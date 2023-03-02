const expressSession = require('express-session');
const RedisStore = require('connect-redis')(expressSession);
require('dotenv').config();

const session = expressSession({
  store: new RedisStore({ url: 'redis://localhost:6379' }),
  key: process.env.SESSION_KEY,
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: {
    expires: Number(process.env.ONEDAY),
  },
});

module.exports = session;
