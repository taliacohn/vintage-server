const pool = require("./db-connection");

const bcrypt = require("bcrypt");
const saltRound = 10;

exports.signUp = async (firstName, lastName, password, email) => {
  return new Promise(async (resolve, reject) => {
    bcrypt.hash(password, saltRound, async (err, hash) => {
      if (err) {
        console.log(err);
        reject(err);
        return;
      }
      const connection = await pool.getConnection();
      const [result] = await connection.execute(
        `INSERT INTO user (firstName, lastName, password, email) VALUES (?, ?, ?, ?)`,
        [firstName, lastName, hash, email]
      );
      connection.release();
      console.log(result);
      resolve({ id: result.insertId });
    });
  });
};

exports.login = (email, password) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM user WHERE email = ?`,
      [email]
    );
    connection.release();
    if (rows.length) {
      const response = await bcrypt.compare(password, rows[0].password);
      if (response) {
        result = JSON.stringify(rows[0]);
        console.log("Successful login");
        console.log(result);
        resolve({ loggedIn: true, user: result });
      } else reject({ message: "Incorrect Password" });
    } else reject({ message: "User Not Found" });
  });
};

exports.updateInfo = (
  userId,
  firstName,
  lastName,
  mainImg,
  streetNumber,
  streetName,
  city,
  country,
  postalCode
) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    if (connection) {
      console.log("connected");
    }
    console.log(
      userId,
      firstName,
      lastName,
      mainImg,
      streetName,
      streetNumber,
      city,
      country,
      postalCode
    );
    console.log(streetNumber);
    connection
      .query(
        `UPDATE user SET firstName = ?, lastName = ?, mainIMG = ?, streetNumber = ?, streetName = ?, city = ?, country = ?, postalCode = ? WHERE id = ?;`,
        [
          firstName,
          lastName,
          mainImg,
          streetNumber,
          streetName,
          city,
          country,
          postalCode,
          userId,
        ]
      )
      .then((result) => {
        console.log(result);
        connection.release();
        resolve(result);
      })
      .catch((error) => {
        console.log(error);
        connection.release();
        reject({ err });
      });
  });
};
