#!/usr/bin/env python

import sys

from src.lex.lexer import lexerFromPath
from src.core.logging import logToken

def main() -> None:
    if len(sys.argv) != 2:
        print(f"Usage: python3 {sys.argv[0]} file.j--", file=sys.stderr)
        sys.exit(1)

    lexer = lexerFromPath(sys.argv[1])

    while lexer.hasNext():
        token = lexer.lex()
        name = lexer.tokenName(token) 
        attr = repr(token.text)
        logToken(name, token.line, attr)

if __name__ == '__main__':
    main()
