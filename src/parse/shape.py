terminals = """
// terminal symbols
ID: 
    id
NUMBER:
    number
STRING:
    string
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

// basic rules that pass through a terminal symbol
type:
    $1
identifier:
    $1
literal/1 with NUMBER:
    $1
literal/1 with STRING:
    $1
literal/1 with 'true':
    $1
literal/1 with 'false':
    $1
"""

globaldeclarations = """
// an empty program should consist only of a program node
start/0:
    program
// if there are global declarations, then the program node is the immediate child of the start node
start/1:
    $1

// Promote children up to same level as parent node. Flattens the tree of global declarations
globaldeclarations/2:
    $1 +($2)
// the root globaldeclarations becomes the program node (root node of the tree)
globaldeclarations/1:
    program ($1)

globaldeclaration/1 with functiondeclaration:
    $1
globaldeclaration/1 with globvariabledeclaration:
    $1
globaldeclaration/1 with mainfunctiondeclaration:
    $1

// Both the main function and other functions are shaped to the same form, 
// a parent node followed by the declaration (id, formals, and return type)
// and the block. Later gets flattened in the `nonterminal` overriden function in the 
// shaper to be of the form funcDecl (returnType, id, formals, block)
mainfunctiondeclaration:
    mainDeclParent ($1, $2)
mainfunctiondeclarator/3:
    mainDecl ($1, formals, void)
mainfunctiondeclarator/4:
    mainDecl ($1, $3, void)

functiondeclaration:
    funcDeclParent ($1, $2)
functionheader/2:
    $2 +($1)
functiondeclarator/3:
    funcDecl ($1, formals)
functiondeclarator/4:
    funcDecl ($1, $3)

// Flatten formal parameter list
formalparameterlist/1:
    formals ($1)
formalparameterlist/3:
    $1 +($3)
formalparameter/2:
    formal ($1, $2)

globvariabledeclaration: 
    globVarDecl ($1, $2)

"""

statements = """
variabledeclaration: 
    varDecl ($1, $2)

statement/2 with 'return':
    returnStmt
statement/2 with 'break':
    breakStmt
statement/3 with 'return':
    returnStmt ($2)
statement/1 with ';':
    nullStmt

statement/5 with 'if':
    ifStmt ($3, $5)
statement/5 with 'while':
    whileStmt ($3, $5)
statement/7 with 'if':
    ifElseStmt ($3, $5, $7)

statement/1:
    $1
statement/2:
    $1

blockstatements/2:
    $1 +($2)
blockstatements:
    block ($1)
blockstatement:
    $1

block/3: $2
block/2: block
"""

expressions = """
expression/1:
    $1

conditionalorexpression/3:
    OR ($1, $3)
conditionalandexpression/3:
    AND ($1, $3)

conditionalandexpression/1:
    $1
conditionalorexpression/1:
    $1
assignmentexpression/1:
    $1

equalityexpression/3 with '==':
    EQ ($1, $3)
relationalexpression/3 with '>':
    GT ($1, $3)
relationalexpression/3 with '>=':
    GE ($1, $3)
relationalexpression/3 with '<':
    LT ($1, $3)
relationalexpression/3 with '<=':
    LE ($1, $3)
equalityexpression/3 with '!=':
    NE ($1, $3)

primary/1:
    $1
primary/3:
    $2

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

relationalexpression/1:
    $1
equalityexpression/1:
    $1

assignment/3:
    ASSIGN ($1, $3)

statementexpression:
    exprStmt ($1)
""";

functions = """
functioninvocation/4:
    funcCall ($1, $3)

functioninvocation/3:
    funcCall ($1, actuals)

argumentlist/1:
    actuals ($1)

argumentlist/3:
    $1 +($3)
""";

shape = terminals + globaldeclarations + statements + expressions + functions
