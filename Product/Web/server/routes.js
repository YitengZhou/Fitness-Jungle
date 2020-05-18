const apiURI = "/api";
const userController = require("./controllers/user");
const petController = require("./controllers/pet");

module.exports = function (app, express, path, rootDir) 
{
   app.post(apiURI + "/register", userController.register);
   app.post(apiURI + "/login", userController.login);
   app.post(apiURI + "/getUser", userController.getUser);
   app.put(apiURI + "/updateUser", userController.updateUser);
   app.post(apiURI + "/getPetTypes", petController.getPetTypes);
   app.post(apiURI + "/createUserPet", petController.createUserPet);
   // app.get(apiURI + "/getAllUsers", userController.getAllUsers);
   // app.get(apiURI + "/getAllTypes", petController.getAllTypes);
   // app.get(apiURI + "/getAllPets", petController.getAllPets);
   app.use(express.static(rootDir));
};