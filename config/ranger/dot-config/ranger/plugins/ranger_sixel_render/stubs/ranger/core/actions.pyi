import string
from _typeshed import Incomplete
from ranger.container.directory import Directory as Directory
from ranger.container.file import File as File
from ranger.container.settings import ALLOWED_SETTINGS as ALLOWED_SETTINGS, ALLOWED_VALUES as ALLOWED_VALUES
from ranger.core.loader import CommandLoader as CommandLoader, CopyLoader as CopyLoader
from ranger.core.shared import FileManagerAware as FileManagerAware, SettingsAware as SettingsAware
from ranger.core.tab import Tab as Tab
from ranger.ext.direction import Direction as Direction
from ranger.ext.keybinding_parser import construct_keybinding as construct_keybinding, key_to_string as key_to_string
from ranger.ext.next_available_filename import next_available_filename as next_available_filename
from ranger.ext.relative_symlink import relative_symlink as relative_symlink
from ranger.ext.rifle import ASK_COMMAND as ASK_COMMAND, squash_flags as squash_flags
from ranger.ext.safe_path import get_safe_path as get_safe_path
from ranger.ext.shell_escape import shell_quote as shell_quote

MACRO_FAIL: str
LOG: Incomplete

class _MacroTemplate(string.Template):
    delimiter: Incomplete
    idpattern: str

class Actions(FileManagerAware, SettingsAware):
    @staticmethod
    def exit() -> None: ...
    previews: Incomplete
    def reset(self) -> None: ...
    mode: Incomplete
    def change_mode(self, mode: Incomplete | None = None) -> None: ...
    def set_option_from_string(self, option_name, value, localpath: Incomplete | None = None, tags: Incomplete | None = None) -> None: ...
    def toggle_visual_mode(self, reverse: bool = False, narg: Incomplete | None = None) -> None: ...
    def reload_cwd(self) -> None: ...
    def notify(self, obj, duration: int = 4, bad: bool = False, exception: Incomplete | None = None) -> None: ...
    def abort(self) -> None: ...
    def get_cumulative_size(self) -> None: ...
    def redraw_window(self) -> None: ...
    def open_console(self, string: str = '', prompt: Incomplete | None = None, position: Incomplete | None = None) -> None: ...
    def execute_console(self, string: str = '', wildcards: Incomplete | None = None, quantifier: Incomplete | None = None): ...
    def substitute_macros(self, string, additional: Incomplete | None = None, escape: bool = False): ...
    def get_macros(self): ...
    def source(self, filename) -> None: ...
    def execute_file(self, files, **kw): ...
    def move(self, narg: Incomplete | None = None, **kw) -> None: ...
    def move_parent(self, n, narg: Incomplete | None = None) -> None: ...
    def select_file(self, path) -> None: ...
    def history_go(self, relative) -> None: ...
    thisfile: Incomplete
    def scroll(self, relative) -> None: ...
    def enter_dir(self, path, remember: bool = False, history: bool = True): ...
    def cd(self, path, remember: bool = True) -> None: ...
    def traverse(self) -> None: ...
    def traverse_backwards(self) -> None: ...
    def pager_move(self, narg: Incomplete | None = None, **kw) -> None: ...
    def taskview_move(self, narg: Incomplete | None = None, **kw) -> None: ...
    def pause_tasks(self) -> None: ...
    def pager_close(self) -> None: ...
    def taskview_open(self) -> None: ...
    def taskview_close(self) -> None: ...
    def execute_command(self, cmd, **kw): ...
    def edit_file(self, file: Incomplete | None = None) -> None: ...
    def toggle_option(self, string) -> None: ...
    def set_option(self, optname, value) -> None: ...
    def sort(self, func: Incomplete | None = None, reverse: Incomplete | None = None) -> None: ...
    def mark_files(self, all: bool = False, toggle: bool = False, val: Incomplete | None = None, movedown: Incomplete | None = None, narg: Incomplete | None = None) -> None: ...
    def mark_in_direction(self, val: bool = True, dirarg: Incomplete | None = None) -> None: ...
    def search_file(self, text, offset: int = 1, regexp: bool = True): ...
    def search_next(self, order: Incomplete | None = None, offset: int = 1, forward: bool = True): ...
    search_method: Incomplete
    def set_search_method(self, order, forward: bool = True) -> None: ...
    def tag_toggle(self, tag: Incomplete | None = None, paths: Incomplete | None = None, value: Incomplete | None = None, movedown: Incomplete | None = None) -> None: ...
    def tag_remove(self, tag: Incomplete | None = None, paths: Incomplete | None = None, movedown: Incomplete | None = None) -> None: ...
    def tag_add(self, tag: Incomplete | None = None, paths: Incomplete | None = None, movedown: Incomplete | None = None) -> None: ...
    def enter_bookmark(self, key) -> None: ...
    def set_bookmark(self, key, val: Incomplete | None = None) -> None: ...
    def unset_bookmark(self, key) -> None: ...
    def draw_bookmarks(self) -> None: ...
    def hide_bookmarks(self) -> None: ...
    def draw_possible_programs(self) -> None: ...
    def hide_console_info(self) -> None: ...
    def display_command_help(self, console_widget) -> None: ...
    def display_help(self) -> None: ...
    def display_log(self) -> None: ...
    def display_file(self) -> None: ...
    def scroll_preview(self, lines, narg: Incomplete | None = None) -> None: ...
    def update_preview(self, path): ...
    @staticmethod
    def sha1_encode(path): ...
    def get_preview(self, fobj, width, height): ...
    @staticmethod
    def read_text_file(path, count: Incomplete | None = None): ...
    current_tab: Incomplete
    thistab: Incomplete
    def tab_open(self, name, path: Incomplete | None = None) -> None: ...
    def tab_close(self, name: Incomplete | None = None) -> None: ...
    def tab_restore(self) -> None: ...
    def tab_move(self, offset, narg: Incomplete | None = None): ...
    def tab_new(self, path: Incomplete | None = None, narg: Incomplete | None = None): ...
    def tab_shift(self, offset: int = 0, to: Incomplete | None = None) -> None: ...
    def tab_switch(self, path, create_directory: bool = False) -> None: ...
    obj: Incomplete
    def get_tab_list(self): ...
    def dump_keybindings(self, *contexts) -> None: ...
    def dump_commands(self) -> None: ...
    def dump_settings(self) -> None: ...
    copy_buffer: Incomplete
    do_cut: bool
    def uncut(self) -> None: ...
    def copy(self, mode: str = 'set', narg: Incomplete | None = None, dirarg: Incomplete | None = None) -> None: ...
    def cut(self, mode: str = 'set', narg: Incomplete | None = None, dirarg: Incomplete | None = None) -> None: ...
    def paste_symlink(self, relative: bool = False) -> None: ...
    def paste_hardlink(self) -> None: ...
    def paste_hardlinked_subtree(self) -> None: ...
    def paste(self, overwrite: bool = False, append: bool = False, dest: Incomplete | None = None, make_safe_path=...) -> None: ...
    def delete(self, files: Incomplete | None = None) -> None: ...
    def mkdir(self, name) -> None: ...
    def rename(self, src, dest): ...
