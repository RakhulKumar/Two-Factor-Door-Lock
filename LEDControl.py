from tkinter import *
import RPi.GPIO as GPIO
import time


window= Tk()
window.geometry("1000x600")
window.title("LED TEST")
window.configure(bg="white")
text = Text(window)
text.insert(INSERT,"LED Control Using RaspberryPi")


GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(21,GPIO.OUT)


def on():
    GPIO.output(21, True)

def off():
    GPIO.output(21, False)



B1 = Button(window, text="ON", width=20, bg="yellow", fg="black", command=on)
B1.place(x=250,y=100)

B2 = Button(window, text="OFF", width=20, bg="yellow", fg="black", command=off)
B2.place(x=450,y=100)

window.mainloop()
