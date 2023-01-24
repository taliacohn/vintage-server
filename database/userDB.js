const bcrypt = require("bcrypt");
const saltRound = 10;

const db = require("./db-connection");

exports.signUp = (firstName, lastName, password, email) => {
  bcrypt.hash(password, saltRound, async (err, hash) => {
    if (err) console.log(err);
    const [rows, fields] = await db.execute(
      `INSERT INTO user (firstName, lastName, password, email) VALUES (?, ?, ?, ?)`,
      [firstName, lastName, password, email]
    );
    return await rows[0];
  });
};

exports.login = async (email, password) => {
  const [rows, fields] = await db.execute(
    `SELECT * FROM user WHERE email = ?`,
    [email],
    (err, result) => {
      if (err) result.send({ err });
      if (result.length) {
        bcrypt.compare(password, result[0].password, (error, response) => {
          if (response) {
            console.log("response: " + response);
            req.session.user = result[0];
            console.log("req.session.user: " + req.session.user);
          }
        });
      }
    }
  );
  return await rows;
};

// exports.updateUser = (firstName, lastName, mainImg, userId) => {
//   return new Promise((resolve, reject) => {
//     connection.query(
//       `UPDATE user SET firstName = "${firstName}", lastName = "${lastName}", mainIMG = "${mainImg}" WHERE id = ${userId};`,
//       (error) => {
//         if (error) {
//           return reject(error);
//         }
//         return resolve();
//       }
//     );
//   });
// };

// router.updateAddress = (
//   streetNumber,
//   streetName,
//   city,
//   country,
//   postalCode,
//   userId
// ) => {
//   return new Promise((resolve, reject) => {
//     connection.query(
//       `INSERT into address (number, street, city, country, postalCode, userID) VALUES (${streetNumber}, "${streetName}", "${city}", "${country}", "${postalCode}", ${user.id});`,
//       (error) => {
//         if (error) {
//           return reject(error);
//         }
//         return resolve();
//       }
//     );
//   });
// };

// router.getAddressId = (userId) => {
//   return new Promise((resolve, reject) => {
//     connection.query(
//       `SELECT id from address where userID = ${userId}`,
//       (error, elements) => {
//         if (error) {
//           return reject(error);
//         }
//         return resolve(elements);
//       }
//     );
//   });
// };

// router.updateAddressId = (resultId, userId) => {
//   connection.query(
//     `UPDATE user SET addressID = ${resultId} WHERE id=${userId};`,
//     (error) => {
//       if (error) {
//         return reject(error);
//       }
//       return resolve();
//     }
//   );
// };

// module.exports = router;
