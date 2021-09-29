void setup() {
  Serial.begin(9600);
  pinMode(24,OUTPUT);

}

void loop() {
  if (Serial.available()) {  // check for incoming serial data
      String command = Serial.readString();  // read command from serial port
      if (command == "ON") {  // 
         digitalWrite(24, HIGH);
         
      } 
      else if(command == "OFF"){
        digitalWrite(24,LOW);
  }
}

}
