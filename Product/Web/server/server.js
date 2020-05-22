const express = require("express");
const bodyParser = require('body-parser');
const path = require("path");
const fs = require("fs");
const sql = require("sqlite3");
const config = require("./config");
const createSqlDb = require("./createSqlDb");
const insertSqlDb = require("./insertSqlDb");
const clientDir = path.join(__dirname, "../client");
const rootDir = path.join(clientDir, "build");
const app = express();
const dbFile = "./server/data.db";
let db;

app.use(bodyParser.json());
app.use(lowercaseUrl);
app.use(addDbToReq); //add db to req object

require("./routes")(app, express, path, rootDir);
startServer();

async function startServer() {    
    if (fs.existsSync(dbFile)) {
        db = new sql.Database(dbFile);        
    } else {
        db = new sql.Database(dbFile);
        await createDb();
    }
    require("./mqtt")(db);
    app.listen(config.port, config.host, () => { console.log("Server running at", config.domainName); });
}

function lowercaseUrl(req, res, next) {
    req.url = req.url.toLowerCase();
    next();
}

function addDbToReq(req, res, next) {
    req.db = db;    
    next();
}

async function createDb() {
    console.log("Creating DB..");
    let promise = new Promise((res, rej) => {
        db.serialize(()=> {
            createSqlDb.create(db);
            insertSqlDb.insert(res, db);
        });
    });
    await promise;
}