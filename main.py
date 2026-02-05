#!/usr/bin/env python

import sys
from src.lex.lexer import lexFromPath

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage")
        sys.exit(1)

    lexFromPath(sys.argv[1])
