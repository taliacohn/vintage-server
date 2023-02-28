const wishlistDB = require("../database/wishlist");

class WishlistController {
  async addToWishlist(req, res) {
    console.log("in the controller");
    const { productID, userID } = req.params;
    wishlistDB
      .addToWishlist(productID, userID)
      .then((result) => {
        console.log("result: " + result);
        res.status(200).json(result);
      })
      .catch((err) => {
        console.log("error: " + err);
        res.status(404).json(err);
      });
  }

  async getWishlist(req, res) {
    console.log("in the cart controller");
    return new Promise((resolve, reject) => {
      const { userID } = req.params;
      wishlistDB
        .getWishlist(userID)
        .then((result) => {
          console.log(result);
          resolve(result);
        })
        .catch((error) => {
          console.log(error);
          reject(error);
        });
    });
  }

  async deleteFromWishlist(req, res) {
    return new Promise((resolve, reject) => {
      const { productID, userID } = req.params;
      wishlistDB
        .deleteFromWishlist(productID, userID)
        .then((result) => {
          res.json(result);
          resolve();
        })
        .catch((error) => {
          reject(error);
        });
    });
  }
}

module.exports = WishlistController;
