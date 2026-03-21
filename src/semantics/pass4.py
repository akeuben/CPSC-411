from src.core.logging import logError
from src.core.cpsc411 import AstTraversal, Ast

from src.semantics.types import Type, TypeBoolean, TypeFunction, TypeInt, TypeVoid

from src.semantics.symbol_table import SymbolTable

class Pass4(AstTraversal):
    """
    Pass one is responsable for collecting all 
    global declarations, and 
    """

    table: SymbolTable
    breakDepth: int
    expectedReturnType: Type
    foundReturn: bool;

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table
        self.breakDepth = 0
        self.expectedReturnType = TypeVoid()
        
    def n_whileStmt(self, node: Ast):
        self.breakDepth += 1 

    def n_whileStmt_exit(self, node: Ast):
        self.breakDepth -= 1

    def n_breakStmt(self, node: Ast):
        if self.breakDepth <= 0:
            logError("break must be inside 'while'", node.lineno)

    def n_funcDecl(self, node: Ast):
        self.expectedReturnType = node[0].sig
        self.foundReturn = False

    def n_funcDecl_exit(self, node: Ast):
        retNode = node[0]
        idNode = node[1]
        name = idNode.attr

        if not self.foundReturn and retNode.sig != TypeVoid():
            logError(f'no return statement in non-void function {repr(name)}')

    def n_mainDecl(self, node: Ast):
        self.expectedReturnType = TypeVoid()

    def n_returnStmt(self, node: Ast):
        if len(node) == 0:
            if self.expectedReturnType != TypeVoid():
                logError("this function must return a value", node.lineno)
            return

        if self.expectedReturnType == TypeVoid():
            logError("this function can't return a value", node.lineno)
        

        if node[0].sig != self.expectedReturnType:
            logError("returned value has the wrong type", node.lineno)

        self.foundReturn = True;

