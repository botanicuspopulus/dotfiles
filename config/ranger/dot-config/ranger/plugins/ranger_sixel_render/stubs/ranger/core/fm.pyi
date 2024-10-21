from _typeshed import Incomplete
from collections.abc import Generator
from ranger.container import settings as settings
from ranger.container.bookmarks import Bookmarks as Bookmarks
from ranger.container.directory import Directory as Directory
from ranger.container.tags import Tags as Tags, TagsDummy as TagsDummy
from ranger.core.actions import Actions as Actions
from ranger.core.loader import Loader as Loader
from ranger.core.metadata import MetadataManager as MetadataManager
from ranger.core.runner import Runner as Runner
from ranger.core.tab import Tab as Tab
from ranger.ext import logutils as logutils
from ranger.ext.img_display import get_image_displayer as get_image_displayer
from ranger.ext.rifle import Rifle as Rifle
from ranger.ext.signals import SignalDispatcher as SignalDispatcher
from ranger.gui.ui import UI as UI

class FM(Actions, SignalDispatcher):
    input_blocked: bool
    input_blocked_until: int
    mode: str
    search_method: str
    ui: Incomplete
    start_paths: Incomplete
    directories: Incomplete
    bookmarks: Incomplete
    current_tab: int
    tabs: Incomplete
    tags: Incomplete
    restorable_tabs: Incomplete
    py3: Incomplete
    previews: Incomplete
    default_linemodes: Incomplete
    loader: Incomplete
    copy_buffer: Incomplete
    do_cut: bool
    metadata: Incomplete
    image_displayer: Incomplete
    run: Incomplete
    rifle: Incomplete
    thistab: Incomplete
    username: Incomplete
    hostname: Incomplete
    home_path: Incomplete
    mimetypes: Incomplete
    def __init__(self, ui: Incomplete | None = None, bookmarks: Incomplete | None = None, tags: Incomplete | None = None, paths: Incomplete | None = None) -> None: ...
    def initialize(self): ...
    def destroy(self) -> None: ...
    @staticmethod
    def get_log() -> Generator[Incomplete]: ...
    thisfile: Incomplete
    thisdir: Incomplete
    def block_input(self, sec: int = 0) -> None: ...
    def input_is_blocked(self): ...
    def copy_config_files(self, which) -> None: ...
    def confpath(self, *paths): ...
    def datapath(self, *paths): ...
    @staticmethod
    def relpath(*paths): ...
    def get_directory(self, path, **dir_kwargs): ...
    def garbage_collect(self, age, tabs: Incomplete | None = None) -> None: ...
    def loop(self) -> None: ...
