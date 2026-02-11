import antlr4

from src.generated.lex import lex
from src.core.logging import *

from typing import Any, Callable

# Type alias to make function signatures more readable
ErrorCallback = Callable[[Any, Any, int, int, str, antlr4.RecognitionException], None]

class ErrorListener(antlr4.DiagnosticErrorListener):
    def __init__(self, callback: ErrorCallback | None = None):
        self.callback = callback
    
    def syntaxError(self, recognizer: Any, offendingSymbol: Any, line: int, col: int, msg: str, e: antlr4.RecognitionException):
        logWarning("a synatx error occurred, but was not handled", line)
        if self.callback != None:
            self.callback(recognizer, offendingSymbol, line, col, msg, e)

class Lexer:
    def __init__(self, scanner: lex, errorCallback: ErrorCallback | None = None):
        scanner.removeErrorListeners()
        scanner.addErrorListener(ErrorListener(errorCallback))

        self.scanner = scanner
        self.token: antlr4.Token | None = None 
        self.hasNextToken: bool = True

    def lex(self) -> antlr4.Token:
        if self.token != None:
            token = self.token
            self.token = None
            return token

        token = self.scanner.nextToken()

        if token.type == token.EOF:
            self.hasNextToken = False

        return token

    def unlex(self, token: antlr4.Token):
        self.token = token
        self.hasNextToken = True

    def peek(self) -> antlr4.Token:
        token = self.lex()
        self.unlex(token)

        return token

    def hasNext(self) -> bool:
        return self.hasNextToken

    def tokenName(self, token) -> str:
        return self.scanner.symbolicNames[token.type] if token.type != token.EOF else "<EOF>"

    def stream(self) -> antlr4.CommonTokenStream:
        return antlr4.CommonTokenStream(self.scanner)


def lexerFromPath(path: str, errorCallback = None) -> Lexer:
    # Deal with non-ascii characters by replacing with unknown char so the
    # lexer can still find the string and report a warning.
    # From: https://docs.python.org/3/library/codecs.html
    # and:  https://github.com/antlr/antlr4/blob/8e6fd9147b3c9d36b60e2b6656871a55227efb1b/runtime/Python3/src/antlr4/FileStream.py
    stream = antlr4.FileStream(path, errors='replace')

    return lexerFromStream(stream, errorCallback)

def lexerFromStream(stream: antlr4.FileStream, errorCallback: ErrorCallback | None = None) -> Lexer:
    scanner = lex(stream)

    return Lexer(scanner, errorCallback)

