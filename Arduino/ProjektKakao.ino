// BY MARCIN BOCHENEK & MICHAL ZURAWKA
#include <LiquidCrystal_I2C.h>
#include <Timers.h>
#include <Wire.h>

#define zielona A0 //zielona i buzzer
#define czerwona A1
#define zolta A2
#define S1 A3
#define S2 11
#define S3 12
#define S4 13
#define S5 2
#define TRIG 3
#define ECHO 4
#define pompa1 5 
#define pompa2 6
//#define silnikkakao 7
#define grzalka 8
#define blender 9
//#define temperatura 10

LiquidCrystal_I2C lcd(0x20,16,2);
int x=0;
int j=0;
int y=0;
int p=0;
unsigned long nalewanie1=0;
unsigned long nalewanie2=0;
unsigned long grzanie=0;
unsigned long blending=0;
unsigned long przycisk=0;
unsigned long wyswietlanie=0;
void setup() {
      x=0; //zmienna do przechodzenia po krokach
      y=0; //zmienna do rozpoczecia programu
      j=0; //zmienna do resetowania wyświetlacza
      lcd.init(); //Deklaracja typu
      lcd.clear();
      pinMode(zielona,OUTPUT); // zielona
      pinMode(czerwona,OUTPUT); // czerwona
      pinMode(zolta,OUTPUT); // żółta
      pinMode(TRIG,OUTPUT); // TRIG
      pinMode(ECHO,INPUT); // ECHO
      pinMode(S1,INPUT_PULLUP); // S1 - start/zatwierdz
      pinMode(S2,INPUT_PULLUP); // S2 - +1 porcja
      pinMode(S3,INPUT_PULLUP); // S3 - -1 porcja
      pinMode(S4,INPUT_PULLUP); // S4 - reset/ nalanie pozostalej porcji
      pinMode(S5,INPUT_PULLUP); // S5 - reset do ustawien poczatkowych i startu
      pinMode(pompa1,OUTPUT);
      pinMode(pompa2,OUTPUT);
      pinMode(grzalka,OUTPUT);
      pinMode(blender,OUTPUT);
      digitalWrite(pompa1,HIGH);
      digitalWrite(pompa2,HIGH);
      digitalWrite(grzalka,HIGH);
      digitalWrite(blender,HIGH);
}

int pomiar(){ // funkcja do pomiaru odległości{
          long czas, dystans;
          digitalWrite(TRIG,LOW);
          delay(2);
          digitalWrite(TRIG,HIGH);
          delay(10);
          digitalWrite(TRIG,LOW);
          czas=pulseIn(ECHO,HIGH);
          dystans=czas/58;
          return dystans;
}
          //////////////////////////////////////////// RESET ///////////////////////////////////
void reset(int *x,int *y, int *j, int *p){ 
  if(digitalRead(S5)==LOW){
          lcd.clear();
          lcd.setCursor(0, 1);
          lcd.print("Resetowanie");
          delay(3000);
          lcd.clear();
          *x=0;
          *y=0;
          *j=0;
          *p=0;
  }
}
          //////////////////////////////////////////// KROK 1 - Stawianie kubka ///////////////////////////////////
void loop() {
  int *iks =&x;
  int *igrek =&y;
  int *jot=&j;
  int *pe=&p;
  if(x==0){
        digitalWrite(czerwona,HIGH);
        if(y==0){
              lcd.setCursor(0, 0);
              lcd.print("Aby rozpoczac");
              lcd.setCursor(0, 1);
              lcd.print("Nacisnij S1");
              y=1;
        }
        if(j==0 && digitalRead(S1)==LOW){
              lcd.clear();
              lcd.setCursor(0, 0);
              lcd.print("Postaw kubek");
              reset(iks, igrek, jot, pe);
              j=1;
        }
        if(pomiar()<=20 && j==1){
              x=1;
              wyswietlanie=millis();
              lcd.clear();
              j=0;
        }
        reset(iks, igrek, jot, pe);
 }
            //////////////////////////////////////////// KROK 2 - Wybieranie ilości porcji ///////////////////////////////////
 if(x==1){
  if(pomiar()<=20 && x==1){
              lcd.setCursor(0, 0);
              lcd.print("Wybierz ilosc");
              lcd.setCursor(0, 1);
              lcd.print("porcji");
              if((millis()-wyswietlanie)>SECS(3)){
              x=2;
              j=0;
              lcd.clear();
              }
      }
     reset(iks, igrek, jot, pe);
 }
  if(x==1 && pomiar()>20)
 {
               lcd.clear();
               lcd.setCursor(0,0);
               lcd.print("Postaw kubek");
               wyswietlanie=millis();
 }
 
if(pomiar()<=20 && x==2){
               lcd.setCursor(0, 0);
               lcd.print("S2 +1, S3 -1");
               lcd.setCursor(0, 1);
               lcd.print(p);
               lcd.print("  porcji S1->OK");
               if(digitalRead(S2)==LOW){
                    p++;
                    delay(100);
               }
               if(digitalRead(S3)==LOW){
                    p--;
                    delay(100);
               }
               if(digitalRead(S1)==LOW &&  p!=0){
                  x=7;
                  nalewanie1=millis();
                  lcd.clear();
               }
               if(p>2){
                p=2;
               }
               if(p<0){
                p=0;
               }
               reset(iks, igrek, jot, pe);
  }
   else if(x==2){
            if(j==0){
                    lcd.clear();
                    lcd.setCursor(0,0);
                    lcd.print("Postaw kubek");
            }
            wyswietlanie=millis();
            x=1;
            j=0;

  }
/*
            //////////////////////////////////////////// KROK 3 - Sypanie kakao ///////////////////////////////////
            // RESET JEST MOZLIWY DO TEGO MIEJSCA
       if(pomiar()<=20 && x==6){
              lcd.setCursor(0, 0);
              lcd.print("Trwa sypanie");
              lcd.setCursor(0, 1);
              lcd.print("      kakao");
              digitalWrite(czerwona,LOW);
              digitalWrite(zolta,HIGH);
              digitalWrite(silnik,LOW);
               delay(5000);
              digitalWrite(silnik,HIGH);
              lcd.clear();
              x=7;
       }
       */
            //////////////////////////////////////////// KROK 4 - Nalewanie mleka ///////////////////////////////////
        if(pomiar()<=20 && x==7){
              lcd.setCursor(0, 0);
              lcd.print("Trwa nalewanie");
              lcd.setCursor(0, 1);
              lcd.print("      mleka");
              digitalWrite(czerwona,LOW);
              digitalWrite(zolta,HIGH);
              digitalWrite(pompa1,LOW);
              if(millis()-nalewanie1>SECS(10)){
                  digitalWrite(pompa1,HIGH);
              }
              if(digitalRead(pompa1)==HIGH){
                    x=8;
                    lcd.clear();
                    blending=millis();
              }
        }
             //////////////////////////////////////////// KROK 5 - Mieszanie ///////////////////////////////////
        if(pomiar()<=20 && x==8){
              lcd.setCursor(0, 0);
              lcd.print("Trwa mieszanie");
              digitalWrite(blender,LOW);
             if((millis()-blending)>SECS(5)){
                  digitalWrite(blender,HIGH);
              }
             if(digitalRead(blender)==HIGH){
                    x=9;
                    lcd.clear();
                    grzanie=millis();
              }
        }
    /////////////////////////////////////////////////////////// KROK 6 - Grzanie ///////////////////////////////////
        if(pomiar()<=20 && x==9){
              lcd.setCursor(0, 0);
              lcd.print("Trwa grzanie");
              digitalWrite(grzalka,LOW);
              if((millis()-grzanie)>SECS(1)){
                  digitalWrite(grzalka,HIGH);
              }
              if(digitalRead(grzalka)==HIGH){
                    x=10;
                    lcd.clear();
              }
              //////////////////////////////////// TRZEBA DODAĆ CZUJNIK TEMP ////////////////////////////
        }
            //////////////////////////////////////////////////// KROK 7 - Odbior porcji ///////////////////////////////////
        if(pomiar()<=20 && x==10){
          j=0;
          lcd.setCursor(0,0);
          lcd.print("Nacisnij S4 aby");
          lcd.setCursor(0,1);
          lcd.print("odebrac porcje");
          if(digitalRead(S4)==LOW){
          x=11;
          lcd.clear();
          nalewanie2=millis();
          }
         }
            else if(x==10){
            if(j==0){
                    lcd.clear();
                    lcd.setCursor(0,0);
                    lcd.print("Postaw kubek");
            }
            j=1;
         }

        ///////////////////////////////////////////////////// KROK 8 - Nalewanie porcji ///////////////////////////////
        if(pomiar()<=20 && x==11){
         lcd.setCursor(0,0);
         lcd.print("Nalewanie porcji");
         digitalWrite(pompa2,LOW);
         if((millis()-nalewanie2)>SECS(5)){
                  digitalWrite(pompa2,HIGH);
              }
         if(digitalRead(pompa2)==HIGH){
                   x=12;
                   lcd.clear();
            }
        }
        //////////////////////////////////////////// KROK 9 - Prosze odebrac napój ///////////////////////////////////
       if(x==12){
            if(j==0 && pomiar()<=20){
            digitalWrite(zolta,LOW);
            digitalWrite(zielona,HIGH); // buzzer i dioda zielona
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("Kakao gotowe");
            lcd.setCursor(0, 1);
            lcd.print("Odbierz napoj");
            j=1;
            }
              if(pomiar()>20){
                  if(j==1)
                  {
                  lcd.clear();
                  wyswietlanie=millis();
                  j=0;
                  }
                  digitalWrite(zielona,LOW);
                  lcd.setCursor(0, 0);
                  lcd.print("Dziekujemy ;)");
                  lcd.setCursor(0, 1);
                  lcd.print("Smacznego!");
                  if(millis()-wyswietlanie>SECS(3)){
                  p--;
                  if(p>0){
                      digitalWrite(zolta,HIGH);
                      digitalWrite(czerwona,LOW);
                      x=10;
                      j=0;
                      lcd.clear();
                  }
                  if(p<=0){
                    digitalWrite(czerwona,HIGH);
                    digitalWrite(zolta,LOW);
                    x=0;
                    y=0;
                    j=0;
                    lcd.clear();
                    }
                  }
         }
  }
}
