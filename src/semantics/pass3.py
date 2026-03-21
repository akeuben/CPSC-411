from typing import Dict, Optional, Tuple, Union
from src.core.logging import logError
from src.semantics.symbol_table import SymbolTable
from src.core.cpsc411 import Ast, AstTraversal
from src.semantics.types import *

BinarySig = Tuple[Type, Type, Type]
UnarySig = Tuple[Type, Type]
Signature = Union[BinarySig, UnarySig]

"""
The valid combination of types for given operators
"""
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
    """
    Computes the resulting type of an expression. For example, 5 + 3 is of type 
    TypeInt(). If the expression is invalid, and error is properly logged, and 
    the program terminates.
    """
    # Check each valid combination
    for v in valid[node.type]:
        signature = compteResultingTypeSingle(v, node)

        if signature != None:
            return signature[len(signature)-1]

    logError(f"type mismatch for {repr(_type)}", node.lineno)

def compteResultingTypeSingle(signature: Signature, node: Ast) -> Optional[Signature]:
    """
    Compytes the resulting type of an expression, if it is valid for the given 
    signature. Otherwise, produces None.
    """

    # If the number of entries in the expression does not match the signature,
    # then certainly the expression does not match.
    if len(signature) - 1 != len(node):
        return None

    # Check each entry in the expression to make sure it matches the signature
    for (expected, actual) in zip(signature, node):
        if expected != actual.sig:
            return None 

    return signature
    

class Pass3(AstTraversal):
    """
    Responsible for performing a majority
    of the type checking
    """

    table: SymbolTable

    def __init__(self, ast: Ast, table: SymbolTable):
        super().__init__(ast)
        self.table = table

    # Assign types to the most basic constructs
    def n_true(self, node: Ast):
        node.sig = TypeBoolean()
    def n_false(self, node: Ast):
        node.sig = TypeBoolean()
    def n_number(self, node: Ast):
        node.sig = TypeInt()
    def n_string(self, node: Ast):
        node.sig = TypeString()

    # Assign types to more complex expressions
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
        # Destructure Children
        idNode = node[0]
        actualsNode = node[1]

        funcSig = idNode.sig 

        # Check if the function call actually references a function. This is not checked in 
        # the reference compiler, instead returning a message stating that the number of arguments 
        # is incorrect.
        if not isinstance(funcSig, TypeFunction):
            logError(f"cannot call the variable {idNode.attr}", node.lineno)

        # We can't call the main function
        if funcSig.main:
            logError(f"can't call the main function", node.lineno)

        # Ensure formal parameters match
        if len(actualsNode) != len(funcSig.formalParameterTypes):
            logError(f"number/type of arguments doesn't match function declaration", node.lineno)
        for (actualNode, expectedType) in zip(actualsNode, funcSig.formalParameterTypes):
            if actualNode.sig != expectedType:
                logError(f"number/type of arguments doesn't match function declaration", actualNode.lineno)

        # Add the return type
        retSig = idNode.sig.returnType 
        node.sig = retSig

    # Ensure that the condition of a while loop or for loop is a boolean expression
    def n_whileStmt(self, node: Ast):
        conditionNode = node[0]

        if conditionNode.sig != TypeBoolean():
            logError("need a boolean expression", node.lineno)

    def n_ifStmt(self, node: Ast):
        conditionNode = node[0]

        if conditionNode.sig != TypeBoolean():
            logError("need a boolean expression", node.lineno)
