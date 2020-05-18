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

// const getAllUsers = (req, res) => {      
//    req.db.all("SELECT * FROM User", (err, rows) => {
//       if (err) {
//          res.status(400).json("Unable to retrieve data at the moment");
//       };
//       res.status(200).json(rows);
//    });
// };

// const addUser = (req, res) => {
//    //User (id INTEGER PRIMARY KEY, username, password, name_first, name_last, email, image_path)
//    let user = req.body.user;
//    req.db.run(`INSERT INTO User VALUES (NULL, "${user.username}", "${user.password}", "", "", "", "")`, (err, result) => {
//       if (err) {
//          console.log(err);
//          res.status(500).json("Error occurred");
//       };
//       res.status(200).json(result);
//    });
// };

// const getUser = (req, res) => {
//    req.db.all(`SELECT * from User WHERE username = "${req.body.user.username}"`, (err, result) => {
//       if (err) {
//          res.status(400).json("Unable to retrieve data at the moment");
//       };
//       res.status(200).json(result);
//    });
// };

// const updateUser = (req, res) => {
//    //User (id INTEGER PRIMARY KEY, username, password, name_first, name_last, email, image_path)
//    let user = req.body.user;
//    req.db.run(`UPDATE User SET name_first="${user.name_first}", name_last="${user.name_last}", email="${user.email}", image_path="${user.image_path}" WHERE username="${user.username}"`, (err, result) => {
//       if (err) {
//          console.log(err);
//          res.status(500).json("Error occurred");
//       };
//       res.status(200).json(result);
//    });
// };

module.exports = {
   register
   , login
   , getUser
   // getAllUsers
   // , addUser
   // , getUser
   // , updateUser
};