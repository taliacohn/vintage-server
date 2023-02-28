const pool = require("./db-connection");

exports.addToCart = async (productID, userID) => {
  const connection = await pool.getConnection();
  const [rows] = await connection.query(
    `INSERT INTO cart (userID, productID) VALUES (?, ?)`,
    [userID, productID]
  );
  connection.release();
  return await rows[0];
};

exports.getCartItems = (userID) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT p.id, p.name, p.price, MAX(i.imgURL) as imgURL FROM product p 
      JOIN product_image i ON p.id = i.productID JOIN cart c ON p.id = c.productID WHERE c.userID = ? GROUP BY p.id, p.name, p.price`,
      [userID]
    );
    if (rows.length) {
      resolve(rows);
    } else {
      reject(new Error("No items in cart"));
    }
    connection.release();
  });
};

exports.deleteFromCart = (productID, userID) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    await connection.query(
      `DELETE from cart where productID = ? AND userID = ?`,
      [productID, userID]
    );
    connection.release();
    resolve({ deletedProductId: productID });
  });
};
