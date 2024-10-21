import abc
from _typeshed import Incomplete
from abc import ABCMeta, abstractmethod
from ranger.ext import spawn as spawn
from ranger.ext.human_readable import human_readable as human_readable, human_readable_time as human_readable_time

DEFAULT_LINEMODE: str

class LinemodeBase(metaclass=abc.ABCMeta):
    __metaclass__ = ABCMeta
    uses_metadata: bool
    required_metadata: Incomplete
    name: Incomplete
    @abstractmethod
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata) -> None: ...

class DefaultLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...

class TitleLinemode(LinemodeBase):
    name: str
    uses_metadata: bool
    required_metadata: Incomplete
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...

class PermissionsLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...

class FileInfoLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...

class MtimeLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...

class SizeMtimeLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...

class HumanReadableMtimeLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...

class SizeHumanReadableMtimeLinemode(LinemodeBase):
    name: str
    def filetitle(self, fobj, metadata): ...
    def infostring(self, fobj, metadata): ...
