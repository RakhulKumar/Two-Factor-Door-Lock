import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from PySide2 import QtGui, QtCore, QtWidgets

import serial



USB_PORT = "/dev/ttyACM0"
usb = serial.Serial(USB_PORT, 9600, timeout=2)

class MainWindow(QObject):
    
    def __init__(self):
        QObject.__init__(self)

    setName = Signal(str)

    @Slot(str)
    def welcomeText(self, name):
        
        def on():
            usb.write(b'led_on')
            
        def off():
            usb.write(b'led_off')
             
        id_val = ["101","102","103","104","105","106","107","108"]
        #if (name in id_val):
        #    self.setName.emit("Welcome User 1")
        #    on()

        for i in id_val:
            if(name == i):
                st = (f'door{i}')
                usb.write(bytes(st))



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
