const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.MYSQL_DB,
  connectionLimit: process.env.CONNECT_LIMIT,
});

// const pool = mysql.createPool({
//   connectionLimit: process.env.CONNECT_LIMIT,
//   user: process.env.DB_USER,
//   host: process.env.DB_HOST,
//   password: process.env.DB_PASS,
//   database: process.env.MYSQL_DB,
// });

// const connection = mysql.createConnection({
//   host: process.env.DB_HOST,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASS,
//   database: process.env.MYSQL_DB,
// });

module.exports = pool;
