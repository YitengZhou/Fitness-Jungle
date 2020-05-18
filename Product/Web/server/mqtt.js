const mqtt = require('mqtt');
const channel = 'fitnessjungle/1';
const mqttName = 'server';
const desktopMqttName = 'desktop';
const m5MqttName = 'm5';
let client = mqtt.connect('mqtt://broker.mqttdashboard.com');;

client.on('connect', function () {
   console.log("Connected to HiveMQ");
   client.subscribe(channel);
});

client.on('message', function (topic, message) {
  // message is Buffer
  try {
     let reqObj = JSON.parse(message.toString());
     console.log(reqObj);
     if (reqObj["to"] == mqttName) {
        let resObj = {"from": mqttName, "to": m5MqttName, "message": "message received"};
        client.publish(channel, JSON.stringify(resObj));
     }     

  } 
  catch (err) {
     console.log(err);
  }
  
});

module.exports = {
   client
};