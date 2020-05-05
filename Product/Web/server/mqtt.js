const mqtt = require('mqtt');
const channel = 'fitnessjungle/1';
let client = mqtt.connect('mqtt://broker.mqttdashboard.com');;

client.on('connect', function () {
   console.log("Connected to HiveMQ");
   client.subscribe(channel);
});

// client.publish('messages', 'Current time is: ' + new Date());

client.on('message', function (topic, message) {
  // message is Buffer
  console.log(message.toString());
})

module.exports = {
   client
};