from src.core.logging import logWarning
from src.codegen.codegen import Codegen
from src.codegen.allocator import AllocatorBundle, StackAllocator
from src.core.cpsc411 import *
from src.semantics.types import Type, TypeBoolean, TypeInt, TypeVoid

def generateCode(codegen: Codegen, alloc: AllocatorBundle, ast: Ast):
    traversal = ProgramTraversal(codegen, alloc)
    traversal.preorder(ast)

class DebugTraversal(AstTraversal):
    def default(self, node):
        logWarning(f"Node f{node} was not handled!")


class ProgramTraversal(AstTraversal):
    def __init__(self, codegen: Codegen, alloc: AllocatorBundle):
        self.alloc = alloc
        self.codegen = codegen

    def n_program(self, _: Ast):
        self.codegen.outputStandardLibrary()

    def n_funcDecl(self, node: Ast):
        stack = StackAllocator()
        stack.alloc(4, "__lr__")
        stackTraversal = StackTraversal(stack)
        stackTraversal.preorder(node)

        retLabel = self.alloc.label.alloc()
        
        formals = []
        for child in node[2]:
            sym = child[1].sym
            formals.append(sym)

        self.codegen.outputFunctionDeclaration(node[1].sym)
        self.codegen.outputFunctionPreamble(stack, formals)
        
        traversal = FunctionBodyTraversal(self.codegen, self.alloc, stack, retLabel)
        traversal.preorder(node[3])

        if node[0].sig != TypeVoid():
            label = self.alloc.label.alloc()
            self.codegen.outputStringLiteral(f"error: function {node[1].attr} must return a value at or near line {node[1].lineno}\n", label)
            self.codegen.outputRuntimeReturnCheck(label)
        
        self.codegen.outputLabel(retLabel)
        self.codegen.outputFunctionPostamble(stack)


    def n_mainDecl(self, node: Ast):
        stack = StackAllocator()
        stack.alloc(4, "__lr__")
        stackTraversal = StackTraversal(stack)
        stackTraversal.preorder(node)

        retLabel = self.alloc.label.alloc()

        self.codegen.outputMainFunctionDeclaration()
        self.codegen.outputFunctionPreamble(stack, [])
        
        traversal = FunctionBodyTraversal(self.codegen, self.alloc, stack, retLabel)
        traversal.preorder(node[3])
        
        self.codegen.outputLabel(retLabel)
        self.codegen.outputMainExit(stack)

        self.prune()


class FunctionBodyTraversal(AstTraversal):
    def __init__(self, codegen: Codegen, alloc: AllocatorBundle, stack: StackAllocator, retLabel: int):
        self.codegen = codegen
        self.alloc = alloc 
        self.stack = stack
        self.retLabel = retLabel

    def n_exprStmt(self, node: Ast):
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node)

        self.alloc.register.free(node[0].reg)

        self.prune()

    def n_returnStmt(self, node: Ast):
        if len(node) > 0:
            traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
            traversal.preorder(node[0])

            self.alloc.register.free(node[0].reg)

            self.codegen.outputMove(self.codegen.getReturnRegister(), node[0].reg)
        else:
            pass 

        self.codegen.outputJump(self.retLabel)

        self.prune()

    def n_ifElseStmt(self, node: Ast):
        labelEnd = self.alloc.label.alloc()
        labelElse = self.alloc.label.alloc()

        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[0])

        register = node[0].reg
        self.alloc.register.free(register)

        self.codegen.outputJumpZero(register, labelElse)

        traversal = FunctionBodyTraversal(self.codegen, self.alloc, self.stack, self.retLabel)
        traversal.preorder(node[1])

        self.codegen.outputJump(labelEnd)
        self.codegen.outputLabel(labelElse)

        traversal = FunctionBodyTraversal(self.codegen, self.alloc, self.stack, self.retLabel)
        traversal.preorder(node[2])

        self.codegen.outputLabel(labelEnd)

        self.prune()

    def n_ifStmt(self, node: Ast):
        label = self.alloc.label.alloc()

        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[0])

        register = node[0].reg
        self.alloc.register.free(register)

        self.codegen.outputJumpZero(register, label)

        traversal = FunctionBodyTraversal(self.codegen, self.alloc, self.stack, self.retLabel)
        traversal.preorder(node[1])

        self.codegen.outputLabel(label)

        self.prune()

    def n_whileStmt(self, node: Ast):
        conditionLabel = self.alloc.label.alloc()
        loopLabel = self.alloc.label.alloc()

        self.codegen.outputJump(conditionLabel)

        self.codegen.outputLabel(loopLabel)
        traversal = FunctionBodyTraversal(self.codegen, self.alloc, self.stack, self.retLabel)
        traversal.preorder(node[1])

        self.codegen.outputLabel(conditionLabel)
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[0])
        
        register = node[0].reg
        self.alloc.register.free(register)

        self.codegen.outputJumpNotZero(register, loopLabel)

        self.prune()
        


class ExpressionTraversal(AstTraversal):

    def __init__(self, codegen: Codegen, alloc: AllocatorBundle, stack: StackAllocator):
        self.codegen = codegen
        self.alloc = alloc
        self.stack = stack

    def n_string_exit(self, node: Ast):
        label = self.alloc.label.alloc()
        register = self.alloc.register.alloc()
        string = bytes(node.attr[1:-1], "utf-8").decode("unicode_escape")
        self.codegen.outputStringLiteral(string, label)
        self.codegen.outputLoadAddress(register, label)
        node.reg = register

    def n_number_exit(self, node: Ast):
        register = self.alloc.register.alloc()
        self.codegen.outputLoadIntegerImm(register, node.attr)
        node.reg = register

    def n_ADD_exit(self, node: Ast):
        left = node[0].reg
        right = node[1].reg

        self.alloc.register.free(right)
        self.alloc.register.free(left)

        register = self.alloc.register.alloc()

        self.codegen.outputAdd(register, left, right)
        node.reg = register

    def n_SUB_exit(self, node: Ast):
        left = node[0].reg
        right = node[1].reg

        self.alloc.register.free(right)
        self.alloc.register.free(left)

        register = self.alloc.register.alloc()

        self.codegen.outputSub(register, left, right)
        node.reg = register

    def n_MUL_exit(self, node: Ast):
        left = node[0].reg
        right = node[1].reg

        self.alloc.register.free(right)
        self.alloc.register.free(left)

        register = self.alloc.register.alloc()

        self.codegen.outputMul(register, left, right)
        node.reg = register

    def n_DIV_exit(self, node: Ast):
        left = node[0].reg
        right = node[1].reg

        self.alloc.register.free(right)
        self.alloc.register.free(left)

        register = self.alloc.register.alloc()

        self.codegen.outputDiv(register, left, right)
        node.reg = register

    def n_MOD_exit(self, node: Ast):
        left = node[0].reg
        right = node[1].reg

        self.alloc.register.free(right)
        self.alloc.register.free(left)

        register = self.alloc.register.alloc()

        self.codegen.outputMod(register, left, right)
        node.reg = register

    def n_funcCall(self, node: Ast):
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[1])

        actuals = node[1]

        params = []
        for child in actuals:
            params.append(child.reg)
            self.alloc.register.free(child.reg)

        self.codegen.outputSaveRegisters(self.alloc.register)
        self.codegen.outputCallFunction(params, node[0].sym)
        self.codegen.outputRestoreRegisters(self.alloc.register)

        register = self.alloc.register.alloc()
        node.reg = register
        self.codegen.outputMove(register, self.codegen.getReturnRegister())

        self.prune()

    def n_id_exit(self, node: Ast):
        sym = node.sym

        if not self.stack.defined(sym):
            # Then this is not a local variable node, is instead 
            # a function call id 
            return
        
        offset = self.stack.location(sym)
        
        register = self.alloc.register.alloc()

        self.codegen.outputLoadIntegerStack(register, offset)

        node.reg = register

    def n_ASSIGN(self, node: Ast):
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[1])

        register = node[1].reg
        sym = node[0].sym

        if self.stack.defined(sym):
            self.codegen.outputStoreRegisterStack(register, self.stack.location(sym))
        else:
            self.codegen.outputStoreRegisterAddress(register, sym)

        node.reg = register

        self.prune()

    def n_true_exit(self, node: Ast):
        register = self.alloc.register.alloc()
        self.codegen.outputLoadIntegerImm(register, "1")
        node.reg = register

    def n_false_exit(self, node: Ast):
        register = self.alloc.register.alloc()
        self.codegen.outputLoadIntegerImm(register, "0")
        node.reg = register

    def n_AND(self, node: Ast):
        register = self.alloc.register.alloc()
        rightLabel = self.alloc.label.alloc()
        # Traverse left 
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[0])
        leftRegister = node[0].reg 
        self.alloc.register.free(leftRegister)

        self.codegen.outputMove(register, leftRegister)
        self.codegen.outputJumpZero(register, rightLabel)

        traversal.preorder(node[1])
        rightRegister = node[1].reg 
        self.alloc.register.free(rightRegister)

        self.codegen.outputMove(register, rightRegister)
        self.codegen.outputLabel(rightLabel)
        
        node.reg = register
        self.prune()

    def n_OR(self, node: Ast):
        rightLabel = self.alloc.label.alloc()
        # Traverse left 
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.preorder(node[0])

        leftRegister = node[0].reg 
        self.alloc.register.free(leftRegister)

        register = self.alloc.register.alloc()

        self.codegen.outputMove(register, leftRegister)
        self.codegen.outputJumpNotZero(register, rightLabel)

        traversal.preorder(node[1])
        rightRegister = node[1].reg 
        self.alloc.register.free(rightRegister)

        self.codegen.outputMove(register, rightRegister)
        self.codegen.outputLabel(rightLabel)
        
        node.reg = register
        self.prune()

    def n_NOT_exit(self, node: Ast):
        paramRegister = node[0].reg
        self.alloc.register.free(paramRegister)
        register = self.alloc.register.alloc();

        self.codegen.outputNot(paramRegister, register, self.alloc.label)

        node.reg = register

    def n_EQ_exit(self, node: Ast):
        trueLabel = self.alloc.label.alloc()
        exitLabel = self.alloc.label.alloc()
        leftReg = node[0].reg
        rightReg = node[1].reg

        self.alloc.register.free(leftReg)
        self.alloc.register.free(rightReg)
        register = self.alloc.register.alloc()

        self.codegen.outputJumpEqual(leftReg, rightReg, trueLabel)
        self.codegen.outputLoadIntegerImm(register, "0")
        self.codegen.outputJump(exitLabel)
        self.codegen.outputLabel(trueLabel)
        self.codegen.outputLoadIntegerImm(register, "1")
        self.codegen.outputLabel(exitLabel)

        node.reg = register

    def n_NE_exit(self, node: Ast):
        trueLabel = self.alloc.label.alloc()
        exitLabel = self.alloc.label.alloc()
        leftReg = node[0].reg
        rightReg = node[1].reg

        self.alloc.register.free(leftReg)
        self.alloc.register.free(rightReg)
        register = self.alloc.register.alloc()

        self.codegen.outputJumpNotEqual(leftReg, rightReg, trueLabel)
        self.codegen.outputLoadIntegerImm(register, "0")
        self.codegen.outputJump(exitLabel)
        self.codegen.outputLabel(trueLabel)
        self.codegen.outputLoadIntegerImm(register, "1")
        self.codegen.outputLabel(exitLabel)

        node.reg = register

    def n_GT_exit(self, node: Ast):
        trueLabel = self.alloc.label.alloc()
        exitLabel = self.alloc.label.alloc()
        leftReg = node[0].reg
        rightReg = node[1].reg

        self.alloc.register.free(leftReg)
        self.alloc.register.free(rightReg)
        register = self.alloc.register.alloc()

        self.codegen.outputJumpGreaterThan(leftReg, rightReg, trueLabel)
        self.codegen.outputLoadIntegerImm(register, "0")
        self.codegen.outputJump(exitLabel)
        self.codegen.outputLabel(trueLabel)
        self.codegen.outputLoadIntegerImm(register, "1")
        self.codegen.outputLabel(exitLabel)

        node.reg = register

    def n_GE_exit(self, node: Ast):
        trueLabel = self.alloc.label.alloc()
        exitLabel = self.alloc.label.alloc()
        leftReg = node[0].reg
        rightReg = node[1].reg

        self.alloc.register.free(leftReg)
        self.alloc.register.free(rightReg)
        register = self.alloc.register.alloc()

        self.codegen.outputJumpGreaterThanOrEqual(leftReg, rightReg, trueLabel)
        self.codegen.outputLoadIntegerImm(register, "0")
        self.codegen.outputJump(exitLabel)
        self.codegen.outputLabel(trueLabel)
        self.codegen.outputLoadIntegerImm(register, "1")
        self.codegen.outputLabel(exitLabel)

        node.reg = register

    def n_LT_exit(self, node: Ast):
        trueLabel = self.alloc.label.alloc()
        exitLabel = self.alloc.label.alloc()
        leftReg = node[0].reg
        rightReg = node[1].reg

        self.alloc.register.free(leftReg)
        self.alloc.register.free(rightReg)
        register = self.alloc.register.alloc()

        self.codegen.outputJumpLessThan(leftReg, rightReg, trueLabel)
        self.codegen.outputLoadIntegerImm(register, "0")
        self.codegen.outputJump(exitLabel)
        self.codegen.outputLabel(trueLabel)
        self.codegen.outputLoadIntegerImm(register, "1")
        self.codegen.outputLabel(exitLabel)

        node.reg = register

    def n_LE_exit(self, node: Ast):
        trueLabel = self.alloc.label.alloc()
        exitLabel = self.alloc.label.alloc()
        leftReg = node[0].reg
        rightReg = node[1].reg

        self.alloc.register.free(leftReg)
        self.alloc.register.free(rightReg)
        register = self.alloc.register.alloc()

        self.codegen.outputJumpLessThanOrEqual(leftReg, rightReg, trueLabel)
        self.codegen.outputLoadIntegerImm(register, "0")
        self.codegen.outputJump(exitLabel)
        self.codegen.outputLabel(trueLabel)
        self.codegen.outputLoadIntegerImm(register, "1")
        self.codegen.outputLabel(exitLabel)

        node.reg = register

class StackTraversal(AstTraversal):
    """
    Calculates stack positions of local variables
    """

    def __init__(self, stack: StackAllocator):
        self.stack = stack

    def n_varDecl(self, node: Ast):
        sym = node[1].sym 
        # Bool can fit in a single byte, but stack must remain word aligned
        self.stack.alloc(4, sym)

    def n_formal(self, node: Ast):
        sym = node[1].sym 
        # Bool can fit in a single byte, but stack must remain word aligned
        self.stack.alloc(4, sym)
