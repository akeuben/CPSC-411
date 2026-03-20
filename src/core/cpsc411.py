# import cpsc411 specific classes. We allow for the location to be overriden depending on 
# an environment variable. This allows me to run on my local machine.
import sys 
import os 
from types import ModuleType
from typing import Any, Type, TypeAlias
sys.path.append(os.environ.get("CPSC_411_LIB", "/home/profs/aycock/411/lib/antlr4/python3.13"))
import cpsc411

Ast: TypeAlias = cpsc411.ast.AST
AstShaper: TypeAlias = cpsc411.astshaper.ASTShaper
AstView: TypeAlias = cpsc411.astview.ASTView
AstTraversal: TypeAlias = cpsc411.asttraversal.ASTTraversal
