const mysql = require("mysql");

const pool = mysql.createPool({
  connectionLimit: process.env.CONNECT_LIMIT,
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  password: process.env.DB_PASS,
  database: process.env.MYSQL_DB,
});

module.exports = pool;
