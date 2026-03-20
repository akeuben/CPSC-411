from typing import Dict, Optional, Tuple, Union
from src.core.logging import logError
from src.semantics.symbol_table import SymbolTable
from src.core.cpsc411 import Ast, AstTraversal
from src.semantics.types import *

"""
The valid combination of types for given operators
"""

BinarySig = Tuple[Type, Type, Type]
UnarySig = Tuple[Type, Type]
Signature = Union[BinarySig, UnarySig]

valid: Dict[str, List[Signature]] = {
    "OR":       [ (TypeBoolean(), TypeBoolean(), TypeBoolean()) ],
    "AND":      [ (TypeBoolean(), TypeBoolean(), TypeBoolean())],
    "EQ":       [ (TypeBoolean(), TypeBoolean(), TypeBoolean()), (TypeInt(), TypeInt(), TypeBoolean()) ],
    "NE":       [ (TypeBoolean(), TypeBoolean(), TypeBoolean()), (TypeInt(), TypeInt(), TypeBoolean()) ],
    "ASSIGN":   [ (TypeBoolean(), TypeBoolean(), TypeBoolean()), (TypeInt(), TypeInt(), TypeInt()) ],
    "LT":       [ (TypeInt(), TypeInt(), TypeBoolean()) ],
    "GT":       [ (TypeInt(), TypeInt(), TypeBoolean()) ],
    "LE":       [ (TypeInt(), TypeInt(), TypeBoolean()) ],
    "GE":       [ (TypeInt(), TypeInt(), TypeBoolean()) ],
    "ADD":      [ (TypeInt(), TypeInt(), TypeInt()) ],
    "SUB":      [ (TypeInt(), TypeInt(), TypeInt()) ],
    "MUL":      [ (TypeInt(), TypeInt(), TypeInt()) ],
    "DIV":      [ (TypeInt(), TypeInt(), TypeInt()) ],
    "MOD":      [ (TypeInt(), TypeInt(), TypeInt()) ],
    "NOT":      [ (TypeBoolean(), TypeBoolean()) ],
    "UMINUS":   [ (TypeInt(), TypeInt()) ]
}

def computeResultingType(node: Ast, _type: str) -> Type:
    for v in valid[node.type]:
        signature = compteResultingTypeSingle(v, node)

        if signature != None:
            return signature[len(signature)-1]

    logError(f"type mismatch for {repr(_type)}", node.lineno)

def compteResultingTypeSingle(signature: Signature, node: Ast) -> Optional[Signature]:
    if len(signature) - 1 != len(node):
        return None

    for (expected, actual) in zip(signature, node):
        if expected != actual.sig:
            return None 
    return signature
    

class Pass3(AstTraversal):
    """
    Responsible for performing a magority
    of the type checking
    """

    table: SymbolTable
    breakDepth: int

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table
        self.breakDepth = 0

    def n_true(self, node: Ast):
        node.sig = TypeBoolean()

    def n_false(self, node: Ast):
        node.sig = TypeBoolean()

    def n_number(self, node: Ast):
        node.sig = TypeInt()

    def n_OR(self, node: Ast):
        node.sig = computeResultingType(node, "||")
    def n_AND(self, node: Ast):
        node.sig = computeResultingType(node, "&&")
    def n_EQ(self, node: Ast):
        node.sig = computeResultingType(node, "==")
    def n_NE(self, node: Ast):
        node.sig = computeResultingType(node, "!=")
    def n_ASSIGN(self, node: Ast):
        node.sig = computeResultingType(node, "=")
    def n_LT(self, node: Ast):
        node.sig = computeResultingType(node, "<")
    def n_GT(self, node: Ast):
        node.sig = computeResultingType(node, ">")
    def n_LE(self, node: Ast):
        node.sig = computeResultingType(node, "<=")
    def n_GE(self, node: Ast):
        node.sig = computeResultingType(node, ">=")
    def n_ADD(self, node: Ast):
        node.sig = computeResultingType(node, "+")
    def n_SUB(self, node: Ast):
        node.sig = computeResultingType(node, "-")
    def n_MUL(self, node: Ast):
        node.sig = computeResultingType(node, "*")
    def n_DIV(self, node: Ast):
        node.sig = computeResultingType(node, "/")
    def n_MOD(self, node: Ast):
        node.sig = computeResultingType(node, "%")
    def n_NOT(self, node: Ast):
        node.sig = computeResultingType(node, "!")
    def n_UMINUS(self, node: Ast):
        node.sig = computeResultingType(node, "-")

    def n_funcCall(self, node: Ast):
        idNode = node[0]
        actualsNode = node[1]

        funcSig = idNode.sig 

        if not isinstance(funcSig, TypeFunction):
            logError(f"number/type of arguments doesn't match function declaration", node.lineno)

        if funcSig.main:
            logError(f"can't call the main function", node.lineno)

        if len(actualsNode) != len(funcSig.formalParameterTypes):
            logError(f"number/type of arguments doesn't match function declaration", node.lineno)

        for (actualNode, expectedType) in zip(actualsNode, funcSig.formalParameterTypes):
            if actualNode.sig != expectedType:
                logError(f"number/type of arguments doesn't match function declaration", actualNode.lineno)

        retSig = idNode.sig.returnType 

        node.sig = retSig

    def n_whileStmt(self, node: Ast):
        conditionNode = node[0]

        if conditionNode.sig != TypeBoolean():
            logError("need a boolean expression", node.lineno)

    def n_ifStmt(self, node: Ast):
        conditionNode = node[0]

        if conditionNode.sig != TypeBoolean():
            logError("need a boolean expression", node.lineno)
