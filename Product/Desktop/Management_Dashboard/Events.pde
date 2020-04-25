String MQTT_topic = "user_data";

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_topic);
}

void messageReceived(String topic, byte[] payload) {
  println("new message from: " + topic + " - " + new String(payload));
}

void connectionLost() {
    println("connection lost");
}
