

def log(prefix, msg, line = None):
    if line != None:
        msg = f"{msg} at or around line {str(line)}"
    print(f"{prefix}: {msg}")

def logWarning(msg, line = None):
    log("warning", msg, line)

def logError(msg, line = None):
    log("error", msg, line)

def logToken(type, line, attr):
    print(f"{type} @ line {line}, attr {attr}")
