import antlr4
import src.core.cpsc411 as cpsc411
from src.parse.shaping import Shaper
from src.parse.errors import ParserErrorListener
from src.core.errors import ErrorCallback
from src.generated.parse import parse
from src.lex.lexer import Lexer


class Parser:
    """
    Wrapper around the antlr4 generated parser to provide additional utility and encapsulating behaviour.
    """
    
    def __init__(self, stream: antlr4.CommonTokenStream, errorCallback: ErrorCallback | None = None):
        """
        Create a Parser using a token stream. Optionally provide a custom callback in case of errors.
        """
        self.parser = parse(stream)
        self.parser.removeErrorListeners()
        self.parser.addErrorListener(ParserErrorListener(errorCallback))

    def getTree(self, shape = "", shaperClass = cpsc411.astshaper.ASTShaper):
        """
        Gets the AST from the parser. Optionally shapes the generated tree using the provided `shape` spec 
        using a subclass `shaperClass` of the cpsc411.astshaper.ASTShaper
        """
        shaper = shaperClass(shape)

        tree = shaper.shapetree(self.parser.start())

        return tree

def parserFromLexer(lexer: Lexer) -> Parser:
    """
    Creates a parser from a given lexer 
    """
    return parserFromTokenStream(lexer.stream())

def parserFromTokenStream(stream: antlr4.CommonTokenStream) -> Parser:
    """
    Creates a parser from an antlr4 token stream
    """
    return Parser(stream)
