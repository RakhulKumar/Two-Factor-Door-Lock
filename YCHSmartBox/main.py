import sys
import os
import datetime

#importing SOID Numbers List
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

    @Slot(str)
    def barcode(self,dummy):
        if(dummy == "Dummy"):
            usb.write(b'barcode')


    DCNumber = ""
    SRL = ""

    @Slot(str)
    def dcNumberChecker(self,dcNumber):
        self.DCNumber = dcNumber
        local_data = DCNumber_Data()
        for i in local_data:
            if(i == self.DCNumber):
                self.SRL = local_data[i]



    @Slot(str)
    def srlLockOpen(self, user_SRL):
        if(self.SRL == user_SRL):
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



    SOID = ""


    @Slot(str)
    def soidChecker(self,SOID):
        self.SOID = SOID
        local_data = SOID_Data()
        for i in local_data:
            if (SOID =="01 253843001"):
                usb.write(b'door1')
                curr_date = str(datetime.datetime.now())
                filename = "Door1 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843002"):
                usb.write(b'door2')
                curr_date = str(datetime.datetime.now())
                filename = "Door2 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843003"):
                usb.write(b'door3')
                curr_date = str(datetime.datetime.now())
                filename = "Door3 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843004"):
                usb.write(b'door4')
                curr_date = str(datetime.datetime.now())
                filename = "Door4 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843005"):
                usb.write(b'door5')
                curr_date = str(datetime.datetime.now())
                filename = "Door5 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843006"):
                usb.write(b'door6')
                curr_date = str(datetime.datetime.now())
                filename = "Door6 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843007"):
                usb.write(b'door7')
                curr_date = str(datetime.datetime.now())
                filename = "Door7 " + curr_date + ".jpg"
                security_camera(filename)

            elif (SOID =="01 253843008"):
                usb.write(b'door8')
                curr_date = str(datetime.datetime.now())
                filename = "Door8 " + curr_date + ".jpg"
                security_camera(filename)



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