require("dotenv").config;
const express = require("express");
const router = express.Router();
const productController = require("../controllers/products");

const controller = new productController();

const cookieParser = require("cookie-parser"); // parse all the cookies we have

router.use(cookieParser());
router.use(express.json());

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

router.get("/:category", (req, res) => {
  console.log("made it to routes");
  controller
    .getProducts(req, res)
    .then((result) => {
      console.log("result: " + result);
      res.status(200).json(result);
    })
    .catch((err) => {
      console.log("error: " + err);
      res.status(404).json(err);
    });
});

module.exports = router;
