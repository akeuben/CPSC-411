from common import runCompiler

TEST_DIRS = {
    "lex": os.path.join(os.path.dirname(__file__), "tests", "lex")
}

REFERENCE_COMPILERS = {
    "lex": "~aycock/411/TEST/reference/j--scan"
}

if __name__ == "__main__":
    results = runCompiler(TEST_DIRS.lex, REFERENCE_COMPILERS.lex)
    print(results)
