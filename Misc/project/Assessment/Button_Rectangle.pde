// This is the type name of the class.  I've added
// _c (underscore and c) so that when I read my code
// I will know I am looking at a class(c) I have made.

class Button_Rectangle {
  
  int x;        // Variables to store position on screen.
  int y;
  int w;
  int h;// Variable for the diameter of our button.
  boolean click;
  boolean cover;
  
  // Constructor / initialiser
  // This function is used when creating an
  // instance of your class, and should set up
  // any class variables
  Button_Rectangle( int set_x, int set_y, int set_w, int set_h ) {
    
    // Initialise class variables.
    x = set_x;
    y = set_y;
    w = set_w;
    h = set_h;
}
  
  void draw() {
     stroke( 0, 0, 0 );  // Draw with a black outline.
     
     // change size when move over
     if (cover==true){
       strokeWeight(10);
     }
     else{
     strokeWeight(4); // Make the outline thick.
     }     
     
     // change color when click
     if (click == true){
       fill( 0, 255, 255 );  // Fill with colour white.
     }
     else{
     fill( 255, 255, 255 );  // Fill with colour white.
     }
     
     // Draw an ellipse, using the class variables.
     rect( x, y, w, h );
  }
  
  // Returns true if the mouse cursor is within the
  // circle we are drawing.
  boolean checkClick() {
    
     if( mouseX>=x && mouseX<=x+w &&
         mouseY>=y && mouseY<=y+h ) {
        return true; 
     } 
     
     // If the above fails, we were not clicked.
     return false;
  }
  
}
