from _typeshed import Incomplete
from collections.abc import Generator
from ranger.ext.widestring import WideString as WideString
from ranger.gui import color as color

ansi_re: Incomplete
codesplit_re: Incomplete
reset: str

def split_ansi_from_text(ansi_text): ...
def text_with_fg_bg_attr(ansi_text) -> Generator[Incomplete]: ...
def char_len(ansi_text): ...
def char_slice(ansi_text, start, length): ...