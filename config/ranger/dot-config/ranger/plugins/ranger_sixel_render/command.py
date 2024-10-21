import os
import sys
import mmap
import struct
import fcntl
import termios
import curses
import io
import asyncio
import concurrent.futures
from cachetools import LRUCache, cached

from subprocess import check_call, DEVNULL, CalledProcessError
from tempfile import NamedTemporaryFile
from pathlib import Path
from contextlib import contextmanager
from typing import NamedTuple
from typing import Tuple

from ranger.core.shared import FileManagerAware
from ranger.ext.img_display import (
        ImageDisplayer, 
        ImageDisplayError,
        register_image_displayer,
)


def run_magick_command(command: list, env: dict, output_file: NamedTemporaryFile):
    """
    Run the ImageMagick command

    Args:
        command (list): The ImageMagickCommand to run.
        env (dict): The environment variables to use.
        output_file (TemporaryFile): The file to write the output to.

    Raises:
        ImageDisplayError: If the command fails
    """

    try:
        check_call(
            command,
            stdout=output_file,
            stderr=DEVNULL,
            env=env,
        )
    except CalledProcessError as e:
        raise ImageDisplayError(f"ImageMagick failed processing the SIXEL image: {e}")
    except FileNotFoundError:
        raise ImageDisplayError("SIXEL image preview requires ImageMagick")


def get_terminal_size() -> Tuple[int, int, int, int]:
    """
    Get the terminal size in rows, columns, x pixels, and y pixels.

    This function uses the ioctl system call to retrieve the terminal window size.

    Returns:
        Tuple[int, int, int, int]: A tuple containing the number of rows, columns,
                                   x pixels, and y pixels of the terminal window.
    """
    farg = struct.pack("HHHH", 0, 0, 0, 0)
    fd_stdout = sys.stdout.fileno()
    fretint = fcntl.ioctl(fd_stdout, termios.TIOCGWINSZ, farg)
    return struct.unpack("HHHH", fretint)

def get_font_dimensions() -> Tuple[int, int]:
    """Get the font dimensions in pixels."""
    rows, cols, xpixels, ypixels = get_terminal_size()
    return (xpixels // cols, ypixels // rows)

def move_cursor(to_y: int, to_x: int):
    """Move the cursor to the specified position."""
    cup_str = curses.tigetstr("cup")

    if cup_str is None:
        raise ValueError("Terminal does not support cup capability")

    tparm = curses.tparm(cup_str, to_y, to_x)
    bin_stdout = getattr(sys.stdout, "buffer", sys.stdout)

    if isinstance(bin_stdout, io.BufferedWriter):
        bin_stdout.write(tparm)
    else:
        bin_stdout.write(tparm.decode("utf-8"))

@contextmanager
def temporarily_move_cursor(to_y: int, to_x: int):
    """Temporarily move the cursor to the specified position and restore it afterwards."""
    sc_str = curses.tigetstr("sc")

    if sc_str is None:
        raise ValueError("Terminal does not support sc capability")

    curses.putp(sc_str)
    move_cursor(to_y, to_x)

    yield

    rc_str = curses.tigetstr("rc")

    if rc_str is None:
        raise ValueError("Terminal does not support rc capability")

    curses.putp(rc_str)
    sys.stdout.flush()


class CacheableSixelImage(NamedTuple):
    width: int
    height: int
    inode: int


class CachedSixelImage(NamedTuple):
    image: mmap.mmap
    fh: NamedTemporaryFile


@register_image_displayer("sixel")
class SixelImageDisplayer(ImageDisplayer, FileManagerAware):
    """Implementation of ImageDisplayer for Sixel images."""

    def __init__(self):
        self.win = None
        self.cache = LRUCache(maxsize=100)
        self.fm.signal_bind('preview.cleared', lambda signal: self._clear_cache(signal.path))
        self.executor = concurrent.futures.ThreadPoolExecutor()

    def _clear_cache(self, path: Path):
        """Clear the cache for the specified path."""
        if path.exists():
            path_stat_ino = path.stat().st_ino
            self.cache = {
                ce: cd
                for ce, cd in self.cache.items()
                if ce.inode != path_stat_ino
            }

    @cached(cache=LRUCache(maxsize=100))
    def _sixel_cache(self, path: Path, width: int, height: int):
        """
        Cache the SIXEL image for the given path, width, and height.

        This method checks if the image is already cached. If not, it generates
        the SIXEL image using ImageMagick, caches it, and returns the cached image.

        Args:
            path (Path): The path to the image file.
            width (int): The width of the image in terminal cells.
            height (int): The height of the image in terminal cells.

        Returns:
            mmap.mmap: The cached SIXEL image.

        Raises:
            ImageDisplayError: If ImageMagick fails to process the image or produces an empty image.
        """
        stat = path.stat()
        cacheable = CacheableSixelImage(width, height, stat.st_ino)

        if cacheable not in self.cache:
            font_width, font_height = get_font_dimensions()
            fit_width = font_width * width
            fit_height = font_height * height

            sixel_dithering = "FloydSteinberg"
            cached = NamedTemporaryFile("w+", prefix="ranger", suffix=path.name.replace(os.sep, "-"))

            environ = dict(os.environ)
            environ.setdefault("MAGICK_OCL_DEVICE", "true")

            command = [
                "magick",
                f"{path}[0]",
                "-geometry",
                f"{fit_width}x{fit_height}",
                "-dither",
                sixel_dithering,
                "sixel:-",
            ]

            future = self.executor.submit(run_magick_command, command, environ, cached)
            future.result()

            cached.flush()

            if os.fstat(cached.fileno()).st_size == 0:
                raise ImageDisplayError("ImageMagick produced an empty SIXEL image")

            self.cache[cacheable] = CachedSixelImage(mmap.mmap(cached.fileno(), 0), cached)

        return self.cache[cacheable].image

    async def async_write_to_stdout(self, data: bytes):
        """
        Asynchronously write the data to stdout.

        Args:
            data (bytes): The data to write to stdout.
        """
        loop = asyncio.get_running_loop()
        await loop.run_in_executor(None, sys.stdout.buffer.write, data)
        await loop.run_in_executor(None, sys.stdout.flush)

    async def async_clear_win(self):
        """
        Asynchronously clear the window.
        """
        if self.win is not None:
            loop = asyncio.get_running_loop()
            await loop.run_in_executor(None, self.win.clear)
            await loop.run_in_executor(None, self.win.refresh)

    def draw(self, path: str|Path, start_x: int, start_y: int, width: int, height: int):
        if isinstance(path, str):
            path = Path(path)

        if self.win is None:
            self.win = self.fm.ui.win.subwin(height, width, start_y, start_x)
        else:
            self.win.mvwin(start_y, start_x)
            self.win.resize(height, width)

        with temporarily_move_cursor(start_y, start_x):
            sixel = self._sixel_cache(path, width, height)[:]
            asyncio.run(self.async_write_to_stdout(sixel))

    def clear(self, start_x: int, start_y: int, width: int, height: int):
        asyncio.run(self.async_clear_win())
        self.win = None
