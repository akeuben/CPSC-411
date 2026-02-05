lexer grammar lex;

@header {
import src.core.logging as logging
import sys
}

WHITESPACE:     [ \t\n\r\f] -> skip;
COMMENT:        '//'.*?[\n] -> skip;

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
