//Flag Values

final int STATE_MAIN_1 = 0;
final int STATE_MAIN_2 = 1;

final int STATE_MENU_PROFILE = 20;
final int STATE_MENU_FRIENDS = 21;
final int STATE_MENU_MAP= 22;
final int STATE_MENU_PET= 23;
final int STATE_MENU_BACK_HOME= 24;

final int STATE_PROFILE_WEEK = 3;
final int STATE_PROFILE_TOTAL = 4;
final int STATE_PROFILE_BACK = 17;

final int STATE_FRIENDS_1 = 5;
final int STATE_FRIENDS_2 = 6;
final int STATE_FRIENDS_3 = 7;
final int STATE_FRIENDS_4 = 8;
final int STATE_FRIENDS_5 = 9;
final int STATE_FRIENDS_6 = 10;
final int STATE_FRIENDS_BACK = 11;

final int STATE_MAP = 12;
final int STATE_MAP_BACK = 13;

final int STATE_PET_STATUS = 14;
final int STATE_PET_SKIN = 15;
final int STATE_PET_BACK = 18;

final int WELCOME_PAGE = 16;

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
      
    // menu
    case STATE_MENU_PROFILE:
      my_img = loadImage("Menu_Profile.png");
      image( my_img, 200, 50 ); 
      break;
      
    case STATE_MENU_FRIENDS:
      my_img = loadImage("Menu_Friends.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_MENU_PET:
      my_img = loadImage("Menu_Pet.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_MENU_MAP:
      my_img = loadImage("Menu_Map.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_MAP_BACK:
      my_img = loadImage("Map_Back.png");
      image( my_img, 200, 50 ); 
      break;
      
    case STATE_MENU_BACK_HOME:
      my_img = loadImage("Menu_Back_Home.png");
      image( my_img, 200, 50 ); 
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
      
    case STATE_PROFILE_BACK:
      my_img = loadImage("Profile_Back.png");
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
    case STATE_FRIENDS_3:
      my_img = loadImage("Friends_3.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_FRIENDS_4:
      my_img = loadImage("Friends_4.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_FRIENDS_5:
      my_img = loadImage("Friends_5.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_FRIENDS_6:
      my_img = loadImage("Friends_6.png");
      image( my_img, 200, 50 ); 
      break;
    case STATE_FRIENDS_BACK:
      my_img = loadImage("Friends_Back.png");
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
    
    case STATE_PET_BACK:
      my_img = loadImage("Pet_Back.png");
      image( my_img, 200, 50 ); 
      break;
      
    default:
      println("Unknown state: " + state );
      break;
  }
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
            state = STATE_MENU_PROFILE; 
         }
        break;
      
      case STATE_MENU_PROFILE:
        if( buttonRight.checkClick()) {
            state = STATE_MENU_FRIENDS; 
        }
        if( buttonMiddle.checkClick()) {
            state = STATE_PROFILE_WEEK; 
        }
        if( buttonLeft.checkClick()) {
            state = STATE_MENU_BACK_HOME; 
        }
        break;
        
      case STATE_MENU_FRIENDS:
        if( buttonRight.checkClick()) {
            state = STATE_MENU_MAP; 
        }
        if( buttonLeft.checkClick()) {
            state = STATE_MENU_PROFILE; 
        }
        if( buttonMiddle.checkClick()) {
            state = STATE_FRIENDS_1; 
        }
        break;
        
      case STATE_MENU_MAP:
        if( buttonRight.checkClick()) {
            state = STATE_MENU_PET; 
        }
        if( buttonLeft.checkClick()) {
            state = STATE_MENU_FRIENDS; 
        }
        if( buttonMiddle.checkClick()) {
            state = STATE_MAP; 
        }
        break;
      
      case STATE_MENU_PET:
        if( buttonRight.checkClick()) {
            state = STATE_MENU_BACK_HOME; 
        }
        if( buttonLeft.checkClick()) {
            state = STATE_MENU_MAP; 
        }
        if( buttonMiddle.checkClick()) {
            state = STATE_PET_STATUS; 
        }
        break;
      
      case STATE_MENU_BACK_HOME:
        if( buttonRight.checkClick()) {
            state = STATE_MENU_PROFILE; 
        }
        if( buttonLeft.checkClick()) {
            state = STATE_MENU_PET; 
        }
        if( buttonMiddle.checkClick()) {
            state = STATE_MAIN_2; 
        }
        break;
        
      case STATE_PROFILE_WEEK:
        if( buttonRight.checkClick()) {
            state = STATE_PROFILE_TOTAL; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_PROFILE_BACK; 
         }
        break;
      
      case STATE_PROFILE_TOTAL:
        if( buttonLeft.checkClick()) {
            state = STATE_PROFILE_WEEK; 
         }
        if( buttonRight.checkClick()) {
            state = STATE_PROFILE_BACK; 
         }
        break;
        
      case STATE_PROFILE_BACK:
        if( buttonMiddle.checkClick()) {
            state = STATE_MENU_PROFILE; 
         }
        if( buttonRight.checkClick()) {
            state = STATE_PROFILE_WEEK; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_PROFILE_TOTAL; 
         }
        break;
        
      case STATE_FRIENDS_1:
         if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_2; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_FRIENDS_BACK; 
         }
        break;
        
      case STATE_FRIENDS_2:
         if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_3; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_FRIENDS_1; 
         }
        break;
      case STATE_FRIENDS_3:
         if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_4; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_FRIENDS_2; 
         }
        break;
      case STATE_FRIENDS_4:
         if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_5; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_FRIENDS_3; 
         }
        break;
      case STATE_FRIENDS_5:
         if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_6; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_FRIENDS_4; 
         }
        break;
      case STATE_FRIENDS_6:
      if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_BACK; 
         }
       if( buttonLeft.checkClick()) {
          state = STATE_FRIENDS_5; 
       }
      break;
      
      case STATE_FRIENDS_BACK:
         if( buttonMiddle.checkClick()) {
            state = STATE_MENU_FRIENDS; 
         }
         if( buttonRight.checkClick()) {
            state = STATE_FRIENDS_1; 
         }
        break;
      
      case STATE_MAP:
        if( buttonLeft.checkClick()) {
            state = STATE_MAP_BACK; 
         }
        if( buttonRight.checkClick()) {
            state = STATE_MAP_BACK; 
         }
        break;
        
      case STATE_MAP_BACK:
        if( buttonMiddle.checkClick()) {
            state = STATE_MENU_MAP; 
         }
        if( buttonRight.checkClick()) {
            state = STATE_MAP; 
         }
        break;

      case STATE_PET_STATUS:
        if( buttonRight.checkClick()) {
            state = STATE_PET_SKIN; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_PET_BACK; 
         }
        break;
        
      case STATE_PET_SKIN:
        if( buttonLeft.checkClick()) {
            state = STATE_PET_STATUS; 
         }
         if( buttonRight.checkClick()) {
            state = STATE_PET_BACK; 
         }
        break;
        
      case STATE_PET_BACK:
        if( buttonMiddle.checkClick()) {
            state = STATE_MENU_PET; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_PET_SKIN; 
         }
         if( buttonLeft.checkClick()) {
            state = STATE_PET_STATUS; 
         }
        break;

      default:
        println("Unknown state: " + state );
        break;
      }
}
