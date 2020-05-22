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
//  M5.Lcd.print("\n"); line 30
  M5.Lcd.setTextFont(4);
  M5.Lcd.println("");
  M5.Lcd.println(" Level : 1                             ");
  M5.Lcd.println(" Steps : 3234                  PET     ");
  M5.Lcd.println(" Calorie : 500  kcal    MODEL");
  M5.Lcd.println(" Rank : 5                              ");
  M5.Lcd.println(" Temperature : 2  - 20                 ");
  M5.Lcd.println("");
  M5.Lcd.println(" Exp:                                  ");
  M5.Lcd.setTextColor(TFT_BLUE);
  M5.Lcd.println(" ||||||||||||||||||                    ");
}

// the loop routine runs over and over again forever
void loop() {

}
