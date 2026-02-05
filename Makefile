ANTLR ?= ~aycock/411/bin/cpsc411-antlr4
ANTLR_OPTIONS += -o ../src/generated

all: src/generated/lex.py

test: all
	python test/run_tests.py lex ./main.py test/tests/lex

src/generated/lex.py: grammar/lex.g4
	cd grammar && $(ANTLR) lex.g4 $(ANTLR_OPTIONS)

.PHONY: clean

clean:
	rm -f src/generated/*.interp src/generated/*.py src/generated/*.tokens
