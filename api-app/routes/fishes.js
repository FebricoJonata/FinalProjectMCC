var express = require("express");
var router = express.Router();
var db = require("./connection.js");
const { route } = require("./index.js");

/* GET users listing. */
router.get("/allfishes", function (req, res, next) {
  const sql = "SELECT f., u.username,  FROM fishes f join users u on u.user_id = f.user_id join fish_types ft on ft.fish_types_id = f.fish_types_id";

  db.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});

router.post("/addfish", function (req, res, next) {
  const data = req.body;
  const query = `insert into fishes (id, user_id, fish_types_id, name, description, price, image_path) VALUES ('${data.id}', '${data.user_id}', '${data.fish_types_id}', '${data.name}', '${data.description}', '${data.price}')`;
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