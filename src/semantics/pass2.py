from src.core.logging import logError
from src.semantics.symbol_table import SymbolTable
from src.core.cpsc411 import Ast, AstTraversal


class Pass2(AstTraversal):
    """
    Responsible for filling out remainder of the 
    symbol table
    """

    table: SymbolTable

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table

    def n_mainDecl(self, node: Ast):
        idNode = node[1]

        name = idNode.attr
        
        self.table.useScope(name)

    def n_mainDecl_exit(self, _: Ast):
        self.table.returnScope()

    def n_funcDecl(self, node: Ast):
        idNode = node[1]

        name = idNode.attr
        
        self.table.useScope(name)

    def n_funcDecl_exit(self, _: Ast):
        self.table.returnScope()

    def n_varDecl(self, node: Ast):
        typeNode = node[0]
        idNode = node[1]

        name = idNode.attr
        sig = typeNode.sig 
        
        # Add entry to the symbol table
        if self.table.alreadyDefined(name):
            logError(f'{repr(name)} redefined', node.lineno)
        entry = self.table.declare(node[1].attr, sig)

        node[1].sym = entry.name 
        node[1].sig = sig
        node.sig = sig

