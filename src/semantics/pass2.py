from src.core.logging import logError
from src.semantics.symbol_table import SymbolTable
from src.core.cpsc411 import Ast, AstTraversal


class Pass2(AstTraversal):
    """
    Responsible for filling out remainder of the 
    symbol table
    """

    table: SymbolTable
    depth: int # holds how many blocks deep we are

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table
        self.depth = 0

    def n_mainDecl(self, node: Ast):
        idNode = node[1]

        name = idNode.attr
        
        self.table.useScope(name)

    def n_mainDecl_exit(self, _: Ast):
        self.table.returnScope()

    def n_funcDecl(self, node: Ast):
        idNode = node[1]
        formalsNode = node[2]

        name = idNode.attr
        
        self.table.useScope(name)

        for formal in formalsNode:
            formalIdNode = formal[1]
            formalSig = formal.sig
            self.table.declare(formalIdNode.attr, formalSig)

    def n_funcDecl_exit(self, _: Ast):
        self.table.returnScope()

    def n_block(self, _: Ast):
        self.depth += 1

    def n_block_exit(self, _: Ast):
        self.depth -= 1

    def n_varDecl(self, node: Ast):
        if self.depth != 1:
            logError("local declaration not in outermost block", node.lineno)

        typeNode = node[0]
        idNode = node[1]

        name = idNode.attr
        sig = typeNode.sig 
        
        # Add entry to the symbol table
        if self.table.alreadyDefined(name):
            logError(f'{repr(name)} redefined', node.lineno)
        self.table.declare(name, sig)

        node.sig = sig

    def n_id(self, node: Ast):
        name = node.attr
        entry = self.table.lookup(name)

        if entry == None:
            logError(f"unknown identifier {repr(name)}", node.lineno)

        node.sym = entry.name 
        node.sig = entry.type
