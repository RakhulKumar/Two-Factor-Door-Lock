'''
OTP = "-1"

class Exampleclass:
    OTP = ""
    def foo(self):
        return("713")

if __name__ == "__main__":
    obj = Exampleclass()
    OTP = obj.foo()
    print(OTP)
'''
'''
dicti = {"101":"5001","102":"5002","103":"5003"}

for i in dicti:
    if(i=="101"):
        print(dicti[i])



import datetime

current_time = datetime.datetime.now()
dat = str(current_time)
print(type(dat))
print(dat)

import serial

USB_PORT = "/dev/tty.usbmodem14101"
usb = serial.Serial(USB_PORT, 9600, timeout=2)

def barcode():
        usb.write(b'barcode')

barcode()
'''

import os

os.system('nautilus /home/ubuntu/Downloads/Two-Factor-Security-Door/YCHSmartBox/SecurityCam')
