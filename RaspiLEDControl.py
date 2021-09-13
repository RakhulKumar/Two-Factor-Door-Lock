from PyQt5.QtCore import pyqtSlot
from PyQt5.QtWidgets import QApplication,QDialog
from PyQt5.uic import loadUi
import RPi.GPIO as gpio
 
led=26
 
gpio.setmode(gpio.BCM)
gpio.setwarnings(False)
gpio.setup(led,gpio.OUT)
 
class HMI(QDialog):
    def __init__(self):
        super(HMI, self).__init__()
        loadUi('LEDControl.ui',self)
        
        self.setWindowTitle('HMI System')
        self.btn.clicked.connect(self.on_off)
        
    @pyqtSlot()
    def on_off(self):
        if gpio.input(led):
            gpio.output(led,gpio.LOW)
            self.btn.setText('OFF')
            self.status.setText('LED Status is OFF')
        else:
            gpio.output(led, gpio.HIGH)
            self.btn.setText('ON')
            self.status.setText('LED Status is ON')
 
app=QApplication(sys.argv)
widget=HMI()
widget.show()
sys.exit(app.exec_())