function create(db) { 
   //PRIMARY KEY autoincrements if not given value
   db.run(
      `CREATE TABLE Admin (
         id INTEGER PRIMARY KEY 
         , username
         , password
         , nameFirst
         , nameLast
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
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
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
      )`
   );

   db.run(
      `CREATE TABLE BasePetType (
         id INTEGER PRIMARY KEY 
         , name
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
      )`
   );

   db.run(
      `CREATE TABLE PetLevel (
         level INTEGER PRIMARY KEY 
         , stepCount
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
      )`
   );

   db.run(
      `CREATE TABLE FriendStatus (
         id INTEGER PRIMARY KEY 
         , name
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
      )`
   );

   db.run(
      `CREATE TABLE Friend (
         user1Id INTEGER NOT NULL
         , user2Id INTEGER NOT NULL
         , statusId
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
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
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
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
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
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
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
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
         , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
         , FOREIGN KEY (userPetId)
            REFERENCES UserPet (id)
      )`
   );

   // db.run(
   //    `CREATE TABLE UserPetIntervalStep (
   //       id INTEGER PRIMARY KEY
   //       , userPetId
   //       , count
   //       , createdAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
   //       , updatedAt INTEGER(4) NOT NULL DEFAULT (strftime('%s','now'))
   //       , FOREIGN KEY (userPetId)
   //          REFERENCES UserPet (id)
   //    )`, function(err) {
   //       if (err) {
   //           console.error(err.message);
   //           process.exit(1);
   //       }    
   //       console.log("DB created successfully.");         
   //       return res();
   //   });
}

module.exports = {
   create
};