import numpy as np
import cv2
import time

def securityCam():
  cap = cv2.VideoCapture(0)
  time.sleep(0.5)
  ret, frame = cap.read()
  
  #gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
  #gray = cv2.resize(gray,(600,600))
    #cv2.imshow('frame',gray)
  cv2.waitKey(0)
  cv2.imwrite('frame.png',frame)
    
    #if(cv2.waitKey(1) & 0xFF == ord('q')):
      
    #  break

  cap.release()
  cv2.destroyAllWindows()



securityCam()

