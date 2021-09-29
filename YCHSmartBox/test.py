'''

OTP = "-1"

class Exampleclass:
    OTP = ""
    def foo(self):
        return("713")

if __name__ == "__main__":
    obj = Exampleclass()
    OTP = obj.foo()
    print(OTP)
'''

dicti = {"101":"5001","102":"5002","103":"5003"}

for i in dicti:
    if(i=="101"):
        print(dicti[i])