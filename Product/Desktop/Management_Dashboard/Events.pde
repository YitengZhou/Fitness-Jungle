String MQTT_topic = "user_data";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_topic);
}

void messageReceived(String topic, byte[] payload) {
  println("new message: " + topic + " - " + new String(payload));
}

void connectionLost() {
    println("connection lost");
}

void mousePressed() {
  //used to re-render display picture
  //view.set_filename("pet.png");
  redraw();
}
