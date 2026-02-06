#!/usr/bin/env python

import sys
from src.lex.lexer import lexerFromPath
from src.core.logging import logToken

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage")
        sys.exit(1)

    lexer = lexerFromPath(sys.argv[1])

    while lexer.hasNext():
        token = lexer.lex()
        name = lexer.tokenName(token) 
        logToken(name, token.line, repr(token.text))

