import sys
from typing import TextIO

def log(prefix: str, msg: str, line: int | None = None, file: TextIO = sys.stdout) -> None:
    if line != None:
        msg = f"{msg} at or near line {str(line)}"
    print(f"{prefix}: {msg}", file=file)

warningCount = 0

def logWarning(msg: str, line: int | None = None) -> None:
    global warningCount
    warningCount += 1 

    log("warning", msg, line, file=sys.stderr)

    if warningCount > 10:
        logError("too many warnings", line)

def logError(msg: str, line: int | None = None) -> None:
    log("error", msg, line, file=sys.stderr)
    exit(1)

def logToken(type: str, line: int, attr: str) -> None:
    print(f"{type} @ line {line}, attr {attr}")

def logUsage(cmd):
    print(f"Usage: python3 {cmd} file.j--", file=sys.stderr)
    sys.exit(1)

def logUnknownFile(path):
    print(f"{path}: No such file or directory")
    sys.exit(1)

