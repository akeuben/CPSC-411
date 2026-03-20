from src.core.logging import logError
from src.core.cpsc411 import AstTraversal, Ast

from src.semantics.types import TypeBoolean, TypeFunction, TypeInt, TypeVoid

from src.semantics.symbol_table import SymbolTable

class Pass1(AstTraversal):
    """
    Pass one is responsable for collecting all 
    global declarations, and 
    """

    table: SymbolTable
    mainFound: bool

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table
        self.mainFound = False

    def n_funcDecl(self, node: Ast):
        retTypeNode = node[0]
        idNode = node[1]
        formalsNode = node[2]

        retSig = retTypeNode.sig 
        # map the formals to their corresponding types
        formalsSig = [child.sig for child in formalsNode]

        name = idNode.attr
        sig = TypeFunction(retSig, formalsSig)

        # Add entry to the symbol table
        if self.table.alreadyDefined(name):
            logError(f'{repr(name)} redefined', node.lineno)
        entry = self.table.declare(name, sig)

        idNode.sym = entry.name
        idNode.sig = sig

    def n_mainDecl(self, node: Ast):
        # Check if this is a second main function
        if self.mainFound:
            logError("multiple main declarations found")
        
        self.mainFound = True

        retTypeNode = node[0]
        idNode = node[1]
        formalsNode = node[2]

        retSig = retTypeNode.sig 
        # map the formals to their corresponding types
        formalsSig = [child.sig for child in formalsNode]

        name = idNode.attr
        sig = TypeFunction(retSig, formalsSig)

        # Add entry to the symbol table
        if self.table.alreadyDefined(name):
            logError(f'{repr(name)} redefined', node.lineno)
        entry = self.table.declare(name, sig)

        idNode.sym = entry.name
        idNode.sig = sig

    def n_globVarDecl(self, node: Ast):
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

    def n_formal(self, node: Ast):
        node.sig = node[0].sig 
        node[1].sig = node[0].sig

    def n_void(self, node: Ast):
        node.sig = TypeVoid()

    def n_bool(self, node: Ast):
        node.sig = TypeBoolean()

    def n_int(self, node: Ast):
        node.sig = TypeInt()
