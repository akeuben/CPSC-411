def collapseUnaryMinus(tree):
    """
    The reference parser pre-evaluates unary minus on a number for a single unary minus. 
    This cannot be done with the ASTShaper, since we cannot modify attributes using that system.

    For example, takes the tree UMINUS (number attr='1') and replaces the node with (number attr='1')

    This function recursively perfoms this operation on the entire syntax tree `tree` and modifies the tree in place.
    """
    for i in range(0, len(tree)):
        child = tree[i]

        if child.type == "UMINUS" and child[0].type == "number":
            child[0].attr = f'-{child[0].attr}'
            tree[i] = child[0]
        else:
            collapseUnaryMinus(child)

def reorderFunctionDeclation(tree):
    for child in tree:
        if child.type == "funcDecl":
            child[0], child[1], child[2], child[3] = child[2], child[0], child[1], child[3]

def postProcessTree(tree):
    collapseUnaryMinus(tree)
    reorderFunctionDeclation(tree)

