void setup() {
   Serial.begin(9600);  // start serial communication at 9600 baud
   pinMode(23,OUTPUT);  // Door1
   pinMode(25, OUTPUT); // Door2
   pinMode(27, OUTPUT); // Door3
   pinMode(29, OUTPUT); // Door4
   pinMode(31, OUTPUT); // Door5
   pinMode(33, OUTPUT); // Door6
   pinMode(35, OUTPUT); // Door7
   pinMode(37, OUTPUT); // Door8
   pinMode(24, OUTPUT); // Barcode Reader
   
}
void loop() {
   // Read and execute commands from serial port
   if (Serial.available()) {  // check for incoming serial data
      String command = Serial.readString();  // read command from serial port
      if (command == "door1") {  // turn on Door1
         digitalWrite(23, HIGH);
         delay(3000);
         digitalWrite(23, LOW);
      } else if (command == "door2") {  //turn on Door2
         digitalWrite(25, HIGH);
         delay(3000);
         digitalWrite(25, LOW);
      } else if (command == "door3") {  // turn on Door3
         digitalWrite(27, HIGH);
         delay(3000);
         digitalWrite(27, LOW);
      } else if (command == "door4") {  // turn on Door4
         digitalWrite(29, HIGH);
         delay(3000);
         digitalWrite(29, LOW);
      } else if (command == "door5") {  // turn on Door5
         digitalWrite(31, HIGH);
         delay(3000);
         digitalWrite(31, LOW);
      } else if (command == "door6") {  // turn on Door6
         digitalWrite(33, HIGH);
         delay(3000);
         digitalWrite(33, LOW);
      } else if (command == "door7") {  // turn on Door7
         digitalWrite(35, HIGH);
         delay(3000);
         digitalWrite(35, LOW);
      } else if (command == "barcode") {  // turn on Door7
         digitalWrite(24, HIGH);
         delay(3000);
         digitalWrite(24, LOW);
      }else if (command == "door8") {  // turn on Door8
         digitalWrite(37, HIGH);
         delay(3000);
         digitalWrite(37, LOW);
      }
      
       
   }
}
