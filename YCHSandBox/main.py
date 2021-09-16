from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
import sys
import os
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
            print("Arduino LED turned on.")

        def off():
            usb.write(b'led_off')
            print("Arduino LED turned off.")

        id_val = ["101","102","103"]
        if name in id_val:
            self.setName.emit("Welcome, " + "User 1")
            on()

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)

    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
