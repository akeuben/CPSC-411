from common import runCompiler, serialize
import os

TEST_DIRS = {
    "lex": os.path.join(os.path.dirname(__file__), "tests", "lex"),
    "parse": os.path.join(os.path.dirname(__file__), "tests", "parse"),
    "sem": os.path.join(os.path.dirname(__file__), "tests", "semantic"),
}

REFERENCE_COMPILERS = {
    "lex": "/home/profs/aycock/411/TEST/reference/j--scan",
    "parse": "/home/profs/aycock/411/TEST/reference/j--parse",
    "sem": "/home/profs/aycock/411/TEST/reference/j--sem",
}

def run(stage):
    results = runCompiler(TEST_DIRS[stage], REFERENCE_COMPILERS[stage])
    for result in results:
        result["stdout"] = result["stdout"].split("SYMBOL TABLE LOG:", 1)[0]
        result["stderr"] = result["stderr"].split("SYMBOL TABLE LOG:", 1)[0]
        file = result["path"]
        file = file.replace(".j--", ".json")
        toSave = serialize(result)

        with open(file, "w") as f:
            f.write(toSave)


if __name__ == "__main__":
    run("lex")
    run("parse")
    run("sem")
