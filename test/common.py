import os
import subprocess
import json

def runCompiler(dir, compiler):
    tests = findScripts(dir)

    results = []
    i = 0
    for test in tests:
        i += 1
        print(f"Progress: {i} of {len(tests)}. Testing {test}")
        fullPath = os.path.join(dir, test)
        results.append(compile(fullPath, compiler))

    return results;

def findScripts(path):
    files = os.listdir(path)
    return [f for f in files if f.endswith(".j--")]

def compile(file, compiler):
    # Check for matching .in file
    in_file = os.path.splitext(file)[0] + ".in"

    stdin_data = None
    if os.path.exists(in_file):
        with open(in_file, "rb") as f:
            stdin_data = f.read()

    cp = subprocess.run(
        [compiler, file],
        input=stdin_data,
        capture_output=True
    )

    return {
        "stdout": cp.stdout.decode("iso-8859-1"),
        "stderr": cp.stderr.decode("iso-8859-1"),
        "path": file,
        "exit_code": cp.returncode
    }

def serialize(result):
    return json.dumps(result)

def deserialize(string):
    return json.loads(string)

