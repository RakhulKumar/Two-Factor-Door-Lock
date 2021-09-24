import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal


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
        for i in id_val:
            if(name == i):
                st = (f'door{i}')
                usb.write(bytes(st))
                
        '''    


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



'''
def handleVisibleChanged():
    if not QtGui.QGuiApplication.inputMethod().isVisible():
        return
    for w in QtGui.QGuiApplication.allWindows():
        if w.metaObject().className() == "QtVirtualKeyboard::InputView":
            keyboard = w.findChild(QtCore.QObject, "keyboard")
            if keyboard is not None:
                r = w.geometry()
                r.moveTop(keyboard.property("y"))
                w.setMask(QtGui.QRegion(r))
                return
'''