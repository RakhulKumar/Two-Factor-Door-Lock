import cv2
import os

def security_camera(filename):
    camera = cv2.VideoCapture(0)
    ramp_frames=30
    x=1280
    y=720

    # Set Resolution
    camera.set(3, x)
    camera.set(4, y)

    #Target folder for storing images
    #path = '/home/pi/Downloads/Two-Factor-Door-Lock-master/YCHSmartBox/SecurityCam'
    path = '/home/ubuntu/Downloads/Two-Factor-Security-Door/YCHSmartBox/SecurityCam'


    # Adjust camera lighting
    for i in range(ramp_frames):
        temp = camera.read()
    retval, snap = camera.read()
    cv2.imwrite(os.path.join(path,filename),snap)
    del(camera)