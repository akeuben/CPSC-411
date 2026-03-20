"""
Pass 1: (post order) Global declarations
Pass 2: (pre/post order) All definitions
Pass 3: (post order) Type checking 
Pass 4: (pre/post order) Misc Checks
"""

from src.core.logging import logError
from src.semantics.pass2 import Pass2
from src.semantics.pass1 import Pass1
from src.semantics.symbol_table import SymbolTable
from src.core.cpsc411 import Ast


def check_semantics(tree: Ast) -> SymbolTable:
    table = SymbolTable()

    pass1 = Pass1(tree, table)
    pass1.postorder()
    if not pass1.mainFound:
        logError("no main declaration found")
    
    pass2 = Pass2(tree, table)
    pass2.preorder()

    return table
