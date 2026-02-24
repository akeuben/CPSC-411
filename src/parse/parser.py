from typing import Any, Callable
import antlr4
from src.core.logging import logError
from src.generated.parse import parse
from src.lex.lexer import Lexer
from src.core.cpsc411 import astshaper

# Type alias to make function signatures more readable
ErrorCallback = Callable[[Any, Any, int, int, str, antlr4.RecognitionException], None]

class ErrorListener(antlr4.DiagnosticErrorListener):
    def __init__(self, callback: ErrorCallback | None = None):
        self.callback = callback
    
    def syntaxError(self, recognizer: Any, offendingSymbol: Any, line: int, col: int, msg: str, e: antlr4.RecognitionException):
        logError(msg, line)
        if self.callback != None:
            self.callback(recognizer, offendingSymbol, line, col, msg, e)

    def reportAmbiguity(self, recognizer, dfa, startIndex, stopIndex, exact, ambigAlts, configs):
        pass

    def reportAttemptingFullContext(self, recognizer, dfa, startIndex, stopIndex, conflictingAlts, configs):
        pass

    def reportContextSensitivity(self, recognizer, dfa, startIndex, stopIndex, prediction, configs):
        pass

class Parser:
    
    def __init__(self, stream: antlr4.CommonTokenStream, errorCallback: ErrorCallback | None = None):
        self.parser = parse(stream)
        self.parser.removeErrorListeners()
        self.parser.addErrorListener(ErrorListener(errorCallback))

    def getTree(self, postProcesser, shape = ""):
        shaper = astshaper.ASTShaper(shape)

        tree = shaper.shapetree(self.parser.start())

        postProcesser(tree)

        return tree

def parserFromLexer(lexer: Lexer) -> Parser:
    return parserFromTokenStream(lexer.stream())

def parserFromTokenStream(stream: antlr4.CommonTokenStream) -> Parser:
    return Parser(stream)
