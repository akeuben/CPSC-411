# Milestone 3 - Avery Keuben (30170731)

*Project URL:* [https://csgit.ucalgary.ca/avery.keuben/cpsc-411](https://csgit.ucalgary.ca/avery.keuben/cpsc-411)

*Git Tag:* `milestone-3`

*AI Disclaimer:* AI was not used in the completion of this project.

*Self Assessment:* Outstanding perfomance

# Self Assessment Evidence

## Code Qualities 
1. *Good error and warning messages output.* The included testing system ensures that my compiler outputs the same warnings and errors as the reference compiler on all test cases. They include the line numbers and a description of the issue. As described in the specification, the messages "should convey at least the same information [as the reference compiler]" which mine does exactly.
2. *Predictable, reliable, and tested:* The compiler outputs the exact same syntax tree as the reference compiler (using the included testing system, `make test`), as well as the same checks and corresponding error messages.

## Development Practices
3. *Incremental development.* See git history. Each commit is atomic, changing or adding a single change per commit.
4. *Documentation of code changes: good commit messages.* See git history. Each commit accuretly descibes the content of the commit.

## Code Qualities
1. *Code is readable:* 
    - In each pass of the AST traversal, common nodes are grouped together. For example, in pass 3, all binary expressions are grouped together, unary expression are grouped together, and literals are grouped together. 
    - Functions that perform the same check and have some kind of dependency on eachother are grouped together. For example, is pass 2, the block entry and exit are grouped with local variable declarations, as we check to ensure that such declarations are within the outermost local scope.
2. *Code is well documented:* 
    - Comments explain what each grouping of functions in each pass are for. 
    - Comments describe non-obvious behaviour, such as the comment above `n_formals`:
    
    ```python
    # We take advantage of the ordering of the children nodes of funcDecl/mainDecl 
    # and the fact that this is a preorder traveral. We don't want the scope to 
    # start when encountering the funcDecl node, as the id of the function (a child of 
    # funcDecl) does not belong to that local scope, instead, the global scope.
    ```
3. *Code is modular and well-structured.* 
    - The only interface that is necessary into the semantic checker is `check_semantics()` defined in `src/sematnics/semantic_checking.py`. This internally heandles each pass, and returns the symbol table that was generated. This leads to minimial code in the main routine. 
    - Each pass is separated into its own file to ensure seperation of concerns. Also makes it easier to see what the different passes are responsible for.
4. *Code does not contain unnecessary duplication.* 
    - Node is not duplicated unnecessarly. Each unary/binary operation type checking in pass 3 is abstracted into a helper function, `computeResultingType` which heandles all the functionality that is needed for each of these node types.
    - Registering of variables and functions in the symbol table is done in multiple places. For that reason, abstractions were provided for the common functionality within the symbol table file.
5. *Code is consistant, e.g., with respect to variable and function naming conventions.* 
    - All variables and functions use camel case (e.g. `parserFromLexer`)
        - Python traditionally uses snake case, but antlr4 uses camel case (e.g. `symbolicNames`), so I decided to remain consistant with the core library we are using.
    - All classes are named with pascal case (e.g. `Parser` or `ParserErrorListener`)
6. *Speed* See run output. Code runs in a reasonable amount of time. The code uses the provided ASTTraversal class, as expected, so that introduces no significant issues. Loops are used only as necessary. There may be slight performance degridation from function overhead due to abstractions, but not enough to affect performance in a meaningful way, and the abstractions provide a meaningful benefit to the structure of the compiler code.
7. *Code respects the environment in terms of the implementation language* 
    - No additional libraries were used for the project, besides ANTLR4 and cpsc411, which is required. Made use of ANTLR4 and cpsc411 in the intended way, just with a small wrapper around it.
    - Used the idomatic main function in python, including using `if __name__ == "__main__": main()` to ensure the main function is only ever called if it is the intended file to run. Also overrode the `__str__` and `__repr__` functions for the type classes to ensure that they have nice printing, including in ASTView. 
    - Used try-except in case of an unknown file instead of checking if the file exists first. 
    - Used exceptions to throw errors in case of a critical failure that should not occur, as an assert.
8. *Code respects the environment in terms of tool usage:*
    - Used the provided grammar file with only small tweaks as recommended by the test cases, or to differentiate globalVariableDeclarations from local variableDeclarations.
    - Used ASTShaper in the intended way, only branching out to overriding the `nonterminal` function of the Shaper class when the shaping tools could not solve the problem in question
13. 

## Relationship with Runtime Environment
1. *Consistent with the environment: error and warning messages sent to stderr, regular output sent to stdout, exit status code set appropriately.*
    - Errors and warnings are sent to `stderr` (see run output)
    - AST with additional attributes are printed to `stdout`, as required.
    - Exiting due to a parsing error, lexing error, invalid command line usage, or unknown file results in an exit code of `1`. (see run output)
    - All error messages, warning messages, exit codes, and output messages are equivalent to that of the reference compiler (see custom unit testing output)
2. *No extraneous garbage in the output.* 
    - Output is not colourized (see output)
    - Output matches character for character with the reference compiler.
3. *Easy to build, and building without errors or warnings.*
    - No errors or warnings (see run output)
    - Building is easy using the provided make file (just run `make`)
4. *Easy to run. Since the compiler's audience is you and the TA, it should be easy to run in the sense that it works to spec.* 
    - Works with the provided `run` command.
    - Upon a fresh clone, all that is necessary is to run `make` and then run the main file `./main.py <input>` or `python main.py <input>`
    - You can easily run the provided unit tests with `make test`

## Run Output 
```
Run started on Fri Mar 20 19:16:15 2026

Hostname: csx1.uc.ucalgary.ca

-------------------------------------------------------------------------------
Running make |
--------------

% /usr/bin/make

STDOUT:
cd grammar && ~aycock/411/bin/cpsc411-antlr4 lex.g4 -o ../src/generated
cpsc411-antlr4: ANTLR4 succeeded

cpsc411-antlr4: start your main Python code as follows...
import sys
sys.path.insert(0, '/home/profs/aycock/411/lib/antlr4/python3.13')
cd grammar && ~aycock/411/bin/cpsc411-antlr4 parse.g4 -o ../src/generated
cpsc411-antlr4: ANTLR4 succeeded

cpsc411-antlr4: start your main Python code as follows...
import sys
sys.path.insert(0, '/home/profs/aycock/411/lib/antlr4/python3.13')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Locating J-- compiler |
-----------------------

Compiler will be run as /usr/bin/python3 main.py

-------------------------------------------------------------------------------
Test: too few arguments |
-------------------------

% /usr/bin/python3 main.py

STDOUT:


STDERR:
Usage: python3 main.py file.j--


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: too many arguments |
--------------------------

% /usr/bin/python3 main.py /dev/null /dev/zero

STDOUT:


STDERR:
Usage: python3 main.py file.j--


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: nonexistent file |
------------------------

% /usr/bin/python3 main.py /i/do/not/exist

STDOUT:


STDERR:
/i/do/not/exist: No such file or directory


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: missing main declaration |
--------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t01

STDOUT:


STDERR:
error: no main declaration found


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: function call doesn't match declaration |
-----------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t02

STDOUT:


STDERR:
error: number/type of arguments doesn't match function declaration at or near line 7


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: missing return |
----------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t03

STDOUT:


STDERR:
error: no return statement in non-void function 'foo'


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: main function with parameter |
------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t04

STDOUT:


STDERR:
error: main declaration can't have parameters at or near line 3


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: duplicate global names |
------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t05

STDOUT:


STDERR:
error: 'foo' redefined at or near line 5


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: nonlocal variable access type checking |
----------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t06

STDOUT:
program (lineno=3)
    globVarDecl (lineno=3)
        int (attr='int', lineno=3, sig='int')
        id (attr='foo', lineno=3, sym=sym7, sig='int')
    globVarDecl (lineno=5)
        int (attr='int', lineno=5, sig='int')
        id (attr='bar', lineno=5, sym=sym8, sig='int')
    funcDecl (lineno=7)
        bool (attr='boolean', lineno=7, sig='bool')
        id (attr='baz', lineno=7, sym=sym9, sig='f(int,bool)')
        formals (lineno=7)
            formal (lineno=7, sig='int')
                int (attr='int', lineno=7, sig='int')
                id (attr='baz', lineno=7, sym=sym11, sig='int')
            formal (lineno=7, sig='bool')
                bool (attr='boolean', lineno=7, sig='bool')
                id (attr='foo', lineno=7, sym=sym12, sig='bool')
        block (lineno=8)
            exprStmt (lineno=8)
                ASSIGN (lineno=8, sig='int')
                    id (attr='bar', lineno=8, sym=sym8, sig='int')
                    id (attr='baz', lineno=8, sym=sym11, sig='int')
            exprStmt (lineno=9)
                ASSIGN (lineno=9, sig='bool')
                    id (attr='foo', lineno=9, sym=sym12, sig='bool')
                    true (attr='true', lineno=9, sig='bool')
            returnStmt (lineno=10)
                false (attr='false', lineno=10, sig='bool')
    mainDecl (lineno=13)
        void (lineno=13, sig='void')
        id (attr='main', lineno=13, sym=sym10, sig='f()')
        formals (lineno=13)
        block (lineno=13)


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: no declarations in inner blocks |
---------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t07

STDOUT:


STDERR:
error: local declaration not in outermost block at or near line 8


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: mixing statements and declarations |
------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t08

STDOUT:
program (lineno=3)
    globVarDecl (lineno=3)
        int (attr='int', lineno=3, sig='int')
        id (attr='foo', lineno=3, sym=sym7, sig='int')
    mainDecl (lineno=5)
        void (lineno=5, sig='void')
        id (attr='main', lineno=5, sym=sym8, sig='f()')
        formals (lineno=5)
        block (lineno=6)
            varDecl (lineno=6, sig='int')
                int (attr='int', lineno=6, sig='int')
                id (attr='foo', lineno=6, sym=sym9, sig='int')
            ifStmt (lineno=7)
                true (attr='true', lineno=7, sig='bool')
                block (lineno=7)
            varDecl (lineno=9, sig='int')
                int (attr='int', lineno=9, sig='int')
                id (attr='bar', lineno=9, sym=sym10, sig='int')
            exprStmt (lineno=10)
                funcCall (lineno=10, sig='void')
                    id (attr='prints', lineno=10, sym=sym1, sig='f(string)')
                    actuals (lineno=10)
                        string (attr='"Hello, world!\\n"', lineno=10, sig='string')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: the main return |
-----------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t09

STDOUT:
program (lineno=3)
    mainDecl (lineno=3)
        void (lineno=3, sig='void')
        id (attr='main', lineno=3, sym=sym7, sig='f()')
        formals (lineno=3)
        block (lineno=4)
            returnStmt (lineno=4)


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: main can't return a value |
---------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t10

STDOUT:


STDERR:
error: this function can't return a value at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: return type mismatch |
----------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t11

STDOUT:


STDERR:
error: this function must return a value at or near line 11


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: the return of return type mismatch |
------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t12

STDOUT:


STDERR:
error: returned value has the wrong type at or near line 11


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: brake the compiler |
--------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t13

STDOUT:


STDERR:
error: break must be inside 'while' at or near line 6


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: nested breaks |
---------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t14

STDOUT:
program (lineno=3)
    mainDecl (lineno=3)
        void (lineno=3, sig='void')
        id (attr='main', lineno=3, sym=sym7, sig='f()')
        formals (lineno=3)
        block (lineno=4)
            whileStmt (lineno=4)
                true (attr='true', lineno=4, sig='bool')
                block (lineno=5)
                    whileStmt (lineno=5)
                        true (attr='true', lineno=5, sig='bool')
                        breakStmt (lineno=6)
                    breakStmt (lineno=7)


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: you never call me |
-------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t15

STDOUT:


STDERR:
error: can't call the main function at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: either syntax or semantics |
----------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t16

STDOUT:


STDERR:
error: must be assignment or function call at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: one isn't true |
----------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t17

STDOUT:


STDERR:
error: need a boolean expression at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: support your local library |
----------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t18

STDOUT:
program (lineno=3)
    mainDecl (lineno=3)
        void (lineno=3, sig='void')
        id (attr='main', lineno=3, sym=sym7, sig='f()')
        formals (lineno=3)
        block (lineno=4)
            exprStmt (lineno=4)
                funcCall (lineno=4, sig='void')
                    id (attr='prints', lineno=4, sym=sym1, sig='f(string)')
                    actuals (lineno=4)
                        string (attr='"Hello, world!\\n"', lineno=4, sig='string')
            exprStmt (lineno=5)
                funcCall (lineno=5, sig='void')
                    id (attr='printb', lineno=5, sym=sym3, sig='f(bool)')
                    actuals (lineno=5)
                        true (attr='true', lineno=5, sig='bool')
            exprStmt (lineno=6)
                funcCall (lineno=6, sig='void')
                    id (attr='printi', lineno=6, sym=sym2, sig='f(int)')
                    actuals (lineno=6)
                        number (attr='123', lineno=6, sig='int')
            exprStmt (lineno=7)
                funcCall (lineno=7, sig='void')
                    id (attr='printc', lineno=7, sym=sym4, sig='f(int)')
                    actuals (lineno=7)
                        number (attr='123', lineno=7, sig='int')
            exprStmt (lineno=8)
                funcCall (lineno=8, sig='int')
                    id (attr='getchar', lineno=8, sym=sym5, sig='f()')
                    actuals (lineno=8)
            exprStmt (lineno=9)
                funcCall (lineno=9, sig='void')
                    id (attr='halt', lineno=9, sym=sym6, sig='f()')
                    actuals (lineno=9)


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: purple main |
-------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t19

STDOUT:


STDERR:
error: number/type of arguments doesn't match function declaration at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: type mismatch |
---------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t20

STDOUT:


STDERR:
error: type mismatch for '+' at or near line 10


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: return type/argument mismatch |
-------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t21

STDOUT:


STDERR:
error: number/type of arguments doesn't match function declaration at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: undefined variable |
--------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t22

STDOUT:


STDERR:
error: unknown identifier 'x' at or near line 4


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: parameter scope check |
-----------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t23

STDOUT:
program (lineno=3)
    funcDecl (lineno=3)
        int (attr='int', lineno=3, sig='int')
        id (attr='foo', lineno=3, sym=sym7, sig='f(int)')
        formals (lineno=3)
            formal (lineno=3, sig='int')
                int (attr='int', lineno=3, sig='int')
                id (attr='foo', lineno=3, sym=sym9, sig='int')
        block (lineno=4)
            exprStmt (lineno=4)
                ASSIGN (lineno=4, sig='int')
                    id (attr='foo', lineno=4, sym=sym9, sig='int')
                    number (attr='5', lineno=4, sig='int')
            returnStmt (lineno=5)
                id (attr='foo', lineno=5, sym=sym9, sig='int')
    mainDecl (lineno=8)
        void (lineno=8, sig='void')
        id (attr='main', lineno=8, sym=sym8, sig='f()')
        formals (lineno=8)
        block (lineno=9)
            exprStmt (lineno=9)
                funcCall (lineno=9, sig='int')
                    id (attr='foo', lineno=9, sym=sym7, sig='f(int)')
                    actuals (lineno=9)
                        number (attr='2', lineno=9, sig='int')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: will the real main please stand up |
------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t24

STDOUT:


STDERR:
error: multiple main declarations found


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: a forward-looking test |
------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t25

STDOUT:
program (lineno=3)
    mainDecl (lineno=3)
        void (lineno=3, sig='void')
        id (attr='qwerty', lineno=3, sym=sym7, sig='f()')
        formals (lineno=3)
        block (lineno=5)
            exprStmt (lineno=5)
                funcCall (lineno=5, sig='void')
                    id (attr='printi', lineno=5, sym=sym2, sig='f(int)')
                    actuals (lineno=5)
                        id (attr='asdf', lineno=5, sym=sym8, sig='int')
            exprStmt (lineno=6)
                funcCall (lineno=6, sig='void')
                    id (attr='qaz', lineno=6, sym=sym9, sig='f(int)')
                    actuals (lineno=6)
                        id (attr='asdf', lineno=6, sym=sym8, sig='int')
    globVarDecl (lineno=9)
        int (attr='int', lineno=9, sig='int')
        id (attr='asdf', lineno=9, sym=sym8, sig='int')
    funcDecl (lineno=11)
        void (attr='void', lineno=11, sig='void')
        id (attr='qaz', lineno=11, sym=sym9, sig='f(int)')
        formals (lineno=11)
            formal (lineno=11, sig='int')
                int (attr='int', lineno=11, sig='int')
                id (attr='i', lineno=11, sym=sym11, sig='int')
        block (lineno=13)
            exprStmt (lineno=13)
                funcCall (lineno=13, sig='void')
                    id (attr='printc', lineno=13, sym=sym4, sig='f(int)')
                    actuals (lineno=13)
                        id (attr='asdf', lineno=13, sym=sym8, sig='int')
            exprStmt (lineno=14)
                funcCall (lineno=14, sig='void')
                    id (attr='qaz', lineno=14, sym=sym9, sig='f(int)')
                    actuals (lineno=14)
                        number (attr='42', lineno=14, sig='int')
            exprStmt (lineno=15)
                ASSIGN (lineno=15, sig='bool')
                    id (attr='uiop', lineno=15, sym=sym10, sig='bool')
                    false (attr='false', lineno=15, sig='bool')
    globVarDecl (lineno=18)
        bool (attr='boolean', lineno=18, sig='bool')
        id (attr='uiop', lineno=18, sym=sym10, sig='bool')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: omg it's like a literal range check |
-------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t26

STDOUT:


STDERR:
error: number out of range at or near line 7


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: omg but this check passes lol |
-------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t27

STDOUT:
program (lineno=3)
    globVarDecl (lineno=3)
        int (attr='int', lineno=3, sig='int')
        id (attr='i', lineno=3, sym=sym7, sig='int')
    mainDecl (lineno=5)
        void (lineno=5, sig='void')
        id (attr='main', lineno=5, sym=sym8, sig='f()')
        formals (lineno=5)
        block (lineno=6)
            exprStmt (lineno=6)
                ASSIGN (lineno=6, sig='int')
                    id (attr='i', lineno=6, sym=sym7, sig='int')
                    number (attr='2147483647', lineno=6, sig='int')
            exprStmt (lineno=7)
                ASSIGN (lineno=7, sig='int')
                    id (attr='i', lineno=7, sym=sym7, sig='int')
                    number (attr='-2147483648', lineno=7, sig='int')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: as the Germans say: nine |
--------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t28

STDOUT:


STDERR:
error: number out of range at or near line 6


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: deep type propagation |
-----------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t29

STDOUT:
program (lineno=3)
    mainDecl (lineno=3)
        void (lineno=3, sig='void')
        id (attr='main', lineno=3, sym=sym7, sig='f()')
        formals (lineno=3)
        block (lineno=4)
            varDecl (lineno=4, sig='int')
                int (attr='int', lineno=4, sig='int')
                id (attr='x', lineno=4, sym=sym8, sig='int')
            varDecl (lineno=5, sig='bool')
                bool (attr='boolean', lineno=5, sig='bool')
                id (attr='b', lineno=5, sym=sym9, sig='bool')
            exprStmt (lineno=7)
                ASSIGN (lineno=7, sig='bool')
                    id (attr='b', lineno=7, sym=sym9, sig='bool')
                    GE (lineno=7, sig='bool')
                        SUB (lineno=7, sig='int')
                            ADD (lineno=7, sig='int')
                                number (attr='2', lineno=7, sig='int')
                                MUL (lineno=7, sig='int')
                                    number (attr='3', lineno=7, sig='int')
                                    number (attr='5', lineno=7, sig='int')
                            number (attr='123', lineno=7, sig='int')
                        UMINUS (lineno=7, sig='int')
                            UMINUS (lineno=7, sig='int')
                                UMINUS (lineno=7, sig='int')
                                    id (attr='x', lineno=7, sym=sym8, sig='int')
            exprStmt (lineno=9)
                ASSIGN (lineno=9, sig='bool')
                    id (attr='b', lineno=9, sym=sym9, sig='bool')
                    NE (lineno=9, sig='bool')
                        NOT (lineno=9, sig='bool')
                            NOT (lineno=9, sig='bool')
                                NOT (lineno=9, sig='bool')
                                    OR (lineno=9, sig='bool')
                                        AND (lineno=9, sig='bool')
                                            true (attr='true', lineno=9, sig='bool')
                                            false (attr='false', lineno=9, sig='bool')
                                        EQ (lineno=9, sig='bool')
                                            id (attr='b', lineno=9, sym=sym9, sig='bool')
                                            true (attr='true', lineno=9, sig='bool')
                        LE (lineno=9, sig='bool')
                            number (attr='5', lineno=9, sig='int')
                            number (attr='6', lineno=9, sig='int')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: local variable scope check |
----------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t30

STDOUT:
program (lineno=3)
    globVarDecl (lineno=3)
        int (attr='int', lineno=3, sig='int')
        id (attr='i', lineno=3, sym=sym7, sig='int')
    mainDecl (lineno=5)
        void (lineno=5, sig='void')
        id (attr='main', lineno=5, sym=sym8, sig='f()')
        formals (lineno=5)
        block (lineno=7)
            exprStmt (lineno=7)
                funcCall (lineno=7, sig='void')
                    id (attr='printi', lineno=7, sym=sym2, sig='f(int)')
                    actuals (lineno=7)
                        id (attr='i', lineno=7, sym=sym7, sig='int')
            varDecl (lineno=8, sig='bool')
                bool (attr='boolean', lineno=8, sig='bool')
                id (attr='i', lineno=8, sym=sym9, sig='bool')
            exprStmt (lineno=9)
                funcCall (lineno=9, sig='void')
                    id (attr='printb', lineno=9, sym=sym3, sig='f(bool)')
                    actuals (lineno=9)
                        id (attr='i', lineno=9, sym=sym9, sig='bool')


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: a marvelous cameo by doc octalpus |
-----------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms3/semantic.t31

STDOUT:


STDERR:
error: number out of range at or near line 6


RETURN CODE: 1

Run ended on Fri Mar 20 19:16:18 2026
```

## Custom Testing tool output
```
python test/run_tests.py lex ./main_lexer.py test/tests/lex
>> Test: basic_constructs.json passed!
>> Test: comment_EOL_check.json passed!
>> Test: comment_ending_in_EOF.json passed!
>> Test: comment_inside_&&_token_pair.json passed!
>> Test: comments_only.json passed!
>> Test: empty_file.json passed!
>> Test: illegal_Unicode_string_escape.json passed!
>> Test: illegal_characters.json passed!
>> Test: illegal_hex_string_escape.json passed!
>> Test: illegal_octal_string_escape.json passed!
>> Test: illegal_string_escape_character.json passed!
>> Test: illegal_whitespace.json passed!
>> Test: legal_strings.json passed!
>> Test: legal_whitespace.json passed!
>> Test: legit_token_salad.json passed!
>> Test: multi-line_string.json passed!
>> Test: non-7-bit_characters.json passed!
>> Test: string_containing_CR.json passed!
>> Test: string_containing_newline_closed.json passed!
>> Test: string_containing_newline_unclosed.json passed!
>> Test: string_escape_before_EOF.json passed!
>> Test: string_escape_before_newline.json passed!
>> Test: string_terminated_by_EOF.json passed!
>> Test: the_carat_schtick.json passed!
>> Test: whitespace_inside_&&_token_pair.json passed!
>> Test: whitespace_inside_||_token_pair.json passed!
>> Test: identifiers.json passed!
>> Test: digit_vs_identifier.json passed!
>> Test: comment_form_feed.json passed!
>> Test: string_form_feed.json passed!
>> Summary (lex): 30/30 tests passed
python test/run_tests.py parse ./main_parser.py test/tests/parse
>> Test: global_variable_declarations.json passed!
>> Test: more_and_more_complex_global_declarations.json passed!
>> Test: the_main_problem.json passed!
>> Test: dangling_else.json passed!
>> Test: local_declarations_et_al.json passed!
>> Test: precedence.json passed!
>> Test: associativity.json passed!
>> Test: unary_minuses_so_many_unary_minuses.json passed!
>> Test: stringing_your_parser_along.json passed!
>> Test: formats_last_theorem.json passed!
>> Test: formalities_and_actualities.json passed!
>> Test: the_perfect_app.json passed!
>> Test: a_calculated_move.json passed!
>> Test: constructs_no_complex_expressions.json passed!
>> Test: constructs_complex_expressions.json passed!
>> Test: syntax_error?.json passed!
>> Test: syntax_error.json passed!
>> Summary (parse): 17/17 tests passed
python test/run_tests.py sem ./main.py test/tests/semantic
>> Test: a_forward-looking_test.json passed!
>> Test: a_marvelous_cameo_by_doc_octalpus.json passed!
>> Test: as_the_Germans_say:_nine.json passed!
>> Test: brake_the_compiler.json passed!
>> Test: deep_type_propagation.json passed!
>> Test: duplicate_global_names.json passed!
>> Test: either_syntax_or_semantics.json passed!
>> Test: function_call_doesnt_match_declaration.json passed!
>> Test: local_variable_scope_check.json passed!
>> Test: main_cant_return_a_value.json passed!
>> Test: main_function_with_parameter.json passed!
>> Test: missing_main_declaration.json passed!
>> Test: missing_return.json passed!
>> Test: mixing_statements_and_declarations.json passed!
>> Test: nested_breaks.json passed!
>> Test: no_declarations_in_inner_blocks.json passed!
>> Test: nonlocal_variable_access_type_checking.json passed!
>> Test: omg_but_this_check_passes_lol.json passed!
>> Test: omg_its_like_a_literal_range_check.json passed!
>> Test: one_isnt_true.json passed!
>> Test: parameter_scope_check.json passed!
>> Test: purple_main.json passed!
>> Test: return_type_argument_mismatch.json passed!
>> Test: return_type_mismatch.json passed!
>> Test: support_your_local_library.json passed!
>> Test: the_main_return.json passed!
>> Test: the_return_of_return_type_mismatch.json passed!
>> Test: type_mismatch.json passed!
>> Test: undefined_variable.json passed!
>> Test: will_the_real_main_please_stand_up.json passed!
>> Test: you_never_call_me.json passed!
>> Summary (sem): 31/31 tests passed
```

## Git Log 
Note that the most recent entry is missing as it is committed to the repo with this file.
For the most up to date log, clone the repo and use `git log`, or use the web interface.
```
commit 0dba49c14d453d8d3148caed148677c4493890f0
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 19:15:37 2026 -0600

    Start milestone3.md document

commit d8ca7b168fd392996c3c039fde42f43873ac2848
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 18:43:01 2026 -0600

    Cleanup repo

commit 06bcb069d17114c5077ffbce0c447635c164e4be
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 18:41:38 2026 -0600

    Improve documentation

commit dd1fff405a6927e0f03dbf52fefa570ca81d17d2
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 18:13:38 2026 -0600

    fix: either_syntax_or_semantics.json

commit 0e20181c729d8aa6bcd25d57f3e9acb573cb5b61
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 18:11:37 2026 -0600

    Add integer bounds checking

commit f264d55c4ba76233ecef741c20a7ae9eabc39560
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 18:05:25 2026 -0600

    fix incorrect return statement checking

commit 18897da708326466a030894b14a8dfad1761d729
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 17:57:32 2026 -0600

    fix: parameter_scope_check.json

commit 94527cb5d60c978119891b44ab4d9c2689c6662f
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 17:41:30 2026 -0600

    Add return type checking

commit 6d9f79f6456f4fba1c560ed14be937132a542667
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 17:22:10 2026 -0600

    Add break check

commit 0f7eafb2d5e65a07bbcb94ce0e6ad7c5a61fb392
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 17:14:17 2026 -0600

    Fix scoping of formal parameter declarations

commit 9c76c1e76aecb24cebdf41251a50959a6ad90ac2
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 16:32:09 2026 -0600

    Basic pass 3

commit 60d5956308b69ea4cace5763a3339df174e748f4
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 15:20:22 2026 -0600

    Fix test system

commit fcfad2443603959daa428c368e042cb29f964bbf
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 15:12:16 2026 -0600

    Add new tests

commit 553c8125e1f9c65ad5db6e94fd52fa13032b851a
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Mar 20 14:50:01 2026 -0600

    Add diff to test lib

commit b5729937662cf136a0f1db3ffdca8cf178b4a3f3
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 23:21:02 2026 -0600

    Add check: local declaration not in outermost block

commit 18ea84d7c3f4b0570fc977d795389c6443c44ea6
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 23:16:53 2026 -0600

    Add check: main declaration can't have parameters

commit f9d8540a5cebd51bbd82a1f96d27a53b74b43917
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 23:11:39 2026 -0600

    Add second pass

commit de9c06714f15e8d008423a369326b86e8ffe8574
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 22:51:58 2026 -0600

    Add first pass

commit 019efcce52e037e45d94d652a368dd949098a976
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 21:08:46 2026 -0600

    Add library functions to symbol table

commit 1281863f93a7d476a60b8812e46577de94ca7112
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 20:59:19 2026 -0600

    Better types for symbol table entries

commit 2dcf6b961650ca5c63cd93749c51e2e28b169961
Author: Avery Keuben <avery1516@gmail.com>
Date:   Thu Mar 19 19:53:19 2026 -0600

    Create basic symbol table

commit f26502b3674f5c4450b63aceec1e214d3cce6cfe
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 25 00:51:16 2026 -0700

    add milestone2.md

commit e534bca37430efde8146d6d7ac9f2489b3508a03
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 25 00:18:42 2026 -0700

    Removed unused pyright warning suppression comment

commit 598f834d39c649a10398460511f6f1e17abf5067
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 25 00:17:19 2026 -0700

    Organize and document shaping rules

commit 45a327e00a666c345535c2ef117f5e5a94dc898d
Author: Avery Keuben <avery1516@gmail.com>
Date:   Tue Feb 24 23:56:46 2026 -0700

    Clean up parser by splitting functionality to different files

commit b0f051fa508b9df66d569e4ddecaeacb06c02723
Author: Avery Keuben <avery1516@gmail.com>
Date:   Tue Feb 24 23:04:09 2026 -0700

    Move unary minus special casing to shaper subclass

commit f2599f48bd4c9c6b7ff6aa75ef2c6e520f9d8486
Author: Avery Keuben <avery1516@gmail.com>
Date:   Tue Feb 24 09:58:07 2026 -0700

    Add parser error handling

commit 3b38a8609b3fba90c759002ab819a265b75623fc
Author: Avery Keuben <avery1516@gmail.com>
Date:   Tue Feb 24 09:33:48 2026 -0700

    Fix missing parse.t02 test (syntax_error)

commit be075c4217011a83fcf06942eab1caa25f821e85
Author: Avery Keuben <avery1516@gmail.com>
Date:   Mon Feb 23 14:12:41 2026 -0700

    Fix test: unary_minuses_so_many_unary_minuses.j--

commit a5e4ba5993e50b8390786f79d33efc2b23a4b0c6
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:59:04 2022 -0600

    Almost fix teste a_calculated_move.j--: still need to fix unary minus

commit 53986b94dc1d12dbec208901aa34195a74114462
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:45:12 2022 -0600

    fix test syntax_error.j--

commit 9618c5a65e70f7de0da2e2f9c639a981dc727f9d
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:37:12 2022 -0600

    fix teset local_declarations_et_al.j--

commit edb2295076e533afb43b59d955d0f189f482dc27
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:31:57 2022 -0600

    fix test dangling_else.j--

commit 3dcef13a4b97f235dc3bd59b949ae2ee8fdec80d
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:28:16 2022 -0600

    fix test the_main_problem.j--

commit 698e40bf1bc3b4ecf610fad485aad1cf3a29e522
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:26:41 2022 -0600

    fix test global_variable_declarations.j--

commit f7ace13fa9da44800cf39bf6e2bb040f17b02c19
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:24:47 2022 -0600

    Add initial shaping

commit 4d83fe88006ba626b701123837c38d15356d0b82
Author: Avery Keuben <avery1516@gmail.com>
Date:   Sat Jul 16 10:23:43 2022 -0600

    Add testing for parser

commit c0b5d24ffe74af50e222ccbe04167634e44c5f2b
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 11 16:48:03 2026 -0700

    Update flake.nix to allow for local visualizations though cpsc411.astview

commit 8a87aa45ef1da9b798c1b84a71d4b2e040d338c3
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 11 16:26:51 2026 -0700

    Start using ASTShaper in cpsc411 lib

commit af84eccd5e347265e77767c61da3c58e2b9d3f12
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 11 16:06:22 2026 -0700

    Add import for cpsc411 lib

commit acf672f8232c2f471e83c9ec4003b2a6b13c4d92
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 11 15:43:50 2026 -0700

    Add grammar for parser

commit f2d406d4122a2bf8c859c6bfd862ea2c07b538bb
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:17:34 2026 -0700

    Update milestone1.md

commit 6b3ad90829ac549ca3ff8d8acb5297eeff57b5bf
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:12:57 2026 -0700

    Fix unknown file warning printing to stdout instead of stderr

commit c814502be78d7bf3df2c1324e9d25a2e4cc0c19b
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:10:32 2026 -0700

    Update readme.md

commit 94a1b7bab21d9adf26302e87204887e2ad36ac9d
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:09:36 2026 -0700

    Update readme.md

commit f51a7bf4098958831b2ba105cb58e7eb610a11bd
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:03:15 2026 -0700

    Add milestone 1 document

commit 79ac01a93110afbb0b9a48e14087dc13f6257da7
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:02:13 2026 -0700

    Fix crash when expected results file is missing for a partiular test in the unit test system

commit 869ec93167ba19a9d6e927e9f98f8da49690ad07
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:01:25 2026 -0700

    Remove unused Lexer paramerter in lexer.py

commit c200cfe036ead3dfe9a3a66fde9371bea4f7683f
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 14:00:50 2026 -0700

    Add retun statements in main() to better show control flow

commit b5a62ddfeda6ca2cf3b9ddf716405d855476fa2c
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 12:35:12 2026 -0700

    Add error handling for unknown file argument

commit 54064d0292c3777558705097ac21471887251a84
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 12:31:46 2026 -0700

    Add expected results for new tests

commit 429c6019fd49c3bfc97cf6afea1aa4f07a33dd0a
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 12:18:53 2026 -0700

    Add additional tests for form feed character and identifiers

commit bbf248f2fea5e6b0ee00da0ac00ebb3a1b1447c7
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 12:15:14 2026 -0700

    Clean up grammar file for lexer using fragments & adjusting whitespace

commit 12cde92aad311722cc704fe6f04975c165d175c1
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 11:57:56 2026 -0700

    Add type signatures to non-generated python files

commit a4c4f7ae9b72d2bed35c80c932c482f54eaa933a
Author: Avery Keuben <avery1516@gmail.com>
Date:   Fri Feb 6 10:18:43 2026 -0700

    Add wrapper around generated lexer

commit c1eee9a0434e5ff622b43c06d5f7b01bc1f27b3b
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 20:11:35 2026 -0700

    Fix test: string_escape_before_newline

commit 7465386773a21ce9716a02f66575abfc937d1f5d
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 20:09:28 2026 -0700

    Fix test: string_escape_before_EOF

commit ff782dc06e11ec16b673f148a9cc6d34fdab9007
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 20:08:02 2026 -0700

    Fix test: string_containing_CR

commit f275c40ea4f49b3a97054a13c41d63cdde6f8f46
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 20:06:49 2026 -0700

    Fix test: non-7-bit_characters.json

commit 76b7660acdb9cc2c46b0833ddfc8d5f06fe06d99
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:47:12 2026 -0700

    Fix test: multiline_string

commit 98546d6bc971b60017e116ffdf57f904e433a241
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:43:07 2026 -0700

    Fix test: comment_ending_in_EOF

commit 7991c6ab6a40b9b5b6e0ba752a2f32cf76077c53
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:39:41 2026 -0700

    Fix test comment_EOL_check

commit 194dffabce5feb3b6e21da6f227a2c952a924d4d
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:39:09 2026 -0700

    Add test to makefile

commit 0f41d8527424489a4268cdd10b4cd67de980eb55
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:26:50 2026 -0700

    Make main.py executable

commit 0f359121beb88736db791a02ee120b81dd68cfe4
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:24:59 2026 -0700

    Use stderr for logging warnings and errors. Limit number of warnings.

commit 6327d0604c95b6296154972b3bf3b9ebfededab2
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:24:00 2026 -0700

    Fix test script using incorrect variable name

commit dd294389eaed3d5b3085f60d1947fc49216d1456
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 18:08:06 2026 -0700

    Add expected results

commit 48ce0bf5b88e5d907a6968381c7d2663b17a676f
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 18:07:26 2026 -0700

    Add provided tests

commit af118009bb7e93cdd8a872692ebf15454398a20a
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:16:30 2026 -0700

    Add test script

commit 0b5e87a9de403221ccbae3139bf0713efd920ad7
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:15:20 2026 -0700

    Generate expected test results and save as json

commit cc0641d7c975407a3ffa862d60a5975d01cd9ec2
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:14:10 2026 -0700

    Fix typos in test system

commit ba217b14ff2a007e82f65afbec4fa966b8ce1f94
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:12:01 2026 -0700

    Add default handler for unrecognized tokens to lexer grammar

commit 26598c5e10078ee7c180f59b230e0af5964528e0
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:07:35 2026 -0700

    Add test for basic j-- language tokens

commit a730e71247a99edd3fdd30e316bea7a16b052170
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:07:08 2026 -0700

    Add expected result generator for reference compiler

commit a911b82a99dcebfcd3045191466e92c9d5506478
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:06:30 2026 -0700

    Add basic testing framework

commit b05acbe9b0408f8d0a4775d030dc0c150ed7661e
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:05:26 2026 -0700

    Add strings to lexer grammar

commit 55e26eef4fa387a2c3acd39e785512eb961d09bb
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 19:04:37 2026 -0700

    Add keywords and operators to lexer grammar

commit 7ec4b69320dc2545a762fd1094cabde68e768d46
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 18:59:40 2026 -0700

    Add basic token iterator from tutorial

commit c01a5d5bfeb7507bd6a48de03497ca7433ce983b
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 18:59:00 2026 -0700

    Add basic logger

commit 975071f308bd9ce937d9ecd4708b7e23fba0fd6e
Author: Avery Keuben <avery1516@gmail.com>
Date:   Wed Feb 4 18:58:33 2026 -0700

    Add basic lexer generation

commit 0ee62aca52cb43e130d0047247926b49922f7ca3
Author: Avery Keuben <avery1516@gmail.com>
Date:   Tue Jan 13 10:29:04 2026 -0700

    Initial Project Setup

commit 1d598d92664734c0bc5123620aefbde808931afd
Author: Avery Keuben <avery.keuben@ucalgary.ca>
Date:   Tue Jan 13 09:57:27 2026 -0700

    Initial commit
```

