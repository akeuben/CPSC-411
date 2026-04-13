#!/usr/bin/env python

import sys
import os

from src.codegen.traversal import generateCode
from src.codegen.allocator import AllocatorBundle, BasicMipsRegisterAllocator, LabelAllocator
from src.codegen.mips import MipsCodegen
from src.semantics.semantic_checking import check_semantics
from src.semantics.view import PrettyView
from src.parse.shaping import Shaper
from src.parse.shape import shape
from src.parse.parser import parserFromLexer
from src.lex.lexer import lexerFromPath
from src.core.logging import logUsage, logUnknownFile

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

    table = check_semantics(tree)

    # Set the environment variable DEBUG to anything 
    # to display the parse tree in an X11 window
    if os.environ.get("DEBUG"):
        view = PrettyView(tree)
        view.x11()
        table.print()

    alloc = AllocatorBundle(BasicMipsRegisterAllocator(), LabelAllocator())
    codegen = MipsCodegen()

    generateCode(codegen, alloc, tree)

if __name__ == '__main__':
    main()
