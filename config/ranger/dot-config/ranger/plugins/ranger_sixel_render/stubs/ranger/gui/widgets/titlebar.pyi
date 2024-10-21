from . import Widget as Widget
from _typeshed import Incomplete
from ranger.gui.bar import Bar as Bar

class TitleBar(Widget):
    old_thisfile: Incomplete
    old_keybuffer: Incomplete
    old_wid: Incomplete
    result: Incomplete
    right_sumsize: int
    throbber: str
    need_redraw: bool
    def __init__(self, *args, **keywords) -> None: ...
    def request_redraw(self) -> None: ...
    def draw(self) -> None: ...
    def click(self, event): ...
