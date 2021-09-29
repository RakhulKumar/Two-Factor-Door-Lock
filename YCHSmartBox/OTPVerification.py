import os
import math
import random
import smtplib

user_data = {"1000":"rakhul.kumar007@gmail.com","102":"rakhul.kumar007@icloud.com"}

def OTPGen(lockerID):
    if(lockerID in user_data):
        digits="0123456789"
        OTP=""
        for i in range(6):
            OTP+=digits[math.floor(random.random()*10)]
        msg = OTP + " is your OTP to open the YCH locker"
        s = smtplib.SMTP('smtp.gmail.com', 587)
        s.starttls()
        s.login("mitmemez007@gmail.com", "gzraasztszkpuqvf")
        emailid = user_data[lockerID]
        s.sendmail('&&&&&&&&&&&',emailid,msg)
        return(OTP)
    else:
        return(-1)


def OTPVerify(user_OTP, main_OTP):
        if (user_OTP == main_OTP):
            return(True)
        else:
            return(False)