const getAllUsers = (req, res) => {      
   req.db.all("select * from User", (err, rows) => {
      if (err) {
         res.status(400).json("Unable to retrieve data at the moment");
      };
      res.status(200).json(rows);
   });
};

const addUser = (req, res) => {
   //User (id INTEGER PRIMARY KEY, username, password, name_first, name_last, email, image_path)
   let user = req.body.user;
   console.log(req.body);
   req.db.run(`insert into User values (NULL, "${user.username}", "${user.password}", "", "", "", "")`, (err, result) => {
      if (err) {
         console.log(err);
         res.status(500).json("Error occurred");
      };
      res.status(200).json(result);
   });
};

const getUser = (req, res) => {
   req.db.all(`select * from User where username = "${req.body.user.username}"`, (err, result) => {
      if (err) {
         res.status(400).json("Unable to retrieve data at the moment");
      };
      res.status(200).json(result);
   });
};

module.exports = {
   getAllUsers
   , addUser
   , getUser
};