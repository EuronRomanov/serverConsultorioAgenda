const mysql=require("mysql2");
const dbConfig=require("../config/db.config.js");

const connection=mysql.createPool({
    host:dbConfig.HOST,
    user:dbConfig.USER,
    password:dbConfig.PASSWORD,
    database:dbConfig.DB,
    waitForConnections: true,
   multipleStatements: true,
   connectionLimit:10,
   timezone: "+00:00"
});
/*
connection.connect((error)=> {
    if(error) throw error;
    console.log("Successfully connected to the database.");
});
*/
module.exports=connection;