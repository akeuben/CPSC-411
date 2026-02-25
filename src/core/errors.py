# Type alias to make function signatures more readable
from typing import Any, Callable
import antlr4

ErrorCallback = Callable[[Any, Any, int, int, str, antlr4.RecognitionException], None]
