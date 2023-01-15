var express = require("express");
var router = express.Router();
var db = require("./connection.js");

/* GET users listing. */
router.get("/read", function (req, res, next) {
  const sql = "SELECT * FROM users";

  db.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});

router.post("/test", function (req, res, next) {
  const data = req.body;
  const query = `insert into users (id, username, email, password, token) VALUES ('${data.id}', '${data.username}', '${data.email}', '${data.password}', '${data.token}')`;
  console.log(req.body.username);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

module.exports = router;
