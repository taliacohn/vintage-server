const pool = require("./db-connection");

exports.getProducts = (category) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    let rows;
    if (category === "all") {
      [rows] = await connection.query(
        `SELECT p.id, p.name, p.price, MAX(i.imgURL) as imgURL
        FROM product p
        JOIN product_image i ON p.id = i.productID
        GROUP by p.id, p.name, p.price`
      );
    } else {
      [rows] = await connection.query(
        `SELECT p.id, p.name, p.price, MAX(i.imgURL) as imgURL
          FROM product p
          JOIN product_category c ON p.categoryID = c.id
          JOIN product_image i ON p.id = i.productID
          WHERE c.name = ?
          GROUP by p.id, p.name, p.price`,
        [category]
      );
    }
    if (rows.length) {
      resolve(rows);
    } else {
      reject(new Error("No products found"));
    }
    connection.release();
  });
};

exports.getOneProduct = (id) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT p.id, p.name, p.price, p.description, i.imgURL
        FROM product p
        JOIN product_image i ON p.id = i.productID
        WHERE p.id = ?`,
      [id]
    );
    if (rows.length) {
      const products = {};
      rows.forEach((row) => {
        if (!products[row.id]) {
          products[row.id] = {
            id: row.id,
            name: row.name,
            price: row.price,
            description: row.description,
            imgURLs: [],
          };
        }
        products[row.id].imgURLs.push(row.imgURL);
      });
      const product = Object.values(products)[0];
      console.log("product in database " + product);
      resolve(product);
    } else {
      reject(new Error("No product found"));
    }
    connection.release();
  });
};

exports.searchResults = (searchQuery) => {
  return new Promise(async (resolve, reject) => {
    const connection = await pool.getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM products WHERE name LIKE '%?%'`,
      [searchQuery]
    );
  });
};
