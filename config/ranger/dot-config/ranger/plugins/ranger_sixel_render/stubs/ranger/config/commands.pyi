from _typeshed import Incomplete
from ranger.api.commands import Command as Command

class alias(Command):
    context: str
    resolve_macros: bool
    def execute(self) -> None: ...

class echo(Command):
    def execute(self) -> None: ...

class cd(Command):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class chain(Command):
    resolve_macros: bool
    def execute(self) -> None: ...

class shell(Command):
    escape_macros_for_shell: bool
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class open_with(Command):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class set_(Command):
    name: str
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class setlocal(set_):
    PATH_RE_DQUOTED: Incomplete
    PATH_RE_SQUOTED: Incomplete
    PATH_RE_UNQUOTED: Incomplete
    def execute(self) -> None: ...

class setintag(set_):
    def execute(self) -> None: ...

class default_linemode(Command):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class quit(Command):
    def execute(self) -> None: ...

class quit_bang(Command):
    name: str
    allow_abbrev: bool
    def execute(self) -> None: ...

class quitall(Command):
    def execute(self) -> None: ...

class quitall_bang(Command):
    name: str
    allow_abbrev: bool
    def execute(self) -> None: ...

class terminal(Command):
    def execute(self) -> None: ...

class delete(Command):
    allow_abbrev: bool
    escape_macros_for_shell: bool
    def execute(self): ...
    def tab(self, tabnum): ...

class trash(Command):
    allow_abbrev: bool
    escape_macros_for_shell: bool
    def execute(self): ...
    def tab(self, tabnum): ...

class jump_non(Command):
    def __init__(self, *args, **kwargs) -> None: ...
    def execute(self) -> None: ...

class mark_tag(Command):
    do_mark: bool
    def execute(self) -> None: ...

class console(Command):
    def execute(self) -> None: ...

class load_copy_buffer(Command):
    copy_buffer_filename: str
    def execute(self): ...

class save_copy_buffer(Command):
    copy_buffer_filename: str
    def execute(self): ...

class unmark_tag(mark_tag):
    do_mark: bool

class mkdir(Command):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class touch(Command):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class edit(Command):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class eval_(Command):
    name: str
    resolve_macros: bool
    def execute(self) -> None: ...

class rename(Command):
    def execute(self): ...
    def tab(self, tabnum): ...

class rename_append(Command):
    def __init__(self, *args, **kwargs) -> None: ...
    def execute(self) -> None: ...

class chmod(Command):
    def execute(self) -> None: ...

class bulkrename(Command):
    def execute(self) -> None: ...

class relink(Command):
    def execute(self): ...
    def tab(self, tabnum): ...

class help_(Command):
    name: str
    def execute(self) -> None: ...

class copymap(Command):
    context: str
    def execute(self): ...

class copypmap(copymap):
    context: str

class copycmap(copymap):
    context: str

class copytmap(copymap):
    context: str

class unmap(Command):
    context: str
    def execute(self) -> None: ...

class uncmap(unmap):
    context: str

class cunmap(uncmap):
    def execute(self) -> None: ...

class unpmap(unmap):
    context: str

class punmap(unpmap):
    def execute(self) -> None: ...

class untmap(unmap):
    context: str

class tunmap(untmap):
    def execute(self) -> None: ...

class map_(Command):
    name: str
    context: str
    resolve_macros: bool
    def execute(self) -> None: ...

class cmap(map_):
    context: str

class tmap(map_):
    context: str

class pmap(map_):
    context: str

class scout(Command):
    AUTO_OPEN: str
    OPEN_ON_ENTER: str
    FILTER: str
    SM_GLOB: str
    IGNORE_CASE: str
    KEEP_OPEN: str
    SM_LETTERSKIP: str
    MARK: str
    UNMARK: str
    PERM_FILTER: str
    SM_REGEX: str
    SMART_CASE: str
    AS_YOU_TYPE: str
    INVERT: str
    def __init__(self, *args, **kwargs) -> None: ...
    def execute(self) -> None: ...
    def cancel(self) -> None: ...
    def quick(self): ...
    def tab(self, tabnum) -> None: ...

class narrow(Command):
    def execute(self) -> None: ...

class filter_inode_type(Command):
    def execute(self) -> None: ...

class filter_stack(Command):
    def execute(self) -> None: ...

class grep(Command):
    def execute(self) -> None: ...

class flat(Command):
    def execute(self) -> None: ...

class reset_previews(Command):
    def execute(self) -> None: ...

class stage(Command):
    def execute(self) -> None: ...

class unstage(Command):
    def execute(self) -> None: ...

class prompt_metadata(Command):
    def execute(self) -> None: ...

class meta(prompt_metadata):
    def execute(self) -> None: ...
    def tab(self, tabnum): ...

class linemode(default_linemode):
    def execute(self) -> None: ...

class yank(Command):
    modes: Incomplete
    def execute(self): ...
    def get_selection_attr(self, attr): ...
    def tab(self, tabnum): ...

class paste_ext(Command):
    @staticmethod
    def make_safe_path(dst): ...
    def execute(self): ...
