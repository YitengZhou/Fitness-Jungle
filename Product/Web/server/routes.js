const apiURI = "/api";
const userControllerURI = "/user";
const petControllerURI = "/pet";
const userController = require("./controllers/user");
const petController = require("./controllers/pet");

module.exports = function (app, express, path, rootDir) {
   app.get(apiURI + userControllerURI + "/getAllUsers", userController.getAllUsers);
   app.get(apiURI + petControllerURI + "/getAllTypes", petController.getAllTypes);
   app.use(express.static(rootDir));
};