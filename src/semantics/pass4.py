from src.core.logging import logError
from src.core.cpsc411 import AstTraversal, Ast

from src.semantics.types import TypeBoolean, TypeFunction, TypeInt, TypeVoid

from src.semantics.symbol_table import SymbolTable

class Pass4(AstTraversal):
    """
    Pass one is responsable for collecting all 
    global declarations, and 
    """

    table: SymbolTable
    breakDepth: int

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table
        self.breakDepth = 0
        
    def n_whileStmt(self, node: Ast):
        self.breakDepth += 1 

    def n_whileStmt_exit(self, node: Ast):
        self.breakDepth -= 1

    def n_breakStmt(self, node: Ast):
        if self.breakDepth <= 0:
            logError("break must be inside 'while'", node.lineno)
