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
  const query = `INSERT INTO users (username, password) VALUES ('${data.username}', '${data.password}')`;
  console.log(req.body.username);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

module.exports = router;
