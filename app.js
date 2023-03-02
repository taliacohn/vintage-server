require('dotenv').config();

const createError = require('http-errors');
const express = require('express');
const path = require('path');
const morgan = require('morgan');

const bodyParser = require('body-parser');
const session = require('./session/session');
// const session = require("express-session");
const cookieSession = require('cookie-session');

const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');

const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users');
const productsRouter = require('./routes/products');
const cartRouter = require('./routes/cart');
const wishlistRouter = require('./routes/wishlist');
const forgotPasswordRouter = require('./routes/forgot_password');

const jwt = require('jsonwebtoken');

const JWT_SECRET = 'dfdgfdgfdh454656*&^%$#fghj#$%^&5678';

const app = express();
//const port = process.env.PORT || 3001;

// view engine setup
app.set('views', path.join(__dirname, 'views'));

// app.set('view engine', 'jade');
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(morgan('short'));

app.use(
  cors({
    origin: ['https://vintage-front.onrender.com/'],
    methods: ['GET', 'POST', 'DELETE', 'PUT'],
    credentials: true,
  })
);
app.use(session);

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/products', productsRouter);
app.use('/cart', cartRouter);
app.use('/wishlist', wishlistRouter);
app.use('/forgot-password', forgotPasswordRouter);

app.get('/', (req, res) => {
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.send('API is running...');
});

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

// app.listen(port, () => {
//   console.log(`running server on ${port}`);
// });

module.exports = app;
