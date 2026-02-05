from common import runCompiler, deserialize
import os
import sys

def usage():
    print(f"Usage: {sys.argv[0]} lex <lexer path> <test dir>") 
    sys.exit(1)

def main():
    if len(sys.argv) != 4:
        usage()

    compilerType = sys.argv[1]
    compiler = sys.argv[2]
    testDir = sys.argv[3]

    results = runCompiler(testDir, compiler)

    successCount = 0
    count = len(results)

    for result in results:
        successCount += checkResult(result)

    print(f">> Summary: {successCount}/{count} tests passed")

def checkResult(result):
    file = result["path"]
    file = file.replace(".j--", ".json")

    with open(file, "r") as f:
        contents = f.read()
        expected = deserialize(contents)

        fail = False
        reasons = []

        if expected["stdout"] != result["stdout"]:
            fail = True
            reasons.append(f"STDOUT mismatch!\n Expected: {expected["stdout"]}\nGot: {result["stdout"]}")
        if expected["stderr"] != result["stderr"]:
            fail = True
            reasons.append(f"STDERR mismatch!\n Expected: {expected["stderr"]}\nGot: {result["stderr"]}")
        if expected["exit_code"] != result["exit_code"]:
            fail = True
            reasons.append(f"EXIT CODE mismatch!\n Expected {expected["exit_code"]}\nGot: {result["exit_code"]}")

        if fail:
            print(f"\n\n>> Test: {os.path.basename(file)} failed!")
            print("\n\n".join(reasons))
            return 0
        else:
            print(f"\n\n>> Test: {os.path.basename(file)} passed!")
            return 1



if __name__ == "__main__":
    main()
