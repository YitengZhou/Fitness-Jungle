PImage img;

void refreshListData() {
    // We just rebuild the view rather than updating existing   
        cp5.remove("List of User");
        view.build_list("List of User", list_api.getListOfUsers(db.listofUsers));   
}

void refreshTextboxData() {
        cp5.remove("userinfo");
        cp5.remove("statsinfo");
        view.build_textArea(db.users);
        redraw();
}

void refreshDailyChart() {
        redraw();
}

void updateDashboardData() {

        int text_x_size = 225;
        int label_spacing = 35;
        int userinfo_x_pos = 350;
        int userinfo_y_pos = 100;
        int textbox_spacing = 50;      

        surface.setTitle("Fitness Jungle Dashboard");              
        view.build_list("List of User", list_api.getListOfUsers(db.listofUsers));
        view.build_textArea(db.users);
        view.build_labels("userinfo_label" ,"User Infomation", userinfo_x_pos, userinfo_y_pos - label_spacing, 25);
        view.build_labels("statsinfo_label" ,"Statistics", userinfo_x_pos + text_x_size + textbox_spacing, userinfo_y_pos - label_spacing, 25);
        view.build_labels("dailychart_label" ,"Bar Chart (hourly)", 140, 350, 25);
        view.build_labels("weeklychart_label" ,"Bar Chart (weekly)", 560, 350, 25);
        view.build_dailychart(db.daily, 
                new String[] {"00:00","03:00","06:00", "09:00","12:00", "15:00", "18:00", "21:00"});
        view.build_weeklychart(db.weekly, 
                new String[] {"Mon","Tue","Wed", "Thur","Fri", "Sat", "Sun"});

}
 
// The main class which contains the dynamic build of the dashboard. Advantage being more metrics can be added with ease. 
public class Dashboard_view {

        String img_filename;
        int text_x_size = 225;
        int text_y_size = 150;  
        int userinfo_x_pos = 350;
        int userinfo_y_pos = 100;
        int textbox_spacing = 50;
        int display_photo_x_size = 200;
        int display_photo_y_size = 200;
        int display_photo_spacing = 75;

        //Building top-left display photo for users
        void build_profilephoto() {
                img = loadImage(db.users.getString("imageUrl"), "png");
                img.resize(200, 200);
                image(img, userinfo_x_pos - display_photo_spacing - display_photo_x_size, userinfo_y_pos - 50);
        }

        //Building Barchart

        void build_dailychart(float[] data, String[] label) {
                dailychart.setData(data);
                dailychart.setMinValue(dailychart.getMinValue());
                dailychart.setMaxValue(dailychart.getMaxValue());
                dailychart.showValueAxis(true);
                dailychart.setBarLabels(label);
                dailychart.showCategoryAxis(true);
        }

        void build_weeklychart(float[] data, String[] label) {
                weeklychart.setData(data);
                weeklychart.setMinValue(weeklychart.getMinValue());
                weeklychart.setMaxValue(weeklychart.getMaxValue());
                weeklychart.showValueAxis(true);
                weeklychart.setBarLabels(label);
                weeklychart.showCategoryAxis(true);
        }

        //Title for Textboxes and Charts

        void build_labels(String label, String label_name, int x_pos, int y_pos, int font_size) {
                cp5.addTextlabel(label)
                .setText(label_name)
                .setPosition(x_pos, y_pos)
                .setColorValue(0xffffff00)
                .setFont(createFont("Georgia", font_size));
        }

        // Textbox for Userinfo and general statistics

        void build_textArea(JSONObject obj) {
                cp5.addTextarea("userinfo")
                        .setPosition(userinfo_x_pos, userinfo_y_pos)
                        .setSize(text_x_size, text_y_size)
                        .setFont(createFont("arial",17))
                        .setLineHeight(20)
                        .setColor(color(180))
                        .setColorBackground(color(255,100))
                        .setColorForeground(color(255,100))
                        .setText("User Name: " + obj.getString("email") + "\n"
                        +"First Name: " + obj.getString("firstName") + "\n"
                        +"Last Name: " + obj.getString("lastName") + "\n"
                        +"Pet Name: " + obj.getString("petName") + "\n"
                        +"Pet Level: " + obj.getInt("petLevel") + "\n"
                        +"Skin: " + obj.getString("petSkin") + "\n");

                cp5.addTextarea("statsinfo")
                        .setPosition(userinfo_x_pos + text_x_size + textbox_spacing, userinfo_y_pos)
                        .setSize(text_x_size, text_y_size)
                        .setFont(createFont("arial",17))
                        .setLineHeight(20)
                        .setColor(color(180))
                        .setColorBackground(color(255,100))
                        .setColorForeground(color(255,100))
                        .setText("Steps: " + obj.getInt("totalStepCount") + "\n"
                        +"Activity Level: " + steps_api.getActivityLevel(obj.getInt("totalStepCount")) + "\n"
                        +"Weekly Step: " + "123456" + "\n"
                        +"Average Step Daily: " + "10000" + "\n"); 
        }

        void build_list(String list_name, JSONObject[] users) {
                ScrollableList list = cp5.addScrollableList(list_name)
                .setPosition(800, 0)
                .setSize(100, 100);
                list.setBackgroundColor(color(190));
                list.setItemHeight(20);
                list.setBarHeight(40);
                list.setColorBackground(color(60));
                list.setColorActive(color(255, 128));
                list.clear();
                list.close();
               
                //for loop to add all users
                for (JSONObject user: users) {
                        int i = 0;
                        if (user != null) {
                                list.addItem(user.getString("firstName"), i);
                                i = i + 1;
                     
                        }
                }
                
                
        }
}
