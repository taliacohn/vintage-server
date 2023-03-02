require('dotenv').config();
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const bodyParser = require('body-parser'); // parsing all req.body elements we get
const cookieParser = require('cookie-parser'); // parse all the cookies we have
const session = require('express-session'); // creating sessions and maintaining them
const cookieSession = require('cookie-session');

const app = express();

const port = process.env.PORT || 3001;

const oneDay = 60 * 60 * 24 * 1000;

app.use(
  session({
    key: 'userId',
    secret: 'subscribe',
    resave: false,
    saveUninitialized: false,
    cookie: {
      expires: oneDay,
    },
  })
);

app.use(bodyParser.json());
app.use(morgan('short'));

app.use(express.json()); // parsing every json object sent from front end
app.use(
  cors({
    origin: ['http://localhost:3000'],
    methods: ['GET', 'POST'],
    credentials: true, // allows the cookie to be enabled
  })
);

const userRouter = require('./routes/users.js');
app.use(userRouter);

//app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.urlencoded({ extended: true }));

// ??
app.use(express.static(__dirname));

app.use(cookieParser());

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

app.listen(port, () => {
  console.log(`running server on ${port}`);
});

module.exports = app;
