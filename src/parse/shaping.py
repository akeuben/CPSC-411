from typing import List
from src.core.cpsc411 import AstShaper 

class Shaper(AstShaper):
    def __init__(self, shape: str):
        super().__init__(shape)

    def nonterminal(self, type: str, lineno: int, children: List): 
        # We need to special case unary minus with a number 
        # child to pre-add the negative sign. We do this at 
        # most once to match the implementation of the reference compiler.
        # We do this only when the node is a "UMINUS" node with a number child that does not 
        # yet have the negative sign
        if type == "UMINUS" and children[0].type == "number" and not children[0].attr.startswith("-"):
            children[0].attr = f"-{children[0].attr}"
            return children[0]

        # Using the built in shaping tools, we cannot organize the children of a funcDecl or mainDecl 
        # to be in the order retType, id, formals, block. We instead do this as a post processing step. 
        # We shaped the parent node of the function declaration to be a xxxParent node so that we 
        # can easily find it and modify it in this following block. We reorder the children before proceeding 
        # as normal with the shaping.
        if type == "funcDeclParent" or type == "mainDeclParent":
            id = children[0][0]
            formals = children[0][1]
            retType = children[0][2]
            block = children[1]
            children = [retType, id, formals, block]
            type = type.replace("Parent", "")

        return super().nonterminal(type, lineno, children)
