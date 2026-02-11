#!/usr/bin/env python

import sys

from src.parse.parser import parserFromLexer
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

    parser = parserFromLexer(lexer)

    print(parser.getTree())


if __name__ == '__main__':
    main()
