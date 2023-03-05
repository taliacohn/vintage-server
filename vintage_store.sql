-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (arm64)
--
-- Host: localhost    Database: vintage_store
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `userID` int NOT NULL,
  `productID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (7,28),(7,32),(10,7),(10,15),(10,2),(10,2),(10,3),(10,10),(10,3),(10,29),(8,10),(8,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `shoppingCartID` int DEFAULT NULL,
  `productID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `shoppingCartID` (`shoppingCartID`),
  KEY `productID` (`productID`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`shoppingCartID`) REFERENCES `shopping_cart` (`id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `ordersID` int DEFAULT NULL,
  `productID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `ordersID` (`ordersID`),
  KEY `productID` (`productID`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`ordersID`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `categoryID` int DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'Vintage Salt and Pepper Wool Houndstooth Trousers','100% wool fabric. High waistline. Wide and slightly tapered leg. Relaxed fit. Tag reads size 12.',1,100.00,1),(3,'Vintage Candy Apple Viscose Blazer','100% viscose rayon fabric. Relaxed fit. Double breasted red button closure. Hand pockets. Slick inner lining. Tag reads size 12.',1,200.00,1),(4,'Vintage Silk Sleeveless Blouse','Soft and light 100% silk fabric. Skinny spaghetti string straps. Relaxed fit. Tag reads size 4.',1,150.00,1),(6,'Vintage Cocktail Dress','Jet black tone. Gorgeous 100% rayon fabric. Strapless silhouette. Rear zipper closure. Tag reads size M.',1,300.00,1),(7,'Vintage Silk Button Up Blouse','Pale pink tone. Soft and light 100% silk fabric. Wide v neckline. Mother of pearl button closure. Relaxed fit. Tag reads size L.',1,150.00,1),(8,'Vintage Ralph Lauren Wool Long Sleeve Polo','100% wool fabric. Button closure. Jet black tone. Relaxed fit. Tag reads size L.',1,200.00,1),(9,'Vintage Cotton Knit Henley','Dark olive tone. Comfy knit 100% cotton fabric. Tortoise button closure. Drop shoulders. Relaxed fit. Tag reads size L.',1,170.00,1),(10,'Vintage Cherry Shetland Wool Sweater','Bright red tone. 100% Scottish shetland wool fabric. Ribbed and stretch knit crewneck. Relaxed fit. Tag reads size M.',1,200.00,1),(11,'Vintage Black Lacoste Cotton Cable Knit Sweater','Black tone with classic green Lacoste crocodile embroidery. 100% cotton fabric. Shallow v-neckline. Relaxed fit. Tag reads size 6.',1,225.00,1),(13,'Vintage Cotton Blend Drop Shoulder Pullover','Lovely red wine tone. 100% cotton blend fabric. Classic crewneck and v-stich. Relaxed fit. Tag reads size XL.',1,85.00,1),(14,'Vintage Carbon Orlon Knit Cardigan','Jet black tone. 100% orlon acrylic fabric. Three-quarter sleeves. Black button closure. Tag reads size S.',1,125.00,1),(15,'Vintage Pure Wool Double Breasted Blazer','Dark blue tone. 100% pure wool fabric. Flattering peak lapel, darts, and padded shoulders. Relaxed fit. Tag reads size L.',1,225.00,1),(16,'Vintage Button Knit Cardigan','White with subtle ivory patina. Knitted fabric. Button closure. Relaxed fit. Tag reads size 34.',1,100.00,1),(17,'Vintage Sugar Cookie Silk Blouse','Pale yellow tone. 100% silk fabric. Notched collar. Cream tortoise button closure. Relaxed fit. Tag reads size 4P.',1,100.00,1),(18,'Vintage Silk Cowl Neck Blouse','Shimmering burgundy tone. 100% silk fabric. Flattering darts and side slits. Sleeveless silhouette. Rear zipper closure. Relaxed fit. Tag reads size 14.',1,100.00,1),(19,'Vintage Silk Embroidery Dress','Striking matte jet black tone. Red, green, and silver rose embroidery. 100% silk fabric. Ruffled neckline and hems. Relaxed fit. Tag reads size 8.',1,225.00,1),(20,'Vintage Ralph Lauren Quarter Zip','Gray tone. 90% merino wool and 10% Angora rabbit hair fabric. Leather zipper pull. Relaxed fit. Tag reads size L.',1,250.00,1),(21,'Vintage Calvin Klein Flare Leg Trousers','Matte black tone. Light and soft fabric. Creases. Low waisted. Relaxed fit. Tag reads size 4.',1,200.00,1),(22,'Vintage Cashmere V Neck Sweater','Jet black tone. 100% pure cashmere fabric. Creases. Relaxed fit. Tag reads size M.',1,150.00,1),(23,'Vintage Medium Wash Denim Jeans','Faded blue tone. 100% cotton denim fabric. High waistline. Relaxed and tapered fit. Tag reads size 7.',1,300.00,1),(24,'Vintage Silk Sleeveless Blouse','Shimmering jet black tone. 100% silk fabric. Side slits. Relaxed fit. Tag reads size PP.',1,160.00,1),(25,'Vintage Long Sleeve Blouse','Shimmering vibrant red tone. Smooth and dense rayon blend fabric. Red button closure. Relaxed fit. Tag reads size 10P.',1,80.00,1),(26,'Vintage Knit Cardigan','Pale pink tone. Knitted mohair blend fabric with ornate dotted motif. Large white button closure. Relaxed fit. Tag reads size L.',1,225.00,1),(27,'Vintage Velvet Black Dress','Shimmering jet black tone. Velvety fabric. Framed neckline and back. Relaxed fit. Tag reads size S.',1,250.00,1),(28,'Vintage Italian Calvin Klein Slingback Pumps','Vibrant red tone. Leather design. Open toe. 2 inch raised heel. Shoe size reads 8N. Made in Italy',2,225.00,1),(29,'Vintage Leather Square Toe Pumps','Shimmering black tone with dotted white stitching. Leather construction. Miniature silver tone buckles. 3 inch raised heel. Shoe size reads 9. In great condition',2,110.00,1),(30,'Vintage Italian Sueded Leather Pumps','Soft and matte black tone. Sueded construction. Circular amber tone buckles. Rounded square toe. 2 1/2 inch raised heel. Shoe size reads 9M. Made in Italy',2,110.00,1),(31,'Vintage Leather Laced Loafer Pumps','Dark brown tone. Sturdy leather construction. Fine brown laces. Rounded square toe. 1 1/3 inch raised heel. Shoe size reads 9M. In great condition',2,175.00,1),(32,'Vintage Leather Square Toe Pumps','Jet black tone. Sturdy leather construction. Black strap and silver tone buckle. Square toe. 2 inch raised heel. Shoe size reads 7.5. In great condition',2,150.00,1),(33,'Vintage Leather Loafers','Two-tone dark navy and white aesthetic. Sturdy leather construction. 3/4 inch raised heel. Shoe size reads 7.5M. In excellent condition',2,125.00,1),(34,'Vintage Italian Pumps','Matte black tone. Triangular woven ornament. Sueded leather construction. 2.5 inch raised heel. Shoe size reads 7B. Made in Italy',2,150.00,1),(35,'Vintage Italian Heel Pumps','Pitch black tone. Suede leather construction. Square toe. Fine black laces. 2 inch raised heel. Shoe size reads 8 1/2M. Made in Italy. In excellent condition.',2,210.00,1),(36,'Vintage Italian Square Toe Pumps','Jet black tone. Leather construction. 2.5 inch raised heel. Shoe size reads 8 1/2M. Made in Italy. In great condition.',2,125.00,1),(37,'Vintage Italian Buckled Pumps','Jet black tone. Sueded exterior. Rounded square toe. Casted buckles. Block heels. 2 inch raised heel. Shoe size reads 7. Made in Italy. In excellent condition.',2,225.00,1),(38,'Vintage Leather Gold Tone Buckle Belt','Rich and warm brown tone. Gold tone buckle. Leather construction. Embossed pattern. Belt reads size S. Fits waist sizes 24 1/2-28 1/2 in.',3,200.00,1),(39,'Vintage Timex Stretch Band Watch','Gold tone bezel and hands contrasted by a white face with black markers. Alternating gold and silver tone stretch band. Length: 6 in (relaxed). In excellent condition. Brand new battery.',3,180.00,1),(40,'Vintage Italian Embossed Leather Belt','Horseshoe gold tone polished buckle. Jet black alligator embossed belt. Sturdy split leather construction. Belt reads size L. Made with quality in Italy',3,225.00,1),(41,'Vintage Quartz Watch','Gold and silver tone polish. Ivory face with gold tone and white gem stone markers. Chain link oyster band with clasp closure. Length: 6 1/2 in. Brand new battery. Made with quality in Japan',3,300.00,1),(42,'Vintage Timex Stretch Band Watch','Silver tone bezel and band perimeter contrasted by gold tone hands, crown and band inner. White face with black hands and markers. Elastic and comfy band. Length: 6 in. Brand new battery.',3,150.00,1),(43,'Vintage Timex Watch','Silver tone polish bezel and band set against a metallic cream face. Comfy band with clasp closure. Length: 5 1/5 in.',3,50.00,1),(44,'Vintage Leather Belt','Jet black tone. Ornate silver tone buckle. Embossment with woven leather pattern. Full grain leather construction. Belt reads size S.',3,120.00,1),(45,'Vintage Gold Tone Buckle Leather Belt','Jet black tone. Gold tone polish buckle. Genuine leather construction. Belt reads size S.',3,250.00,1),(46,'Vintage Italian Leather Belt','Warm brown tone. Polished square silver tone buckle and belt end. Crocodile embossment. Leather construction. Belt reads size M. Made with quality in Italy.',3,225.00,1),(47,'Vintage Timex Stretch Band Watch','Gold and silver tone polish. Black hands and markers set against shimmering silvery face. Comfortable elastic fit. Small time piece and narrow band. Wind-up functionality.',3,50.00,1),(48,'Vintage Timex Stretch Band Watch','Gold tone polish and markers set against an ovular cream face. No longer keeps time, but makes for a lovely ornate bracelet.',3,50.00,1),(49,'Vintage Digital Watch Ring','Watch ring featuring miniature watch form factor, crown graphic, digital clock, and metallic construction.',3,100.00,1),(50,'Vintage Primary Colors Watch','Featuring red, yellow and blue hands. White dial face, numbered markers, gold crown, and black band.',3,85.00,1),(51,'Vintage Italian Leather Belt','Rich dark brown tone. Gorgeous silver tone polished buckle. Genuine leather construction with alligator embossment.',3,75.00,1),(52,'Vintage Wind Up Watch','Colorful typography featuring red, yellow, blue, and green print. Black and red hands. One-piece synthetic adjustable strap with white buckle, and gold crown. Wind-up and water resistant.',3,95.00,1),(53,'Vintage Square Buckle Leather Belt','Black belt. Silver tone buckle and belt end patinas. Genuine leather construction. Sueded Leatehr interior. Belt reads size L.',3,200.00,1),(54,'Tubular Chrome and Smoked Glass Shelf','Rounded brass corners. Smoked glass shelving. Great condition. 5 shelves',4,1000.00,1),(55,'Smoked Plastic Bottle Chiller','80s bottle chiller. Smoked plastic with gold accents. Made by \"Vini Cool\" in England.',4,100.00,1),(56,'White Bertoia Style Chairs','Monochromatic white \"Bertoia\" style metal chairs. Classic and minimal. Removable vinyl covers. All rubber feet. Sold as a set of 2.',4,500.00,1),(57,'Orange Lucite Wine Rack','Orange lucite wine rack with 6 spaces. Made in Taiwan.',4,150.00,1),(58,'Henri Matisse \"The Dance\"','This print is from 1999 for The State Hermitage, St Petersburg, part of the Sergei Shchukin Collection in Moscow. Faux wooden frame.',4,300.00,1),(59,'Vintage Swivel Chairs and Dining Table Set','Tulip-style table with a laminate wood top. Four swivel chairs. The upholstery is a rich rust colour velvet.',4,600.00,1),(60,'Marc Chagall Hardcover Coffee Table Art','326 pages. Vintage March Chagall hardcover book.',4,120.00,1),(61,'Pablo Picasso - \"Portrait of Paulo as Pierrot\"','Pablo Picasso print of Portrait of Paulo as Pierrot. This rare poster is from the Musee des Beaux Arts in Montreal, 1985. Pink metal frame.',4,200.00,1),(63,'Large Aqua Glass Vase','Blue vase. Graphic shape. Beautiful with flower and on its own.',4,100.00,1),(64,'Vintage Ikea Fruit Mug Set','Mugs with red, green, and yellow fruit designs. Features bananas, pears, and apples. Sold as a set of 6.',4,110.00,1),(66,'Pink Speckled Lunch Set','Dusty rose and white speckled bowl and plate set. Snack sized plates and cereal bowls. Made in Japan. Stonewear, oven, microwave, freezer and dishwasher safe. Sold as a set of 6 - 3 bowls, 3 plates.',4,105.00,1),(67,'Vintage Lily Mugs','Vintage mugs with pastel lily print. Diner style handle. Set of 4.',4,75.00,1),(68,'XL Glass Ashtray','Beautiful glass ashtray. Nice and heavy.',4,50.00,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'clothes'),(2,'shoes'),(3,'accessories'),(4,'home_decor');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `productID` int DEFAULT NULL,
  `imgURL` varchar(500) DEFAULT NULL,
  KEY `productID` (`productID`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (2,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8272_900x.jpg?v=1671754065'),(2,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8252_900x.jpg?v=1671754065'),(2,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8259_48d858ca-e2df-47b1-805e-be50e9cf4666_900x.jpg?v=1671754065'),(2,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8275_900x.jpg?v=1671754008'),(3,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4498_540x.jpg?v=1675278163'),(3,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4497_540x.jpg?v=1675278163'),(3,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4501_540x.jpg?v=1675278163'),(3,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4499_540x.jpg?v=1675278163'),(4,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4382_540x.jpg?v=1675278313'),(4,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4381_59fdbdfd-25c9-47e3-8160-0027b543fdde_540x.jpg?v=1675278311'),(4,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4380_5ea1c502-4212-4dee-82c3-064a6118bc7c_540x.jpg?v=1675278312'),(4,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4383_540x.jpg?v=1675278313'),(6,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4412_540x.jpg?v=1675278401'),(6,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4409_540x.jpg?v=1675278401'),(6,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4413_e470b79a-6c03-4df1-9f2f-105b4719b5f5_540x.jpg?v=1675278401'),(6,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4410_540x.jpg?v=1675278401'),(7,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4403_089df20d-523a-4356-a325-c9518c3cbfa0_540x.jpg?v=1675278498'),(7,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4408_1a7d4ff6-94a7-47f6-89f7-6c26d0df5d64_540x.jpg?v=1675278498'),(7,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4406_540x.jpg?v=1675278499'),(7,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4405_fa9ec873-c4cd-48a1-91cb-90847cfb9b6c_540x.jpg?v=1675278499'),(8,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3941_a967621b-849c-44e1-bb18-eab70b4b5a38_540x.jpg?v=1675104553'),(8,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3940_540x.jpg?v=1675104553'),(8,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3933_540x.jpg?v=1675104550'),(8,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3938_540x.jpg?v=1675104549'),(9,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3824_62aaec2f-8d24-4668-8e26-089ef85d77d0_540x.jpg?v=1674848176'),(9,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3832_540x.jpg?v=1674848176'),(9,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3821_3f9353f6-48b9-46c2-9d57-e4f0ba6eb544_540x.jpg?v=1674848176'),(9,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3829_77266f0b-b70b-4d16-8e2c-024caba54f46_540x.jpg?v=1674839800'),(10,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_a92b4268-3a9d-4458-9a71-068b33e318e8_540x.jpg?v=1674848522'),(10,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_7d64b894-b04d-418c-b301-0e302724532e_540x.jpg?v=1674848523'),(10,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_64329278-c102-4981-b750-2e6b146f8d59_540x.jpg?v=1674848528'),(10,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_aabb0c08-7fb0-465a-98d7-e46babc98c87_540x.jpg?v=1674848527'),(11,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3565_540x.jpg?v=1674665725'),(11,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3564_540x.jpg?v=1674665725'),(11,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3562_44068574-833c-4a81-bb8a-8f53528f460b_540x.jpg?v=1674665725'),(11,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3561_b5354af5-a9c5-49d2-8abd-ff68da90f558_540x.jpg?v=1674665719'),(13,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3311_540x.jpg?v=1674504157'),(13,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3313_d6be3899-2a13-4917-b99c-641c0a639d16_540x.jpg?v=1674504156'),(13,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3316_540x.jpg?v=1674504157'),(13,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3312_540x.jpg?v=1674504156'),(14,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2439_540x.jpg?v=1674056994'),(14,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2440_540x.jpg?v=1674056993'),(14,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2442_540x.jpg?v=1674056993'),(14,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2444_540x.jpg?v=1674056994'),(15,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2608_46c84760-aeb8-4b1e-a67c-a8eeec389ab0_540x.jpg?v=1674244537'),(15,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2602_540x.jpg?v=1674244537'),(15,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2599_540x.jpg?v=1674244538'),(15,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2603_540x.jpg?v=1674244537'),(16,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2428_540x.jpg?v=1674055608'),(16,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2426_540x.jpg?v=1674055608'),(16,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2424_540x.jpg?v=1674055608'),(16,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2427_bfde828f-8779-48c6-a6e9-41b1c2f7f3e1_540x.jpg?v=1674055603'),(17,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2033_ff7ac56f-5734-407f-9179-a709acf377d6_540x.jpg?v=1673642574'),(17,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2029_540x.jpg?v=1673642574'),(17,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2031_540x.jpg?v=1673642574'),(17,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2032_540x.jpg?v=1673642574'),(18,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0939_540x.jpg?v=1672962492'),(18,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0931_7a609d81-ace4-460c-9301-39d7c5f2ba15_540x.jpg?v=1672962492'),(18,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0937_540x.jpg?v=1672962492'),(18,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0942_5bb274b2-d23b-4562-98ea-76e5fe343c8f_540x.jpg?v=1672962486'),(19,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4768_26edffd5-09ac-4d15-a308-98832e052a8a_540x.jpg?v=1675454214'),(19,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4770_540x.jpg?v=1675454212'),(19,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4767_540x.jpg?v=1675454212'),(19,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4758_540x.jpg?v=1675454214'),(20,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4791_e91f888a-c622-49bb-ac36-d324b3dc04df_540x.jpg?v=1675454262'),(20,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4792_56fffc01-bb2b-4974-9444-7284e38cbe33_540x.jpg?v=1675454261'),(20,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4786_540x.jpg?v=1675454263'),(20,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4785_3d77568c-1ae3-4d20-9b33-47711fa20046_540x.jpg?v=1675454262'),(21,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4391_21a861f5-3ab2-4f55-a01b-00d575ed77e9_540x.jpg?v=1675454052'),(21,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/597F1184-3EF1-4AAE-BC4E-C18AE4E1C047_540x.jpg?v=1675454052'),(21,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4393_540x.jpg?v=1675454045'),(21,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/998FA8FC-F904-47CC-B53B-DADC0C3E91A1_540x.jpg?v=1675454042'),(22,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4773_642b1264-6064-42d3-84cb-35bd4428f422_540x.jpg?v=1675454231'),(22,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4775_540x.jpg?v=1675454231'),(22,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4774_540x.jpg?v=1675454232'),(22,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4772_540x.jpg?v=1675454232'),(23,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2201_7a3f137d-77c5-43af-9562-4cad9fb5ac79_540x.jpg?v=1675439619'),(23,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2194_36aa1968-f04f-43e7-aec6-8f50983a3e51_540x.jpg?v=1675439619'),(23,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2197_dc85f5ff-c8cf-475f-814b-2e6b4f0d273a_540x.jpg?v=1675439619'),(23,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2208_fcff3fbc-b483-4c27-b67f-a8ab1c16d42f_540x.jpg?v=1675439619'),(24,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4746_69d69160-5b3d-4555-96a8-ab7a572ca8e6_540x.jpg?v=1675454150'),(24,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4748_540x.jpg?v=1675454149'),(24,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4747_540x.jpg?v=1675454149'),(25,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4754_5393a115-474e-4d42-afc6-237f83448d34_540x.jpg?v=1675454125'),(25,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4750_1ce5c844-fddf-4a29-8489-3fffa4076c49_540x.jpg?v=1675454126'),(25,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4756_540x.jpg?v=1675454129'),(25,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4749_540x.jpg?v=1675454125'),(26,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4487_f720a06a-a11b-4224-8987-f42759bccd7a_540x.jpg?v=1675277866'),(26,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4488_176efb8f-b394-44bd-abd2-4f9cad94ca1e_540x.jpg?v=1675277867'),(26,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4486_540x.jpg?v=1675277866'),(26,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4483_540x.jpg?v=1675277867'),(27,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4477_540x.jpg?v=1675277776'),(27,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4477_540x.jpg?v=1675277776'),(27,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4478_96e8545a-4e5f-4d7a-8bea-a6b59b9ded21_540x.jpg?v=1675277809'),(27,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4482_a0f8a565-de9b-44ae-872f-8007d237aa9a_540x.jpg?v=1675277809'),(28,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4503_10e3917e-57c2-46b1-9f2d-ac3a195af1ea_540x.jpg?v=1675278042'),(28,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4504_540x.jpg?v=1675278042'),(28,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4505_615eb27b-1ce3-47e6-9ed8-0ddb9ecd55db_540x.jpg?v=1675278042'),(29,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_c46304da-f378-48d3-b652-f445b685b523_540x.jpg?v=1674674211'),(29,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_b2db77b2-9c7a-4646-be2c-14d337358992_540x.jpg?v=1674674214'),(29,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_bac759fa-3af1-488b-95a4-6fc42d5ac4ef_540x.jpg?v=1674674228'),(30,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_fd600313-2fad-4bb2-978a-a5a5e8871ecd_540x.jpg?v=1675108794'),(30,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_24af4ceb-0f9a-4cba-b712-0f0a07a269b0_540x.jpg?v=1675109182'),(31,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_b2e00fbd-975f-42f7-9138-a8a4cd3a77e7_540x.jpg?v=1674848797'),(31,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_dba24fab-0350-4ee9-8f74-6a4a4f83841c_540x.jpg?v=1674848794'),(32,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4528_b96542b5-2a21-48ce-8317-1dbe67b9cb02_540x.jpg?v=1675278238'),(32,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4526_540x.jpg?v=1675278238'),(32,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4527_29f0152d-9002-47b9-b3ee-b60b2047c08c_540x.jpg?v=1675278238'),(32,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4529_4793267e-34b8-43c7-aa77-03aa08815509_540x.jpg?v=1675278238'),(33,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0241_540x.jpg?v=1672525696'),(33,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0222_4aebbc71-38dc-41e0-a373-616cac8b7410_540x.jpg?v=1672525696'),(33,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0221_540x.jpg?v=1672525696'),(33,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_0224_540x.jpg?v=1672525694'),(34,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_b9fb1e68-caea-45d3-8e61-4a53cfb9eb8d_540x.jpg?v=1670444349'),(34,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_4bbb8a74-7927-4f09-a85d-66693937021a_540x.jpg?v=1670444352'),(34,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_4f4bc374-483f-481a-ba00-9afa1a117d1c_540x.jpg?v=1670444356'),(34,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_5d87cea5-bb7c-4999-94e7-be71d19a1dc8_540x.jpg?v=1670444358'),(35,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2865_540x.jpg?v=1674504196'),(35,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2863_540x.jpg?v=1674504196'),(35,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2864_540x.jpg?v=1674504168'),(35,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_2861_540x.jpg?v=1674504168'),(36,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/0F7EC89A-6176-45E3-A56F-776968DE184E_540x.jpg?v=1671480271'),(36,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/DABF1ED6-BA68-4CCE-B6B9-5E10AAB9B650_540x.jpg?v=1671480271'),(36,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/01E6E8F7-5FBD-4D7F-801E-CE442C7A78C7_540x.jpg?v=1671480271'),(36,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/DF5D20A4-68D7-43FA-80DF-4CD3537F3BE2_540x.jpg?v=1671480267'),(37,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3017_540x.jpg?v=1669217564'),(37,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3007_540x.jpg?v=1669217564'),(37,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3014_540x.jpg?v=1669217564'),(37,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3010_540x.jpg?v=1669217564'),(38,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3951_540x.jpg?v=1675104522'),(38,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3950_2e1ce991-b0b0-40f4-a718-b5ce6dfe0c98_540x.jpg?v=1675104522'),(38,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3952_540x.jpg?v=1675104522'),(38,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_3947_5395c423-219a-49a5-8924-473e73e20796_540x.jpg?v=1675104522'),(39,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_3e1fa467-fc00-4936-8e4d-8dfe1cab0b26_540x.jpg?v=1675109158'),(39,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_117efc8f-f0c7-4fd6-a842-3b3c67efaee9_540x.jpg?v=1675109159'),(40,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_6306e5e9-4916-4985-bd1e-8243c75661f4_540x.jpg?v=1674848571'),(40,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_8e420bbe-32a6-473b-903f-96324307bb75_540x.jpg?v=1674848573'),(40,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_dca2b419-1c42-4c24-b941-4bc544145062_540x.jpg?v=1674848575'),(40,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_facf428e-ce22-415c-b357-41a22e21df83_540x.jpg?v=1674848577'),(41,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_44866366-f490-43df-a28d-b137156bcb69_540x.jpg?v=1675109130'),(41,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_1e8def0f-1a4a-49b6-9e2b-aac252195d1f_540x.jpg?v=1675109131'),(42,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_6fd897c2-7ee0-42f1-936a-03890e229924_540x.jpg?v=1674674178'),(42,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_56ccaee6-57e9-431c-9784-c83c4731bbab_540x.jpg?v=1674674185'),(43,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_0c3a3d0a-3aed-43ed-9387-e4cee73293f5_540x.jpg?v=1674504500'),(43,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_dcd07ffd-4a1b-485c-bbc0-ed2f6b10238b_540x.jpg?v=1674504501'),(44,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_dcd07ffd-4a1b-485c-bbc0-ed2f6b10238b_540x.jpg?v=1674504501'),(44,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8056_ceacd437-7ffb-4e76-85a1-ce943e373b25_540x.jpg?v=1671753743'),(44,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8065_3f65a542-2bad-4741-9d2d-0d3ab6ac5223_540x.jpg?v=1671753743'),(45,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_9107_540x.jpg?v=1672260285'),(45,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_9116_540x.jpg?v=1672260285'),(45,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_9128_09ab7477-93d8-440c-88c2-997fba373e70_540x.jpg?v=1672260284'),(45,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_9131_540x.jpg?v=1672260284'),(46,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8161_540x.jpg?v=1671752086'),(46,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8159_540x.jpg?v=1671752086'),(46,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8164_540x.jpg?v=1671752058'),(46,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8165_540x.jpg?v=1671752058'),(47,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4573_540x.jpg?v=1671141893'),(47,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4574_540x.jpg?v=1671141893'),(48,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_d7ae3ad5-98de-4e4f-b08a-cc8ecd94184a_540x.jpg?v=1669593502'),(49,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_b0bf103b-dd5e-4070-973a-77b3ad5e8c36_540x.jpg?v=1651694068'),(49,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_404b7b8b-ea48-4367-b91c-a9274ad8f2e0_540x.jpg?v=1651694039'),(49,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/image_ee7a38ad-52a9-4d0c-a2c8-8e09437d4ecf_540x.jpg?v=1651694039'),(50,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4583_068ed9df-1476-4d65-b464-f45706b6b948_540x.jpg?v=1669664412'),(50,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4585_aca29d73-9fad-4ffa-8a53-c5935149c5cd_540x.jpg?v=1669664412'),(50,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4586_947f8e10-ee69-43bb-8f8d-ea953b5087f5_540x.jpg?v=1669664661'),(51,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8143_5e33fea2-6dd5-4584-b68e-7c52dd1591e5_540x.jpg?v=1667413054'),(51,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8147_a452dd05-d25e-40f7-8c2f-2cea7178796b_540x.jpg?v=1667413054'),(51,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_8148_540x.jpg?v=1667413055'),(52,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4587_540x.jpg?v=1669664727'),(52,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4588_540x.jpg?v=1669664728'),(53,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4810_16eab30d-e955-4b1e-ac9e-8a7dcdcb9ab1_540x.jpg?v=1675454353'),(53,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4809_540x.jpg?v=1675454351'),(53,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4806_540x.jpg?v=1675454352'),(53,'https://cdn.shopify.com/s/files/1/0507/5235/6513/products/IMG_4810_1_540x.jpg?v=1675454352'),(54,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4771_540x.jpg?v=1675281740'),(54,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4743_540x.jpg?v=1675281936'),(54,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4735_540x.jpg?v=1675281936'),(54,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4746_540x.jpg?v=1675281936'),(55,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4767_540x.jpg?v=1675282114'),(55,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4765_540x.jpg?v=1675282114'),(55,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4766_540x.jpg?v=1675282114'),(55,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4764_540x.jpg?v=1675282114'),(56,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4776_540x.jpg?v=1675282045'),(56,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4774_540x.jpg?v=1675282045'),(56,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4793_540x.jpg?v=1675282032'),(56,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4790_540x.jpg?v=1675282029'),(57,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4752_540x.jpg?v=1675282088'),(57,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4760_540x.jpg?v=1675282088'),(57,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4755_540x.jpg?v=1675282088'),(57,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4749_540x.jpg?v=1675282088'),(58,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4709_540x.jpg?v=1675282099'),(58,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4712_540x.jpg?v=1675282100'),(58,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4713_540x.jpg?v=1675282099'),(58,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_4714_540x.jpg?v=1675282100'),(59,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3556_540x.jpg?v=1673479463'),(59,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3592_540x.jpg?v=1673479463'),(59,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3589_540x.jpg?v=1673479463'),(59,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3591_540x.jpg?v=1673479463'),(60,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3765_540x.jpg?v=1673479522'),(60,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3773_540x.jpg?v=1673479524'),(60,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3766_540x.jpg?v=1673479523'),(60,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3777_540x.jpg?v=1673479523'),(61,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3610_540x.jpg?v=1673478181'),(61,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3611_540x.jpg?v=1673478181'),(61,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3612_540x.jpg?v=1673478181'),(61,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_3620_540x.jpg?v=1673478182'),(63,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1362_540x.jpg?v=1668642640'),(63,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1364_540x.jpg?v=1668642640'),(63,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1365_540x.jpg?v=1668642640'),(63,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1366_540x.jpg?v=1668642640'),(64,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1380_540x.jpg?v=1668641852'),(64,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1382_540x.jpg?v=1668641859'),(64,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1381_600bc6d9-8c6f-439c-9db3-ea80e0806ec2_540x.jpg?v=1668641859'),(66,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_9332_540x.jpg?v=1659037117'),(66,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_9333_540x.jpg?v=1659037117'),(66,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_9337_540x.jpg?v=1659037114'),(66,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_9403_540x.jpg?v=1659037117'),(67,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1041_540x.jpg?v=1639091386'),(67,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1084_540x.jpg?v=1639091386'),(67,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1051_540x.jpg?v=1639091386'),(67,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_1052_540x.jpg?v=1639091386'),(68,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_2733_540x.jpg?v=1620765036'),(68,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_2726_a98aa7b8-6071-4983-8233-812e6906069e_540x.jpg?v=1620765036'),(68,'https://cdn.shopify.com/s/files/1/0434/0141/2768/products/IMG_2728_540x.jpg?v=1620765036');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`userID`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `mainIMG` varchar(500) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `streetNumber` int DEFAULT NULL,
  `streetName` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Jon','Doe','$2b$10$uHLVkxlDSW6uHMeTW7OZPOryvcV0MAbt0Gn.5w7gmwpX1AmEC6Kpy',NULL,'jondoe@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Talia','Cohn','$2b$10$E.FAYlIhknrtlCJ1hOc3p.GAP4P6iLUlpJnrtzfpEJFvG68L0U1sC','','talia@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Zachary','Zobary','$2b$10$KN8z38X4adFSwIxicjyHOuPrAn8KWNy3oF.Jf3NI27S04YMcxDlTq','https://media.licdn.com/dms/image/C4D03AQGbMWXs8E-6RQ/profile-displayphoto-shrink_800_800/0/1536357367961?e=1681344000&v=beta&t=5ioE5CsEIzUSIkCpEKEQQLy3qiX_U1OSiz54pTl6o8s','zacharyzobary@gmail.com',5,'Hadassa St','Tel Aviv','123456','Israel',NULL),(9,'Ron','C','$2b$10$8Ms/XiPFqHdpCCNnjFL7ouio4PwrhYzPC0Kk/3cjTIAKp7Lwvg0Hq','','aaron@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(10,'Aleksandra','Kuznetsova','$2b$10$ys21b0Ozdt6wUNe1rMN2NuzPA5.A4Rntq.UaNh5.0Lawm.0gf9AHW','https://media.licdn.com/dms/image/D4E03AQFLz8bLpl-R1g/profile-displayphoto-shrink_800_800/0/1671386435074?e=1681344000&v=beta&t=7JGAYHZJ6LPO0OO-utZBIXO17xxnwiQwim6qIOL7jls','aleksandra@gmail.com',123,'dfsdf','fdsgds','1234r4','fdsgds',NULL),(12,'Jessie','Ng','$2b$10$w54W3INn73hLE1aZ.Xod/uMp09UAOsvQpXSeGUWG/gN7jd7U7GNNO',NULL,'jessie@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(13,'Asher','Billinkoff','$2b$10$9gQwH/omjHUm3iclS8ukbu.i1Ev5Vp6nXp9miKUeDFXA.3bR2TKpW',NULL,'asher@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(16,'Sandra','Cohn','$2b$10$8rCvWatc1rFruz8SFbbj6.Rq7DyWAfsLtKR3nkkhf0IXAQIYdA/ou',NULL,'sandra@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(17,'David','Cohn','$2b$10$8zXzzElmskyFFDJC3106UOMO.x3NdY7OfqTwauagOH..Y81eVStDW','https://media.licdn.com/dms/image/C4D03AQFa9GnsmRDOgQ/profile-displayphoto-shrink_800_800/0/1516548087142?e=1681344000&v=beta&t=r0mfeKjxl3hTR84EpiL-Ot62GTqs8_BcDDDvetK9G6M','david@gmail.com',123,'Dad St','Toronto','123456','Canada',NULL),(18,'Talia','C','$2b$10$QmspTYzzauCOW0HSQzFSQOB/DEwlPVggtabyQvVB.II89PGbv1Tmy',NULL,'taliacohn3@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),(19,'Talia','C','$2b$10$dIm0ZNrldJEvPRh6o2bor.pAFKWAOLTXDxfcjYNB.PSX9rMGmqcqa',NULL,'taliacohn3@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `productID` int DEFAULT NULL,
  `userID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (2,10),(2,10),(2,10),(3,10),(2,10),(3,10),(3,10),(2,10),(3,10),(3,10),(10,10),(3,10),(30,10),(7,8),(4,8),(6,8);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02 16:39:56
