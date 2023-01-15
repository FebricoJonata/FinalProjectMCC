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
    res.send(result);
  });
});

router.get("/login", function (req, res, next) {
  const data = req.body;
  const query = `select * from users where email = "${data.email}" and password = "${data.password}"`;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

router.post("/register", function (req, res, next) {
  const data = req.body;
  const query = `insert into users (user_id, email, username, password, token) VALUES ('${data.user_id}', '${data.email}', '${data.username}', '${data.password}', '${data.token}')`;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

module.exports = router;
