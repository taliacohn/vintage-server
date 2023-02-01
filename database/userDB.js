const pool = require("./db-connection");

const bcrypt = require("bcrypt");
const saltRound = 10;

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

exports.login = (email, password) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM user WHERE email = ?`,
      [email]
    );
    if (rows.length) {
      const response = await bcrypt.compare(password, rows[0].password);
      if (response) {
        result = JSON.stringify(rows[0]);
        console.log("Successful login");
        resolve({ loggedIn: true, user: result });
      } else reject({ message: "Incorrect Password" });
    } else reject({ message: "User Not Found" });
  });
};
//   try {
//     const connection = await pool.getConnection();

//     // check if username exists
//     const [rows] = await connection.query(
//       `SELECT * FROM user WHERE email = ?`,
//       [email]
//     );
//     if (rows.length === 0) {
//       console.log("User not found");
//       rej({ loggedIn: false, message: "User not found" });
//     }

//     // compare password with hased password
//     const isValid = await bcrypt.compare(password, rows[0].password);

//     if (isValid) {
//       result = JSON.stringify(rows[0]);
//       console.log("Successful login");
//       res({ loggedIn: true, user: result });
//     } else {
//       console.log("Incorrect password");
//       rej({ loggedIn: false, message: "Incorrect password" });
//     }
//   } catch (err) {
//     console.log(err);
//     return false;
//   }
// };

//       (err, result) => {
//         if (err) result.send({ err });
//         if (result.length) {
//           bcrypt.compare(password, result[0].password, (error, response) => {
//             if (response) {
//               console.log("response: " + response);
//               req.session.user = result[0];
//               console.log("req.session.user: " + req.session.user);
//             }
//           });
//         }
//       }
//     );
//     console.log(rows);
//     connection.release();
//   } catch (err) {
//     console.log(err);
//   }
// };

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
