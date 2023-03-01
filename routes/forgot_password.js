require("dotenv").config;
const express = require("express");
const router = express.Router();
const forgotPasswordController = require("../controllers/forgot-password");

const controller = new forgotPasswordController();

const cookieParser = require("cookie-parser"); // parse all the cookies we have

router.use(cookieParser());
router.use(express.json());

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

router.post("/submit-email", (req, res) => {
  controller.forgotPassword(req, res);
});

router.get("/reset-password/:id/:token", (req, res) => {
  controller.resetPassword(req, res);
});

router.post("/reset-password/:id/:token", (req, res) => {
  controller.resetPasswordPost(req, res);
});

module.exports = router;
