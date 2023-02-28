require("dotenv").config;
const express = require("express");
const router = express.Router();
const cartController = require("../controllers/cart");

const controller = new cartController();

const cookieParser = require("cookie-parser"); // parse all the cookies we have

router.use(cookieParser());
router.use(express.json());

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

router.post("/:productID/:userID", (req, res) => {
  console.log("made it to routes");
  controller.addToCart(req, res);
});

router.get("/:userID", (req, res) => {
  console.log("made it to routes");
  controller
    .getCartItems(req, res)
    .then((result) => {
      res.status(200).json(result);
    })
    .catch((err) => {
      res.status(404).json(err);
    });
});

router.delete("/:productID/:userID", (req, res) => {
  controller.deleteFromCart(req, res);
});

module.exports = router;
