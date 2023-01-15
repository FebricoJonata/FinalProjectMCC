var express = require("express");
var router = express.Router();
var db = require("./connection.js");
const { route } = require("./index.js");

/* GET fishes listing. */
router.get("/allfishes", function (req, res, next) {
  const query = `select image_path, name, price from fishes f`;
  
  db.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.send(result);
  });
});

router.post("/addfish", function (req, res, next) {
  const data = req.body;
  const query = `insert into fishes (id, user_id, name, description, price, image_path, fish_types_id) VALUES ('${data.id}', '${data.user_id}', '${data.name}', '${data.description}', '${data.price}', '${data.image_path}', '${data.fish_types_id}')`;
  console.log(req.body.username);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

router.post("/editfish", function (req, res, next) {
  const data = req.body;
  // diganti
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