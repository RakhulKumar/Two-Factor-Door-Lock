

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(23, OUTPUT);
   pinMode(25, OUTPUT);
    pinMode(27, OUTPUT);
     pinMode(29, OUTPUT);
 pinMode(31, OUTPUT);
  pinMode(33, OUTPUT);
   pinMode(35, OUTPUT);
    pinMode(37, OUTPUT);
     pinMode(39, OUTPUT);
      pinMode(41, OUTPUT);
       pinMode(43, OUTPUT);
        pinMode(45, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(23, HIGH);
   digitalWrite(25, HIGH);
    digitalWrite(27, HIGH);
     digitalWrite(29, HIGH);
      digitalWrite(31, HIGH);
       digitalWrite(33, HIGH);
        digitalWrite(35, HIGH);
         digitalWrite(37, HIGH);
          digitalWrite(39, HIGH);
           digitalWrite(41, HIGH);
            digitalWrite(43, HIGH);
             digitalWrite(45, HIGH);// turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(23, LOW); 
    digitalWrite(25, LOW); 
      digitalWrite(27, LOW); 
        digitalWrite(27, LOW); 
          digitalWrite(29, LOW); 
            digitalWrite(31, LOW); 
              digitalWrite(33, LOW); 
                digitalWrite(35, LOW); 
                  digitalWrite(37, LOW); 
                    digitalWrite(39, LOW); 
                      digitalWrite(41, LOW); 
                        digitalWrite(43, LOW); 
                          digitalWrite(45, LOW); // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}
