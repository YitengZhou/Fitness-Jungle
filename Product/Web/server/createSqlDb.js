function create(res, db) { 
   //PRIMARY KEY autoincrements if not given value
   db.run(
      `CREATE TABLE Admin (
         id INTEGER PRIMARY KEY 
         , username
         , password
         , nameFirst
         , nameLast
         , createdAt
         , updatedAt
      )`
   );

   db.run(
      `CREATE TABLE User (
         id INTEGER PRIMARY KEY 
         , email
         , password
         , nameFirst
         , nameLast
         , imagePath
         , m5DeviceNo
         , totalStepCount
         , createdAt
         , updatedAt
      )`
   );

   db.run(
      `CREATE TABLE BasePetType (
         id INTEGER PRIMARY KEY 
         , name
         , createdAt
         , updatedAt
      )`
   );

   db.run(
      `CREATE TABLE PetLevel (
         level INTEGER PRIMARY KEY 
         , stepCount
         , createdAt
         , updatedAt
      )`
   );

   db.run(
      `CREATE TABLE FriendStatus (
         id INTEGER PRIMARY KEY 
         , name
         , createdAt
         , updatedAt
      )`
   );

   db.run(
      `CREATE TABLE Friend (
         user1Id INTEGER NOT NULL
         , user2Id INTEGER NOT NULL
         , statusId
         , createdAt
         , updatedAt
         , PRIMARY KEY(user1Id, user2Id)
         , FOREIGN KEY (user1Id)
            REFERENCES User (id)
         , FOREIGN KEY (user2Id)
            REFERENCES User (id)
         , FOREIGN KEY (statusId)
            REFERENCES FriendStatus (id) 
      )`
   );

   db.run(
      `CREATE TABLE UserIntervalStep (
         id INTEGER PRIMARY KEY
         , userId
         , count
         , createdAt
         , updatedAt
         , FOREIGN KEY (userId)
            REFERENCES User (id)
      )`
   );

   db.run(
      `CREATE TABLE PetType (
         id INTEGER PRIMARY KEY
         , baseTypeId
         , name
         , levelRequired
         , imagePath
         , createdAt
         , updatedAt
         , FOREIGN KEY (baseTypeId)
            REFERENCES BasePetType (id)
         , FOREIGN KEY (levelRequired)
            REFERENCES PetLevel (level)
      )`
   );

   db.run(
      `CREATE TABLE UserPet (
         id INTEGER PRIMARY KEY
         , userId
         , petTypeId
         , name
         , totalStepCount
         , level
         , active
         , createdAt
         , updatedAt
         , FOREIGN KEY (userId)
            REFERENCES User (id)
         , FOREIGN KEY (petTypeId)
            REFERENCES PetType (id)
         , FOREIGN KEY (level)
            REFERENCES PetLevel (level)
      )`
   );

   db.run(
      `CREATE TABLE UserPetIntervalStep (
         id INTEGER PRIMARY KEY
         , userPetId
         , count
         , createdAt
         , updatedAt
         , FOREIGN KEY (userPetId)
            REFERENCES UserPet (id)
      )`, function(err) {
         if (err) {
             console.error(err.message);
             process.exit(1);
         }    
         console.log("DB created successfully.");         
         return res();
     });
}

module.exports = {
   create
};