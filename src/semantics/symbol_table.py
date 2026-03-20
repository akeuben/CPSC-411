from typing import Dict, List, Optional

from src.semantics.types import Type

class SymbolTableEntry:
    name: str 
    type: Type

class SymbolTableScope:
    name: str
    map: Dict[str, SymbolTableEntry]

    def __init__(self, name):
        self.name = name
        self.map = {}

    def declare(self, entry: SymbolTableEntry):
        """
        Adds a given symbol to this scope
        """
        self.map[entry.name] = entry

    def lookup(self, symbol: str) -> Optional[SymbolTableEntry]:
        """
        Looks up the given symbol name in 
        this scope
        """
        return self.map.get(symbol)

class SymbolTable:
    scopes: Dict[str, SymbolTableScope]
    stack: List[SymbolTableScope]

    def __init__(self):
        libraryScope = SymbolTableScope("__library__");

        # TODO: Insert default library functions

        globalScope = SymbolTableScope("__global__");

        self.scopes = {}
        self.stack = []
        self.stack.append(libraryScope);
        self.stack.append(globalScope);

    def useScope(self, name: str):
        """
        Bind a scope by name. Further lookups will 
        first check this bound scope, then the global scope,
        then the library scope
        """

        # If the scope does not already exist, we create a new scope
        if name in self.scopes.keys():
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

    def declare(self, entry: SymbolTableEntry):
        """
        Adds a given symbol to the currently bound scope, or the global 
        scope if there is no bound scope.
        """

        # Append entry to top of stack
        self.stack[len(self.stack)-1].declare(entry)

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
