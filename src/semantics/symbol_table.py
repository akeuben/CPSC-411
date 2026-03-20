from typing import Dict, List, Optional

from src.semantics.types import Type, TypeBoolean, TypeFunction, TypeInt, TypeString, TypeVoid

class SymbolTableEntry:
    name: str 
    type: Type

    def __init__(self, name: str, _type: Type):
        self.name = name 
        self.type = _type

class SymbolTableScope:
    map: Dict[str, SymbolTableEntry]

    def __init__(self):
        self.map = {}

    def declare(self, name: str, entry: SymbolTableEntry):
        """
        Adds a given symbol to this scope
        """
        self.map[name] = entry

    def lookup(self, symbol: str) -> Optional[SymbolTableEntry]:
        """
        Looks up the given symbol name in 
        this scope
        """
        return self.map.get(symbol)

class SymbolTable:

    stack: List[SymbolTableScope]
    index: int

    log: List[str]

    def __init__(self):
        self.scopes = {}
        self.stack = []
        self.index = 0
        self.log = []

        self.useScope()

        self.declare("prints", TypeFunction(TypeVoid(), [TypeString()]))
        self.declare("printi", TypeFunction(TypeVoid(), [TypeInt()]))
        self.declare("printb", TypeFunction(TypeVoid(), [TypeBoolean()]))
        self.declare("printc", TypeFunction(TypeVoid(), [TypeInt()]))
        self.declare("getchar", TypeFunction(TypeInt(), []))
        self.declare("halt", TypeFunction(TypeVoid(), []))

        self.useScope()

    def useScope(self):
        """
        Bind a scope by name. Further lookups will 
        first check this bound scope, then the global scope,
        then the library scope
        """

        # If the scope does not already exist, we create a new scope
        scope = SymbolTableScope()

        self.appendLogEntry("open scope")
        self.stack.append(scope)
        
    def appendLogEntry(self, entry: str) -> None:
        self.log.append("\t" * len(self.stack) + entry)

    def returnScope(self):
        """
        Return out of the current scope. Further lookups will 
        first check the global scope, then the library scope.
        """
        if len(self.stack) <= 2:
            raise RuntimeError("Tried to pop global scope or library scope off scope stack. This should never occur");

        self.appendLogEntry("close scope")
        self.stack.pop()

    def declare(self, name: str, _type: Type) -> SymbolTableEntry:
        """
        Adds a given symbol to the currently bound scope, or the global 
        scope if there is no bound scope.
        """

        self.index += 1
        entry = SymbolTableEntry(f'sym{self.index}', _type)

        # Append entry to top of stack
        self.stack[-1].declare(name, entry)

        self.appendLogEntry(f'define "{name}" ({entry.name}) sig={repr(entry.type)}')

        return entry

    def lookup(self, symbol: str) -> Optional[SymbolTableEntry]:
        """
        Looks up a symbol by name in the following order:
        1. Currently bound scope (if it exists)
        2. The global scope 
        3. The library scope
        """

        # Iterate from top of stack to bottom (reverse from index order)
        for scope in reversed(self.stack):
            result = scope.lookup(symbol)
            if result != None:
                return result 

        # No symbol found in the symbol table, return None
        return None

    def alreadyDefined(self, symbol: str) -> bool:
        """
        Tests whether the given symbol is already defined 
        in the current scope (and only the current scope)
        """
        return self.stack[-1].lookup(symbol) != None

    def print(self) -> None:
        print('\n'.join(self.log))
