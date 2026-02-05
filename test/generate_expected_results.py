from common import main

TEST_DIRS = {
    "lex": os.path.join(os.path.dirname(__file__), "tests", "lex")
}

REFERENCE_COMPILERS = {
    "lex": "~aycock/411/TEST/reference/j--scan"
}

if __name__ == "__main__":
    results = runCompilers(TEST_DIRS.lex, REFERENCE_COMPILERS.lex)
    print(results)
