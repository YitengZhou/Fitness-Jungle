const mqtt = require('mqtt');
const serverName = 'server';
const channelM5 = 'fitnessjungle/m5';
const channelDesktop = 'fitnessjungle/desktop';
const desktopName = 'desktop_1';
const m5Name = 'm5_P4177';

const getActivePet = (request, db) => {
   return new Promise((res, rej) => {
      db.all(
         `SELECT up.id AS id, up.name, up.level, bpt.name AS type, pt.name AS skin, pt.imagePath AS imageUrl, up.totalStepCount AS stepCount
         FROM UserPet As up
         INNER JOIN PetType AS pt ON up.petTypeId = pt.id
         INNER JOIN BasePetType AS bpt ON pt.baseTypeId = bpt.id
         WHERE up.userId = ${request.userId} AND up.active = true`
         , (err, rows) => {
            if (err) {
               rej(err);
            };
            
            db.all(
               `SELECT level, stepCount FROM PetLevel`, (err2, levelRows) => {
                  if (err2) {
                     rej(err2);              
                  };
                  let levelObj = {};
                  for (let row of levelRows) {
                     levelObj[row.level] = row.stepCount;
                  }

                  if (Array.isArray(rows) && rows.length) {
                     rows[0].stepsToNextLevel = levelObj[rows[0].level+1];
                  }
                  res(rows[0]);
               }
            );   
         }
      );
   });
};

function getDeviceData (request, db) {   
   return new Promise((res, rej) => {
      db.all(
         `SELECT *
         FROM User AS u      
         WHERE u.m5DeviceNo = '${request.deviceNo}'`
         , (err, rows) => {
            if (err) {               
               rej(err);               
            };
            
            let resJson = {};
            if (rows.length > 0) {
               let row = rows[0];
               resJson.user = {               
                  "firstName": row.nameFirst,
                  "lastName": row.nameLast,
                  "totalStepCount": row.totalStepCount
               };
               getActivePet({userId: row.id}, db)
               .then(function(petObj) {
                  resJson.pet = petObj;
                  res(resJson);
               });
            }
         }
      );
   });
}



function insertUserSteps(request, db) {
   return new Promise((res, rej) => {
      db.all(
         `SELECT *
         FROM User AS u      
         WHERE u.m5DeviceNo = '${request.deviceNo}'`
         , (err, rows) => {
            if (err) {               
               rej(err);               
            };

            db.run(
               `INSERT INTO UserIntervalStep (userId, count)
               VALUES (${rows[0].id}, ${request.stepCount})`
               , (err, result) => {
                  if (err) {
                     rej(err);                     
                  }
                  res(rows[0].id);
               }
            );
         }
      );
   });
}

function insertPetSteps(request, db) {   
   return new Promise((res, rej) => {
      db.all(
         `SELECT *
         FROM UserPet      
         WHERE userId = ${request.userId} AND active = true`
         , (err, rows) => {
            if (err) {               
               rej(err);               
            };

            db.run(
               `INSERT INTO UserPetIntervalStep (userPetId, count)
               VALUES (${rows[0].id}, ${request.stepCount})`
               , (err, result) => {
                  if (err) {
                     rej(err);                     
                  }
                  res();
               }
            );
         }
      );
   });
}

module.exports = function (db) 
{
   let client = mqtt.connect('mqtt://broker.mqttdashboard.com');;

   client.on('connect', function () {
      client.subscribe(channelM5);
      client.subscribe(channelDesktop);
      console.log("Connected to HiveMQ");
   });

   client.on('message', async function (topic, message) {
      // message is Buffer
      try {
         let reqObj = JSON.parse(message.toString());
         console.log(reqObj);
         if (!reqObj || !reqObj.from || !reqObj.to || !reqObj.request || !reqObj.request.header || reqObj.to != serverName) return;
         
         let responseJson = {
            from: serverName,
            to: reqObj.from,
            response: {
               header: reqObj.request.header,
               body: {},
               status: {
                  code: 0,
                  message: ""
               }
            }
         };

         if (topic == channelM5) {
            let request;
            switch(reqObj.request.header) {
               case "/getDeviceData":
                  request = {
                     deviceNo: reqObj.from.split("m5_")[1]
                  };

                  getDeviceData(request, db)
                  .then(function(res) {                     
                     if (res) {
                        responseJson.response.body = res;
                     }
                     responseJson.response.status.code = 200;
                     responseJson.response.status.message = "OK";
                  })
                  .catch(function(err){
                     console.log(err);
                     responseJson.response.status.code = 500;
                     responseJson.response.status.message = "Internal error";
                  })
                  .finally(function() {
                     client.publish(topic, JSON.stringify(responseJson));
                  });
                  break;
               case "/postSteps":
                  request = {
                     deviceNo: reqObj.from.split("m5_")[1],
                     stepCount: reqObj.request.body.stepCount
                  };
                  insertUserSteps(request, db)
                  .then(function(userId) {
                     request.userId = userId;
                     insertPetSteps(request, db);
                  })
                  .then(function() {   
                     responseJson.response.status.code = 200;
                     responseJson.response.status.message = "OK";                  
                  })
                  .catch(function(err){
                     console.log(err);
                     responseJson.response.status.code = 500;
                     responseJson.response.status.message = "Internal error";
                  })
                  .finally(function() {
                     client.publish(topic, JSON.stringify(responseJson));
                  });
                  break;
               default:
                  responseJson.response.status.code = 500;
                  responseJson.response.status.message = "Specified API endpoint does not exists";
                  client.publish(topic, JSON.stringify(responseJson));
            }
         }
      } 
      catch (err) {
         console.log(err);
      }
   
   });
};
