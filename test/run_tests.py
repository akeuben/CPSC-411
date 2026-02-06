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
        r = checkResult(result)
        if r == -1:
            count -= 1
        else:
            successCount += r

    print(f">> Summary: {successCount}/{count} tests passed")

def checkResult(result):
    file = result["path"]
    file = file.replace(".j--", ".json")

    try:
        with open(file, "r") as f:
            contents = f.read()
            expected = deserialize(contents)

            fail = False
            reasons = []

            if expected["stdout"] != result["stdout"]:
                fail = True
                reasons.append(f"STDOUT mismatch!\nExpected: \n{expected["stdout"]}\nGot: \n{result["stdout"]}")
            if expected["stderr"] != result["stderr"]:
                fail = True
                reasons.append(f"STDERR mismatch!\nExpected: \n{expected["stderr"]}\nGot: \n{result["stderr"]}")
            if expected["exit_code"] != result["exit_code"]:
                fail = True
                reasons.append(f"EXIT CODE mismatch!\nExpected \n{expected["exit_code"]}\nGot: \n{result["exit_code"]}")

            if fail:
                print(f">> Test: {os.path.basename(file)} failed!")
                print("\n".join(reasons))
                return 0
            else:
                print(f">> Test: {os.path.basename(file)} passed!")
                return 1
    except:
        print(f">> warning: expected output for test {file} does not exist. Make sure to run ./generate_expected_results.py within the test directory on the CPSC-Linux machines.")
        return -1



if __name__ == "__main__":
    main()
