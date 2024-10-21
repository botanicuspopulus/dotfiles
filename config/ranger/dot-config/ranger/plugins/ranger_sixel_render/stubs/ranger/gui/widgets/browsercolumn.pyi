from . import Widget as Widget
from .pager import Pager as Pager
from _typeshed import Incomplete
from ranger.core import linemode as linemode
from ranger.ext.widestring import WideString as WideString

HAVE_BIDI: bool

def hook_before_drawing(fsobject, color_list): ...

class BrowserColumn(Pager):
    main_column: bool
    display_infostring: bool
    display_vcsstate: bool
    scroll_begin: int
    target: Incomplete
    last_redraw_time: int
    old_dir: Incomplete
    old_thisfile: Incomplete
    need_redraw: bool
    image: Incomplete
    need_clear_image: bool
    level: Incomplete
    tab: Incomplete
    original_level: Incomplete
    def __init__(self, win, level, tab: Incomplete | None = None) -> None: ...
    def request_redraw(self) -> None: ...
    def click(self, event): ...
    def execute_curses_batch(self, line, commands) -> None: ...
    def has_preview(self): ...
    def level_shift(self, amount) -> None: ...
    def level_restore(self) -> None: ...
    def poke(self) -> None: ...
    scroll_extra: int
    def draw(self) -> None: ...
    def scroll(self, n) -> None: ...
