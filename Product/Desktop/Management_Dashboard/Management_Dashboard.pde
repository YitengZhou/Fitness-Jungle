//Importing required libraries
import mqtt.*;
import controlP5.*;

ControlP5 cp5;
MQTTClient client;

void setup() {
    cp5 = new ControlP5(this);
    size(900, 700);
    // connect to the broker
    client = new MQTTClient(this);
    // connect to the broker and use a random string for clientid
    client.connect("mqtt://try:try@broker.hivemq.com", "processing_desktop" + str(random(3)));
    delay(100);
}

void draw() {
  background(0);
}
