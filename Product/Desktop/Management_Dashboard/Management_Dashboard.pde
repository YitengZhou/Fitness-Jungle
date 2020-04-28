//Importing required libraries
import mqtt.*;
import controlP5.*;
import org.gicentre.utils.stat.*;

ControlP5 cp5;
MQTTClient client;
BarChart barChart;
BarChart barChart1;

Dashboard_view view = new Dashboard_view();

void setup() {
    cp5 = new ControlP5(this);
    barChart = new BarChart(this);
    barChart1 = new BarChart(this);
    size(900, 700);
    // connect to the broker
    client = new MQTTClient(this);
    // connect to the broker and use a random string for clientid
    client.connect("mqtt://try:try@broker.hivemq.com", "processing_desktop" + str(random(3)));
    delay(100);
    updateDashboardData();
}

void draw() {
    background(0);
    view.build_profilephoto();
    barChart.draw(75,400,350,200);
    barChart1.draw(500,400,350,200);
}
