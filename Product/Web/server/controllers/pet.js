const getAllTypes = (req, res) => {      
   req.db.all("select * from Animal", (err, rows) => {
      if (err) {
         res.status(400).json("Unable to retrieve data at the moment");
      };
      res.status(200).json(rows);
   });
};

const getAllPets = (req, res) => {      
   req.db.all("select * from Pet", (err, rows) => {
      if (err) {
         res.status(400).json("Unable to retrieve data at the moment");
      };
      res.status(200).json(rows);
   });
};

module.exports = {
   getAllTypes
   , getAllPets
};