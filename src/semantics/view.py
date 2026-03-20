from src.core import cpsc411

class PrettyView(cpsc411.AstView):
    def v_sym(self, attr):
        return f'sym={attr}'
    def v_sig(self, attr):
        return f'sig={repr(attr)}'
    def v_lineno(self, attr):
        return f'lineno={attr}'
