import cv2

def security_camera(filename):
    camera = cv2.VideoCapture(0)
    ramp_frames=30
    x=1280
    y=720

    # Set Resolution
    camera.set(3, x)
    camera.set(4, y)

    # Adjust camera lighting
    for i in range(ramp_frames):
        temp = camera.read()
    retval, im = camera.read()
    cv2.imwrite(filename,im)
    del(camera)

