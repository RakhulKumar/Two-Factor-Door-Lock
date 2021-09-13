from tkinter import *
import RPi.GPIO as GPIO
import time


window= Tk()
window.geometry("1000x600")
window.title("LED TEST")

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(21,GPIO.OUT)


def on():
    GPIO.output(21, True)

def off():
    GPIO.output(21, False)



B1 = Button(window, text="ON", width=20, bg="yellow", fg="black", command=on)
B1.place(x=150,y=50)

B2 = Button(window, text="OFF", width=20, bg="yellow", fg="black", command=off)
B2.place(x=350,y=50)

window.mainloop()
