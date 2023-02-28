const cartDB = require("../database/cart");
// const express = require("express");
// const router = express.Router();

// const cookieParser = require("cookie-parser"); // parse all the cookies we have
// router.use(cookieParser());
// router.use(express.json());

class CartController {
  async addToCart(req, res) {
    console.log("in the controller");
    const { productID, userID } = req.params;
    cartDB
      .addToCart(productID, userID)
      .then((result) => {
        console.log("result: " + result);
        res.status(200).json(result);
      })
      .catch((err) => {
        console.log("error: " + err);
        res.status(404).json(err);
      });
  }

  async getCartItems(req, res) {
    console.log("in the cart controller");
    return new Promise((resolve, reject) => {
      const { userID } = req.params;
      cartDB
        .getCartItems(userID)
        .then((result) => {
          console.log(result);
          resolve(result);
        })
        .catch((error) => {
          console.log(error);
          reject(error);
        });
    });
  }

  async deleteFromCart(req, res) {
    return new Promise((resolve, reject) => {
      const { productID, userID } = req.params;
      cartDB
        .deleteFromCart(productID, userID)
        .then((result) => {
          res.json(result);
          resolve();
        })
        .catch((error) => {
          reject(error);
        });
    });
  }
}

module.exports = CartController;
