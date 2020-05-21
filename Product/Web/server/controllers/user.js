const register = (req, res) => {
   let body = req.body;
   req.db.run(
      `INSERT INTO User (email, password, nameFirst, nameLast)
      VALUES ("${body.email}", "${body.password}", "${body.firstName}", "${body.lastName}")`
      , (err, result) => {
      if (err) {
         console.log(err);
         res.status(500);
      };
      res.status(200).json({
         "resultCode": 0,
         "resultMessage": "OK" // possible values: [0: "OK", 1: "Email already taken"]
      });
   });
};

const login = (req, res) => {
   let body = req.body;
   req.db.all(
      `SELECT * FROM User WHERE email = '${body.email}'`, (err, rows) => {
         if (err) {
            console.log(err);
            res.status(500);
         };
         
         let resJson = {};
         if (Array.isArray(rows) && rows.length && rows[0].password.localeCompare(body.password) == 0) {
            let row = rows[0];
            resJson = {
               "userId": row.id,
               "firstName": row.nameFirst,
               "lastName": row.nameLast,
               "imageUrl": row.imagePath
            };
         }
         res.status(200).json(resJson);
      }
   );
};

const getUser = (req, res) => {
   let body = req.body;
   req.db.all(
      `SELECT * FROM User WHERE id = '${body.userId}'`, (err, rows) => {
         if (err) {
            console.log(err);
            res.status(500);
         };
         
         let resJson = {};
         if (Array.isArray(rows) && rows.length) {
            let row = rows[0];
            resJson = {               
               "firstName": row.nameFirst,
               "lastName": row.nameLast,
               "imageUrl": row.imagePath,
               "deviceNo": row.m5DeviceNo,
               "totalStepCount": row.totalStepCount
            };
         }
         res.status(200).json(resJson);
      }
   );
};

const updateUser = (req, res) => {
   let body = req.body;
   let toUpdate = body.toUpdate;
   req.db.run(
      `UPDATE User SET nameFirst = '${toUpdate.firstName}', nameLast = '${toUpdate.lastName}', imagePath = '${toUpdate.imageUrl}', m5DeviceNo = '${toUpdate.deviceNo}'
      WHERE id = ${body.userId}`
      , (err, result) => {
      if (err) {
         console.log(err);
         res.status(500);
      };
      res.status(200).json({
         "resultCode": 0,
         "resultMessage": "OK"
      });
   });
};

module.exports = {
   register
   , login
   , getUser
   , updateUser
};