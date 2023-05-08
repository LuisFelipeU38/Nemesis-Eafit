const express = require('express');
const router = express.Router();
const productoModel = require("../models/nemesis");


router.get('/', function(req, res, next) {
  res.sendFile(__dirname + '/index.html');
});

/* GET home page. */
router.get('/home', function(req, res, next) {
    res.sendFile(__dirname + '/home.html');
});

router.get('/login', function (req, res, next) {
  console.log("AQUI ESTOY");
  productoModel
      .login(req.query['email'], req.query['password'])
      .then(id_customer => {
          if (id_customer) {
              return res.status(200).redirect("/home");
          } else {
              console.error("Usuario o Constraseña incorrecta");
              return res.status(401).send("Usuario o Constraseña incorrecta");
      }})
      .catch(err => {
          console.error(err);
          console.error("Error connecting to DB")
          return res.status(404).send("Error connecting to DB");
      });

});

router.post('/register', function (req, res, next) {
    const username  = req.body.username;
  const email  = req.body.email;
  const password  = req.body.password;
  productoModel
      .postcrearUsuario(username, email, password)
      .then(results => {
          if (results) {
            return res.status(200).redirect("/home");
          } else {
              console.error("Error creando al usuario");
              return res.status(401).send("Error creando al usuario");
      }})
      .catch(err => {
          console.error("Error connecting to DB")
          return res.status(404).send("Error connecting to DB");
      });
});


module.exports = router;
