void updateDashboardData() {
  view.build_userinfomation("bebe1230", "beibei", "liu", "pet pet", "100", "idk" );
  view.build_statisticsinformation("12,345", "high", "54,321", "9,876");
  view.build_userinfo_label();
  view.build_statsinfo_label();
  view.set_filename("pet.png");
 
}
 
public class Dashboard_view {
    
    PImage img; 
    String img_filename;
    int text_x_size = 225;
    int text_y_size = 150;  
    int label_spacing = 35;
    int userinfo_x_pos = 350;
    int userinfo_y_pos = 100;
    int textbox_spacing = 50;
    int display_photo_x_size = 200;
    int display_photo_y_size = 200;
    int display_photo_spacing = 75;
    
    
void build_userinfo_label() {
  
        cp5.addTextlabel("userinfo_label")
            .setText("User Infomation")
            .setPosition(userinfo_x_pos, userinfo_y_pos - label_spacing)
            .setColorValue(0xffffff00)
            .setFont(createFont("Georgia",25));
}

void build_statsinfo_label() {
  
        cp5.addTextlabel("statsinfo_label")
            .setText("Statistics")
            .setPosition(userinfo_x_pos + text_x_size + textbox_spacing, userinfo_y_pos - label_spacing)
            .setColorValue(0xffffff00)
            .setFont(createFont("Georgia",25));
}
   
void build_userinfomation(String username, String firstname, String lastname, String petname, String petlevel, String skin) {
        cp5.addTextarea("userinfo")
            .setPosition(userinfo_x_pos, userinfo_y_pos)
            .setSize(text_x_size, text_y_size)
            .setFont(createFont("arial",17))
            .setLineHeight(20)
            .setColor(color(180))
            .setColorBackground(color(255,100))
            .setColorForeground(color(255,100))
            .setText("User Name: " + username + "\n"
                     +"First Name: " + firstname + "\n"
                     +"Last Name: " + lastname + "\n"
                     +"Pet Name: " + petname + "\n"
                     +"Pet Level: " + petlevel + "\n"
                     +"Skin: " + skin + "\n"); 
      }
      
void build_statisticsinformation(String steps, String activitylevel, String weeklystep, String averagestepdaily) {
        cp5.addTextarea("statsinfo")
            .setPosition(userinfo_x_pos + text_x_size + textbox_spacing, userinfo_y_pos)
            .setSize(text_x_size, text_y_size)
            .setFont(createFont("arial",17))
            .setLineHeight(20)
            .setColor(color(180))
            .setColorBackground(color(255,100))
            .setColorForeground(color(255,100))
            .setText("Steps: " + steps + "\n"
                     +"Activity Level: " + activitylevel + "\n"
                     +"Weekly Step: " + weeklystep + "\n"
                     +"Average Step Daily: " + averagestepdaily + "\n");      
      }
      
void set_filename(String filename) {
        img_filename = filename; 
}
      
void build_profilephoto() {
        img = loadImage(img_filename);
        img.resize(200, 200);
        image(img, userinfo_x_pos - display_photo_spacing - display_photo_x_size, userinfo_y_pos - 50);
 
      }
}
