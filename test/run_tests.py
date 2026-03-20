from typing import List, Tuple, Union
from common import compile, runCompiler, deserialize
import os
import sys
import difflib

def usage():
    print(f"Usage: {sys.argv[0]} lex|parse <executable path> <test dir|test>") 
    sys.exit(1)

def main():
    if len(sys.argv) != 4:
        usage()

    compilerType = sys.argv[1]
    compiler = sys.argv[2]
    testDir = sys.argv[3]

    if os.path.isdir(testDir):
        results = runCompiler(testDir, compiler)
    else:
        results = [compile(testDir, compiler)]

    successCount = 0
    count = len(results)

    for result in results:
        r = checkResult(result)
        if r == -1:
            count -= 1
        else:
            successCount += r

    print(f">> Summary ({compilerType}): {successCount}/{count} tests passed")

def checkResult(result):
    file = result["path"]
    file = file.replace(".j--", ".json")

    try:
        with open(file, "r") as f:
            contents = f.read()
            expected = deserialize(contents)

            fail = False
            reasons: List[Tuple[str, Union[str, int], Union[str, int]]] = []

            if expected["stdout"].strip() != result["stdout"].strip():
                fail = True
                reasons.append(("stdout", expected["stdout"], result["stdout"]))
            if expected["stderr"].strip() != result["stderr"].strip():
                fail = True
                reasons.append(("stderr", expected["stderr"], result["stderr"]))
            if expected["exit_code"] != result["exit_code"]:
                fail = True
                reasons.append(("exit_code", expected["exit_code"], result["exit_code"]))

            if fail:
                print(f">> Test: {os.path.basename(file)} failed!")
                for reason in reasons:
                    print(f"{reason[0]} mismatch!")
                    if type(reason[1]) != str or type(reason[2]) != str:
                        print(f'expected: {reason[1]}, got: {reason[2]}')
                    else:
                        diff = difflib.unified_diff(
                            reason[1].splitlines(keepends=True),
                            reason[2].splitlines(keepends=True),
                            fromfile="expected",
                            tofile="actual"
                        )
                        print(''.join(diff))
                return 0
            else:
                print(f">> Test: {os.path.basename(file)} passed!")
                return 1
    except:
        print(f">> warning: expected output for test {file} does not exist. Make sure to run ./generate_expected_results.py within the test directory on the CPSC-Linux machines.")
        return -1



if __name__ == "__main__":
    main()
