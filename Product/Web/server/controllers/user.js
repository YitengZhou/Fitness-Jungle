const register = (req, res) => {
   let body = req.body;
   req.db.run(
      `INSERT INTO User (email, password, nameFirst, nameLast)
      VALUES ("${body.email}", "${body.password}", "${body.firstName}", "${body.lastName}")`
      , (err, result) => {
      if (err) {
         console.log(err);
         res.status(500).json({
            "resultCode": 2,
            "resultMessage": "Internal error"
         });
      };
      res.status(200).json({
         "resultCode": 0,
         "resultMessage": "OK" // possible values: [0: "OK", 1: "Email already taken", 2: "Internal error"]
      });
   });
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
   // getAllUsers
   // , addUser
   // , getUser
   // , updateUser
};