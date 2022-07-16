from common import runCompiler, serialize
import os

TEST_DIRS = {
    "lex": os.path.join(os.path.dirname(__file__), "tests", "lex"),
    "parse": os.path.join(os.path.dirname(__file__), "tests", "parse"),
}

REFERENCE_COMPILERS = {
    "lex": "/home/profs/aycock/411/TEST/reference/j--scan",
    "parse": "/home/profs/aycock/411/TEST/reference/j--parse"
}

def run(stage):
    results = runCompiler(TEST_DIRS[stage], REFERENCE_COMPILERS[stage])
    for result in results:
        file = result["path"]
        file = file.replace(".j--", ".json")
        toSave = serialize(result)

        with open(file, "w") as f:
            f.write(toSave)


if __name__ == "__main__":
    run("lex")
    run("parse")
