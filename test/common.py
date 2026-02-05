import os
import subprocess

def runCompiler(dir, compiler):
    tests = findTests(dir)

    results = []

    for test in tests:
        results.push(compile(path, test, reference))

    return results;

def findScripts(path):
    files = os.listdir(path)
    return [f for f in files if f.endswith(".j--")]

def compile(file, reference):
    cp = subprocess.run([reference, file], capture_output=True)

    return {
        "stdout": cp.stdout,
        "stderr": cp.stderr,
        "exit_code": cp.returncode
    }

