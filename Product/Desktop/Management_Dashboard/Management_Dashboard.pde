//Importing required libraries
import mqtt.*;
import controlP5.*;
import java.util.*;
import java.text.*;
import org.gicentre.utils.stat.*;

ControlP5 cp5;
MQTTClient client;
BarChart dailychart, weeklychart;
Database db = new Database();
List list_api = new List();
User user_api = new User();
Steps steps = new Steps();

Dashboard_view view = new Dashboard_view();

String client_id = str(random(3));

void setup() {
    cp5 = new ControlP5(this);
    dailychart = new BarChart(this);
    weeklychart = new BarChart(this);
    size(900, 700);
    // connect to the broker
    client = new MQTTClient(this);
    // connect to the broker and use a random string for clientid
    client.connect("mqtt://try:try@broker.hivemq.com", "processing_desktop" + client_id);
    delay(100);
    loadDummyData();
    steps.createStepRequest();
    updateDashboardData();
}

void draw() {
    background(0);
    view.build_profilephoto();
    dailychart.draw(75,400,350,200);
    weeklychart.draw(500,400,350,200);
}
