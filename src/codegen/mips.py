class MipsCodegen(Codegen):
    def __init__(self):
        super().__init__()

    def outputStandardLibrary(self):
        with open("res/std-mips.s", "r") as f:
            content = f.read()
            print(content)

    def outputMainFunctionDeclaration(self):
        print("main:")

    def outputFunctionDeclaration(self, sym: str):
        print(f"F{sym}:")
