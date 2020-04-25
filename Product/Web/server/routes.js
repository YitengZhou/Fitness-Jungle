const apiURI = "/api";

module.exports = function (app, express, path, rootDir) {
   app.use(express.static(rootDir));
};