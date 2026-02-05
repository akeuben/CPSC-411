lexer grammar lex;

@header {
import src.core.logging as logging
import sys
}

WHITESPACE:     [ \t\n\r\f] -> skip;
COMMENT_START:  '//' -> more, mode(COMMENT_MODE);

TRUE:           'true';
FALSE:          'false';
BOOLEAN:        'boolean';
INT:            'int';
VOID:           'void';
IF:             'if';
ELSE:           'else';
WHILE:          'while';
BREAK:          'break';
RETURN:         'return';
PLUS:           '+';
MINUS:          '-';
TIMES:          '*';
DIVIDE:         '/';
MODULO:         '%';
LT:             '<';
GT:             '>';
LE:             '<=';
GE:             '>=';
ASSIGN:         '=';
EQ:             '==';
NE:             '!=';
NOT:            '!';
AND:            '&&';
OR:             '||';
LPAREN:         '(';
RPAREN:         ')';
LBRACE:         '{';
RBRACE:         '}';
SEMI:           ';';
COMMA:          ',';

ID:             [a-zA-Z_][a-zA-Z_0-9]*;

NUMBER:         [0-9]+ ;

START_STRING:   '"' -> more, mode(STRING_MODE);

DEFAULT:        . {
    logging.logWarning("unknown char", self.line);
} -> skip;

mode COMMENT_MODE;

COMMENT_NEWLINE:[\r\n]+ -> skip, mode(DEFAULT_MODE);
COMMENT_EOF:    EOF -> skip, mode(DEFAULT_MODE);
COMMENT:        . -> more;

mode STRING_MODE;

STRING:         '"' -> mode(DEFAULT_MODE);
STRING_NL:      '\n' {
    logging.logError("NL in string", self.line - 1)
};
STRING_CR:      '\r' {
    logging.logError("CR in string", self.line)    
};
STRING_EOF:     EOF {
    logging.logError("EOF in string", self.line)
};
STRING_ESCAPE:  '\\'[bftrn'"\\] -> more;
STRING_ESCAPE_NEWLINE:  '\\\n' {
    logging.logError("bad escape in string", self.line - 1)
};
STRING_INVALID_ESCAPE:  '\\'~[bftrn;"\\] {
    logging.logError("bad escape in string", self.line)
};
STRING_CHAR:    . -> more;
