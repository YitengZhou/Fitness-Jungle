String MQTT_topic = "user_data";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_topic);
}

void connectionLost() {
    println("connection lost");
}

void messageReceived(String topic, byte[] payload) {
    try {
      JSONObject json = parseJSONObject(new String(payload));
      
    }catch (RuntimeException e) {
      println(" Runtime exception error");
  }
}



void mousePressed() {
  //used to re-render display picture
  //view.set_filename("pet.png");
  redraw();
}
