from typing import List
from src.core.logging import logError
from src.codegen.allocator import LabelAllocator, RegisterAllocator, StackAllocator
from src.codegen.codegen import Codegen
from enum import Enum

class AsmMode(Enum):
    UNDEFINED = ""
    TEXT = ".text"
    DATA = ".data"

class MipsCodegen(Codegen):
    def __init__(self):
        super().__init__()
        self.mode = AsmMode.UNDEFINED

    def switchMode(self, mode):
        if self.mode != mode:
            print(mode.value)
            self.mode = mode

    def getReturnRegister(self):
        return "v0"

    def outputStandardLibrary(self):
        with open("res/std-mips.s", "r") as f:
            content = f.read()
            print(content)

    def outputMainFunctionDeclaration(self):
        self.switchMode(AsmMode.TEXT)
        print("main:")

    def outputFunctionDeclaration(self, sym: str):
        self.switchMode(AsmMode.TEXT)
        print(f"{sym}:")

    def outputGlobalVariableDeclaration(self, label: str):
        self.switchMode(AsmMode.DATA)
        print(f"{label}: .word 0");

    def outputFunctionPreamble(self, stackInfo: StackAllocator, formals: List[str]):
        self.switchMode(AsmMode.TEXT)
        size = stackInfo.size()
        print(f"\taddi $sp, $sp, -{size}")
        print(f"\tsw $ra, 0($sp)")
        
        i = 0
        for sym, offset in stackInfo.allocations.items():
            if sym == "__lr__":
                continue
            elif sym in formals:
                print(f"\tsw $a{i}, {offset}($sp)")
                i += 1

    def outputFunctionPostamble(self, stackInfo: StackAllocator):
        self.switchMode(AsmMode.TEXT)
        size = stackInfo.size()
        print(f"\tlw $ra, 0($sp)")
        print(f"\taddi $sp, $sp, {size}")
        print(f"\tjr $ra")

    def outputSaveRegisters(self, alloc: RegisterAllocator):
        self.switchMode(AsmMode.TEXT)
        allocated = alloc.getUsed()
        size = len(allocated) * 4

        if size == 0:
            return

        print("# save registers")
        print(f"\taddi $sp, $sp, -{size}")
        offset = 0
        for reg in allocated:
            print(f"\tsw ${reg}, {offset}($sp)")
            offset += 4
        print("# save registers")

    def outputRestoreRegisters(self, alloc: RegisterAllocator):
        self.switchMode(AsmMode.TEXT)
        allocated = alloc.getUsed()
        size = len(allocated) * 4

        if size == 0:
            return

        print("# restore registers")
        offset = 0
        for reg in allocated:
            print(f"\tlw ${reg}, {offset}($sp)")
            offset += 4
        print(f"\taddi $sp, $sp, {size}")
        print("# restore registers")


    def outputMainExit(self, stack: StackAllocator):
        self.switchMode(AsmMode.TEXT)
        size = stack.size()
        print(f"\tlw $ra, 0($sp)")
        print(f"\taddi $sp, $sp, {size}")
        print(f"\tjal sym6")

    def outputStringLiteral(self, string: str, label: int):
        self.switchMode(AsmMode.DATA)
        length = len(string)
        data = [str(ord(x)) for x in string]
        self.outputLabel(label)
        print(f".byte {length}, {", ".join(data)}")
    
    def outputLoadIntegerImm(self, register: str, value: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tli ${register}, {value}")

    def outputLoadIntegerStack(self, register: str, offset: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tlw ${register}, {offset}($sp)")

    def outputLoadIntegerAddress(self, register: str, label: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tlw ${register}, {label}")

    def outputLoadByteImm(self, register: str, value: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tlb ${register}, {value}")

    def outputLoadAddress(self, register: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tla ${register}, L{label}")

    def outputStoreRegisterStack(self, register: str, offset: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tsw ${register}, {offset}($sp)");

    def outputStoreRegisterAddress(self, register: str, label: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tsw ${register}, {label}");

    def outputAdd(self, registerResult: str, registerA: str, registerB: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\taddu ${registerResult}, ${registerA}, ${registerB}")

    def outputSub(self, registerResult: str, registerA: str, registerB: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tsubu ${registerResult}, ${registerA}, ${registerB}")

    def outputNegate(self, registerResult: str, registerA: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tsubu ${registerResult}, $zero, ${registerA}")

    def outputMul(self, registerResult: str, registerA: str, registerB: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tmult ${registerA}, ${registerB}")
        print(f"\tmflo ${registerResult}")

    def outputDiv(self, registerResult: str, registerA: str, registerB: str, registerAllocator: RegisterAllocator):
        self.switchMode(AsmMode.TEXT)
        self.outputSaveRegisters(registerAllocator)
        self.outputCallFunction([registerA, registerB], "divmodchk")
        self.outputRestoreRegisters(registerAllocator)
        print(f"\tdiv ${registerResult}, ${registerA}, $v0")


    def outputMod(self, registerResult: str, registerA: str, registerB: str, registerAllocator: RegisterAllocator):
        self.switchMode(AsmMode.TEXT)
        self.outputSaveRegisters(registerAllocator)
        self.outputCallFunction([registerA, registerB], "divmodchk")
        self.outputRestoreRegisters(registerAllocator)
        print(f"\trem ${registerResult}, ${registerA}, $v0")

    def outputCallFunction(self, paramRegisters: List[str], functionSym: str):
        self.switchMode(AsmMode.TEXT)

        for i in range(len(paramRegisters)):
            param = paramRegisters[i]

            print(f"\tmove $a{i}, ${param}")
        print(f"\tjal {functionSym}")

    def outputMove(self, dst: str, src: str):
        self.switchMode(AsmMode.TEXT)
        print(f"\tmove ${dst}, ${src}")

    def outputJump(self, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tj L{label}")

    def outputRuntimeReturnCheck(self, msgLabel: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tla $a0, L{msgLabel}")
        print("\tjal sym1")
        print("\tli $v0, 17")
        print("\tli $a0, 1")
        print("\tsyscall")

    def outputJumpNotZero(self, register: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tbne ${register}, $zero, L{label}")

    def outputJumpZero(self, register: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tbeq ${register}, $zero, L{label}")

    def outputNot(self, dst: str, src: str, labelAlloc: LabelAllocator):
        self.switchMode(AsmMode.TEXT)
        l1 = labelAlloc.alloc()
        l2 = labelAlloc.alloc()
        print(f"\tbeq ${src}, $zero, L{l1}")
        print(f"\tli ${dst}, 0")
        print(f"\tb L{l2}")
        super().outputLabel(l1)
        print(f"\tli ${dst}, 1")
        super().outputLabel(l2)

    def outputJumpEqual(self, a: str, b: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tbeq ${a}, ${b}, L{label}")

    def outputJumpNotEqual(self, a: str, b: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tbne ${a}, ${b}, L{label}")

    def outputJumpGreaterThan(self, a: str, b: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tbgt ${a}, ${b}, L{label}")

    def outputJumpGreaterThanOrEqual(self, a: str, b: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tbge ${a}, ${b}, L{label}")

    def outputJumpLessThan(self, a: str, b: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tblt ${a}, ${b}, L{label}")

    def outputJumpLessThanOrEqual(self, a: str, b: str, label: int):
        self.switchMode(AsmMode.TEXT)
        print(f"\tble ${a}, ${b}, L{label}")
