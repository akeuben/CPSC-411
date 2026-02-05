lexer grammar lex;

WHITESPACE:     [ \t\n\r\f] -> skip;

ASSIGN:         '=';
ID:             [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER:         [0-9]+ ;
