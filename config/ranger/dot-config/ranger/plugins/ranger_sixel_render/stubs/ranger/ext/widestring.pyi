from _typeshed import Incomplete

PY3: Incomplete
ASCIIONLY: Incomplete
NARROW: int
WIDE: int
WIDE_SYMBOLS: Incomplete

def uwid(string): ...
def utf_char_width(string): ...
def string_to_charlist(string): ...

class WideString:
    string: Incomplete
    chars: Incomplete
    def __init__(self, string, chars: Incomplete | None = None) -> None: ...
    def __add__(self, string): ...
    def __radd__(self, string): ...
    def __getslice__(self, start, stop): ...
    def __getitem__(self, i): ...
    def __len__(self) -> int: ...
