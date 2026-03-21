from src.core.logging import logError
from src.semantics.symbol_table import SymbolTable, register_var
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

    # We take advantage of the ordering of the children nodes of funcDecl/mainDecl 
    # and the fact that this is a preorder traveral. We don't want the scope to 
    # start when encountering the funcDecl node, as the id of the function (a child of 
    # funcDecl) does not belong to that local scope, instead, the global scope.
    def n_formals(self, _: Ast):
        self.table.useScope()

    # Only once we leave both the formals and the top most block do we return the scope,
    # which equivalent to when we leave the function delaration
    def n_mainDecl_exit(self, _: Ast):
        self.table.returnScope()

    # Only once we leave both the formals and the top most block do we return the scope,
    # which equivalent to when we leave the function delaration
    def n_funcDecl_exit(self, _: Ast):
        self.table.returnScope()

    def n_formal(self, node: Ast):
        register_var(self.table, node, True)

    # Entering or leaving a block changes the depth of the current scope. We 
    # must keep track of this to ensure local variables are not declared in 
    # an inner scope.
    def n_block(self, _: Ast):
        self.depth += 1

    def n_block_exit(self, _: Ast):
        self.depth -= 1

    def n_varDecl(self, node: Ast):
        if self.depth != 1:
            logError("local declaration not in outermost block", node.lineno)

        register_var(self.table, node, True)

    # At this point, we are free to lookup and resolve id nodes to their declared entries 
    # in the symbol table
    def n_id(self, node: Ast):
        name = node.attr
        entry = self.table.lookup(name)

        if entry == None:
            logError(f"unknown identifier {repr(name)}", node.lineno)

        node.sym = entry.name 
        node.sig = entry.type
