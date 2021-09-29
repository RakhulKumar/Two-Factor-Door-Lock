import sys
import os

#Importing OTP Verification script
from OTPGenerator import OTPGen
from SOID_Data import SOID_Data
from OpenLockSOID import openLockSOID


#Importing Qt Modules
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

#Importing USB module for Arduino
import serial


USB_PORT = "/dev/ttyACM0"
usb = serial.Serial(USB_PORT, 9600, timeout=2)



class MainWindow(QObject):
    
    def __init__(self):
        QObject.__init__(self)

    setName = Signal(str)

    @Slot(str)
    def SRL_Lock_Open(self, name):

        if(name == "101"):   
            usb.write(b'door1')
        elif(name == "102"):     
            usb.write(b'door2')
        elif(name == "103"):  
            usb.write(b'door3')
        elif(name == "104"):
            usb.write(b'door4')
        elif(name == "105"):
            usb.write(b'door5')
        elif(name == "106"):
            usb.write(b'door6')
        elif(name == "107"):
            usb.write(b'door7')
        elif(name == "108"):
            usb.write(b'door8')
        else:
            usb.write(b'led_off')    

        '''
        id_val = ["101","102","103","104","105","106","107","108"]
        for i in id_val:
            if(name == i):
                st = (f'door{i}')
                usb.write(bytes(st))
                
        '''
    
    
    otpResult = Signal(str)
    soidResult = Signal(str)
    OTP = ""
    SOID = ""
    

    @Slot(str)
    def soidChecker(self,SOID):
        self.SOID = SOID
        local_data = SOID_Data()
        for i in local_data:
            if (SOID == i):
                self.soidResult.emit("True")
                self.OTP = OTPGen(local_data[i])
                
                 
    @Slot(str)
    def otpChecker(self,user_otp):
        generatedOTP = self.OTP
        if(user_otp == generatedOTP):
            self.otpResult.emit("True")
            command = openLockSOID(self.SOID)
            usb.write(command)
        else: 
            self.otpResult.emit("False")



if __name__ == "__main__":
    os.environ["QT_IM_MODULE"] = "qtvirtualkeyboard"
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)

    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
