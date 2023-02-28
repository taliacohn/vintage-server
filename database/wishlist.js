const pool = require("./db-connection");

exports.addToWishlist = async (productID, userID) => {
  const connection = await pool.getConnection();
  const [rows] = await connection.query(
    `INSERT INTO wishlist (userID, productID) VALUES (?, ?)`,
    [userID, productID]
  );
  connection.release();
  return await rows[0];
};

exports.getWishlist = (userID) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT p.id, p.name, p.price, MAX(i.imgURL) as imgURL FROM product p 
      JOIN product_image i ON p.id = i.productID JOIN wishlist w ON p.id = w.productID WHERE w.userID = ? GROUP BY p.id, p.name, p.price`,
      [userID]
    );
    if (rows.length) {
      resolve(rows);
    } else {
      reject(new Error("No items in wishlist"));
    }
    connection.release();
  });
};

exports.deleteFromWishlist = (productID, userID) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    await connection.query(
      `DELETE from wishlist where productID = ? AND userID = ?`,
      [productID, userID]
    );
    connection.release();
    resolve({ deletedProductId: productID });
  });
};
