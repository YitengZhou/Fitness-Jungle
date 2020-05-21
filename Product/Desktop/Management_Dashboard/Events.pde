String MQTT_topic = "fitnessjungle/desktop";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_topic);
    //to get initial list of registered users
    client.publish(MQTT_topic, loadJSONObject("Request/getUserListReq.json").toString());
    //to get first user
    client.publish(MQTT_topic, loadJSONObject("Request/getDetailedUserReq.json").toString());
    //to get first user steps data
    client.publish(MQTT_topic, loadJSONObject("Request/getStepsIntervalReq.json").toString());

}

void connectionLost() {
    println("connection lost");
}

void messageReceived(String topic, byte[] payload) {
    try {
      JSONObject json = parseJSONObject(new String(payload));
      if(json.getString("to").equals("desktop_1")) {
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
            refreshListData();
            break;
          case (Response.GETUSERDETAILED):
            user_api.getUserInfo(body);
            refreshData();
            refreshTextboxData();
            break;
          case (Response.GETUSERSTEPSINTERVAL):
            println("Got user steps interval response");
            steps_api.getStepsInterval(body);
            refreshDailyChart();
            break;
        }
      }
      else{
        println("requests");
      }
          
    }catch (RuntimeException e) {
      println(" Runtime exception error");
  }
}

void controlEvent(ControlEvent theEvent) {
    
    String userClicked = theEvent.getController().getLabel();
    int userId = list_api.getUserId(userClicked);

    if(userId != 0) {
      user_api.createUserRequest(userId);
      client.publish(MQTT_topic, loadJSONObject("Request/getDetailedUserReq.json").toString());
      steps_api.createStepRequest();
      client.publish(MQTT_topic, loadJSONObject("Request/getStepsIntervalReq.json").toString());
    }    
}

