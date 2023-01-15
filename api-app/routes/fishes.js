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

router.get("/fish", function (req, res, next) {
  const data = req.body;
  const query = `select * from fishes where id = '${data.id}'`;
  
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
  const query = `update fishes set name = '${data.name}', description= '${data.description}', price = '${data.price}', image_path = '${data.image_path}' where id = '${data.id}' and user_id = '${data.user_id}'`;

  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});



module.exports = router;