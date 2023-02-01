require("dotenv").config;
const express = require("express");
const router = express.Router();
const userController = require("../controllers/users");

const controller = new userController();

const cookieParser = require("cookie-parser"); // parse all the cookies we have

router.use(cookieParser());
router.use(express.json());

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

// router.get("/login", (req, res) => {
//   if (req.session.user) res.send({ loggedIn: true, user: req.session.user });
//   else res.send({ loggedIn: false });
// });

router.post("/signup", (req, res) => {
  controller.signUp(req, res);
});

router.post("/login", (req, res) => {
  controller
    .login(req, res)
    .then((result) => {
      console.log(result);
      res.status(200).json(result);
    })
    .catch((err) => {
      console.log(err);
      res.status(404).json(err);
    });
});

module.exports = router;

//router.post("/login", (req, res) => {
//   const email = req.body.email;
//   const password = req.body.password;

//   db.query(`SELECT * FROM user WHERE email = ?`, [email], (err, result) => {
//     if (err) {
//       res.send({ err: err });
//     }

//     if (result.length > 0) {
//       bcrypt.compare(password, result[0].password, (error, response) => {
//         console.log(result);
//         console.log(req.session);
//         if (response) {
//           req.session.user = result[0];
//           console.log(req.session.user);
//           user = req.session.user;
//           sessionEmail = req.session.user.email;
//           res.send(req.session.user);
//         } else {
//           res.send({ message: "Wrong username/password combination! " });
//         }
//       });
//       //res.send(result); // send to front end
//     } else {
//       res.send({ message: "User doesn't exist" });
//     }
//   });
// });

// router.post("/signup", (req, res) => {
//   const firstName = req.body.firstName;
//   const lastName = req.body.lastName;
//   const password = req.body.password;
//   const email = req.body.email;

//   bcrypt.hash(password, saltRounds, (err, hash) => {
//     if (err) {
//       console.log(err);
//     }
//     db.query(
//       `INSERT INTO user (firstName, lastName, password, email) VALUES("${firstName}", "${lastName}", "${hash}", "${email}")`,
//       (err, result) => {
//         if (err) {
//           res.send(err);
//         }
//         res.send(result);
//       }
//     );
//   });
// });

// router.get("/isLoggedIn", (req, res) => {
//   if (req.session.user) {
//     console.log("hi");
//     res.send({ loggedIn: true });
//   }
//   console.log("bye");
//   res.send({ loggedIn: false });
// });

// router.post("/userpage", (req, res) => {
//   console.log("running");

//   console.log(req.session);
//   //console.log(req.cookies.userId);
//   //const id = req.session.user[0].id;

//   if (req.session.user) {
//     console.log("querying..");
//     db.query(
//       `SELECT addressID from user WHERE id=${user.id}`,
//       (err, result) => {
//         console.log(result.addressID);
//         if (result.addressID == null) {
//           db.query(
//             `SELECT firstName, lastName from user WHERE id=${user.id}`,
//             (err, result) => {
//               if (err) {
//                 console.log(err);
//                 res.send({ err: err, message: "no info" });
//               }
//               console.log(result);
//               res.send({ loggedIn: true, user: result });
//             }
//           );
//         } else {
//           db.query(
//             `SELECT u.firstName, u.lastName, u.mainIMG, a.number, a.street, a.city, a.postalCode, a.country FROM user as u JOIN address as a ON u.addressID = a.id WHERE u.id=${user.id}`,
//             (err, result) => {
//               if (err) {
//                 console.log(err);
//                 res.send({ err: err });
//               }
//               if (result.length > 0) {
//                 //console.log(result);
//                 console.log(result);
//                 res.send({ loggedIn: true, user: result });
//               }
//             }
//           );
//         }
//       }
//     );
//   } else {
//     res.send({ loggedIn: false });
//   }
// });

// router.post("/editInfo", (req, res) => {
//   const firstName = req.body.firstName;
//   const lastName = req.body.lastName;
//   const mainImg = req.body.mainImg;
//   const streetNumber = req.body.streetNumber;
//   const streetName = req.body.streetName;
//   const city = req.body.city;
//   const country = req.body.country;
//   const postalCode = req.body.postalCode;

//   console.log("Street NAme: " + streetName);
//   console.log("Street Number  : " + streetNumber);

//   //console.log(userId);
//   //console.log(sessionEmail);

//   db.query(
//     `select addressID from user where id=${user.id}`,
//     async (err, result) => {
//       console.log(result[0].addressID);
//       if (result[0].addressID != null) {
//         console.log("address being updated...");
//         db.query(
//           `UPDATE user u, address a SET u.firstName = "${firstName}", u.lastName = "${lastName}", u.mainIMG = "${mainImg}", a.number = ${streetNumber}, a.street = "${streetName}", a.city = "${city}", a.country = "${country}", a.postalCode = "${postalCode}" WHERE a.userID = u.id AND u.id="${user.id}"`,
//           (err, result) => {
//             if (err) {
//               console.log(err);
//               res.send({ err: err });
//             } else {
//               console.log(result);
//               res.send({ infoUpdated: true });
//             }
//           }
//         );
//       } else {
//         try {
//           console.log("no address yet..");
//           await userQueries.updateUser(firstName, lastName, mainImg, user.id);
//         } catch (e) {
//           console.log();
//         }

//         try {
//           await db.query(
//             `UPDATE user SET firstName = "${firstName}", lastName = "${lastName}", mainIMG = "${mainImg}" WHERE id = ${user.id};`
//           );
//           await db.query(
//             `INSERT into address (number, street, city, country, postalCode, userID) VALUES (${streetNumber}, "${streetName}", "${city}", "${country}", "${postalCode}", ${user.id});`
//           );
//         } catch (err) {
//           console.log("error: " + err.message);
//         }
//       }
//     }
//   );
// });

// router.post("/login", (req, res) => {
//   const email = req.body.email;
//   const password = req.body.password;

//   db.query(`SELECT * FROM user WHERE email = ?`, [email], (err, result) => {
//     if (err) {
//       res.send({ err: err });
//     }

//     if (result.length > 0) {
//       bcrypt.compare(password, result[0].password, (error, response) => {
//         console.log(result);
//         console.log(req.session);
//         if (response) {
//           req.session.user = result[0];
//           console.log(req.session.user);
//           user = req.session.user;
//           sessionEmail = req.session.user.email;
//           res.send(req.session.user);
//         } else {
//           res.send({ message: "Wrong username/password combination! " });
//         }
//       });
//       //res.send(result); // send to front end
//     } else {
//       res.send({ message: "User doesn't exist" });
//     }
//   });
// });

// router.post("/logout", (req, res) => {
//   res.clearCookie("userId").send();
//   sessionEmail = "";
//   userId = "";
// });

// router.get("/user", (req, res) => {
//   db.query("SELECT * FROM user", (err, result) => {
//     if (err) {
//       res.send(err);
//     }
//     res.send(result);
//   });
// });
