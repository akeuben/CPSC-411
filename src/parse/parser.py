import antlr4
from src.generated.parse import parse
from src.lex.lexer import Lexer

# import cpsc411 specific classes. We allow for the location to be overriden depending on 
# an environment variable. This allows me to run on my local machine.
import sys 
import os 
sys.path.append(os.environ.get("CPSC_411_LIB", "/home/profs/aycock/411/lib/python3.13"))
import cpsc411

class Parser:
    
    def __init__(self, stream: antlr4.CommonTokenStream):
        self.parser = parse(stream)

    def getTree(self) -> cpsc411.ast.AST:
        return cpsc411.ast.AST("<EOF>")

def parserFromLexer(lexer: Lexer) -> Parser:
    return parserFromTokenStream(lexer.stream())

def parserFromTokenStream(stream: antlr4.CommonTokenStream) -> Parser:
    return Parser(stream)
