from src.core.logging import logWarning
from src.codegen.codegen import Codegen
from src.codegen.allocator import AllocatorBundle, StackAllocator
from src.core.cpsc411 import *
from src.semantics.types import Type, TypeBoolean, TypeInt

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
        
        formals = []
        for child in node[2]:
            sym = child[1].sym
            formals.append(sym)

        self.codegen.outputFunctionDeclaration(node[1].sym)
        self.codegen.outputFunctionPreamble(stack, formals)
        
        traversal = BlockTraversal(self.codegen, self.alloc, stack)
        traversal.preorder(node[3])
        
        self.codegen.outputFunctionPostamble(stack)


    def n_mainDecl(self, node: Ast):
        stack = StackAllocator()
        stack.alloc(4, "__lr__")
        stackTraversal = StackTraversal(stack)
        stackTraversal.preorder(node)

        self.codegen.outputMainFunctionDeclaration()
        self.codegen.outputFunctionPreamble(stack, [])
        
        traversal = BlockTraversal(self.codegen, self.alloc, stack)
        traversal.preorder(node[3])
        
        self.codegen.outputFunctionPostamble(stack)
        self.codegen.outputMainExit()

        self.prune()


class BlockTraversal(AstTraversal):
    def __init__(self, codegen: Codegen, alloc: AllocatorBundle, stack: StackAllocator):
        self.codegen = codegen
        self.alloc = alloc 
        self.stack = stack

    def n_exprStmt(self, node: Ast):
        traversal = ExpressionTraversal(self.codegen, self.alloc, self.stack)
        traversal.postorder(node)
        self.prune()


class ExpressionTraversal(AstTraversal):

    def __init__(self, codegen: Codegen, alloc: AllocatorBundle, stack: StackAllocator):
        self.codegen = codegen
        self.alloc = alloc
        self.stack = stack

    def n_string(self, node: Ast):
        label = self.alloc.label.alloc()
        register = self.alloc.register.alloc()
        string = bytes(node.attr[1:-1], "utf-8").decode("unicode_escape")
        self.codegen.outputStringLiteral(string, label)
        self.codegen.outputLoadAddress(register, label)
        node.reg = register

    def n_number(self, node: Ast):
        register = self.alloc.register.alloc()
        self.codegen.outputLoadIntegerImm(register, node.attr)
        node.reg = register

    def n_ADD(self, node: Ast):
        left = node[0].reg
        right = node[1].reg

        self.alloc.register.free(right)
        self.alloc.register.free(left)

        register = self.alloc.register.alloc()

        self.codegen.outputAdd(register, left, right)
        node.reg = register

    def n_funcCall(self, node: Ast):
        actuals = node[1]

        params = []
        for child in actuals:
            params.append(child.reg)
            self.alloc.register.free(child.reg)

        self.codegen.outputCallFunction(params, node[0].sym)

    def n_id(self, node: Ast):
        sym = node.sym

        if not self.stack.defined(sym):
            # Then this is not a local variable node, is instead 
            # a function call id 
            return
        
        offset = self.stack.location(sym)
        
        register = self.alloc.register.alloc()

        self.codegen.outputLoadIntegerStack(register, offset)

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
