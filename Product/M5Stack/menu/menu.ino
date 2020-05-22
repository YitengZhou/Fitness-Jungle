#include <M5Stack.h>

// the setup routine runs once when M5Stack starts up
void setup(){

  // Initialize the M5Stack object
  M5.begin();

  /*
    Power chip connected to gpio21, gpio22, I2C device
    Set battery charging voltage and current
    If used battery, please call this function in your project
  */
  M5.Power.begin();
    
  // LCD display
  M5.Lcd.print("\n");
  M5.Lcd.print("\n");
  M5.Lcd.setTextFont(2);
  M5.Lcd.println("  MENU:");
  M5.Lcd.println("-----------------------------------------------------");
  M5.Lcd.setTextColor(TFT_YELLOW);
  M5.Lcd.println("          -->>        PROFILE");
  M5.Lcd.println("-----------------------------------------------------");
  M5.Lcd.println("                      FRIENDS");
  M5.Lcd.println("-----------------------------------------------------");
  M5.Lcd.println("                        MAP");
  M5.Lcd.println("-----------------------------------------------------");
  M5.Lcd.println("                        PET");
  M5.Lcd.println("-----------------------------------------------------");
  M5.Lcd.println("                   BACK TO HOME");
  M5.Lcd.setTextColor(TFT_WHITE);
  M5.Lcd.println("-----------------------------------------------------");
  M5.Lcd.print("\n"); 
  M5.Lcd.println("      PREVIOUS       SELECT         NEXT");
}

// the loop routine runs over and over again forever
void loop() {

}
