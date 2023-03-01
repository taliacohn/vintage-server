const passwordDB = require('../database/forgot-password');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const bcrypt = require('bcrypt');
const JWT_SECRET = 'dfdgfdgfdh454656*&^%$#fghj#$%^&5678';
const saltRound = 10;

class ForgotPasswordController {
  async forgotPassword(req, res) {
    const { email } = req.body;
    try {
      const oldUser = await passwordDB.checkUserExists(email);
      console.log(oldUser);

      if (!oldUser) {
        res.status(404).json({
          message: 'Did not create user',
        });
      }

      const secret = JWT_SECRET + oldUser[0].password;

      const token = jwt.sign(
        { email: oldUser[0].email, id: oldUser[0].id },
        secret,
        {
          expiresIn: '5m',
        }
      );

      const link = `http://localhost:3001/forgot-password/reset-password/${oldUser[0].id}/${token}`;

      var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'taliacohn3@gmail.com',
          pass: 'ptyxhxeccqonkwjh',
        },
      });

      var mailOptions = {
        from: 'youremail@gmail.com',
        to: email,
        subject: 'Password Reset',
        text: link,
      };

      transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
          console.log('error');
          console.log(error);
        } else {
          console.log('Email sent: ' + info.response);
        }
      });
      console.log(link);
      res.status(200).json({ message: 'Email sent!' });
    } catch (error) {
      res.status(404).json({
        message: 'Did not create user',
      });
    }
  }

  async resetPassword(req, res) {
    const { id, token } = req.params;
    console.log(req.params);
    const oldUser = await passwordDB.validateUser(id);
    if (!oldUser) {
      res.json({ status: 'User does not exist!' });
    }
    const secret = JWT_SECRET + oldUser[0].password;
    try {
      const verify = jwt.verify(token, secret);
      res.render('index', { email: verify.email, status: 'Not verified' });
    } catch (error) {
      res.send('Not verified');
    }
  }

  async resetPasswordPost(req, res) {
    const { id, token } = req.params;
    const { password } = req.body;

    const oldUser = await passwordDB.validateUser(id);
    if (!oldUser) {
      res.json({ status: 'User does not exist!' });
    }
    const secret = JWT_SECRET + oldUser[0].password;
    try {
      const verify = jwt.verify(token, secret);
      const encryptedPassword = await bcrypt.hash(password, saltRound);
      await passwordDB.updatePassword(encryptedPassword, id);

      //res.json({ status: 'Password Updated' });

      res.render('index', { email: verify.email, status: 'verified' });
    } catch (error) {
      console.log('error' + error);
      console.log(error);
      res.json({ status: 'Something went wrong' });
      //res.render('index', { status: 'verification failed' });
    }
  }
}

module.exports = ForgotPasswordController;
