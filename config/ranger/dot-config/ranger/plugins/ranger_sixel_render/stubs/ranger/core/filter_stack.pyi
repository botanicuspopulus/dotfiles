from _typeshed import Incomplete
from ranger.container.directory import InodeFilterConstants as InodeFilterConstants, accept_file as accept_file
from ranger.core.shared import FileManagerAware as FileManagerAware
from ranger.ext.hash import hash_chunks as hash_chunks

class BaseFilter:
    def decompose(self): ...

SIMPLE_FILTERS: Incomplete
FILTER_COMBINATORS: Incomplete

def stack_filter(filter_name): ...
def filter_combinator(combinator_name): ...

class NameFilter(BaseFilter):
    pattern: Incomplete
    regex: Incomplete
    def __init__(self, pattern) -> None: ...
    def __call__(self, fobj): ...

class MimeFilter(BaseFilter):
    pattern: Incomplete
    regex: Incomplete
    def __init__(self, pattern) -> None: ...
    def __call__(self, fobj): ...

class HashFilter(BaseFilter, FileManagerAware):
    filepath: Incomplete
    filehash: Incomplete
    def __init__(self, filepath: Incomplete | None = None) -> None: ...
    def __call__(self, fobj): ...

def group_by_hash(fsobjects): ...

class DuplicateFilter(BaseFilter, FileManagerAware):
    duplicates: Incomplete
    def __init__(self, _) -> None: ...
    def __call__(self, fobj): ...
    def get_duplicates(self): ...

class UniqueFilter(BaseFilter, FileManagerAware):
    unique: Incomplete
    def __init__(self, _) -> None: ...
    def __call__(self, fobj): ...
    def get_unique(self): ...

class TypeFilter(BaseFilter):
    type_to_function: Incomplete
    filetype: Incomplete
    def __init__(self, filetype) -> None: ...
    def __call__(self, fobj): ...

class OrFilter(BaseFilter):
    subfilters: Incomplete
    def __init__(self, stack) -> None: ...
    def __call__(self, fobj): ...
    def decompose(self): ...

class AndFilter(BaseFilter):
    subfilters: Incomplete
    def __init__(self, stack) -> None: ...
    def __call__(self, fobj): ...
    def decompose(self): ...

class NotFilter(BaseFilter):
    subfilter: Incomplete
    def __init__(self, stack) -> None: ...
    def __call__(self, fobj): ...
    def decompose(self): ...
