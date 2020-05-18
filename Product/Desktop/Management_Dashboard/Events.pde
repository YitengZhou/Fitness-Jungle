String MQTT_topic = "DESKTOP: MQTT";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_topic);
    //to get initial list of registered users
    client.publish(MQTT_topic, loadJSONObject("Request/getUserListReq.json").toString());
}

void connectionLost() {
    println("connection lost");
}

void messageReceived(String topic, byte[] payload) {
    try {
      //JSONObject json = parseJSONObject(new String(payload));
      println(new String(payload));
      
    }catch (RuntimeException e) {
      println(" Runtime exception error");
  }
}



//void mousePressed() {
  //used to re-render display picture
  //view.set_filename("pet.png");
  //redraw();
//}

void keyPressed() {
  client.publish(MQTT_topic, "world");
}
