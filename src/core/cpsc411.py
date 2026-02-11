# import cpsc411 specific classes. We allow for the location to be overriden depending on 
# an environment variable. This allows me to run on my local machine.
import sys 
import os 
from typing import Any
sys.path.append(os.environ.get("CPSC_411_LIB", "/home/profs/aycock/411/lib/antlr4/python3.13"))
import cpsc411

ast: Any = cpsc411.ast
astshaper: Any = cpsc411.astshaper
astview: Any = cpsc411.astview
