import collections
from _typeshed import Incomplete

class OpenStruct(dict):
    __dict__: Incomplete
    def __init__(self, *args, **keywords) -> None: ...

class DefaultOpenStruct(collections.defaultdict):
    __dict__: Incomplete
    def __init__(self, *args, **keywords) -> None: ...
    def __getattr__(self, name): ...
