//Flag Values

final int STATE_MAIN_1 = 0;
final int STATE_MAIN_2 = 1;

final int STATE_MENU = 2;

final int STATE_PROFILE_WEEK = 3;
final int STATE_PROFILE_TOTAL = 4;

final int STATE_FRIENDS_1 = 5;
final int STATE_FRIENDS_2 = 6;

final int STATE_MAP = 7;

final int STATE_PET_STATUS = 8;
final int STATE_PET_SKIN = 9;

final int WELCOME_PAGE = 10;

// State flag.
int state;
PImage my_img;
int flag=1;
float x,y;
Button_Rectangle buttonLeft;
Button_Rectangle buttonMiddle;
Button_Rectangle buttonRight;

void setup() {

  size( 1200, 900 );
  // Set the initial state of our program.
  state = WELCOME_PAGE;
  buttonLeft = new Button_Rectangle( 250, 700, 100 , 50 );
  buttonMiddle = new Button_Rectangle( 550, 700, 100 , 50 );
  buttonRight = new Button_Rectangle( 850, 700, 100 , 50 );
  x = 300;
  y = 100;
}

void draw() {

  background(128);
  if( buttonLeft.checkClick() ) {
    buttonLeft.cover=true;
  }
  else{
    buttonLeft.cover=false;
  }
  buttonLeft.draw();
  
  if( buttonMiddle.checkClick() ) {
    buttonMiddle.cover=true;
  }
  else{
    buttonMiddle.cover=false;
  }
  buttonMiddle.draw();
  
  if( buttonRight.checkClick() ) {
    buttonRight.cover=true;
  }
  else{
    buttonRight.cover=false;
  }
  buttonRight.draw();
  // Here, we change the way the program will display
  // and respond based on which state the system is in.
  // This could also be implemented as an
  // if{} 
  // elseif(){}
  // set of statements.
  // Note that, we expect "state" to change on events
  // such as keypresses, mouse interaction, etc.
  switch( state ) {

    case WELCOME_PAGE:
      my_img = loadImage("Start_Screen.png");
      image( my_img, 200, 50 ); 
      break;

    case STATE_MAIN_1:
      my_img = loadImage("Main_1.png");
      image( my_img, 200, 50 ); 
      break;
      
    case STATE_MAIN_2:
      my_img = loadImage("Main_2.png");
      image( my_img, 200, 50 ); 
      break;
    
    case STATE_MENU:
      my_img = loadImage("Menu.png");
      image( my_img, 200, 50 ); 
      drawMark();
      break;
    
    //
    case STATE_PROFILE_WEEK:
      my_img = loadImage("Profile_Week.png");
      image( my_img, 200, 50 ); 
      break;
    
    case STATE_PROFILE_TOTAL:
      my_img = loadImage("Profile_Total.png");
      image( my_img, 200, 50 ); 
      break;
    
    case STATE_FRIENDS_1:
      my_img = loadImage("Friends_1.png");
      image( my_img, 200, 50 ); 
      break;
      
    case STATE_FRIENDS_2:
      my_img = loadImage("Friends_2.png");
      image( my_img, 200, 50 ); 
      break;
   
    case STATE_MAP:
      my_img = loadImage("Map.png");
      image( my_img, 200, 50 ); 
      break;
    
    case STATE_PET_STATUS:
      my_img = loadImage("Pet_Status.png");
      image( my_img, 200, 50 ); 
      break;
    
    case STATE_PET_SKIN:
      my_img = loadImage("Pet_Skin.png");
      image( my_img, 200, 50 ); 
      break;
      
    default:
      println("Unknown state: " + state );
      break;
  }
}

void drawMark() {
  stroke( 255, 0, 0 );
  strokeWeight( 2 );
  ellipse( x, y, 20,20);
}

void mouseReleased() {
    switch( state ) {
      case WELCOME_PAGE:
        if( buttonMiddle.checkClick()||buttonLeft.checkClick()||buttonRight.checkClick()) {
            state =STATE_MAIN_1; 
         }
        break;
      
      case STATE_MAIN_1:
        if( buttonMiddle.checkClick()||buttonLeft.checkClick()||buttonRight.checkClick()) {
            state =STATE_MAIN_2; 
         }
        break;
      
      case STATE_MAIN_2:
        if( buttonMiddle.checkClick()||buttonLeft.checkClick()||buttonRight.checkClick()) {
            state = STATE_MENU; 
         }
        break;
      
      case STATE_MENU:
        if( buttonRight.checkClick()) {
            flag++;
            y=y+90;
        }
        if (flag==1 && buttonMiddle.checkClick()){
          state = STATE_PROFILE_WEEK; 
        }
        if (flag==2 && buttonMiddle.checkClick()){
          state = STATE_FRIENDS_1;
        }
        if (flag==3 && buttonMiddle.checkClick()){
          state = STATE_MAP;
        }
        if (flag==4 && buttonMiddle.checkClick()){
          state = STATE_PET_STATUS;
        }
        if (flag==5 && buttonMiddle.checkClick()){
          state = WELCOME_PAGE;
        }
        if (flag>5){
          y=100;
          flag=1;
        }
        break;
      
      case STATE_PROFILE_WEEK:
        if( buttonRight.checkClick()) {
            state = STATE_PROFILE_TOTAL; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_MENU; 
         }
        break;
      
      case STATE_PROFILE_TOTAL:
        if( buttonLeft.checkClick()) {
            state = STATE_MENU; 
         }
        break;
        
      case STATE_FRIENDS_1:
        if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_2; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_MENU; 
         }
        break;
        
      case STATE_FRIENDS_2:
        if( buttonLeft.checkClick()) {
            state = STATE_MENU; 
         }
        break;
        
      case STATE_MAP:
        if( buttonLeft.checkClick()) {
            state = STATE_MENU; 
         }
        break;
        
      case STATE_PET_STATUS:
        if( buttonRight.checkClick()) {
            state = STATE_PET_SKIN; 
         }
         if( buttonLeft.checkClick()) {
            state = WELCOME_PAGE; 
         }
        break;
        
      case STATE_PET_SKIN:
        if( buttonLeft.checkClick()) {
            state = STATE_MENU; 
         }
        break;

      default:
        println("Unknown state: " + state );
        break;
      }
}
