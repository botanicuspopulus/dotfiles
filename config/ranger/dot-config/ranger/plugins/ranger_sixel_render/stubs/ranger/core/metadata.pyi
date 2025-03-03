from _typeshed import Incomplete

METADATA_FILE_NAME: str
DEEP_SEARCH_DEFAULT: bool

class MetadataManager:
    metadata_cache: Incomplete
    metafile_cache: Incomplete
    deep_search: Incomplete
    def __init__(self) -> None: ...
    def reset(self) -> None: ...
    def get_metadata(self, filename): ...
    def set_metadata(self, filename, update_dict): ...
