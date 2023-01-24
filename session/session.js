const expressSession = require("express-session");
require("dotenv").config();

const session = expressSession({
  key: process.env.SESSION_KEY,
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: {
    expires: process.env.ONEDAY,
  },
});

module.exports = session;
