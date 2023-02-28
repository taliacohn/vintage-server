const { resolve } = require("path");
const productsDB = require("../database/products");
// const express = require("express");
// const router = express.Router();

// const cookieParser = require("cookie-parser"); // parse all the cookies we have
// router.use(cookieParser());
// router.use(express.json());

class ProductController {
  async getProducts(req, res) {
    return new Promise((resolve, reject) => {
      console.log("in the controller");
      const { category } = req.params;
      productsDB
        .getProducts(category)
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

  async getOneProduct(req, res) {
    return new Promise((resolve, reject) => {
      const { id } = req.params;
      productsDB
        .getOneProduct(id)
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
}

module.exports = ProductController;
