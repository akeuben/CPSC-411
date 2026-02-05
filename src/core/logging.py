import sys

def log(prefix, msg, line = None, file=sys.stdout):
    if line != None:
        msg = f"{msg} at or near line {str(line)}"
    print(f"{prefix}: {msg}", file=file)

warningCount = 0

def logWarning(msg, line = None):
    global warningCount
    warningCount += 1 

    log("warning", msg, line, file=sys.stderr)

    if warningCount > 10:
        logError("too many warnings", line)

def logError(msg, line = None):
    log("error", msg, line, file=sys.stderr)
    exit(1)

def logToken(type, line, attr):
    print(f"{type} @ line {line}, attr {attr}")
