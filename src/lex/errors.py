from typing import Any
import antlr4

from src.core.errors import ErrorCallback
from src.core.logging import logWarning


class LexerErrorListener(antlr4.DiagnosticErrorListener):
    def __init__(self, callback: ErrorCallback | None = None):
        self.callback = callback
    
    def syntaxError(self, recognizer: Any, offendingSymbol: Any, line: int, col: int, msg: str, e: antlr4.RecognitionException):
        logWarning("a synatx error occurred, but was not handled", line)

        # Allow for the lexer to take in an additional handler for the error
        if self.callback != None:
            self.callback(recognizer, offendingSymbol, line, col, msg, e)

