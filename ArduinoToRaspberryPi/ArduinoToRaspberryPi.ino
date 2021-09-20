void setup() {
   Serial.begin(9600);  // start serial communication at 9600 baud
}
void loop() {
   // Read and execute commands from serial port
   if (Serial.available()) {  // check for incoming serial data
      String command = Serial.readString();  // read command from serial port
      if (command == "led_on") {  // turn on LED
         digitalWrite(LED_BUILTIN, HIGH);
      } else if (command == "led_off") {  // turn off LED
         digitalWrite(LED_BUILTIN, LOW);
      } else if (command == "read_a0") {  // read and send A0 analog value
         Serial.println(analogRead(A0));
      }
   }
}
