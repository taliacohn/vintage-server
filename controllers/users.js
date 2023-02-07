const userDB = require("../database/userDB");
// const express = require("express");
// const router = express.Router();

// const cookieParser = require("cookie-parser"); // parse all the cookies we have
// router.use(cookieParser());
// router.use(express.json());

class UserController {
  signUp(req, res) {
    return new Promise((resolve, reject) => {
      console.log(req.body);
      const { firstName, lastName, email, password } = req.body;
      userDB
        .signUp(firstName, lastName, email, password)
        .then((result) => {
          console.log(result);
          resolve(result);
        })
        .catch((error) => {
          reject(error);
        });
    });
  }

  login(req, res) {
    return new Promise((resolve, reject) => {
      const { email, password } = req.body;
      userDB
        .login(email, password)
        .then((result) => {
          console.log(result);
          if (result.user) {
            const user = JSON.parse(result.user);
            console.log(user);
            req.session.user = {
              id: user.id,
              email: user.email,
              firstName: user.firstName,
              lastName: user.lastName,
              streetNumber: user.streetNumber || "",
              streetName: user.streetName || "",
              city: user.city || "",
              postalCode: user.postalCode || "",
              country: user.country || "",
              phoneNumber: user.phoneNumber || "",
              mainImg: user.mainIMG || "",
            };
            resolve({ loggedIn: true, user: req.session.user });

            console.log(result.loggedIn);
          } else {
            console.log("result.message is: " + result.message);
            reject({ loggedIn: false, message: `${result.message}` });
          }
        })
        .catch((err) => {
          console.log(err.message);
          reject({ loggedIn: false, message: err.message });
        });
    });
  }

  editUserInfo(req, res) {
    return new Promise((resolve, reject) => {
      console.log("now in controllers");
      const { userId } = req.params;
      const {
        firstName,
        lastName,
        mainImg,
        streetNumber,
        streetName,
        city,
        country,
        postalCode,
      } = req.body;
      userDB
        .updateInfo(
          userId,
          firstName,
          lastName,
          mainImg,
          streetNumber,
          streetName,
          city,
          country,
          postalCode
        )
        .then((result) => {
          console.log(result);
          console.log("updating info");
          resolve({ result: result });
        })
        .catch((error) => {
          console.log(error.message);
          console.log(error);
          reject({ error: error });
        });
    });
  }
  //     const result = await userDB.login(email, password);
  //     console.log(result);
  //     if (result.user) {
  //       const user = JSON.parse(result.user);
  //       console.log(user);
  //       req.session.user = {
  //         id: user.id,
  //         email: user.email,
  //         firstName: user.firstName,
  //         lastName: user.lastName,
  //         streetNumber: user.streetNumber || "",
  //         streetNumber: user.streetNumber || "",
  //         city: user.city || "",
  //         postalCode: user.postalCode || "",
  //         country: user.country || "",
  //         phoneNumber: user.phoneNumber || "",
  //         mainImg: user.mainIMG || "",
  //       };
  //       resolve({ loggedIn: true, user: req.session.user });

  //       console.log(result.loggedIn);
  //     } else {
  //       reject({ loggedIn: false, message: `${result.message}` });
  //     }
  //   })
  // }

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
