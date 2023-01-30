const userDB = require("../database/userDB");
// const express = require("express");
// const router = express.Router();

// const cookieParser = require("cookie-parser"); // parse all the cookies we have
// router.use(cookieParser());
// router.use(express.json());

class UserController {
  async signUp(req, res) {
    const { firstName, lastName, password, email } = req.body;
    const result = await userDB.signUp(firstName, lastName, password, email);
    if (result.id) {
      res.status(201).json({
        //successful
        message: "User created",
      });
    } else {
      res.status(404).json({
        message: "Did not create user",
      });
    }
  }

  async login(req, res) {
    const { email, password } = req.body;
    const result = await userDB.login(email, password);
    console.log("login result:" + result);
  }

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

  // getUserAccount() {}
  // updateUserAccount() {}
}

module.exports = UserController;

// exports.updateUserAccount = async (req, res) => {
//   const firstName = req.body.firstName;
//   const lastName = req.body.lastName;
//   const mainImg = req.body.mainImg;
//   const streetNumber = req.body.streetNumber;
//   const streetName = req.body.streetName;
//   const city = req.body.city;
//   const country = req.body.country;
//   const postalCode = req.body.postalCode;
//   const result = await db.updateAccount(
//     firstName,
//     lastName,
//     mainImg,
//     streetNumber,
//     streetName,
//     city,
//     country,
//     postalCode,
//     result
//   );
//   if (result.id) {
//     res.status(200).json({
//       status: "okay",
//       data: { result },
//     });
//   } else {
//     res.status(404).json({
//       status: "fail",
//       data: `Unable to update account`,
//     });
//   }
// };
