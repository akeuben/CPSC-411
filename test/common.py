import os
import subprocess

def runCompilers(dir, compiler):
    tests = findTests(dir)

    results = []

    for test in tests:
        results.push(runCompiler(path, test, reference))

    return results;

def findScripts(path):
    files = os.listdir(path)
    return [f for f in files if f.endswith(".j--")]

def runCompiler(file, reference):
    cp = subprocess.run([reference, file], capture_output=True)

    return {
        "stdout": cp.stdout,
        "stderr": cp.stderr,
        "exit_code": cp.returncode
    }

