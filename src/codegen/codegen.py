from abc import abstractmethod
from typing import List
from src.codegen.allocator import RegisterAllocator, StackAllocator
from src.semantics.symbol_table import SymbolTable
from src.semantics.types import Type


class Codegen():
    def __init__(self):
        self.labelCounter = 0

    def outputLabel(self, id):
        print(f"L{id}:")

    @abstractmethod
    def outputStandardLibrary(self):
        pass

    @abstractmethod
    def outputMainFunctionDeclaration(self):
        pass

    @abstractmethod
    def outputFunctionDeclaration(self, sym: str):
        pass

    @abstractmethod
    def outputGlobalVariableDeclaration(self, varType: Type):
        pass

    @abstractmethod
    def outputFunctionPreamble(self, stackInfo: StackAllocator, formals: List[str]):
        pass

    @abstractmethod
    def outputFunctionPostamble(self, stackInfo: StackAllocator):
        pass

    @abstractmethod
    def outputSaveRegisters(self, alloc: RegisterAllocator):
        pass

    @abstractmethod
    def outputRestoreRegisters(self, alloc: RegisterAllocator):
        pass

    @abstractmethod
    def outputFunctionCall(self, sym: SymbolTable):
        pass

    @abstractmethod
    def outputMainExit(self, stack: StackAllocator):
        pass

    @abstractmethod
    def outputStringLiteral(self, string: str, label: int):
        pass

    @abstractmethod
    def outputLoadIntegerStack(self, register: str, offset: int):
        pass

    @abstractmethod
    def outputLoadIntegerImm(self, register: str, value: str):
        pass

    @abstractmethod
    def outputLoadByteImm(self, register: str, value: str):
        pass 

    @abstractmethod
    def outputLoadAddress(self, register: str, label: int):
        pass

    @abstractmethod 
    def outputStoreRegisterStack(self, register: str, offset: int):
        pass 

    @abstractmethod 
    def outputStoreRegisterAddress(self, register: str, label: str):
        pass

    @abstractmethod
    def outputAdd(self, registerResult: str, registerA: str, registerB: str):
        pass

    @abstractmethod 
    def outputCallFunction(self, paramRegisters: List[str], functionSym: str):
        pass

    @abstractmethod
    def outputMove(self, dst: str, src: str):
        pass

    @abstractmethod
    def outputJump(self, label: int):
        pass
