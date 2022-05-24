/*
  ASCII table

  Prints out byte values in all possible formats:
  - as raw binary values
  - as ASCII-encoded decimal, hex, octal, and binary values

  For more on ASCII, see http://www.asciitable.com and http://en.wikipedia.org/wiki/ASCII

  The circuit: No external hardware needed.

  created 2006
  by Nicholas Zambetti <http://www.zambetti.com>
  modified 9 Apr 2012
  by Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/ASCIITable
*/

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // prints title with ending line break
  Serial.println("ASCII Table ~ Character Map");
}

// first visible ASCIIcharacter '!' is number 33:
int thisByte = 33;
// you can also write ASCII characters in single quotes.
// for example, '!' is the same as 33, so you could also use this:
// int thisByte = '!';

void loop() {
  // prints value unaltered, i.e. the raw binary version of the byte.
  // The Serial Monitor interprets all bytes as ASCII, so 33, the first number,
  // will show up as '!'
  thisByte=33;
  for(int i=thisByte;i<=126;i++){
  Serial.write(thisByte);
  Serial.print(" ");
  if((i-33)%8==0)
  Serial.println(" ");
  thisByte++;
  }
  if(thisByte==127)
  Serial.println(" ");
  thisByte=33;
  delay(100);
  Serial.println("DEC:");
  for(int i=thisByte;i<=126;i++){
  Serial.print(thisByte, DEC);
  Serial.print(" ");
  if((i-32)%8==0)
  Serial.println(" ");
  thisByte++;
  }
  if(thisByte==127)
  Serial.println(" ");
  thisByte=33;
  delay(100);
  Serial.println("HEX:");
  for(int i=thisByte;i<=126;i++){
  Serial.print(thisByte, HEX);
  Serial.print(" ");
  if((i-32)%8==0)
  Serial.println(" ");
  thisByte++;
  }
  if(thisByte==127)
  Serial.println(" ");
  thisByte=33;
  delay(100);
  Serial.println("OCT:");
  for(int i=thisByte;i<=126;i++){
  Serial.print(thisByte, OCT);
  Serial.print(" ");
  if((i-32)%8==0)
  Serial.println(" ");
  thisByte++;
  }
  if(thisByte==127)
  Serial.println(" ");
  thisByte=33;
  delay(100);
  Serial.println("BIN");
  for(int i=thisByte;i<=126;i++){
  Serial.print(thisByte, BIN);
  Serial.print(" ");
  if((i-32)%8==0)
  Serial.println(" ");
  thisByte++;
  }
  }
