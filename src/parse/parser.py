from typing import Any, Callable, List
import antlr4
from src.core.logging import logError
from src.generated.parse import parse
from src.lex.lexer import Lexer
from src.core.cpsc411 import ast, astshaper

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

class Shaper(astshaper.ASTShaper):
    def __init__(self, shape: str):
        super().__init__(shape)

    def nonterminal(self, type: str, lineno: int, children: List): 
        if type == "UMINUS" and children[0].type == "number" and not children[0].attr.startswith("-"):
            children[0].attr = f"-{children[0].attr}"
            return children[0]

        return super().nonterminal(type, lineno, children)

class Parser:
    
    def __init__(self, stream: antlr4.CommonTokenStream, errorCallback: ErrorCallback | None = None):
        self.parser = parse(stream)
        self.parser.removeErrorListeners()
        self.parser.addErrorListener(ErrorListener(errorCallback))

    def getTree(self, postProcesser, shape = ""):
        shaper = Shaper(shape)

        tree = shaper.shapetree(self.parser.start())

        postProcesser(tree)

        return tree

def parserFromLexer(lexer: Lexer) -> Parser:
    return parserFromTokenStream(lexer.stream())

def parserFromTokenStream(stream: antlr4.CommonTokenStream) -> Parser:
    return Parser(stream)
