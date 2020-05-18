const petLevels = [1, 2, 3, 4, 5];
const levelSteps = [100, 200, 300, 400, 500];
const friendStatuses = ["requested1", "requested2", "denied1", "denied2", "accepted1", "accepted2"];

function insert(res, db) {
   db.run(
      `INSERT INTO BasePetType ("name")
      VALUES ("Cactus")`
   );

   for (let i = 0; i < petLevels.length; i++) {
      db.run(
         `INSERT INTO PetLevel ("level", "stepCount")
         VALUES (${petLevels[i]}, ${levelSteps[i]})`
      );
   }

   db.run(
      `INSERT INTO PetType ("baseTypeId", "name", "levelRequired", "imagePath")
      VALUES (1, "Baby Cactus", 1, null)`
   );

   for (let i = 0; i < friendStatuses.length; i++) {
      db.run(
         `INSERT INTO FriendStatus ("name")
         VALUES ("${friendStatuses[i]}")`
      );
   }

   db.run(
      `INSERT INTO Admin ("username", "password", "nameFirst", "nameLast")
      VALUES ("admin", "12345", "Mister", "Admin")`
      , function(err) {
            if (err) {
                console.error(err.message);
                process.exit(1);
            }    
            console.log("DB created successfully.");         
            return res();
      }
   );
}

module.exports = {
   insert
};