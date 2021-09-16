#include <EEPROM.h>
#include <SoftwareSerial.h>
#include <math.h>
#include "U8glib.h"
#include <Wire.h>
//#include "RTClib.h"

SoftwareSerial printer(10, 11);

U8GLIB_ST7920_128X64 u8g(A2, A1, A0, U8G_PIN_NONE); // SPI Com: SCK = en = A2, MOSI = rw = A1, CS = rs = A0
//RTC_DS3231 rtc;
//int box_address = 0;
boolean stringComplete = false;
boolean taskComplete = false;
char zero = 0;
char barcodelen = 9;
char findbox, finishbox;
char BoxBarMemAddr = 100;
int BoxcondMemAddr = 500;
char box_status, Box_Number, j;
char Total_box = 24;

char DoorIp[] = { 21, 20, 19, 18, 17, 16, 2, 3, 4, 5, 6, 7, A15, A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4 };
char DoorOp[] = {22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45 };


char Digit[10];
String tempstore;
//char readboxstatus[] = {'E','F','E','E','E','E','E','F','F','F','E','E','E','E','F','F','E','F','F','E','F','E','E','E'};
char readboxstatus[] = {'E', 'F', 'E', 'E', 'E', 'E', 'E', 'F', 'F', 'F', 'E', 'E', 'E', 'E', 'F', 'F', 'E', 'F', 'F', 'E', 'F', 'E', 'E', 'E'};

char seqx[] = {0, 13, 106, 119};
char seqy = 0;
char dpx[] = {35, 56, 76};
char dpy[] = {12, 30};
char nowtime[3][2] = {0, 1, 0, 1, 0, 17};
unsigned long randnumber, randnumber1, randnumber2, randnumber3;
int checkInput = 13;  //2;
//int rtcInput = A3;
int resetInput = 8;
int incrInput = 9;
//int checkInput = A6;
char *Time = "00";
//har box_cond[Total_box];


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  delay(100);
  printer.begin(9600);
  delay(100);
  Serial3.begin(9600);
  pinMode(checkInput, INPUT_PULLUP);
  //  if (! rtc.begin()) {
  //    Serial.println("Couldn't find RTC");
  //    while (1);
  //  }
  //
  //  if (rtc.lostPower()) {
  //    Serial.println("RTC lost power, lets set the time!");
  //    // following line sets the RTC to the date & time this sketch was compiled
  //    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
  //    // This line sets the RTC with an explicit date & time, for example to set
  //    // January 21, 2014 at 3am you would call:
  //    //rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
  //  }
  //rtc.adjust(DateTime(2017, 1, 30, 13, 54, 0));
  BoxConfigure();
  output_init();
  Display_init();
  Memory_emptyinit();
  print_init_display();
}

void loop() {
  // put your main code here, to run repeatedly:
  Check_Empty();
  BoxOpen(sensor_scanning());
  box_condition();
  print_box_disp(Box_Number);
  random_numbers();
  door_reset();
}

void Display_init()
{
  if ( u8g.getMode() == U8G_MODE_R3G3B2 )
    u8g.setColorIndex(255); // white
  else if ( u8g.getMode() == U8G_MODE_GRAY2BIT )
    u8g.setColorIndex(3); // max intensity
  else if ( u8g.getMode() == U8G_MODE_BW )
    u8g.setColorIndex(1); // pixel on
}

void print_init_display()
{
  u8g.firstPage();
  do {
    u8g.setFont(u8g_font_ncenB10);
    u8g.drawStr( 22, 14, "WELCOME");
    u8g.drawStr( 54, 30, "TO");
    u8g.drawStr( 15, 46, "MICROLEAF");
    u8g.setFont(u8g_font_timR08);
    u8g.drawStr( 16, 60, "Software Technologies");
  } while ( u8g.nextPage());

  delay(2500);

  u8g.firstPage();
  do {
    u8g.setFont(u8g_font_ncenB10);
    u8g.drawStr( 16, 14, "S2BAGGAGE");
    u8g.drawStr( 32, 34, "LOCKER");
  } while ( u8g.nextPage());
  Serial.println("inital");
}

void print_box_disp(char ybox)
{
  u8g.firstPage();
  do {
    //rtc_screen(ybox);
    read_box();
  } while ( u8g.nextPage());
}

void print_box_number(char Nos)
{
  if (Nos < 10)
  {
    u8g.firstPage();
    do {
      u8g.setFont(u8g_font_ncenB10);
      u8g.drawStr( 16, 14, "S2BAGGAGE");
      u8g.drawStr( 32, 34, "LOCKER");
      u8g.setPrintPos(61, 54);
      //u8g.print(Nos, DEC);//ms
    } while ( u8g.nextPage());
  }
  else if (Nos > 9)
  {
    u8g.firstPage();
    do {
      u8g.setFont(u8g_font_ncenB10);
      u8g.drawStr( 16, 14, "S2BAGGAGE");
      u8g.drawStr( 32, 34, "LOCKER");
      //u8g.setPrintPos(39, 56);
      //u8g.setFont(u8g_font_fub49n);
      u8g.print(Nos, DEC);
    } while ( u8g.nextPage());
  }
}

void BoxOpen(char box)
{
  char y;
  if (taskComplete == true)
  {
    if (box > 0) {
      //if (digitalRead(DoorIp[box - 1]) == HIGH)
      {
        Serial.print(box, DEC + 1);
        Serial.println(" :Box Number");
        digitalWrite(DoorOp[box - 1], HIGH);
        delay(500);
        digitalWrite(DoorOp[box - 1], LOW);
        for (y = 0; y < barcodelen; y++)
        {
          EEPROM.write(BoxBarMemAddr + ((box - 1) * 10) + y, '0');
          delay(25);
        }
        EEPROM.write(box - 1, 'E');
        //      taskComplete = false;
      }
    }
    taskComplete = false;
  }
}

void Memory_emptyinit()
{
  char x;
  for (x = 0; x < EEPROM.length(); x++)
  {
    EEPROM.write(x, 'E');
    delay(20);
  }
}

void Check_Empty()
{
  if (digitalRead(checkInput) == LOW)
  {
    delay(200);
    while (digitalRead(checkInput) == LOW);
    Box_Number = box_check();
    Serial.println(Box_Number + 1, DEC); //
    //print_box_number(Box_Number+1);
        if(Box_Number >= Total_box)
        {
          u8g.firstPage();
        do {
          u8g.setFont(u8g_font_timR10);
          u8g.drawStr( 28, 30, "BOX FULL");
          } while ( u8g.nextPage());
          delay(2000);
        return;
        }
    //    else
    //    {
    string_2_byte(print_random_no());
    //      digitalWrite((Box_Number+30),HIGH);
    Serial.print(Box_Number + 1, DEC);
    Serial.println(" : box open");
    EEPROM.write(Box_Number, 'O');
    digitalWrite(DoorOp[Box_Number], HIGH);
    delay(500);
    digitalWrite(DoorOp[Box_Number], LOW);
    //EEPROM.write(Box_Number, 'O');
    //    }
    //    print_random_no();
    //    Box_Number = 0;
    //    while(digitalRead((Box_Number+4)) == LOW); // High or Low

    //      while(digitalRead(DoorIp[Box_Number]) == LOW); // High or Low
    box_condition();
  }

}

void box_condition()
{
  char ibox;
  for (ibox = 0; ibox < Total_box; ibox++) {
    if (digitalRead(DoorIp[ibox]) == HIGH && EEPROM.read(ibox) == 'O') {
      EEPROM.write(ibox, 'C');
      Serial.print(ibox + 1, DEC);
      Serial.println(" :box closing");
      delay(20);
      break;
      //      EEPROM.write(BoxcondMemAddr+ibox, 'C');
    }
  }
  for (ibox = 0; ibox < Total_box; ibox++) {
    if (digitalRead(DoorIp[ibox]) == LOW && EEPROM.read(ibox) == 'C') {
      EEPROM.write(ibox, 'F');
      Serial.print(ibox + 1, DEC);
      Serial.println(" :box closed");
      delay(20);
      break;
      //      EEPROM.write(BoxcondMemAddr+ibox, 'C');
    }
  }
}

char box_check()
{
  char box_address;
  for (box_address = 0; box_address < Total_box; box_address++)
  {
    box_status = EEPROM.read(box_address);
    if (box_status == 'E')
      break;
  }
  return (box_address);
}

void random_numbers()
{
  randnumber1 = random(100, 1000);
  randnumber2 = random(100, 1000);
  randnumber3 = random(100, 1000);
  delay(25);
}


unsigned long print_random_no()
{
  //  randnumber1 = random(100,1000);
  //  randnumber2 = random(100,1000);
  //  randnumber3 = random(100,1000);
  randnumber1 = randnumber1 * 1000000;
  randnumber2 = randnumber2 * 1000;
  randnumber = randnumber1 + randnumber2 + randnumber3;
  Serial.println(randnumber);
  return (randnumber);
}
/*
  void Decimal2Ascii(unsigned int Time,unsigned char yes)
  {
  if(yes == 1){
  Digit[0] = (Time / 100) + 0X30 ;
  Time = (Time % 100);
  Digit[1] = (Time / 10) + 0X30;
  Digit[2] = '.';
  Digit[3] = (Time % 10)+ 0X30;}
  else{
  Digit[0] = (Time / 100) + 0X30 ;
  Time = (Time % 100);
  Digit[1] = (Time / 10) + 0X30;
  Digit[2] = (Time % 10)+ 0X30;
  Digit[3] = '%';
  }
  }
*/

void string_2_byte(unsigned long Num)
{
  int i;
  Digit[0] = (Num / 100000000) + 0X30 ;
  Num = (Num % 100000000);
  Digit[1] = (Num / 10000000) + 0X30;
  Num = (Num % 10000000);
  Digit[2] = (Num / 1000000) + 0X30 ;
  Num = (Num % 1000000);
  Digit[3] = (Num / 100000) + 0X30;
  Num = (Num % 100000);
  Digit[4] = (Num / 10000) + 0X30 ;
  Num = (Num % 10000);
  Digit[5] = (Num / 1000) + 0X30;
  Num = (Num % 1000);
  Digit[6] = (Num / 100) + 0X30;
  Num = (Num % 100);
  Digit[7] = (Num / 10) + 0X30;
  Digit[8] = (Num % 10) + 0X30;
  Serial.println("printer setup");
  printer1_setup();
  Serial.println("store memory");
  for (i = 0; i < barcodelen; i++)
  {
    EEPROM.write(BoxBarMemAddr + (Box_Number * 10) + i, Digit[i]);
    delay(25);
  }
}

char sensor_scanning()
{
  char m = 0, n = 0;
  findbox = 0;
  if (stringComplete == true)
  {
    while (1)
    {
      if (tempstore[m] == EEPROM.read(BoxBarMemAddr + (findbox * 10) + m))
      {
        m++;
        //        Serial.print(m,DEC);
        //        Serial.println(" m");
        if (m >= 9)
        {
          taskComplete = true;
          finishbox = findbox + 1;
          //          Serial.print(finishbox,DEC);
          //          Serial.println(" true");
          //          n = 0;
          break;
        }
      }
      else
      {
        m = 0;
        //n++;
        //n = 0;
        findbox++;
        taskComplete = false;
        //        Serial.print(findbox,DEC);
        //        Serial.println(" false2");
      }
      /* old concept*/
      //      n++;
      //      if(n >= 9 && m == 0)
      //        {
      //          //taskComplete = false;
      //          Serial.print(n,DEC);
      //          Serial.println(" false1");
      //          n = 0;
      //          break;
      //        }
      n++;
      if (Total_box < findbox)
      {
        //taskComplete = false;
        //          Serial.print(n,DEC);
        //          Serial.println(" false1");
        n = 0;
        break;
      }

    }
    stringComplete = false;
  }
  return (finishbox);
}

void printer1_setup()
{
  // Initialize printer
  printer.write(27);
  printer.write(64);

  //Default Line Spacing
  printer.write(27);
  printer.write(51);
  printer.write(40);
  //Centered
  printer.write(27);
  printer.write(97);
  printer.write(1);
  delay(5);
  // Send date
  //printer.print(nowtime);
  //printer.print(".");
  //printer.print(Time);
  //printer.print(".");
  //printer.print(Time);
  // printer.print(" -- ");
  //delay(5);
  // Send time
  //printer.println(Time);

  //Double Height -ON
  printer.write(27);
  printer.write(33);
  printer.write(16);
  //Double width -ON
  printer.write(27);
  printer.write(33);
  printer.write(32);
  //
  printer.print("Locker 'A'");
  printer.print("Lock Num :");
  printer.println(Box_Number + 1, DEC);
  // printer.write(10);
  //Double Height/width -Off
  printer.write(27);
  printer.write(33);
  printer.write(zero);
  //Bar Code Height
  printer.write(29);
  printer.write(104);
  printer.write(100);
  //Bar Code weidth
  printer.write(29);
  printer.write(119);
  printer.write(3);
  //Feed Paper
  printer.write(27);
  printer.write(74);
  printer.write(5);
  //center
  printer.write(27);
  printer.write(97);
  printer.write(1);
  //
  //Barcode
  printer.write(29); //GS
  printer.write(107); //k
  printer.write(zero); //m = 0
  for (int z = 0; z < barcodelen; z++)
  {
    printer.write(Digit[z]);
  }
  //     printer.write(Digit[2]);
  printer.write(Digit[5]);
  printer.write(Digit[8]);
  printer.write(zero); // bar code terminator
  delay(500);
  //Feed Paper
  printer.write(27);
  printer.write(74);
  printer.write(10);
  printer.println("Thank You..Visit Again !!");
  printer.write(10);
  printer.write(10);
  //Cut Paper
  printer.write(27);
  printer.write(109);
  printer.write(10);
}

void read_box()
{
  u8g.setFont(u8g_font_timR10);
  u8g.drawStr( 28, 30, "WELCOME");
  u8g.setFontPosTop();
  char i, j = 0, tempcheck = 8, boxes;
  seqy = 0;
  for (i = 0; i < Total_box; i++)
  {
    if (i == tempcheck)
    {
      tempcheck += 8;
      if (i < (Total_box - 1))
        j++;
      seqy = 0;
    }
    boxes = EEPROM.read(i);
    if (boxes == 'F')
      u8g.drawBox(seqx[j], seqy, 9, 6); // For Empty Box identification 2nd Column
    else if (boxes == 'E' || boxes == 'O' || boxes == 'C')
      u8g.drawRFrame(seqx[j], seqy, 9, 6, 0); // For Empty Box identification 2nd Column
    //delay(200);
    seqy += 8;
  }
}

//void rtc_screen(char zbox)
//{
//  u8g.setFont(u8g_font_ncenB10);
//  u8g.setFontPosTop();
//  DateTime now = rtc.now();
//  str_2_byte(now.day());
//  u8g.drawStr(35, 30, Time);
//  u8g.drawStr(51, 30, ".");
//  //Serial.println(Time);
//  str_2_byte(now.month());
//  u8g.drawStr(56, 30, Time);
//  str_2_byte(now.year()-2000);
//  u8g.drawStr(72, 30, ".");
//   //Serial.println(Time);
//  u8g.drawStr(76, 30, Time);
//  if(now.hour() == 0)
//  {
//    str_2_byte(now.hour()+12);
//    u8g.drawStr(35, 12, Time);
//    u8g.setFont(u8g_font_ncenB08);
//    u8g.setFontPosTop();
//    u8g.drawStr(73, 12, "AM");
//  }
//  else if(now.hour() < 13)
//  {
//    str_2_byte(now.hour());
//    u8g.drawStr(35, 12, Time);
//    u8g.setFont(u8g_font_ncenB08);
//    u8g.setFontPosTop();
//    u8g.drawStr(73, 12, "AM");
//  }
//  else if(now.hour() > 12)
//  {
//    str_2_byte(now.hour()-12);
//    u8g.drawStr(35, 12, Time);
//    u8g.setFont(u8g_font_ncenB08);
//    u8g.setFontPosTop();
//    u8g.drawStr(73, 12, "PM");
//  }
//  u8g.setFont(u8g_font_ncenB10);
//  u8g.setFontPosTop();
////  u8g.drawStr(35, 12, Time);
//  u8g.drawStr(50, 12, ":");
//   //Serial.println(Time);
//  str_2_byte(now.minute());
//  u8g.drawStr(55, 12, Time);
//  //str_2_byte(now.second());
//  //u8g.drawStr(71, 12, ":");
//   //Serial.println(Time);
////  if(now.hour() < 13)
////  {
////    u8g.drawStr(76, 12, "AM");
////  }
////  else if(now.hour() > 12)
////  {
////    u8g.drawStr(76, 12, "PM");
////  }
//
//   //Serial.println(Time);
//  u8g.setFont(u8g_font_ncenB08);
//  u8g.setFontPosTop();
//  //u8g.drawStr(28, 48, "S");
//  //u8g.drawStr(35, 53, "2");
//  //u8g.drawStr(42, 48, "BAGGAGE");
//  //u8g.setFont(u8g_font_fub30);
//  str_2_byte(zbox);
//  //u8g.drawStr(59, 54, Time);
//  //Serial.println("find RTC");
//}

//void rtc_data(char dat,char dx,char dy)
//{
//     char px,py;
//     //u8g.drawStr(50, 30, ".");
//     for(px=0;px<3;px++)
//     {
//      for(py=0;py<2;py++)
//      {
//        if(px == 2 & py == 0){
//          if(dx == 2 & dy == 0)
//            nowtime[2][0] = dat;
//          if(((nowtime[2][0])%2) == 0)
//          {
//            u8g.drawStr(dpx[2], dpy[0], "AM");
//          }
//          else if(((nowtime[2][0])%2) == 1)
//          {
//            u8g.drawStr(dpx[2], dpy[0], "PM");
//          }
//          else{
//            u8g.drawStr(dpx[2], dpy[0], "AM");
//          }
//        }
//        else if(dx == px & dy == py){
//          nowtime[dx][dy] = dat;
//          str_2_byte(nowtime[dx][dy]);
//          u8g.drawStr(dpx[dx], dpy[dy], Time);
//        }
//        else{
//          str_2_byte(nowtime[px][py]);
//          u8g.drawStr(dpx[px], dpy[py], Time);
//        }
//      }
//     }
//        u8g.drawStr(dpx[0]+16, 12, ":");
//   for(px=0;px<2;px++)
//        u8g.drawStr(dpx[px]+16, 30, ".");
//}

//void rtc_Menu(void)
//{
//  char ix=0,iy=0,idata=0;
//  while(digitalRead(rtcInput) == LOW);//enter
//  while(1)
//  {
//Jmp2:if(digitalRead(rtcInput) == LOW)//enter
//      {
//       while(digitalRead(rtcInput) == LOW);//enter
//       delay(100);
//              idata = 0;
//              ix++;
//              if(ix >= 3){
//                ix = 0;
//                iy++;
//              }
//              if(iy == 2){
//                iy = 0;
//                break;
//              }
//      }
//   Jmp1:if(digitalRead(incrInput) == LOW)//up
//          {
//             idata++;
//             while(digitalRead(incrInput) == LOW);
//          }
//        if(digitalRead(resetInput) == LOW)//enter
//          {
//              while(digitalRead(resetInput) == LOW);//enter
//              break;
//          }
//      if(digitalRead(rtcInput) == LOW)//enter
//        goto Jmp2;
//        else{
//            u8g.firstPage();
//            do {
//            u8g.setFont(u8g_font_ncenB10);
//            u8g.setFontPosTop();
//            rtc_data(idata,ix,iy);
//            } while( u8g.nextPage());
//          goto Jmp1;
//        }
//  }
//  char hours = nowtime[2][0];
//  if((hours%2) == 1)
//  rtc.adjust(DateTime(2000+nowtime[2][1], nowtime[1][1], nowtime[0][1], nowtime[0][0]+12, nowtime[1][0], 0));
//  else if((hours%2) == 0)
//  rtc.adjust(DateTime(2000+nowtime[2][1], nowtime[1][1], nowtime[0][1], nowtime[0][0], nowtime[1][0], 0));
//}

void reopen_data(char dat)
{
  str_2_byte(dat);
  u8g.drawStr(17, dpy[1], "DOOR OPEN");
  u8g.drawStr(dpx[1], dpy[0], Time);
}

void door_reopen(char xbox)
{
  //if (digitalRead(DoorIp[xbox]) == LOW)
  {
    Serial.println(xbox, DEC);
    digitalWrite(DoorOp[xbox], HIGH);
    delay(500);
    digitalWrite(DoorOp[xbox], LOW);
    delay(20);
    EEPROM.write(xbox, 'E');
    delay(20);
  }
}

void door_reset()
{
  char ix = 0, iy = 0, idata = 0;
  if (digitalRead(resetInput) == LOW)
  {
    delay(100);
    while (digitalRead(resetInput) == LOW); //enter
    while (1)
    {
Jmp12: if (digitalRead(resetInput) == LOW && idata > 0) //enter
      {
        while (digitalRead(resetInput) == LOW); //enter
        delay(100);
        ix++;
        Serial.println(idata, DEC);
        if (ix >= 1) {
          Serial.println(idata, DEC);
          door_reopen(idata-1);
          idata = 0;
          break;
        }
      }
Jmp11: if (digitalRead(incrInput) == LOW) //up
      {
        idata++;
        Serial.println(idata, DEC);
        if (idata > Total_box)
          idata = 0;
        while (digitalRead(incrInput) == LOW);
      }
      //         if(digitalRead(rtcInput) == LOW)//enter
      //          {
      //              while(digitalRead(rtcInput) == LOW);//enter
      //              break;
      //          }
      if (digitalRead(resetInput) == LOW) //enter
        goto Jmp12;
      else {
        u8g.firstPage();
        do {
          u8g.setFont(u8g_font_ncenB10);
          u8g.setFontPosTop();
          reopen_data(idata);
        } while ( u8g.nextPage());
        goto Jmp11;
      }
    }
  }
}

void str_2_byte(char Num1)
{
  Time[0] = (Num1 / 10) + 0X30;
  Time[1] = (Num1 % 10) + 0X30;
}

void BoxConfigure()
{
  pinMode(DoorOp[0], OUTPUT);
  pinMode(DoorOp[1], OUTPUT);
  pinMode(DoorOp[2], OUTPUT);
  pinMode(DoorOp[3], OUTPUT);
  pinMode(DoorOp[4], OUTPUT);
  pinMode(DoorOp[5], OUTPUT);
  pinMode(DoorOp[6], OUTPUT);
  pinMode(DoorOp[7], OUTPUT);
  pinMode(DoorOp[8], OUTPUT);
  pinMode(DoorOp[9], OUTPUT);
  pinMode(DoorOp[10], OUTPUT);
  pinMode(DoorOp[11], OUTPUT);
  pinMode(DoorOp[12], OUTPUT);
  pinMode(DoorOp[13], OUTPUT);
  pinMode(DoorOp[14], OUTPUT);
  pinMode(DoorOp[15], OUTPUT);
  pinMode(DoorOp[16], OUTPUT);
  pinMode(DoorOp[17], OUTPUT);
  pinMode(DoorOp[18], OUTPUT);
  pinMode(DoorOp[19], OUTPUT);
  pinMode(DoorOp[20], OUTPUT);
  pinMode(DoorOp[21], OUTPUT);
  pinMode(DoorOp[22], OUTPUT);
  pinMode(DoorOp[23], OUTPUT);

  pinMode(DoorIp[0], INPUT_PULLUP);
  pinMode(DoorIp[1], INPUT_PULLUP);
  pinMode(DoorIp[2], INPUT_PULLUP);
  pinMode(DoorIp[3], INPUT_PULLUP);
  pinMode(DoorIp[4], INPUT_PULLUP);
  pinMode(DoorIp[5], INPUT_PULLUP);
  pinMode(DoorIp[6], INPUT_PULLUP);
  pinMode(DoorIp[7], INPUT_PULLUP);
  pinMode(DoorIp[8], INPUT_PULLUP);
  pinMode(DoorIp[9], INPUT_PULLUP);
  pinMode(DoorIp[10], INPUT_PULLUP);
  pinMode(DoorIp[11], INPUT_PULLUP);
  pinMode(DoorIp[12], INPUT_PULLUP);
  pinMode(DoorIp[13], INPUT_PULLUP);
  pinMode(DoorIp[14], INPUT_PULLUP);
  pinMode(DoorIp[15], INPUT_PULLUP);
  pinMode(DoorIp[16], INPUT_PULLUP);
  pinMode(DoorIp[17], INPUT_PULLUP);
  pinMode(DoorIp[18], INPUT_PULLUP);
  pinMode(DoorIp[19], INPUT_PULLUP);
  pinMode(DoorIp[20], INPUT_PULLUP);
  pinMode(DoorIp[21], INPUT_PULLUP);
  pinMode(DoorIp[22], INPUT_PULLUP);
  pinMode(DoorIp[23], INPUT_PULLUP);
  //pinMode(rtcInput  ,INPUT_PULLUP);
  pinMode(resetInput, INPUT_PULLUP);
  pinMode(incrInput, INPUT_PULLUP);
}

void output_init()
{
  digitalWrite(DoorOp[0], LOW);
  digitalWrite(DoorOp[1], LOW);
  digitalWrite(DoorOp[2], LOW);
  digitalWrite(DoorOp[3], LOW);
  digitalWrite(DoorOp[4], LOW);
  digitalWrite(DoorOp[5], LOW);
  digitalWrite(DoorOp[6], LOW);
  digitalWrite(DoorOp[7], LOW);
  digitalWrite(DoorOp[8], LOW);
  digitalWrite(DoorOp[9], LOW);
  digitalWrite(DoorOp[10], LOW);
  digitalWrite(DoorOp[11], LOW);
  digitalWrite(DoorOp[12], LOW);
  digitalWrite(DoorOp[13], LOW);
  digitalWrite(DoorOp[14], LOW);
  digitalWrite(DoorOp[15], LOW);
  digitalWrite(DoorOp[16], LOW);
  digitalWrite(DoorOp[17], LOW);
  digitalWrite(DoorOp[18], LOW);
  digitalWrite(DoorOp[19], LOW);
  digitalWrite(DoorOp[20], LOW);
  digitalWrite(DoorOp[21], LOW);
  digitalWrite(DoorOp[22], LOW);
  digitalWrite(DoorOp[23], LOW);
}

void serialEvent3() {
  while (Serial3.available()) {
    // get the new byte:
    String inChar = Serial3.readString();
    //Serial.println(inChar);
    // add it to the inputString:
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    //if (inChar == '\r' ){//|| inChar == '\r') {
      stringComplete = true;
      //j = 0;
//    }
//    else
//    {
      tempstore = inChar;
           Serial.print(tempstore);
      //j++;
    //}
  }
  Serial.println();
}
