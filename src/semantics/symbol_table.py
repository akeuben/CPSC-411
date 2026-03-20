from typing import Dict, List, Optional

from src.semantics.types import Type, TypeBoolean, TypeFunction, TypeInt, TypeString, TypeVoid

class SymbolTableEntry:
    name: str 
    type: Type

    def __init__(self, name: str, _type: Type):
        self.name = name 
        self.type = _type

    def __repr__(self) -> str:
        return f'{self.name}:{self.type}'

class SymbolTableScope:
    name: str
    map: Dict[str, SymbolTableEntry]

    def __init__(self, name):
        self.name = name
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

    def __repr__(self):
        return self.map.__repr__()

class SymbolTable:
    scopes: Dict[str, SymbolTableScope]
    stack: List[SymbolTableScope]

    index: int

    def __init__(self):
        self.scopes = {}
        self.stack = []
        self.index = 0

        self.useScope("__library__")

        self.declare("getchar", TypeFunction(TypeInt(), []))
        self.declare("halt", TypeFunction(TypeVoid(), []))
        self.declare("printb", TypeFunction(TypeVoid(), [TypeBoolean()]))
        self.declare("printc", TypeFunction(TypeVoid(), [TypeInt()]))
        self.declare("printi", TypeFunction(TypeVoid(), [TypeInt()]))
        self.declare("prints", TypeFunction(TypeVoid(), [TypeString()]))

        self.useScope("__global__")

    def useScope(self, name: str):
        """
        Bind a scope by name. Further lookups will 
        first check this bound scope, then the global scope,
        then the library scope
        """

        # If the scope does not already exist, we create a new scope
        if not name in self.scopes.keys():
            self.scopes[name] = SymbolTableScope(name)

        scope = self.scopes[name]

        self.stack.append(scope)
        

    def returnScope(self):
        """
        Return out of the current scope. Further lookups will 
        first check the global scope, then the library scope.
        """
        if len(self.stack) <= 2:
            raise RuntimeError("Tried to pop global scope or library scope off scope stack. This should never occur");

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
    
    def __repr__(self):
        return self.scopes.__repr__()
