var express = require("express");
var router = express.Router();
var db = require("./connection.js");
const { route } = require("./index.js");

/* GET users listing. */
router.get("/read", function (req, res, next) {
  const sql = "SELECT * FROM users";

  db.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});

router.post("/login", function (req, res, next) {
  const data = req.body;
  const query = `insert into users (username, password) VALUES ('${data.username}', '${data.password}')`;
  console.log(req.body.username);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

router.post("/register", function (req, res, next) {
  const data = req.body;
  const query = `insert into users (id, username, email, password, token) VALUES ('${data.id}', '${data.username}', '${data.email}', '${data.password}', '${data.token}')`;
  console.log(req.body.username);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

router.get("/trial", function (req, res, next){
  console.log("Hello");
});

module.exports = router;
