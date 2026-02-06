lexer grammar lex;

@header {
import src.core.logging as logging
import sys
}

fragment DIGIT:     [0-9];
fragment ALPHA:     [a-zA-Z];
fragment CRLF:      [\n\r];
fragment SPACE:     [ \t\f];

WHITESPACE:         (CRLF | SPACE) -> skip;
COMMENT_START:      '//' -> more, mode(COMMENT_MODE);

TRUE:               'true';
FALSE:              'false';
BOOLEAN:            'boolean';
INT:                'int';
VOID:               'void';
IF:                 'if';
ELSE:               'else';
WHILE:              'while';
BREAK:              'break';
RETURN:             'return';
PLUS:               '+';
MINUS:              '-';
TIMES:              '*';
DIVIDE:             '/';
MODULO:             '%';
LT:                 '<';
GT:                 '>';
LE:                 '<=';
GE:                 '>=';
ASSIGN:             '=';
EQ:                 '==';
NE:                 '!=';
NOT:                '!';
AND:                '&&';
OR:                 '||';
LPAREN:             '(';
RPAREN:             ')';
LBRACE:             '{';
RBRACE:             '}';
SEMI:               ';';
COMMA:              ',';

ID:                 (ALPHA | '_')(ALPHA | DIGIT | '_')*;
NUMBER:             DIGIT+;
START_STRING:       '"' -> more, mode(STRING_MODE);

DEFAULT:            . {
                        logging.logWarning("unknown char", self.line);
                    } -> skip;

mode COMMENT_MODE;

COMMENT_NEWLINE:    CRLF+ -> skip, mode(DEFAULT_MODE);
COMMENT_EOF:        EOF -> skip, mode(DEFAULT_MODE);
COMMENT:            . -> more;

mode STRING_MODE;

STRING:             '"' -> mode(DEFAULT_MODE);
STRING_NL:          '\n' {
                        logging.logError("NL in string", self.line - 1)
                    };
STRING_CR:          '\r' {
                        logging.logError("CR in string", self.line)    
                    };
STRING_EOF:         EOF {
                        logging.logError("EOF in string", self.line)
                    };
STRING_ESCAPE:      '\\'[bftrn'"\\] -> more;
STRING_ESCAPE_NL:   '\\\n' { 
                        logging.logError("bad escape in string", self.line - 1) 
                    };
STRING_INVALID_ESC: '\\'~[bftrn;"\\] {
                        logging.logError("bad escape in string", self.line)
                    };
STRING_CHAR:        . -> more;
