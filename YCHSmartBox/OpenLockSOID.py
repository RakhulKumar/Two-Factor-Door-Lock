def openLockSOID(SOID):
    SOID_Split = list(SOID)
    command = "door" + str(SOID_Split[-1])
    return(bytes(command))
