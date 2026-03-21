# Milestone 1 - Avery Keuben (30170731)

*Project URL:* [https://csgit.ucalgary.ca/avery.keuben/cpsc-411](https://csgit.ucalgary.ca/avery.keuben/cpsc-411)

*Git Tag:* `milestone-1`

*AI Disclaimer:* AI was not used in the completion of this project.

*Self Assessment:* Outstanding perfomance

# Self Assessment Evidence

## Run Output

```
Run started on Fri Feb  6 14:13:47 2026

Hostname: csx2.uc.ucalgary.ca

-------------------------------------------------------------------------------
Running make |
--------------

% /usr/bin/make

STDOUT:
make: Nothing to be done for 'all'.


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
Test: empty file |
------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t01

STDOUT:
<EOF> @ line 1, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: comments only |
---------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t02

STDOUT:
<EOF> @ line 4, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: comment ending in EOF |
-----------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t03

STDOUT:
<EOF> @ line 1, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: legal whitespace |
------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t04

STDOUT:
<EOF> @ line 6, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: comment EOL check |
-------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t05

STDOUT:
ID @ line 3, attr 'asdf'
<EOF> @ line 4, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: illegal whitespace |
--------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t06

STDOUT:
<EOF> @ line 3, attr '<EOF>'


STDERR:
warning: unknown char at or near line 2


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: illegal characters |
--------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t07

STDOUT:
<EOF> @ line 4, attr '<EOF>'


STDERR:
warning: unknown char at or near line 3
warning: unknown char at or near line 3
warning: unknown char at or near line 3
warning: unknown char at or near line 3


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: legit token salad |
-------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t08

STDOUT:
PLUS @ line 3, attr '+'
MINUS @ line 4, attr '-'
TIMES @ line 5, attr '*'
DIVIDE @ line 6, attr '/'
MODULO @ line 7, attr '%'
LPAREN @ line 8, attr '('
RPAREN @ line 9, attr ')'
LBRACE @ line 10, attr '{'
RBRACE @ line 11, attr '}'
SEMI @ line 12, attr ';'
COMMA @ line 13, attr ','
NOT @ line 17, attr '!'
NE @ line 18, attr '!='
ASSIGN @ line 19, attr '='
EQ @ line 20, attr '=='
LT @ line 21, attr '<'
LE @ line 22, attr '<='
GT @ line 23, attr '>'
GE @ line 24, attr '>='
GT @ line 26, attr '>'
ASSIGN @ line 26, attr '='
AND @ line 30, attr '&&'
OR @ line 31, attr '||'
TRUE @ line 35, attr 'true'
FALSE @ line 36, attr 'false'
BOOLEAN @ line 37, attr 'boolean'
INT @ line 38, attr 'int'
VOID @ line 39, attr 'void'
IF @ line 40, attr 'if'
ELSE @ line 41, attr 'else'
WHILE @ line 42, attr 'while'
ID @ line 43, attr 'for'
BREAK @ line 44, attr 'break'
RETURN @ line 45, attr 'return'
ID @ line 49, attr 'iffy'
ID @ line 50, attr 'Break'
ID @ line 51, attr 'falsetto'
ID @ line 52, attr 'switch'
ID @ line 53, attr 'class'
ID @ line 54, attr 'abcdef'
ID @ line 55, attr 'abc123'
ID @ line 56, attr '_'
ID @ line 57, attr '_abc_0'
NUMBER @ line 61, attr '0'
NUMBER @ line 62, attr '12345678901234567890'
NUMBER @ line 64, attr '0123'
<EOF> @ line 65, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: non-7-bit characters |
----------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t09

STDOUT:
<EOF> @ line 4, attr '<EOF>'


STDERR:
warning: unknown char at or near line 2
warning: unknown char at or near line 2
warning: unknown char at or near line 2
warning: unknown char at or near line 2


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: whitespace inside && token pair |
---------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t10

STDOUT:
<EOF> @ line 3, attr '<EOF>'


STDERR:
warning: unknown char at or near line 2
warning: unknown char at or near line 2


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: whitespace inside || token pair |
---------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t11

STDOUT:
<EOF> @ line 3, attr '<EOF>'


STDERR:
warning: unknown char at or near line 2
warning: unknown char at or near line 2


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: comment inside && token pair |
------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t12

STDOUT:
<EOF> @ line 4, attr '<EOF>'


STDERR:
warning: unknown char at or near line 2
warning: unknown char at or near line 3


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: the carat schtick |
-------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t13

STDOUT:


STDERR:
warning: unknown char at or near line 2
warning: unknown char at or near line 3
warning: unknown char at or near line 4
warning: unknown char at or near line 5
warning: unknown char at or near line 6
warning: unknown char at or near line 7
warning: unknown char at or near line 8
warning: unknown char at or near line 9
warning: unknown char at or near line 10
warning: unknown char at or near line 11
warning: unknown char at or near line 12
error: too many warnings at or near line 12


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: string terminated by EOF |
--------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t14

STDOUT:


STDERR:
error: EOF in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: string containing newline, unclosed |
-------------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t15

STDOUT:


STDERR:
error: NL in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: string containing newline, closed |
-----------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t16

STDOUT:


STDERR:
error: NL in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: multi-line string |
-------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t17

STDOUT:


STDERR:
error: NL in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: string containing CR |
----------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t18

STDOUT:


STDERR:
error: CR in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: string escape before EOF |
--------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t19

STDOUT:


STDERR:
error: EOF in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: string escape before newline |
------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t20

STDOUT:


STDERR:
error: bad escape in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: legal strings |
---------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t21

STDOUT:
STRING @ line 2, attr '"abc"'
STRING @ line 3, attr '"ab\\bcd"'
STRING @ line 4, attr '"ab\\tcd"'
STRING @ line 5, attr '"ab\\ncd"'
STRING @ line 6, attr '"ab\\fcd"'
STRING @ line 7, attr '"ab\\rcd"'
STRING @ line 8, attr '"ab\\"cd"'
STRING @ line 9, attr '"ab\\\'cd"'
STRING @ line 10, attr '"ab\\\\cd"'
STRING @ line 11, attr '"ab\\\\\\\\\\"cd"'
STRING @ line 12, attr '"ab\x00cd"'
<EOF> @ line 13, attr '<EOF>'


STDERR:


RETURN CODE: 0

-------------------------------------------------------------------------------
Test: illegal octal string escape |
-----------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t22

STDOUT:


STDERR:
error: bad escape in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: illegal hex string escape |
---------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t23

STDOUT:


STDERR:
error: bad escape in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: illegal Unicode string escape |
-------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t24

STDOUT:


STDERR:
error: bad escape in string at or near line 2


RETURN CODE: 1

-------------------------------------------------------------------------------
Test: illegal string escape character |
---------------------------------------

% /usr/bin/python3 main.py /home/profs/aycock/411/TEST/ms1/scan.t25

STDOUT:


STDERR:
error: bad escape in string at or near line 2


RETURN CODE: 1

Run ended on Fri Feb  6 14:13:48 2026
```

## Custom Testing Results
I wrote a custom unit testing system to compare `stdout`, `stderr`, and the return code from my compiler and compare it against the 
reference compiler. All tests pass.

```
avery> make test
python test/run_tests.py lex ./main.py test/tests/lex
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
>> Summary: 30/30 tests passed
```

## Commit History 
viewable at [https://csgit.ucalgary.ca/avery.keuben/cpsc-411/-/commits/main?ref_type=HEADS](https://csgit.ucalgary.ca/avery.keuben/cpsc-411/-/commits/main?ref_type=HEADS)

Log at time of writing:
```
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

## Tool (milestone) Properties
1. *Good error and warning messages output.* My lexer provides identical output to the reference compiler. As seen from the run output:
    - warning messages provide the line that caused the issue
    - error messages provide the line that caused the issue
    - error messages describe the problem, for example: `bad escape in string` or `NL in string`
    - warning messages describe the problem, for example: `unknown char`
2. *Predictable, reliable, and tested: correct inputs tokenized correctly, erroneous inputs rejected, no crashes.* My compiler provides the exact output compared to the reference compiler, ensuring accurate results. Each test case in my custom unit testing system directly compares the output of my compiler to the reference compiler and fails any input test where the `stdout`, `stderr`, or exit code do not match. Further:
    - List of tokens is easy to read, as per the run output 
    - Line numbers and token attributes are printed
    - No crashes in run output, including for: no input file, too many parameters, invalid input file, input file with non-ascii characters

## Development Practices
1. *Incremental development.* Each commit directly adds a single feature, fixes a single issue, addresses a specific test case, or cleans up a limited scope of the project.
    - See commit history above 
2. *Documentation of code changes: good commit messages.* 
    - Each commit follows standard git commit convensions. In the present tense (Infinitive). For example, `Add basic lexer generation` and not `Added basic lexer generation`
    - Each commit message accurately describes the content of the commit. For example, `Add keywords and operators to lexer grammar` adds keywords and operators to the `lex.g4` grammar file.

## Code Qualities 
1. *Code is readable: thoughtful use of whitespace and formatting, no gatuitously overcomplicated code.* Code is formatted with properly.
    - Variables are descriptive of their use. For example, in `src/lex/lexer.py` the `Lexer` class has properties including `scanner`, `token`, and `hasNextToken` which all accurately describe their use and content.
    - All variables, parameters, and function return types are typed to accurately describe the contents of the variables and allow for editor LSP integration.
    - The grammar `grammar/lex.g4` makes use of white space to visually seperate the left and right sides of each rule into two separate columns to easily differentiate between the two. 
    - The grammar file has similar rules grouped together.
        - Keywords and operators are grouped 
        - Whitespace and comments (rules that are skipped) are grouped 
        - Identifiers, Numbers, and Strings are grouped as they are complex constructs in the `g--` grammar.
        - The default unknown character rule is alone at the bottom to differentiate the error/warning path.
        - Within the `COMMENT_MODE` and `STRING_MODE`, the order of rules is:
            1. Rules that end the mode 
            2. Rules that result in an error or warning being logged 
            3. Rules that continue parsing within that mode 
2. *Code is well documented: important information is included, extraneous information is excluded.*
    - Made all code self-documenting. Variables are self-describing, control flow is easy to follow. Little need for comments arise.
    - Functions describe what they do. `lex` provides a token, `unlex` returns a token to the Lexer, `peek` allows you to see what the next token is, etc... These functions are self explainatory, and adding comments are uncessessary. Since all parameters and return values are typed, the user knows what a certain function provides, reducing the importance of comments more.
    - There are comments when a line of code _requires_ explaination. For example, creating the file stream in `lexerFromPath` has a comment describing why we include `errors='replace'` in the constructor for the stream, since it is non-obvious and was required to pass a very specific test case.
3. `Code is Modular and well-structured.` All functions are as short as possible. 
    - If something could be split up, then it was. For example, creating the lexer has two different possible function calls, `lexerFromPath` and `lexerFromStream`. We are only required, in this assignment, to provide input from a file. It could be preceivable that someone using the parser at some point may want to lex from `stdin` or some other source. Seperating `lexerFromStream` and calling that from `lexerFromPath` allows the user to choose from the two options.
    - A wrapper, `Lexer` was made around the generated lexer in order to provide additional functionality. This allowed the actual lexing and iteration done by the compiler to be split. The lexer provides us tokens, and the main file consumes the tokens. This is more modular than the sample provided in the tutorials, as that directly created a lexer and iterated tokens all within the main function, making consuming the tokens inherantly connected to the production. My solution allows for the next milestone, where tokens will be fed to the parser instead of stdout an easy change, as the main function is minimal.
    - Code is split into multiple modules to provide separation of concerns. 
        - `src.core.logging` provides all logging functionality to the entire application
        - `src.lex.lexer` provides everything to do with the lexer 
        - `src.generated` contains everything generated by a grammar file, which keeps the hand-written code separate from the machine generated code.
4. *Code does not contain uncessessary duplication.* Code is not duplicated.
    - `lexerFromPath` and `lexerFromStream` both need to instantiate the generated lexer object. However, since `lexerFromPath` creates a stream, it instead calls `lexerFromStream` instead of duplicating code.
    - The grammar file `grammar/lex.g4` uses fragments for common patterns, including `DIGIT` (for numeric characters), `ALPHA` (for alphabetic characters), `CRLF` (for `\r` and `\n` characters), and `SPACE` for other kinds of whitespace, such that space, tabs, and form feed charaters.
    - Wanted to separate valid string escapes with `fragment VALID_ESC: [bftrn'"\\];`, but antlr4 does not support using the negation operator on fragments, which is used in the following rule, `STRING_INVALID_ESC`. Seperating into a fragment would not have prevented duplication, as it would only be used within the `STRING_ESCAPE` rule.
5. *Code is consistant, e.g., with respect to variable and function naming conventions.* 
    - All variables and functions use camel case (e.g. `lexerFromPath`)
        - Python traditionally uses snake case, but antlr4 uses camel case (e.g. `symbolicNames`), so I decided to remain consistant with the core library we are using.
    - All classes are named with pascal case (e.g. `Lexer` or `ErrorListener`)
    - Syle of function bodies are consistant, e.g. with early returns in `Lexer.__init__` or `main`
6. *Speed: code should not be unreasonably slow.* 
    - The entire code uses only a single loop, in the main function to iterate over all tokens, which cannot be avoided.
    - The wrapper does add a little overhead for function calls, but that in negligable, and the benefits of modularity provide a greater benefit. If I were programming this in another language, I would have looked into inlining some of the functions in the wrapper.
    - The fact `lexerFromPath` calls `lexerFromStream` instead of returning a scanner directly does add a little overhead, by once again, the modularity provided by this decision outweighs the benefit of (very marginally) faster code, especially considering that it is called once per application runtime.
7. *Code respects the environment in terms of the implementation language, i.e., are appropriate idioms and libraries used?*
    - No additional libraries were used for the project, besides ANTLR4, which is required. Made use of ANTLR4 in the intended way, jsut with a small wrapper around it.
    - Used the idomatic main function in python, including using `if __name__ == "__main__": main()` to ensure the main function is only ever called if it is the intended file to run.
    - Used try-except in case of an unknown file instead of checking if the file exists first. 
8. *Code respects the environment in terms of tool usage: are pattern-matching facilities of ANTLR4 used appropriately and readably?*
    - Made use of modes (e.g. `STRING_MODE` and `COMMENT_MODE`) for complex pattern
    - Made use of fragments for commonly repeated regular expression parts (e.g. `DIGIT` and `ALPHA`) aiding reability
    - Made use of code blocks within ANTLR4 to emit error messages whenever possible and cessessary.

## Relationship with Runtime Environment
1. *Consistent with the environment: error and warning messages sent to stderr, regular output sent to stdout, exit status code set appropriately.*
    - Errors and warnings are sent to `stderr` (see run output)
    - Lexed tokens are sent to `stdout` (see run output)
    - Exiting due to a lexing error, invalid command line usage, or unknown file results in an exit code of `1`. (see run output)
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
