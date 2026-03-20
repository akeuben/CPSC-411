from enum import Enum
from typing import Dict, Optional

class Type(Enum):
    INT = 1
    BOOL = 2
    STRING = 3

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
    libraryScope: SymbolTableScope 
    globalScope: SymbolTableScope 
    scopes: Dict[str, SymbolTableScope]

    currentScope: Optional[SymbolTableScope]

    def __init__(self):
        self.libraryScope = SymbolTableScope("__library__");

        # Insert default library functions

        self.globalScope = SymbolTableScope("__global__");
        self.scopes = {}

    def useScope(self, name: str):
        """
        Bind a scope by name. Further lookups will 
        first check this bound scope, then the global scope,
        then the library scope
        """
        # J-- does not support nested scopes. If we are entering a new 
        # scope, we just save the old scope we were in
        self.returnScope()

        self.currentScope = self.scopes[name]

        # If the scope does not already exist, we create a new scope
        if self.currentScope == None:
            self.currentScope = SymbolTableScope(name)

    def returnScope(self):
        """
        Return out of the current scope. Further lookups will 
        first check the global scope, then the library scope.
        """
        if self.currentScope != None:
            self.scopes[self.currentScope.name] = self.currentScope

    def declare(self, entry: SymbolTableEntry):
        """
        Adds a given symbol to the currently bound scope, or the global 
        scope if there is no bound scope.
        """
        if self.currentScope != None:
            self.currentScope.declare(entry)
        else:
            self.globalScope.declare(entry)

    def lookup(self, symbol: str) -> Optional[SymbolTableEntry]:
        """
        Looks up a symbol by name in the following order:
        1. Currently bound scope (if it exists)
        2. The global scope 
        3. The library scope
        """
        entry: Optional[SymbolTableEntry] = None

        # Check currently bound scope
        if self.currentScope != None:
            entry = self.currentScope.lookup(symbol)

        if entry != None:
            return entry 

        # Check global scope
        entry = self.globalScope.lookup(symbol)

        if entry != None:
            return entry 

        # Check library scope
        entry = self.libraryScope.lookup(symbol)

        return entry
