from typing import List

class Type:
    pass

class TypeInt(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeInt)

class TypeBoolean(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeBoolean)

class TypeString(Type):
    def __eq__(self, value: object, /) -> bool:
        return isinstance(value, TypeString)

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
    
