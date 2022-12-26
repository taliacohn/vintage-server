const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const bodyParser = require("body-parser"); // parsing all req.body elements we get
const cookieParser = require("cookie-parser"); // parse all the cookies we have
const session = require("express-session"); // creating sessions and maintaining them
const cookieSession = require("cookie-session");

const bcrypt = require("bcrypt");
const { query } = require("express");
const saltRounds = 10;

const app = express();

const port = process.env.PORT || 3001;

app.use(express.json()); // parsing every json object sent from front end
app.use(
  cors({
    origin: ["http://localhost:3000"],
    methods: ["GET", "POST"],
    credentials: true, // allows the cookie to be enabled
  })
);

//app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.urlencoded({ extended: true }));

// ??
app.use(express.static(__dirname));

app.use(cookieParser());

const oneDay = 60 * 60 * 24 * 1000;

app.use(
  session({
    key: "userId",
    secret: "subscribe",
    resave: false,
    saveUninitialized: false,
    cookie: {
      expires: oneDay,
    },
  })
);

const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "Maxiecohn8",
  database: "vintage_store",
});

let sessionEmail;
let userId;

app.post("/signup", (req, res) => {
  const firstName = req.body.firstName;
  const lastName = req.body.lastName;
  const password = req.body.password;
  const email = req.body.email;

  bcrypt.hash(password, saltRounds, (err, hash) => {
    if (err) {
      console.log(err);
    }
    db.query(
      `INSERT INTO user (firstName, lastName, password, email) VALUES("${firstName}", "${lastName}", "${hash}", "${email}")`,
      (err, result) => {
        if (err) {
          res.send(err);
        }
        res.send(result);
      }
    );
  });
});

app.get("/isLoggedIn", (req, res) => {
  if (req.cookies.userId) {
    res.send({ loggedIn: true });
  } else {
    res.send({ loggedIn: false });
  }
});

app.post("/userpage", (req, res) => {
  console.log("running");
  console.log(sessionEmail);
  console.log(req.session);
  //console.log(req.cookies.userId);
  //const id = req.session.user[0].id;

  if (req.cookies.userId) {
    console.log("querying..");
    db.query(`SELECT addressID from user WHERE id=${userId}`, (err, result) => {
      console.log(result[0].addressID);
      if (result[0].addressID == null) {
        db.query(
          `SELECT firstName, lastName from user WHERE id=${userId}`,
          (err, result) => {
            if (err) {
              console.log(err);
              res.send({ err: err, message: "no info" });
            }
            console.log(result);
            res.send({ loggedIn: true, user: result });
          }
        );
      } else {
        db.query(
          `SELECT u.firstName, u.lastName, u.mainIMG, a.number, a.street, a.city, a.postalCode, a.country FROM user as u JOIN address as a ON u.addressID = a.id WHERE u.id=${userId}`,
          (err, result) => {
            if (err) {
              console.log(err);
              res.send({ err: err });
            }
            if (result.length > 0) {
              //console.log(result);
              console.log(result);
              res.send({ loggedIn: true, user: result });
            }
          }
        );
      }
    });
  } else {
    res.send({ loggedIn: false });
  }
});

app.post("/editInfo", (req, res) => {
  const firstName = req.body.firstName;
  const lastName = req.body.lastName;
  const mainImg = req.body.mainImg;
  const streetNumber = req.body.streetNumber;
  const streetName = req.body.streetName;
  const city = req.body.city;
  const country = req.body.country;
  const postalCode = req.body.postalCode;

  console.log(userId);
  console.log(sessionEmail);

  db.query(`select addressID from user where id=${userId}`, (err, result) => {
    console.log(result[0].addressID);
    if (result[0].addressID != null) {
      console.log("address being updated...");
      db.query(
        `UPDATE user u, address a SET u.firstName = "${firstName}", u.lastName = "${lastName}", u.mainIMG = "${mainImg}", a.number = ${streetNumber}, a.street = "${streetName}", a.city = "${city}", a.country = "${country}", a.postalCode = "${postalCode}" WHERE a.userID = u.id AND u.id="${userId}"`,
        (err, result) => {
          if (err) {
            console.log(err);
            res.send({ err: err });
          } else {
            console.log(result);
            res.send({ infoUpdated: true });
          }
        }
      );
    } else {
      console.log("no address yet..");
      db.query(
        `UPDATE user SET firstName = "${firstName}", lastName = "${lastName}", mainIMG = "${mainImg}" WHERE id = ${userId}; INSERT into address (number, street, city, country, postalCode, userID) VALUES (${streetNumber}, "${streetName}", "${city}", "${country}", "${postalCode}", "${userId}");`
      );
      db.query(
        `select id from address where userId = ${userId}`,
        (err, result) => {
          if (result) {
            console.log(result);
            console.log(result[0].id);
            db.query(
              `UPDATE user SET addressID = ${result[0].id} WHERE id=${userId};`,
              (err, result) => {
                if (err) {
                  console.log(err);
                  res.send({ err: err });
                } else {
                  res.send({ infoUpdated: true });
                }
              }
            );
          }
        }
      );
    }
  });
});

app.post("/login", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  db.query(`SELECT * FROM user WHERE email = ?`, [email], (err, result) => {
    if (err) {
      res.send({ err: err });
    }

    if (result.length > 0) {
      bcrypt.compare(password, result[0].password, (error, response) => {
        if (response) {
          req.session.user = result;
          sessionEmail = req.session.user[0].email;
          userId = req.session.user[0].id;
          res.send(req.session.user);
        } else {
          res.send({ message: "Wrong username/password combination! " });
        }
      });
      //res.send(result); // send to front end
    } else {
      res.send({ message: "User doesn't exist" });
    }
  });
});

app.post("/logout", (req, res) => {
  res.clearCookie("userId").send();
  sessionEmail = "";
  userId = "";
});

app.get("/user", (req, res) => {
  db.query("SELECT * FROM user", (err, result) => {
    if (err) {
      res.send(err);
    }
    res.send(result);
  });
});

app.listen(port, () => {
  console.log(`running server on ${port}`);
});
