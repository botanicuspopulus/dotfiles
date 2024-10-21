import logging
from _typeshed import Incomplete

class QueueHandler(logging.Handler):
    queue: Incomplete
    def __init__(self, queue) -> None: ...
    def enqueue(self, record) -> None: ...
    def emit(self, record) -> None: ...

QUEUE: Incomplete
FMT_NORMAL: Incomplete
FMT_DEBUG: Incomplete

def setup_logging(debug: bool = True, logfile: Incomplete | None = None) -> None: ...
