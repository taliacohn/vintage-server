const pool = require("./db-connection");

const bcrypt = require("bcrypt");
const saltRound = 10;

exports.signUp = (firstName, lastName, password, email) => {
  bcrypt.hash(password, saltRound, async (err, hash) => {
    if (err) console.log(err);
    const connection = await pool.getConnection();
    const [rows, fields] = await connection.execute(
      `INSERT INTO user (firstName, lastName, password, email) VALUES (?, ?, ?, ?)`,
      [firstName, lastName, password, email]
    );
    connection.release();
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
    connection.release();
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
