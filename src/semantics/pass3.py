from src.core.logging import logError
from src.semantics.symbol_table import SymbolTable
from src.core.cpsc411 import Ast, AstTraversal

"""
The valid combination of types for given operators
"""
valid = {
    "": []
}

class Pass2(AstTraversal):
    """
    Responsible for performing a magority
    of the type checking
    """

    table: SymbolTable

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table
