class RegisterAllocator():

    def getUsed(self):
        raise RuntimeError("Not implemented")

    def alloc(self):
        raise RuntimeError("Not implemented")

    def free(self, register)
        raise RuntimeError("Not implemented")

class BasicMipsRegisterAllocator(RegisterAllocator):
    def __init__(self):
        self.free = [f"s{x}" for x in range(7)]
        self.used = []

    def alloc(self):
        if len(self.free) == 0:
            logError("No registers remaining!")
        reg = self.free.pop()
        self.used.append(reg)
        return reg

    def free(self, reigster):
        self.free.append(register)
        self.used.remove(register)

