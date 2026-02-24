import antlr4
from src.generated.parse import parse
from src.lex.lexer import Lexer
from src.core.cpsc411 import astshaper

class Parser:
    
    def __init__(self, stream: antlr4.CommonTokenStream):
        self.parser = parse(stream)

    def getTree(self, postProcesser, shape = ""):
        shaper = astshaper.ASTShaper(shape)

        tree = shaper.shapetree(self.parser.start())

        postProcesser(tree)

        return tree

def parserFromLexer(lexer: Lexer) -> Parser:
    return parserFromTokenStream(lexer.stream())

def parserFromTokenStream(stream: antlr4.CommonTokenStream) -> Parser:
    return Parser(stream)
