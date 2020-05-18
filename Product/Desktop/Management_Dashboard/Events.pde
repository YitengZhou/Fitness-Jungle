String MQTT_request = "DESKTOP: MQTT_request";
String MQTT_response = "DESKTOP: MQTT_response";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_response);
    //to get initial list of registered users
    client.publish(MQTT_request, "Desktop client connected");
    client.publish(MQTT_request, loadJSONObject("Request/getUserListReq.json").toString());
}

void connectionLost() {
    println("connection lost");
}

void messageReceived(String topic, byte[] payload) {
    try {
      JSONObject json = parseJSONObject(new String(payload)); 
      JSONObject response = json.getJSONObject("response");
      String response_type = response.getString("header");
      println("Received message from " + topic); 
      println("Response type " + response_type);
      switch (response_type) {
        case (Response.LOGIN):
          println("Got login response");
          break;
        case (Response.GETUSERLIST):
          JSONObject body = response.getJSONObject("body");
          user_api.saveListtoDB(body);
          refreshData();
          refreshDashboardData();
          //println("JSONObject of list of users saved to db");
          break;
        case (Response.GETUSERDETAILED):
          println("Got detailed user response");
          break;
        case (Response.GETUSERSTEPSINTERVAL):
          println("Got user steps interval response");
          break;
      }
        
    }catch (RuntimeException e) {
      println(" Runtime exception error");
  }
}



//void mousePressed() {
  //used to re-render display picture
  //view.set_filename("pet.png");
  //redraw();
//}
