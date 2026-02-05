import os
import subprocess
import json

def runCompiler(dir, compiler):
    tests = findScripts(dir)

    results = []

    for test in tests:
        fullPath = os.path.join(dir, test)
        results.append(compile(fullPath, compiler))

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

