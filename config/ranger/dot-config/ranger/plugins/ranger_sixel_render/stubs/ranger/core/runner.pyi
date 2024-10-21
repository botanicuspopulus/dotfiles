from _typeshed import Incomplete
from ranger.ext.get_executables import get_executables as get_executables, get_term as get_term
from ranger.ext.popen_forked import Popen_forked as Popen_forked

LOG: Incomplete
ALLOWED_FLAGS: str

def press_enter() -> None: ...

class Context:
    action: Incomplete
    app: Incomplete
    mode: Incomplete
    flags: Incomplete
    files: Incomplete
    file: Incomplete
    fm: Incomplete
    wait: Incomplete
    popen_kws: Incomplete
    def __init__(self, action: Incomplete | None = None, app: Incomplete | None = None, mode: Incomplete | None = None, flags: Incomplete | None = None, files: Incomplete | None = None, file: Incomplete | None = None, fm: Incomplete | None = None, wait: Incomplete | None = None, popen_kws: Incomplete | None = None) -> None: ...
    @property
    def filepaths(self): ...
    def __iter__(self): ...
    def squash_flags(self) -> None: ...

class Runner:
    ui: Incomplete
    fm: Incomplete
    logfunc: Incomplete
    zombies: Incomplete
    def __init__(self, ui: Incomplete | None = None, logfunc: Incomplete | None = None, fm: Incomplete | None = None) -> None: ...
    def __call__(self, action: Incomplete | None = None, try_app_first: bool = False, app: str = 'default', files: Incomplete | None = None, mode: int = 0, flags: str = '', wait: bool = True, **popen_kws): ...
