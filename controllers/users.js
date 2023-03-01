const userDB = require("../database/user");
// const express = require("express");
// const router = express.Router();

// const cookieParser = require("cookie-parser"); // parse all the cookies we have
// router.use(cookieParser());
// router.use(express.json());

class UserController {
  async signUp(req, res) {
    const { firstName, lastName, password, email } = req.body;
    const result = await userDB.signUp(firstName, lastName, password, email);
    console.log(result);
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
      const userId = req.params;
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
      console.log("userId: " + userId.id);
      userDB
        .updateInfo(
          userId.id,
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
}

module.exports = UserController;
