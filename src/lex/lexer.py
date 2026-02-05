import antlr4
from src.generated.lex import lex
from src.core.logging import *

class WarningListener(antlr4.error.ErrorListener.ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, col, msg, e):
        #for now, we assume that the only possible error the parser can throw is an unknown token error,
        logWarning("unknown char", line)

def lexFromPath(path):
    # Deal with non-ascii characters by replacing with unknown char so the 
    # lexer can still find the string and report a warning.
    # From: https://docs.python.org/3/library/codecs.html
    # and:  https://github.com/antlr/antlr4/blob/8e6fd9147b3c9d36b60e2b6656871a55227efb1b/runtime/Python3/src/antlr4/FileStream.py
    stream = antlr4.FileStream(path, errors='replace')
    lexFromStream(stream)

def lexFromStream(stream):
    scanner = lex(stream)

    scanner.removeErrorListeners()
    scanner.addErrorListener(WarningListener())

    while(t := scanner.nextToken()):
        name = scanner.symbolicNames[t.type] if t.type != t.EOF else "<EOF>"
        logToken(name, t.line, repr(t.text))
        if t.type == t.EOF:
            break
