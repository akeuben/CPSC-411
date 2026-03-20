ANTLR ?= ~aycock/411/bin/cpsc411-antlr4
ANTLR_OPTIONS += -o ../src/generated

all: src/generated/lex.py src/generated/parse.py

test: all
	python test/run_tests.py lex ./main_lexer.py test/tests/lex
	python test/run_tests.py parse ./main_parser.py test/tests/parse

src/generated/lex.py: grammar/lex.g4
	cd grammar && $(ANTLR) lex.g4 $(ANTLR_OPTIONS)

src/generated/parse.py: grammar/parse.g4 src/generated/lex.tokens
	cd grammar && $(ANTLR) parse.g4 $(ANTLR_OPTIONS)
		

.PHONY: clean

clean:
	rm -f src/generated/*.interp src/generated/*.py src/generated/*.tokens
