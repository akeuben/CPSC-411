class LabelGenerator():
    def __init__(self):
        self.counter = 0

    def acquire(self):
        self.counter += 1
        return self.counter

class Codegen():
    def __init__(self):
        self.labelCounter = 0

    def outputLabel(self, id):
        print(f"L{id}:")

    def outputStandardLibrary(self):
        raise RuntimeError("Not implemented")

    def outputMainFunctionDeclaration(self):
        raise RuntimeError("Not implemented")

    def outputFunctionDeclaration(self):
        raise RuntimeError("Not implemented")

    def outputGlobalVariableDeclaration(self, varType: Type):
        raise RuntimeError("Not implemented")

    def outputFunctionPreamble(self, stackInfo: StackInfo):
        raise RuntimeError("Not implemented")

    def outputFunctionPostamble(self, stackInfo: StackInfo):
        raise RuntimeError("Mot implemented")

    def outputSaveRegisters(self, alloc: RegisterAllocator):
        raise RuntimeError("Not implemented")

    def outputRestoreRegisters(self, alloc: RegisterAllocator):
        raise RuntimeError("Not implemented")

    def outputFunctionCall(self, table: SymbolTable):
        raise RuntimeError("Not implemented")


