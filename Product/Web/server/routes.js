const apiURI = "/api";
const userControllerURI = "/user";
const petControllerURI = "/pet";
const userController = require("./controllers/user");
const petController = require("./controllers/pet");

module.exports = function (app, express, path, rootDir) {
   app.get(apiURI + userControllerURI + "/getAllUsers", userController.getAllUsers);
   app.post(apiURI + userControllerURI + "/getUser", userController.getUser);
   app.post(apiURI + userControllerURI + "/addUser", userController.addUser);
   
   app.get(apiURI + petControllerURI + "/getAllTypes", petController.getAllTypes);
   app.get(apiURI + petControllerURI + "/getAllPets", petController.getAllPets);
   app.use(express.static(rootDir));
};