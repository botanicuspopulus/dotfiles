from _typeshed import Incomplete
from ranger.gui.widgets.browsercolumn import BrowserColumn as BrowserColumn
from ranger.gui.widgets.view_base import ViewBase as ViewBase

class ViewMultipane(ViewBase):
    def __init__(self, win) -> None: ...
    columns: Incomplete
    main_column: Incomplete
    def rebuild(self) -> None: ...
    need_redraw: bool
    def resize(self, y, x, hei: Incomplete | None = None, wid: Incomplete | None = None) -> None: ...
