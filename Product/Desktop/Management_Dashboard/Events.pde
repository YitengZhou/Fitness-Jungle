String MQTT_request = "DESKTOP: MQTT_request";
String MQTT_response = "DESKTOP: MQTT_response";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_response);
    //to get initial list of registered users
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
      println(response_type);
      switch (response_type) {
        case (Response.GETUSERLIST):
          JSONObject body = response.getJSONObject("body");
          //println(body.toString());
          user_api.getListOfUsers(body);
          break;
        case (Response.GETUSERDETAILED):
          println("Got detailed user");
          break;
        case (Response.GETUSERSTEPSINTERVAL):
          println("Got user steps interval");
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
