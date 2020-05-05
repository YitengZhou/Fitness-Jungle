const express = require("express");
const bodyParser = require('body-parser');
const path = require("path");
const fs = require("fs");
const sql = require("sqlite3");
const config = require("./config");
const mqtt = require("./mqtt");
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

    // if (!fs.existsSync(rootDir) || !fs.existsSync(rootDir + "/index.html")) {
    //     console.error("Root directory or index.html is not found");
    //     process.exit(1);
    // }
    // mqtt.connect();
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
            createSql(res);
        });
    });
    await promise;
}

function createSql(res) {
    db.run(`create table User (id INTEGER PRIMARY KEY, username, password, name_first, name_last, email, image_path)`); //PRIMARY KEY autoincrements
    db.run(`create table PetType (id INTEGER PRIMARY KEY, name, image_path)`);
    db.run(`create table Pet (id INTEGER PRIMARY KEY, name, image_path, pettype_id)`, function(err) {
        if (err) {
            return console.error(err.message); //TODO exit program
        }    
        console.log("DB created successfully.");         
        return res();
    });   
}