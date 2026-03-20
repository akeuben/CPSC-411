from typing import List

class Type:
    def __repr__(self):
        return f"'{self.format()}'"

    def __str__(self):
        return self.format();

    def format(self):
        raise NotImplementedError()
    pass

class TypeInt(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeInt)

    def format(self):
        return 'int'

class TypeBoolean(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeBoolean)

    def format(self):
        return 'bool'
        

class TypeString(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeString)

    def format(self):
        return 'string'

class TypeVoid(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeVoid)

    def format(self):
        return 'void'

class TypeFunction(Type):
    formalParameterTypes: List[Type]
    returnType: Type

    def __init__(self, returnType: Type, formalParameterTypes: List[Type]):
        self.returnType = returnType
        self.formalParameterTypes = formalParameterTypes

    def __eq__(self, value: object, /) -> bool:
        if not isinstance(value, TypeFunction):
            return False

        if not self.returnType == value.returnType:
            return False 

        return self.formalParameterTypes == value.formalParameterTypes
    
    def format(self):
        # map each formal parameter type to its corresponding string representation
        formalParameterTypes = [str(x) for x in self.formalParameterTypes]
        return f'f({','.join(formalParameterTypes)})'
