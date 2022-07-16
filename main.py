#!/usr/bin/env python

import sys
import os

from src.parse.parser import parserFromLexer
from src.lex.lexer import lexerFromPath
from src.core.logging import logUsage, logUnknownFile
from src.core.cpsc411 import astview

shaper = """
type:
    $1
identifier:
    $1

ID: id

start/0:
    program

start/1:
    $1

globaldeclarations/2:
    $1 +($2)

globaldeclarations/1:
    program ($1)

globaldeclaration/1 with functiondeclaration:
    $1

globaldeclaration/1 with variabledeclaration:
    $1

globaldeclaration/1 with mainfunctiondeclaration:
    $1

mainfunctiondeclarator:
    mainDecl (void, $1, formals)

mainfunctiondeclaration:
    $1 +($2)

formalparameterlist/1:
    formals ($1)

formalparameterlist/3:
    $1 +($3)

formalparameter/2:
    formal ($1, $2)

functiondeclarator/4:
    funcDecl ($1, $3)

functiondeclarator/3:
    funcDecl ($1, formals)

variabledeclaration: 
    varDecl ($1, $2)

functionheader/2:
    $2 +($1)

functiondeclaration:
    $1 +($2)

blockstatement:
    $1

statement/2 with 'return':
    returnStmt

statement/3 with 'return':
    returnStmt ($2)

statement/5 with 'if':
    ifStmt ($3, $5)

statement/7 with 'if':
    ifElseStmt ($3, $5, $7)

statement/1:
    $1

statement/2:
    $1

conditionalorexpression/3:
    OR ($1, $3)

conditionalandexpression/3:
    AND ($1, $3)

equalityexpression/3 with '==':
    EQ ($1, $3)

equalityexpression/3 with '!=':
    NE ($1, $3)

blockstatements/2:
    $1 +($2)

blockstatements:
    block ($1)

block/3: $2

block/2: block

NUMBER:
    number

STRING:
    string

literal/1 with NUMBER:
    $1

literal/1 with STRING:
    $1

literal/1 with 'true':
    $1

literal/1 with 'false':
    $1

primary/1:
    $1

postfixexpression/1:
    $1

unaryexpression/1:
    $1

multiplicativeexpression/1:
    $1

additiveexpression/1:
    $1

additiveexpression/3 with '+':
    ADD ($1, $3)

additiveexpression/3 with '-':
    SUB ($1, $3)

multiplicativeexpression/3 with '*':
    MUL ($1, $3)

multiplicativeexpression/3 with '/':
    DIV ($1, $3)

multiplicativeexpression/3 with '%':
    MOD ($1, $3)

unaryexpression/2 with '-':
    UMINUS ($2)

primary/3:
    $2

relationalexpression/1:
    $1

equalityexpression/1:
    $1

conditionalandexpression/1:
    $1
conditionalorexpression/1:
    $1
assignmentexpression/1:
    $1
assignment/3:
    ASSIGN ($1, $3)

statementexpression:
    exprStmt ($1)

functioninvocation/4:
    funcCall ($1, $3)

functioninvocation/3:
    funcCall ($1, actuals)

expression/1:
    $1

argumentlist/1:
    actuals ($1)

argumentlist/3:
    $1 +($3)

'int': 
    int

'boolean':
    bool 

'true':
    true 

'false':
    false

'void':
    void
"""

def main() -> None:
    if len(sys.argv) != 2:
        logUsage(sys.argv[0])
        return

    path = sys.argv[1]

    try:
        lexer = lexerFromPath(path)
    except:
        logUnknownFile(path)
        return

    parser = parserFromLexer(lexer)

    tree = parser.getTree(shaper)

    for child in tree:
        if child.type == "varDecl":
            child.type = "globVarDecl";
        if child.type == "funcDecl":
            child[0], child[1], child[2], child[3] = child[2], child[0], child[1], child[3]

    isDebug = os.environ.get("DEBUG")

    if isDebug:
        astview.ASTView(tree).x11()

    print(tree)

if __name__ == '__main__':
    main()
