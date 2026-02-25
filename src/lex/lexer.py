import antlr4

from src.lex.errors import LexerErrorListener
from src.core.errors import ErrorCallback
from src.generated.lex import lex

class Lexer:
    """
    A wrapper around an antlr4 generated lexer to provide abstraction and encapsulation.
    """
    
    def __init__(self, scanner: lex, errorCallback: ErrorCallback | None = None):
        scanner.removeErrorListeners()
        scanner.addErrorListener(LexerErrorListener(errorCallback))

        self.scanner = scanner
        self.token: antlr4.Token | None = None 
        self.hasNextToken: bool = True

    def lex(self) -> antlr4.Token:
        """
        Get a token from the lexer
        """
        if self.token != None:
            token = self.token
            self.token = None
            return token

        token = self.scanner.nextToken()

        if token.type == token.EOF:
            self.hasNextToken = False

        return token

    def unlex(self, token: antlr4.Token):
        """
        Return a token to the lexer
        """
        self.token = token
        self.hasNextToken = True

    def peek(self) -> antlr4.Token:
        """
        Get the next token without consuming it. Equivalent to lexing a 
        token with `lex` and returning it with `unlex`
        """
        token = self.lex()
        self.unlex(token)

        return token

    def hasNext(self) -> bool:
        """
        Returns whether there is another token to consume. Note that 
        an <EOF> token must be consumed before this function returns false.
        """
        return self.hasNextToken

    def tokenName(self, token) -> str:
        """
        Returns a textual name for a given token
        """
        return self.scanner.symbolicNames[token.type] if token.type != token.EOF else "<EOF>"

    def stream(self) -> antlr4.CommonTokenStream:
        """
        Get an antlr4 token stream.
        """
        return antlr4.CommonTokenStream(self.scanner)


def lexerFromPath(path: str, errorCallback = None) -> Lexer:
    """
    Create a lexer from a path. Reads the file from disk.
    """
    # Deal with non-ascii characters by replacing with unknown char so the
    # lexer can still find the string and report a warning.
    # From: https://docs.python.org/3/library/codecs.html
    # and:  https://github.com/antlr/antlr4/blob/8e6fd9147b3c9d36b60e2b6656871a55227efb1b/runtime/Python3/src/antlr4/FileStream.py
    stream = antlr4.FileStream(path, errors='replace')

    return lexerFromStream(stream, errorCallback)

def lexerFromStream(stream: antlr4.FileStream, errorCallback: ErrorCallback | None = None) -> Lexer:
    """
    Create a lexer from a file stream.
    """
    scanner = lex(stream)

    return Lexer(scanner, errorCallback)

