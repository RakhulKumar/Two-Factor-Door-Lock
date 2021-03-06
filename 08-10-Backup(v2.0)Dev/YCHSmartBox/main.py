import sys
import os
import datetime

#Importing OTP Verification script
from OTPGenerator import OTPGen
from SOID_Data import SOID_Data

#Importing SecurityCamera
from SecurityCamera import security_camera

#Importing DCNumbers List
from DCNumber_Data import DCNumber_Data

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

    dcNumberResult = Signal(str)
    DCNumber = ""
    SRL = ""
    srlResult = Signal(str)

    @Slot(str)
    def dcNumberChecker(self,dcNumber):
        self.DCNumber = dcNumber
        local_data = DCNumber_Data()
        for i in local_data:
            if(i == self.DCNumber):
                self.SRL = local_data[i]
                self.dcNumberResult.emit("True")
            else:
                self.dcNumberResult.emit("False")


    @Slot(str)
    def srlLockOpen(self, user_SRL):
        if(self.SRL == user_SRL):
            self.srlResult.emit("True")
            if(user_SRL == "101"):   
                usb.write(b'door1')
                curr_date = str(datetime.datetime.now())
                filename = "Door1 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "102"):     
                usb.write(b'door2')
                curr_date = str(datetime.datetime.now())
                filename = "Door2 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "103"):  
                usb.write(b'door3')
                curr_date = str(datetime.datetime.now())
                filename = "Door3 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "104"):
                usb.write(b'door4')
                curr_date = str(datetime.datetime.now())
                filename = "Door4 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "105"):
                usb.write(b'door5')
                curr_date = str(datetime.datetime.now())
                filename = "Door5 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "106"):
                usb.write(b'door6')
                curr_date = str(datetime.datetime.now())
                filename = "Door6 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "107"):
                usb.write(b'door7')
                curr_date = str(datetime.datetime.now())
                filename = "Door7 " + curr_date + ".jpg"
                security_camera(filename)
            elif(user_SRL == "108"):
                usb.write(b'door8')
                curr_date = str(datetime.datetime.now())
                filename = "Door8 " + curr_date + ".jpg"
                security_camera(filename)  

    
    
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
            if(self.SOID == "1001"):
                usb.write(b'door1')
                curr_date = str(datetime.datetime.now())
                filename = "Door1 " + curr_date + ".jpg"
                security_camera(filename)
            elif(self.SOID == "1002"):
                usb.write(b'door2')
                curr_date = str(datetime.datetime.now())
                filename = "Door2 " + curr_date + ".jpg"
                security_camera(filename)  
            elif(self.SOID == "1003"):
                usb.write(b'door3')
                curr_date = str(datetime.datetime.now())
                filename = "Door3 " + curr_date + ".jpg"
                security_camera(filename)
            elif(self.SOID == "1004"):
                usb.write(b'door4')
                curr_date = str(datetime.datetime.now())
                filename = "Door4 " + curr_date + ".jpg"
                security_camera(filename)
            elif(self.SOID == "1005"):
                usb.write(b'door5')
                curr_date = str(datetime.datetime.now())
                filename = "Door5 " + curr_date + ".jpg"
                security_camera(filename)
            elif(self.SOID == "1006"):
                usb.write(b'door6')
                curr_date = str(datetime.datetime.now())
                filename = "Door6 " + curr_date + ".jpg"
                security_camera(filename)
            elif(self.SOID == "1007"):
                usb.write(b'door7')
                curr_date = str(datetime.datetime.now())
                filename = "Door7 " + curr_date + ".jpg"
                security_camera(filename)
            elif(self.SOID == "1008"):
                usb.write(b'door8')
                curr_date = str(datetime.datetime.now())
                filename = "Door8 " + curr_date + ".jpg"
                security_camera(filename)     
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
