const getPetTypes = (req, res) => {
   let body = req.body;
   req.db.all(
      `SELECT pt.id, bpt.name AS name, pt.name AS skin, pt.imagePath FROM BasePetType As bpt
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
                  "id": row.id,
                  "type": row.name,
                  "skin": row.skin,
                  "imageUrl": row.imagePath
               });
            }
         }
         res.status(200).json(resJson);
      }
   );
};

const createUserPet = (req, res) => {
   let body = req.body;
   req.db.run(
      `INSERT INTO UserPet (userId, petTypeId, name, active)
      VALUES (${body.userId}, ${body.typeId}, '${body.name}', false)`
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

const getUserPets = (req, res) => {
   let body = req.body;
   req.db.all(
      `SELECT up.id AS petId, up.name, up.level, bpt.name AS type, pt.name AS skin, pt.imagePath AS imageUrl, up.totalStepCount AS stepCount, up.active
      FROM UserPet As up
      INNER JOIN PetType AS pt ON up.petTypeId = pt.id
      INNER JOIN BasePetType AS bpt ON pt.baseTypeId = bpt.id
      WHERE up.userId = ${body.userId}`
      , (err, rows) => {
         if (err) {
            console.log(err);
            res.status(500);
         };
         
         req.db.all(
            `SELECT level, stepCount FROM PetLevel`, (err2, levelRows) => {
               if (err) {
                  console.log(err);
                  res.status(500);
               };
               let levelObj = {};
               for (let row of levelRows) {
                  levelObj[row.level] = row.stepCount;
               }

               if (Array.isArray(rows) && rows.length) {
                  for (let row of rows) {
                     row.stepsToNextLevel = levelObj[row.level+1];
                  }
               }

               res.status(200).json(rows);
            }
         );
         
      }
   );
};

module.exports = {
   getPetTypes
   , createUserPet
   , getUserPets
};