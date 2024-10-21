from _typeshed import Incomplete
from collections.abc import Generator

PY3: Incomplete
digits: Incomplete
ANYKEY: Incomplete
PASSIVE_ACTION: Incomplete
ALT_KEY: Incomplete
QUANT_KEY: Incomplete
special_keys: Incomplete
very_special_keys: Incomplete

def special_keys_init() -> None: ...

reversed_special_keys: Incomplete

def parse_keybinding(obj) -> Generator[Incomplete]: ...
def construct_keybinding(iterable): ...
def key_to_string(key): ...

class KeyMaps(dict):
    keybuffer: Incomplete
    used_keymap: Incomplete
    def __init__(self, keybuffer: Incomplete | None = None) -> None: ...
    def use_keymap(self, keymap_name) -> None: ...
    def bind(self, context, keys, leaf) -> None: ...
    def copy(self, context, source, target) -> None: ...
    def unbind(self, context, keys) -> None: ...

class KeyBuffer:
    any_key = ANYKEY
    passive_key = PASSIVE_ACTION
    quantifier_key = QUANT_KEY
    exclude_from_anykey: Incomplete
    keymap: Incomplete
    keys: Incomplete
    wildcards: Incomplete
    pointer: Incomplete
    result: Incomplete
    quantifier: Incomplete
    finished_parsing_quantifier: bool
    finished_parsing: bool
    parse_error: bool
    def __init__(self, keymap: Incomplete | None = None) -> None: ...
    def clear(self) -> None: ...
    def add(self, key) -> None: ...
