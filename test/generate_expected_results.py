from common import runCompiler, serialize
import os

TEST_DIRS = {
    "lex": os.path.join(os.path.dirname(__file__), "tests", "lex")
}

REFERENCE_COMPILERS = {
    "lex": "/home/profs/aycock/411/TEST/reference/j--scan"
}

if __name__ == "__main__":
    results = runCompiler(TEST_DIRS["lex"], REFERENCE_COMPILERS["lex"])
    for result in results:
        file = result["path"]
        file = file.replace(".j--", ".json")
        toSave = serialize(result)

        with open(file, "w") as f:
            f.write(toSave)
