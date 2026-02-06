import antlr4
from src.generated.lex import lex
from src.core.logging import *

class ErrorListener(antlr4.error.ErrorListener.ErrorListener):
    def __init__(self, callback = None):
        self.callback = callback
    
    def syntaxError(self, recognizer, offendingSymbol, line, col, msg, e):
        logWarning("a synatx error occurred, but was not handled", line)
        callback(recognizer, offendingSymbol, line, ocl, msg, e)

class Lexer:
    def __init__(self, scanner, errorCallback = None):
        scanner.removeErrorListeners()
        scanner.addErrorListener(ErrorListener(errorCallback))

        self.scanner = scanner
        self.token = None 
        self.hasToken = False
        self.hasNextToken = True

    def lex(self):
        if self.hasToken:
            self.hasToken = False
            return self.token

        token = self.scanner.nextToken()

        if token.type == token.EOF:
            self.hasNextToken = False

        return token

    def unlex(self, token):
        self.token = token
        self.hasToken = True
        self.hasNextToken = True

    def peek(self):
        token = self.lex()
        self.unlex(token)

        return token

    def hasNext(self):
        return self.hasNextToken

    def tokenName(self, token):
        return self.scanner.symbolicNames[token.type] if token.type != token.EOF else "<EOF>"

    
        

def lexerFromPath(path, errorCallback = None):
    # Deal with non-ascii characters by replacing with unknown char so the 
    # lexer can still find the string and report a warning.
    # From: https://docs.python.org/3/library/codecs.html
    # and:  https://github.com/antlr/antlr4/blob/8e6fd9147b3c9d36b60e2b6656871a55227efb1b/runtime/Python3/src/antlr4/FileStream.py
    stream = antlr4.FileStream(path, errors='replace')

    return lexerFromStream(stream, errorCallback)

def lexerFromStream(stream, errorCallback = None):
    scanner = lex(stream)

    return Lexer(scanner, errorCallback)

