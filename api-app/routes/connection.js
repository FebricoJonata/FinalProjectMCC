const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "mcclab",
});

// connection.connect(function (err) {
//   if (err) throw err;
//   console.log("Connected!");
// });

connection.connect();

module.exports = connection;
