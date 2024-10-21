from _typeshed import Incomplete
from ranger.core.linemode import DEFAULT_LINEMODE as DEFAULT_LINEMODE, DefaultLinemode as DefaultLinemode, FileInfoLinemode as FileInfoLinemode, HumanReadableMtimeLinemode as HumanReadableMtimeLinemode, MtimeLinemode as MtimeLinemode, PermissionsLinemode as PermissionsLinemode, SizeHumanReadableMtimeLinemode as SizeHumanReadableMtimeLinemode, SizeMtimeLinemode as SizeMtimeLinemode, TitleLinemode as TitleLinemode
from ranger.core.shared import FileManagerAware as FileManagerAware, SettingsAware as SettingsAware
from ranger.ext import spawn as spawn
from ranger.ext.human_readable import human_readable as human_readable
from ranger.ext.lazy_property import lazy_property as lazy_property
from ranger.ext.shell_escape import shell_escape as shell_escape

maketrans: Incomplete
CONTAINER_EXTENSIONS: Incomplete
DOCUMENT_EXTENSIONS: Incomplete
DOCUMENT_BASENAMES: Incomplete
BAD_INFO: str

def safe_path(path): ...

class FileSystemObject(FileManagerAware, SettingsAware):
    basename: Incomplete
    relative_path: Incomplete
    infostring: Incomplete
    path: Incomplete
    permissions: Incomplete
    stat: Incomplete
    content_loaded: bool
    force_load: bool
    is_device: bool
    is_directory: bool
    is_file: bool
    is_fifo: bool
    is_link: bool
    is_socket: bool
    accessible: bool
    exists: bool
    loaded: bool
    marked: bool
    runnable: bool
    stopped: bool
    tagged: bool
    audio: bool
    container: bool
    document: bool
    image: bool
    media: bool
    video: bool
    size: int
    last_load_time: int
    vcsstatus: Incomplete
    vcsremotestatus: Incomplete
    linemode_dict: Incomplete
    preload: Incomplete
    display_data: Incomplete
    def __init__(self, path, preload: Incomplete | None = None, path_is_abs: bool = False, basename_is_rel_to: Incomplete | None = None) -> None: ...
    def extension(self): ...
    def relative_path_lower(self): ...
    def linemode(self): ...
    def dirname(self): ...
    def shell_escaped_basename(self): ...
    def filetype(self): ...
    def basename_natural(self): ...
    def basename_natural_lower(self): ...
    def basename_without_extension(self): ...
    def safe_basename(self): ...
    def user(self): ...
    def group(self): ...
    def use(self) -> None: ...
    def look_up_cumulative_size(self) -> None: ...
    def set_mimetype(self) -> None: ...
    @property
    def mimetype(self): ...
    @property
    def mimetype_tuple(self): ...
    def mark(self, _) -> None: ...
    def mark_set(self, boolean) -> None: ...
    def realpath(self): ...
    def load(self) -> None: ...
    def get_permission_string(self): ...
    def load_if_outdated(self): ...
    def set_linemode(self, mode) -> None: ...
