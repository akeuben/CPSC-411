#!/usr/bin/env python

import sys
import os

from src.parse.shaping import Shaper
from src.parse.shape import shape
from src.parse.parser import parserFromLexer
from src.lex.lexer import lexerFromPath
from src.core.logging import logUsage, logUnknownFile
from src.core.cpsc411 import astview


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

    tree = parser.getTree(shape, Shaper)

    # Set the environment variable DEBUG to anything 
    # to display the parse tree in an X11 window
    if os.environ.get("DEBUG"):
        astview.ASTView(tree).x11()

    print(tree)

if __name__ == '__main__':
    main()
