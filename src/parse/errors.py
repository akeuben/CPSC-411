from typing import Any
import antlr4

from src.core.logging import logError
from src.core.errors import ErrorCallback

class ParserErrorListener(antlr4.DiagnosticErrorListener):
    def __init__(self, callback: ErrorCallback | None = None):
        self.callback = callback
    
    def syntaxError(self, recognizer: Any, offendingSymbol: Any, line: int, col: int, msg: str, e: antlr4.RecognitionException):
        logError(msg, line)

        # Allow for the parser to take in an additional handler for the error
        if self.callback != None:
            self.callback(recognizer, offendingSymbol, line, col, msg, e)

# pyright: reportUnusedVariable=false
    def reportAmbiguity(self, recognizer, dfa, startIndex, stopIndex, exact, ambigAlts, configs):
        pass

    def reportAttemptingFullContext(self, recognizer, dfa, startIndex, stopIndex, conflictingAlts, configs):
        pass

    def reportContextSensitivity(self, recognizer, dfa, startIndex, stopIndex, prediction, configs):
        pass
