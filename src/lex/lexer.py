import antlr4
from src.generated.lex import lex
from src.core.logging import *

class WarningListener(antlr4.error.ErrorListener.ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, col, msg, e):
        #for now, we assume that the only possible error the parser can throw is an unknown token error,
        logWarning("unknown char", line)

def lexFromPath(path):
    stream = antlr4.FileStream(path)
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
