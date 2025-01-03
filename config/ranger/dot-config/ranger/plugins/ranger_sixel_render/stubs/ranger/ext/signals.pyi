from _typeshed import Incomplete

class Signal(dict):
    stopped: bool
    __dict__: Incomplete
    def __init__(self, **keywords) -> None: ...
    def stop(self) -> None: ...

class SignalHandler:
    active: bool
    priority: Incomplete
    signal_name: Incomplete
    function: Incomplete
    pass_signal: Incomplete
    def __init__(self, signal_name, function, priority, pass_signal) -> None: ...

class SignalDispatcher:
    def __init__(self) -> None: ...
    def signal_clear(self) -> None: ...
    def signal_bind(self, signal_name, function, priority: float = 0.5, weak: bool = False, autosort: bool = True): ...
    def signal_force_sort(self, signal_name: Incomplete | None = None): ...
    def signal_unbind(self, signal_handler) -> None: ...
    def signal_garbage_collect(self) -> None: ...
    def signal_emit(self, signal_name, **kw): ...
