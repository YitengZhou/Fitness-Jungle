const apiURI = "/api";
const userControllerURI = "/user";
const userController = require("./controllers/user");

module.exports = function (app, express, path, rootDir) {
   app.get(apiURI + userControllerURI + "/getAllUsers", userController.getAllUsers);
   app.use(express.static(rootDir));
};