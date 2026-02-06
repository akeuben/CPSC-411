#!/usr/bin/env python

import sys

from src.lex.lexer import lexerFromPath
from src.core.logging import logToken, logUsage, logUnknownFile

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

    while lexer.hasNext():
        token = lexer.lex()
        name = lexer.tokenName(token) 
        attr = repr(token.text)
        logToken(name, token.line, attr)

if __name__ == '__main__':
    main()
