from . import Widget as Widget
from _typeshed import Incomplete
from ranger.ext.human_readable import human_readable as human_readable
from ranger.gui.bar import Bar as Bar

class StatusBar(Widget):
    __doc__ = __doc__
    owners: Incomplete
    groups: Incomplete
    timeformat: str
    hint: Incomplete
    msg: Incomplete
    old_thisfile: Incomplete
    old_ctime: Incomplete
    old_du: Incomplete
    old_hint: Incomplete
    result: Incomplete
    column: Incomplete
    def __init__(self, win, column: Incomplete | None = None) -> None: ...
    need_redraw: bool
    def request_redraw(self) -> None: ...
    def notify(self, text, duration: int = 0, bad: bool = False) -> None: ...
    def clear_message(self) -> None: ...
    def draw(self) -> None: ...

def get_free_space(path): ...

class Message:
    elapse: Incomplete
    text: Incomplete
    bad: bool
    def __init__(self, text, duration, bad) -> None: ...
    def is_alive(self): ...
