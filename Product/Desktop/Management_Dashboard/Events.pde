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
      JSONObject body = response.getJSONObject("body");
      String response_type = response.getString("header");
      println("Received message from " + topic); 
      println("Response type " + response_type);
      switch (response_type) {
        case (Response.LOGIN):
          println("Got login response");
          break;
        case (Response.GETUSERLIST):
         
          list_api.saveListtoDB(body);
          refreshData();
          refreshDashboardData();
          println("JSONObject of list of users saved to db");
          break;
        case (Response.GETUSERDETAILED):
          println("Got detailed user response");
          //println(body.toString());
          //println(body.getString("firstName"));
          user_api.getUserInfo(body);
          println("sucess called function");
          break;
        case (Response.GETUSERSTEPSINTERVAL):
          println("Got user steps interval response");
          break;
      }
        
    }catch (RuntimeException e) {
      println(" Runtime exception error");
  }
}

void controlEvent(ControlEvent theEvent) {
    // expand order if clicked via API call
    //if (theEvent.getController().getValueLabel().getText().contains("O") == true) {
        // call the api and get the JSON packet
        //expanded_order = api.getOrdersByStatus(theEvent.getController().getName())[(int) theEvent.getController().getValue()].getString("order_id");
        //view.build_expanded_order(expanded_order);
    //}
    println(theEvent.getController().getLabel());
}

//void mousePressed() {
  //used to re-render display picture
  //view.set_filename("pet.png");
  //redraw();
//}
