from .displayable import DisplayableContainer as DisplayableContainer
from .mouse_event import MouseEvent as MouseEvent
from _typeshed import Incomplete
from ranger.ext.keybinding_parser import ALT_KEY as ALT_KEY, KeyBuffer as KeyBuffer, KeyMaps as KeyMaps
from ranger.ext.lazy_property import lazy_property as lazy_property
from ranger.ext.signals import Signal as Signal
from ranger.ext.spawn import check_output as check_output

MOUSEMASK: Incomplete
ESCAPE_ICON_TITLE: str

def ascii_only(string): ...

class UI(DisplayableContainer):
    ALLOWED_VIEWMODES: Incomplete
    is_set_up: bool
    load_mode: bool
    is_on: bool
    termsize: Incomplete
    keybuffer: Incomplete
    keymaps: Incomplete
    redrawlock: Incomplete
    titlebar: Incomplete
    taskview: Incomplete
    status: Incomplete
    console: Incomplete
    pager: Incomplete
    multiplexer: Incomplete
    browser: Incomplete
    fm: Incomplete
    def __init__(self, env: Incomplete | None = None, fm: Incomplete | None = None) -> None: ...
    win: Incomplete
    def setup_curses(self) -> None: ...
    def initialize(self) -> None: ...
    def suspend(self) -> None: ...
    def set_load_mode(self, boolean) -> None: ...
    def destroy(self) -> None: ...
    def handle_mouse(self) -> None: ...
    def handle_key(self, key) -> None: ...
    def press(self, key): ...
    def handle_keys(self, *keys) -> None: ...
    def handle_input(self) -> None: ...
    viewmode: Incomplete
    def setup(self) -> None: ...
    def vcsthread(self): ...
    def redraw(self) -> None: ...
    need_redraw: bool
    def redraw_window(self) -> None: ...
    def update_size(self) -> None: ...
    def draw(self) -> None: ...
    def finalize(self) -> None: ...
    def draw_images(self) -> None: ...
    def close_pager(self) -> None: ...
    def open_pager(self): ...
    def open_embedded_pager(self): ...
    def close_embedded_pager(self) -> None: ...
    def open_console(self, string: str = '', prompt: Incomplete | None = None, position: Incomplete | None = None) -> None: ...
    def close_console(self) -> None: ...
    def open_taskview(self) -> None: ...
    def redraw_main_column(self) -> None: ...
    def redraw_statusbar(self) -> None: ...
    def close_taskview(self) -> None: ...
    def throbber(self, string: str = '.', remove: bool = False) -> None: ...
    def handle_multiplexer(self) -> None: ...
    def restore_multiplexer_name(self) -> None: ...
    def hint(self, text: Incomplete | None = None) -> None: ...
    def get_pager(self): ...