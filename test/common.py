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

def compile(file, compiler):
    cp = subprocess.run([compiler, file], capture_output=True)

    return {
        "stdout": str(cp.stdout, encoding='iso-8859-1'),
        "stderr": str(cp.stderr, encoding='iso-8859-1'),
        "path": file,
        "exit_code": cp.returncode
    }

def serialize(result):
    return json.dumps(result)

def deserialize(string):
    return json.loads(string)

