from src.core.logging import logError
from src.core.cpsc411 import AstTraversal, Ast

from src.semantics.types import Type, TypeVoid

from src.semantics.symbol_table import SymbolTable

class Pass4(AstTraversal):
    """
    Pass 4 is responsible for misc checks
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
        
    # Ensure break statements are within a while expression
    def n_whileStmt(self, _: Ast):
        self.breakDepth += 1 

    def n_whileStmt_exit(self, _: Ast):
        self.breakDepth -= 1

    def n_breakStmt(self, node: Ast):
        if self.breakDepth <= 0:
            logError("break must be inside 'while'", node.lineno)

    # Ensure that the return type of a function is correct.
    # We waited until stage 4 here as this check is easier with 
    # a preorder traversal, as we can save the expected type on enter,
    # and check once a return is encountered, or upon exiting the function
    def n_funcDecl(self, node: Ast):
        self.expectedReturnType = node[0].sig
        self.foundReturn = False

    def n_funcDecl_exit(self, node: Ast):
        retNode = node[0]
        idNode = node[1]
        name = idNode.attr

        if not self.foundReturn and retNode.sig != TypeVoid():
            logError(f'no return statement in non-void function {repr(name)}')

    def n_mainDecl(self, _: Ast):
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

    # Ensure integer literals are in range.
    def n_number(self, node: Ast):
        # We only look at absolute values 
        # as we use lexographical ordering to compare the literal 
        # with the bounds
        MAX_INT = "2147483647"
        MIN_INT = "2147483648"

        # The two values to comapre
        num: str = node.attr.strip()
        comparison = MAX_INT

        if num[0] == "-":
            comparison = MIN_INT
            num = num[1:]

        if len(num) < len(comparison):
            return 

        if len(num) > len(comparison):
            logError("number out of range", node.lineno)

        # This is a lexigraphical ordering 
        # since they are the same size.
        if num > comparison:
            logError("number out of range", node.lineno)

    # Ensure that expression statements are only assignments or function calls.
    def n_exprStmt(self, node: Ast):
        child = node[0]

        if child.type != "ASSIGN" and child.type != "funcCall":
            logError("must be assignment or function call", node.lineno)


