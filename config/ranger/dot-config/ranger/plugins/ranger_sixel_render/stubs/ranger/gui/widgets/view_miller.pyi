from ..displayable import DisplayableContainer as DisplayableContainer
from .browsercolumn import BrowserColumn as BrowserColumn
from .pager import Pager as Pager
from _typeshed import Incomplete
from ranger.container import settings as settings
from ranger.gui.widgets.view_base import ViewBase as ViewBase

class ViewMiller(ViewBase):
    ratios: Incomplete
    preview: bool
    is_collapsed: bool
    stretch_ratios: Incomplete
    old_collapse: bool
    columns: Incomplete
    old_draw_borders: Incomplete
    def __init__(self, win) -> None: ...
    pager: Incomplete
    main_column: Incomplete
    def rebuild(self) -> None: ...
    need_redraw: bool
    need_clear: bool
    def draw(self) -> None: ...
    def resize(self, y, x, hei: Incomplete | None = None, wid: Incomplete | None = None) -> None: ...
    def open_pager(self) -> None: ...
    def close_pager(self) -> None: ...
    def poke(self) -> None: ...
