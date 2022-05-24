#include <SPI.h>
#include <Ethernet.h>
#include <FastLED.h>
FASTLED_USING_NAMESPACE
#define LED_PIN     9
#define COLOR_ORDER GRB
#define CHIPSET     WS2811
#define NUM_LEDS  50 //300
#define FRAMES_PER_SECOND 60
#define MAX_POWER_MILLIAMPS 500
bool gReverseDirection = false;
CRGB leds[NUM_LEDS];
CRGBPalette16 gPal;
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };                     
byte ip[] = { 192, 168, 0, 10 };     //ip arduino                                   
byte gateway[] = { 192, 168, 0, 1 };   // ip kompa                     
byte subnet[] = {255, 255, 255, 0};                             
EthernetServer server(80);                                              
int rl1_pin = 2; //wlaczanie
int rl2_pin = 9; //Sterowanie
int rl1_state = 0;// status wlaczania 
int rl2_state = 0;
int rl3_state = 0;
int rl4_state = 0;
int rl5_state = 0;
int rl0_state = 1;
String rl1_text = "OFF";
String rl2_text = "OFF";
String rl3_text = "OFF";
String rl4_text = "OFF";
String rl5_text = "OFF";
String readString;

void setup() {
  pinMode(rl1_pin, OUTPUT);
  digitalWrite(rl1_pin, HIGH);
  pinMode(rl2_pin, OUTPUT);
  Ethernet.begin(mac, ip, gateway);
  server.begin();
}
void loop() {
  EthernetClient client = server.available();
  if (client) {
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        if (readString.length() < 100) {
          readString += c;
        }
        if (c == 0x0D) {
          read_request();
          client.println("HTTP/1.1 200 OK"); //send new page
          client.println("Content-Type: text/html");
          client.println();
          client.println("<html>");
          client.println("<head>");
          client.println("<TITLE>LedyMichala</TITLE>");
          client.println("</head>");
          client.println("<body>");
          client.println("<h1>Sterowanko</h1>");
          client.println("<hr>");
          client.println("<br>");
          client.println("<table border='2'>");
          client.println("<tr>");
          client.println("<th>Przekaznik</th>");
          client.println("<th>");
          client.println(rl1_text);
          client.println("</th>");
          client.println("<th>");
           if (rl1_state == 1) {
            client.println("<a href=\"/?RL1OFF\"\">TURN OFF</a>");
          } else {
            client.println("<a href=\"/?RL1ON\"\">TURN ON</a>");
          }
          client.println("</th>");
          client.println("</th>");
          client.println("<tr>");
          client.println("<tr>");
          client.println("<th>Fire</th>");
          client.println("<th>");
          client.println(rl2_text);
          client.println("</th>");
          client.println("<th>");
          if (rl2_state == 1) {
            client.println("<a href=\"/?RL2OFF\"\">TURN OFF</a>");
          } else {
            client.println("<a href=\"/?RL2ON\"\">TURN ON</a>");
          }
          client.println("</th>");
          client.println("<tr>");
          client.println("<th>ColorTemp</th>");
          client.println("<th>");
          client.println(rl3_text);
          client.println("</th>");
          client.println("<th>");
           if (rl3_state == 1) {
            client.println("<a href=\"/?RL3OFF\"\">TURN OFF</a>");
          } else {
            client.println("<a href=\"/?RL3ON\"\">TURN ON</a>");
          }
          client.println("</th>");
          client.println("</th>");
          client.println("<tr>");
          client.println("<tr>");
          client.println("<th>Pride</th>");
          client.println("<th>");
          client.println(rl4_text);
          client.println("</th>");
          client.println("<th>");
          if (rl4_state == 1) {
            client.println("<a href=\"/?RL4OFF\"\">TURN OFF</a>");
          } else {
            client.println("<a href=\"/?RL4ON\"\">TURN ON</a>");
          }
          client.println("<tr>");
          client.println("<th>Pacifika</th>");
          client.println("<th>");
          client.println(rl5_text);
          client.println("</th>");
          client.println("<th>");
         
          if (rl5_state == 1) {
            client.println("<a href=\"/?RL5OFF\"\">TURN OFF</a>");
          } else {
            client.println("<a href=\"/?RL5ON\"\">TURN ON</a>");
          }
          client.println("</th>");
          client.println("<tr>");
          client.println("</th>");
          client.println("</th>");
          client.println("<tr>");
          client.println("<tr>");
          client.println("<th>Bialy</th>");
          client.println("<th>");
          client.println(rl0_state);
          client.println("</th>");
          client.println("<tr>");;
          client.println("</table>");
          client.println("</body>");
          client.println("</html>");
          delay(10);
          client.stop();
        }
      }
    }
  }
  
  if(rl2_state==1){//fire
    int BRIGHTNESS = 200;
    FastLED.addLeds<CHIPSET, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
    FastLED.setBrightness( BRIGHTNESS );
    gPal = HeatColors_p;  
    random16_add_entropy( random());
    Fire2012WithPalette(); // run simulation frame, using palette colors
    FastLED.show(); // display this frame
    FastLED.delay(1000 / FRAMES_PER_SECOND);
  }
    
  if(rl3_state==1){//color temp  
    int BRIGHTNESS = 128; 
    #define TEMPERATURE_1 Tungsten100W
    #define TEMPERATURE_2 OvercastSky
    #define DISPLAYTIME 20
    #define BLACKTIME   3
    static uint8_t starthue = 0;
    fill_rainbow( leds + 5, NUM_LEDS - 5, --starthue, 20);
    uint8_t secs = (millis() / 1000) % (DISPLAYTIME * 2);
    if( secs < DISPLAYTIME) {
    FastLED.setTemperature( TEMPERATURE_1 ); // first temperature
    leds[0] = TEMPERATURE_1; // show indicator pixel
  } else {
    FastLED.setTemperature( TEMPERATURE_2 ); // second temperature
    leds[0] = TEMPERATURE_2; // show indicator pixel
  }
   if( (secs % DISPLAYTIME) < BLACKTIME) {
    memset8( leds, 0, NUM_LEDS * sizeof(CRGB));
  }
    FastLED.addLeds<CHIPSET, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS).setCorrection( TypicalSMD5050 );
    FastLED.setBrightness( BRIGHTNESS );
    FastLED.show();
  }
  
  if(rl4_state==1){//pride
    int BRIGHTNESS = 255;
    FastLED.addLeds<CHIPSET,LED_PIN,COLOR_ORDER>(leds, NUM_LEDS)
    .setCorrection(TypicalLEDStrip)
    .setDither(BRIGHTNESS < 255);
    FastLED.setBrightness(BRIGHTNESS);
    pride();
    FastLED.show();  
  }
  
  if(rl5_state==1){//pacifika
    FastLED.addLeds<CHIPSET,LED_PIN,COLOR_ORDER>(leds, NUM_LEDS)
    .setCorrection( TypicalLEDStrip );
    FastLED.setMaxPowerInVoltsAndMilliamps( 5, MAX_POWER_MILLIAMPS);
    EVERY_N_MILLISECONDS( 20) {
    pacifica_loop();
    FastLED.show();
  }
  }

   if(rl0_state==1){ //bialy
      int i=0;
      int BRIGHTNESS = random(50,150); 
      FastLED.setBrightness( BRIGHTNESS );
      FastLED.addLeds<CHIPSET, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS).setCorrection( TypicalLEDStrip );
      for(i=0;i<=NUM_LEDS;i++){
      leds[i] = CRGB::White;
      FastLED.show();
    }
    FastLED.show();
    }
    
}

void read_request() {
  if (readString.indexOf("?RL1ON") > -1)
  {
    rl1_state = 1;
    rl1_text = "ON";
    digitalWrite(rl1_pin, LOW);

  }
  else {
    if (readString.indexOf("?RL1OFF") > -1)
    {
      rl1_state = 0;
      rl1_text = "OFF";
      digitalWrite(rl1_pin, HIGH);
    }
  }
  if (readString.indexOf("?RL2ON") > -1)
  {
    rl2_state = 1;
    rl3_state = 0;
    rl4_state = 0;
    rl5_state = 0;
    rl0_state = 0;
    rl2_text = "ON";
    rl3_text = "OFF";
    rl4_text = "OFF";
    rl5_text = "OFF";
  }
  else {
    if (readString.indexOf("?RL2OFF") > -1)
    {
      rl2_state = 0;
      rl0_state = 1;
      rl2_text = "OFF";
    }
  }
    if (readString.indexOf("?RL3ON") > -1)
  {
    rl2_state = 0;
    rl3_state = 1;
    rl4_state = 0;
    rl5_state = 0;
    rl0_state = 0;
    rl2_text = "OFF";
    rl4_text = "OFF";
    rl5_text = "OFF";
    rl3_text = "ON";
  }
  else {
    if (readString.indexOf("?RL3OFF") > -1)
    {
      rl3_state = 0;
      rl0_state = 1;
      rl3_text = "OFF";
    }
  }
  if (readString.indexOf("?RL4ON") > -1)
  {
    rl4_state = 1;
    rl2_state = 0;
    rl3_state = 0;
    rl5_state = 0;
    rl0_state = 0;
    rl2_text = "OFF";
    rl4_text = "ON";
    rl5_text = "OFF";
    rl3_text = "OFF";
  }
  else {
    if (readString.indexOf("?RL4OFF") > -1)
    {
      rl4_state = 0;
      rl0_state = 1;
      rl4_text = "OFF";
    }
  }
    if (readString.indexOf("?RL5ON") > -1)
  {
    rl5_state = 1;
    rl4_state = 0;
    rl2_state = 0;
    rl3_state = 0;
    rl0_state = 0;
    rl2_text = "OFF";
    rl4_text = "OFF";
    rl3_text = "OFF";
    rl5_text = "ON";
  }
  else {
    if (readString.indexOf("?RL5OFF") > -1)
    {
      rl5_state = 0;
      rl0_state = 1;
      rl5_text = "OFF";
    }
  }
  readString = "";
}

void Fire2012WithPalette()
{
  #define COOLING  55
  #define SPARKING 120
// Array of temperature readings at each simulation cell
  static byte heat[NUM_LEDS];

  // Step 1.  Cool down every cell a little
    for( int i = 0; i < NUM_LEDS; i++) {
      heat[i] = qsub8( heat[i],  random8(0, ((COOLING * 10) / NUM_LEDS) + 2));
    }
  
    // Step 2.  Heat from each cell drifts 'up' and diffuses a little
    for( int k= NUM_LEDS - 1; k >= 2; k--) {
      heat[k] = (heat[k - 1] + heat[k - 2] + heat[k - 2] ) / 3;
    }
    
    // Step 3.  Randomly ignite new 'sparks' of heat near the bottom
    if( random8() < SPARKING ) {
      int y = random8(7);
      heat[y] = qadd8( heat[y], random8(160,255) );
    }

    // Step 4.  Map from heat cells to LED colors
    for( int j = 0; j < NUM_LEDS; j++) {
      // Scale the heat value from 0-255 down to 0-240
      // for best results with color palettes.
      byte colorindex = scale8( heat[j], 240);
      CRGB color = ColorFromPalette( gPal, colorindex);
      int pixelnumber;
      if( gReverseDirection ) {
        pixelnumber = (NUM_LEDS-1) - j;
      } else {
        pixelnumber = j;
      }
      leds[pixelnumber] = color;
    }
}


void pride() 
{
  static uint16_t sPseudotime = 0;
  static uint16_t sLastMillis = 0;
  static uint16_t sHue16 = 0;
 
  uint8_t sat8 = beatsin88( 87, 220, 250);
  uint8_t brightdepth = beatsin88( 341, 96, 224);
  uint16_t brightnessthetainc16 = beatsin88( 203, (25 * 256), (40 * 256));
  uint8_t msmultiplier = beatsin88(147, 23, 60);

  uint16_t hue16 = sHue16;//gHue * 256;
  uint16_t hueinc16 = beatsin88(113, 1, 3000);
  
  uint16_t ms = millis();
  uint16_t deltams = ms - sLastMillis ;
  sLastMillis  = ms;
  sPseudotime += deltams * msmultiplier;
  sHue16 += deltams * beatsin88( 400, 5,9);
  uint16_t brightnesstheta16 = sPseudotime;
  
  for( uint16_t i = 0 ; i < NUM_LEDS; i++) {
    hue16 += hueinc16;
    uint8_t hue8 = hue16 / 256;

    brightnesstheta16  += brightnessthetainc16;
    uint16_t b16 = sin16( brightnesstheta16  ) + 32768;

    uint16_t bri16 = (uint32_t)((uint32_t)b16 * (uint32_t)b16) / 65536;
    uint8_t bri8 = (uint32_t)(((uint32_t)bri16) * brightdepth) / 65536;
    bri8 += (255 - brightdepth);
    
    CRGB newcolor = CHSV( hue8, sat8, bri8);
    
    uint16_t pixelnumber = i;
    pixelnumber = (NUM_LEDS-1) - pixelnumber;
    
    nblend( leds[pixelnumber], newcolor, 64);
  }
}



CRGBPalette16 pacifica_palette_1 = 
    { 0x000507, 0x000409, 0x00030B, 0x00030D, 0x000210, 0x000212, 0x000114, 0x000117, 
      0x000019, 0x00001C, 0x000026, 0x000031, 0x00003B, 0x000046, 0x14554B, 0x28AA50 };
CRGBPalette16 pacifica_palette_2 = 
    { 0x000507, 0x000409, 0x00030B, 0x00030D, 0x000210, 0x000212, 0x000114, 0x000117, 
      0x000019, 0x00001C, 0x000026, 0x000031, 0x00003B, 0x000046, 0x0C5F52, 0x19BE5F };
CRGBPalette16 pacifica_palette_3 = 
    { 0x000208, 0x00030E, 0x000514, 0x00061A, 0x000820, 0x000927, 0x000B2D, 0x000C33, 
      0x000E39, 0x001040, 0x001450, 0x001860, 0x001C70, 0x002080, 0x1040BF, 0x2060FF };


void pacifica_loop()
{
  // Increment the four "color index start" counters, one for each wave layer.
  // Each is incremented at a different speed, and the speeds vary over time.
  static uint16_t sCIStart1, sCIStart2, sCIStart3, sCIStart4;
  static uint32_t sLastms = 0;
  uint32_t ms = GET_MILLIS();
  uint32_t deltams = ms - sLastms;
  sLastms = ms;
  uint16_t speedfactor1 = beatsin16(3, 179, 269);
  uint16_t speedfactor2 = beatsin16(4, 179, 269);
  uint32_t deltams1 = (deltams * speedfactor1) / 256;
  uint32_t deltams2 = (deltams * speedfactor2) / 256;
  uint32_t deltams21 = (deltams1 + deltams2) / 2;
  sCIStart1 += (deltams1 * beatsin88(1011,10,13));
  sCIStart2 -= (deltams21 * beatsin88(777,8,11));
  sCIStart3 -= (deltams1 * beatsin88(501,5,7));
  sCIStart4 -= (deltams2 * beatsin88(257,4,6));

  // Clear out the LED array to a dim background blue-green
  fill_solid( leds, NUM_LEDS, CRGB( 2, 6, 10));

  // Render each of four layers, with different scales and speeds, that vary over time
  pacifica_one_layer( pacifica_palette_1, sCIStart1, beatsin16( 3, 11 * 256, 14 * 256), beatsin8( 10, 70, 130), 0-beat16( 301) );
  pacifica_one_layer( pacifica_palette_2, sCIStart2, beatsin16( 4,  6 * 256,  9 * 256), beatsin8( 17, 40,  80), beat16( 401) );
  pacifica_one_layer( pacifica_palette_3, sCIStart3, 6 * 256, beatsin8( 9, 10,38), 0-beat16(503));
  pacifica_one_layer( pacifica_palette_3, sCIStart4, 5 * 256, beatsin8( 8, 10,28), beat16(601));

  // Add brighter 'whitecaps' where the waves lines up more
  pacifica_add_whitecaps();

  // Deepen the blues and greens a bit
  pacifica_deepen_colors();
}

// Add one layer of waves into the led array
void pacifica_one_layer( CRGBPalette16& p, uint16_t cistart, uint16_t wavescale, uint8_t bri, uint16_t ioff)
{
  uint16_t ci = cistart;
  uint16_t waveangle = ioff;
  uint16_t wavescale_half = (wavescale / 2) + 20;
  for( uint16_t i = 0; i < NUM_LEDS; i++) {
    waveangle += 250;
    uint16_t s16 = sin16( waveangle ) + 32768;
    uint16_t cs = scale16( s16 , wavescale_half ) + wavescale_half;
    ci += cs;
    uint16_t sindex16 = sin16( ci) + 32768;
    uint8_t sindex8 = scale16( sindex16, 240);
    CRGB c = ColorFromPalette( p, sindex8, bri, LINEARBLEND);
    leds[i] += c;
  }
}

// Add extra 'white' to areas where the four layers of light have lined up brightly
void pacifica_add_whitecaps()
{
  uint8_t basethreshold = beatsin8( 9, 55, 65);
  uint8_t wave = beat8( 7 );
  
  for( uint16_t i = 0; i < NUM_LEDS; i++) {
    uint8_t threshold = scale8( sin8( wave), 20) + basethreshold;
    wave += 7;
    uint8_t l = leds[i].getAverageLight();
    if( l > threshold) {
      uint8_t overage = l - threshold;
      uint8_t overage2 = qadd8( overage, overage);
      leds[i] += CRGB( overage, overage2, qadd8( overage2, overage2));
    }
  }
}

void pacifica_deepen_colors()
{
  for( uint16_t i = 0; i < NUM_LEDS; i++) {
    leds[i].blue = scale8( leds[i].blue,  145); 
    leds[i].green= scale8( leds[i].green, 200); 
    leds[i] |= CRGB( 2, 5, 7);
  }
}
