from abc import abstractmethod
from typing import List
from src.core.logging import logError


class RegisterAllocator():

    @abstractmethod
    def getUsed(self) -> List[str]:
        pass

    @abstractmethod
    def alloc(self) -> str:
        pass

    @abstractmethod
    def free(self, register: str):
        pass

class BasicMipsRegisterAllocator(RegisterAllocator):
    def __init__(self):
        self.freeList = [f"s{x}" for x in range(7)]
        self.usedList = []

    def alloc(self):
        if len(self.freeList) == 0:
            logError("No registers remaining!")
        reg = self.freeList.pop()
        self.usedList.append(reg)
        return reg

    def free(self, register: str):
        self.freeList.append(register)
        self.usedList.remove(register)

    def getUsed(self) -> List[str]:
        return self.usedList

class StackAllocator():
    def __init__(self):
        self.offset = 0
        self.allocations = {}

    def alloc(self, bytes: int, sym: str):
        offset = self.offset
        self.offset += bytes
        self.allocations[sym] = offset
        return offset

    def size(self):
        return self.offset

    def location(self, sym: str) -> int:
        return self.allocations[sym]

    def defined(self, sym: str) -> bool:
        return sym in self.allocations.keys()

class LabelAllocator():
    def __init__(self):
        self.counter = 0

    def alloc(self):
        self.counter += 1
        return self.counter

class AllocatorBundle():
    def __init__(self, register: RegisterAllocator, label: LabelAllocator):
        self.register = register
        self.label = label
