"""
Pass 1: (post order) Global declarations
Pass 2: (pre/post order) All definitions
Pass 3: (post order) Type checking 
Pass 4: (pre/post order) Misc Checks

[x] No main declaration found.
[x] Multiple main declarations found.
[x] A local declaration was not in an outermost block.
[x] The number/type of arguments in a function call doesn't match the function's declaration.
[x] The main function can't be called.
[ ] Break statements must be inside a while statement.
[x] Type mismatch for an operator (||, &&, ==, !=, =, <, >, <=, >=, +, - (unary and binary), *, /, %, !).
[ ] A void function can't return a value.
[ ] A non-void function must return a value.
[ ] A value returned from a function has the wrong type.
[ ] No return statements at all are present in a non-void function. Note that you're only checking for the existence of an appropriate return statement at the semantic checking stage, not whether it's actually executed.
[x] An if- or while-condition must be of Boolean type.
[x] An identifier is redefined within the same scope.
[x] An undeclared identifier is used.
[ ] An integer literal is out of range.
[x] The main declaration can't have parameters (if not handled during parsing).
[ ] A statementexpression can only be an assignment or function invocation (if not handled during parsing).
"""

from src.semantics.pass4 import Pass4
from src.semantics.pass3 import Pass3
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

    pass3 = Pass3(tree, table)
    pass3.postorder()

    pass4 = Pass4(tree, table)
    pass4.preorder()

    return table
