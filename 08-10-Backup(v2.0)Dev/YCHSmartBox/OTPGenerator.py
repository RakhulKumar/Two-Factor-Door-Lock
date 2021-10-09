import os
import math
import random
import smtplib


def OTPGen(mailID):
        digits="0123456789"
        OTP=""
        for i in range(6):
            OTP += digits[math.floor(random.random()*10)]
        msg = OTP + " is your OTP to open the YCH locker"
        s = smtplib.SMTP('smtp.gmail.com', 587)
        s.starttls()
        s.login("mitmemez007@gmail.com", "gzraasztszkpuqvf")
        emailid = mailID
        s.sendmail('&&&&&&&&&&&',emailid,msg)
        return(OTP)