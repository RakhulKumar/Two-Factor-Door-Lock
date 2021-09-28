from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

import serial
import os
import sys

USB_PORT = "/dev/ttyACM0"
usb = serial.Serial(USB_PORT, 9600, timeout=2)

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self) 
    @Slot(str)
    def toArd(self,comd):
        if(comd == "ON"):
            usb.write(b'ON')
        elif(comd == "OFF"):
            usb.write(b'OFF')

if __name__ == "__main__":

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)

    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())