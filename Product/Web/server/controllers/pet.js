const getPetTypes = (req, res) => {
   let body = req.body;
   req.db.all(
      `SELECT bpt.name AS name, pt.name AS skin, pt.imagePath FROM BasePetType As bpt
      INNER JOIN PetType AS pt ON bpt.id = pt.baseTypeId
      WHERE levelRequired = 1`
      , (err, rows) => {
         if (err) {
            console.log(err);
            res.status(500);
         };
         
         let resJson = {
            petTypes: []
         };
         if (Array.isArray(rows) && rows.length) {
            for (let row of rows) {
               resJson.petTypes.push({
                  "name": row.name,
                  "skin": row.skin,
                  "imageUrl": row.imagePath
               });
            }
         }
         res.status(200).json(resJson);
      }
   );
};

// const createUserPet = (req, res) => {
//    let body = req.body;
//    req.db.run(
//       `INSERT INTO User (email, password, nameFirst, nameLast)
//       VALUES ('${body.email}', '${body.password}', '${body.firstName}', '${body.lastName}')`
//       , (err, result) => {
//       if (err) {
//          console.log(err);
//          res.status(500);
//       };
//       res.status(200).json({
//          "resultCode": 0,
//          "resultMessage": "OK" // possible values: [0: "OK", 1: "Email already taken"]
//       });
//    });
// };


// const getAllPets = (req, res) => {      
//    req.db.all("select * from Pet", (err, rows) => {
//       if (err) {
//          res.status(400).json("Unable to retrieve data at the moment");
//       };
//       res.status(200).json(rows);
//    });
// };

module.exports = {
   getPetTypes
   // , getAllPets
};