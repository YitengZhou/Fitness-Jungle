# AnimatedGIFs_SD
Display GIFs on TFT screens from Flash, SD or SPIFFS 

GIFs require at least 32kB of SRAM.   So this example can only run on Zero, Due, ESP8266, ESP32, Teensy3.x, STM32x4xx ...

All targets can use SPI libraries e.g TFT_eSPI, Adafruit_ST7735, Adafruit_ILI9341, ...
Most targets can use MCUFRIEND_kbv (except ESP8266)

Most chips can store some sample GIFs in Flash
All targets can render unlimited number of GIFs from SD  Card.
ESP8266 and ESP32 can also store some samples with SPIFFS.  Enable with USE_SPIFFS in FileNameFunctions.h

Note that you need a current ESP32 for SPIFFS.   And ESP is a little fussy about SD Card type.

Set DEBUG to 0, 2, 3 in GifDecoderImpl.h  

GIF optimisation via PC or online is not that clever.   
They should minimise the display rectangle to only cover animation changes.
They should make a compromisde between contiguous run of pixels or multiple transparent pixels.

Many thanks to Craig A. Lindley and Louis Beaudoin (Pixelmatix) for their original work on small LED matrix.

## M5Stack
- Arduino 환경에서 M5Stack-Core-ESP32를 선택
- SD 대신 SPIFFS를 사용하려면 FilenameFunctions.h에서 #define USE_SPIFFS 을 활성화 한다.
- Gif 파일은 data 폴더에 저장을 하고, Arduino > Tools > ESP32 Sketch Data Upload를 선택해서 저장을 한다.

### 코드 수정: 
- 아두이노 library에 설치된 TFT_eSPI 라이브러리 코드 중 'User_Setup.h' 파일에서 다음과 같은 부분을 활성화한다.

~~~cpp
// Only define one driver, the other ones must be commented out
#define ILI9341_DRIVER

// For M5Stack ESP32 module with integrated ILI9341 display ONLY, remove // in line below
#define M5STACK

// For the M5Stack module use these #define lines
#define TFT_MISO 19
#define TFT_MOSI 23
#define TFT_SCLK 18
#define TFT_CS   14  // Chip select control pin
#define TFT_DC   27  // Data Command control pin
#define TFT_RST  33  // Reset pin (could connect to Arduino RESET pin)
#define TFT_BL   32  // LED back-light (required for M5Stack)

#define LOAD_GLCD   // Font 1. Original Adafruit 8 pixel font needs ~1820 bytes in FLASH
#define LOAD_FONT2  // Font 2. Small 16 pixel high font, needs ~3534 bytes in FLASH, 96 characters
#define LOAD_FONT4  // Font 4. Medium 26 pixel high font, needs ~5848 bytes in FLASH, 96 characters
#define LOAD_FONT6  // Font 6. Large 48 pixel font, needs ~2666 bytes in FLASH, only characters 1234567890:-.apm
#define LOAD_FONT7  // Font 7. 7 segment 48 pixel font, needs ~2438 bytes in FLASH, only characters 1234567890:-.
#define LOAD_FONT8  // Font 8. Large 75 pixel font needs ~3256 bytes in FLASH, only characters 1234567890:-.
//#define LOAD_FONT8N // Font 8. Alternative to Font 8 above, slightly narrower, so 3 digits fit a 160 pixel TFT
#define LOAD_GFXFF  // FreeFonts. Include access to the 48 Adafruit_GFX free fonts FF1 to FF48 and custom fonts

#define SPI_FREQUENCY  40000000 // Maximum to use SPIFFS
~~~

## gif 이미지 사이즈 수정: ezgif.com
- Resize 메뉴를 사용하고,320x240 사이즈로 선택
- resize method은 ImageMagick + coalesce
- aspect ratio는 center or force-aspect를 선택
- 중복 프레임을 줄이려면 Fuzz factor를 25% 정도로 해서 조절한다.
- 참고: https://learn.adafruit.com/pyportal-animated-gif-display?view=all