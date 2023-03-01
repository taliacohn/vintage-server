const pool = require('./db-connection');

const bcrypt = require('bcrypt');
const saltRound = 10;

exports.checkUserExists = (email) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM user WHERE email = ?`,
      [email]
    );
    connection.release();
    if (rows.length) {
      resolve(rows);
    } else reject(rows);
  });
};

exports.validateUser = (id) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(`SELECT * FROM user WHERE id = ?`, [
      id,
    ]);
    connection.release();
    if (rows.length) {
      resolve(rows);
    } else reject(rows);
  });
};

exports.updatePassword = (password, id) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `Update user SET password = ? WHERE id = ?`,
      [password, id]
    );
    connection.release();

    if (rows) {
      resolve(rows);
    } else reject(rows);
  });
};
