import serial

USB_PORT = "/dev/ttyACM0"
usb = serial.Serial(USB_PORT, 9600, timeout=2)

def openLockSOID(SOID):
    SOID_Split = list(SOID)
    key = SOID_Split[-1]
    if(key == 1):
        usb.write(b'door1')