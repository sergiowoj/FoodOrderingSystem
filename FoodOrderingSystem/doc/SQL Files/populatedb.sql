-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fos
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Joes House','16 Deerfield Dr','Unit 9','Ottawa','Ontario','k2g3r6','6138908083','Nop',4),(2,'Sergio\'s House','Lol','Lol','Lol','Lol','Lol','Lol','Lol',4),(3,'','','','','','','','',4),(4,'','','','','','','','',4),(5,'','','','','','','','',4);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'No category'),(2,'Pizza'),(3,'Drinks'),(4,'Deserts'),(5,'Poutines'),(6,'Sandwiches'),(7,'Dips'),(8,'Chicken Wings'),(9,'Salads'),(10,'Sides');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Sergio','Oliveira','6138908083','6138908083','sergioclc@yahoo.com.br','123456','no'),(2,'Sergio','Oliveira','6138908083','6138908083','sergioclc@yahoo.com.br','123456','no'),(3,'Sergio','Oliveira','6138908083','6138908083','sergiowoj@gmail.com','123456','no'),(4,'Sergio','Oliveira','6138908083','6138908083','sergioclc','1234','no');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Buffalo Chicken',7.00,'Hot N Spice Chicken','',1,2),(2,'Buffalo Chicken',9.00,'Hot N Spice Chicken','',2,2),(3,'Buffalo Chicken',12.00,'Hot N Spice Chicken','',3,2),(4,'Chipotle Chicken',7.50,'More Chicken!','',1,2),(5,'Chipotle Chicken',9.50,'More Chicken!','',2,2),(6,'Chipotle Chicken',12.50,'More Chicken!','',3,2),(7,'Canadian Bacon',6.50,'Bacon bacon bacon','',1,2),(8,'Canadian Bacon',8.50,'Bacon bacon bacon','',2,2),(9,'Canadian Bacon',10.50,'Bacon bacon bacon','',3,2),(10,'Pepperoni',6.50,'Pepperoni is the new black.','',1,2),(11,'Pepperoni',8.50,'Pepperoni is the new black.','',2,2),(12,'Pepperoni',10.50,'Pepperoni is the new black.','',3,2),(13,'Veggie',9.50,'Never felt so fresh!','',1,2),(14,'Veggie',11.50,'Never felt so fresh!','',2,2),(15,'Veggie',12.50,'Never felt so fresh!','',3,2),(16,'Can pop',1.20,'350ml','',2,3),(17,'4 Can Pack',3.99,'4 x 350ml','',2,3),(18,'8 Can Pack',6.99,'8 x 350ml','',2,3),(19,'Bottle Pop',1.99,'600ml','',2,3),(20,'6 Chicken Wings',5.49,'Six pieces of delicious chicken wings.','',1,8),(21,'10 Chicken Wings',8.89,'Ten pieces of delicious chicken wings.','',2,8),(22,'20 Chicken Wings',17.59,'Twenty pieces of delicious chicken wings.','',3,8);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2015-04-04',NULL,14.41,10.98,0.00,1.43,0.00,'cash',3,4,0,0,1),(2,'2015-04-04',NULL,20.61,16.47,0.00,2.14,0.00,'cash',1,4,0,0,2),(3,'2015-04-04',NULL,74.04,63.75,0.00,8.29,0.00,'cash',1,4,0,0,2),(4,'2015-04-04',NULL,20.61,16.47,0.00,2.14,0.00,'cash',1,4,0,0,2),(5,'2015-04-04',NULL,26.81,21.96,0.00,2.85,0.00,'cash',1,4,0,0,2),(6,'2015-04-05',NULL,32.14,26.67,0.00,3.47,0.00,'cash',1,4,0,0,1),(7,'2015-04-05',NULL,20.61,16.47,0.00,2.14,0.00,'cash',1,4,0,0,1),(8,'2015-04-05',NULL,14.41,10.98,0.00,1.43,0.00,'cash',1,4,0,0,1),(9,'2015-04-05',NULL,14.41,10.98,0.00,1.43,0.00,'cash',1,4,0,0,1),(10,'2015-04-05',NULL,81.51,70.36,0.00,9.15,0.00,'cash',1,4,0,0,1),(11,'2015-04-05',NULL,101.33,87.90,2.00,11.43,0.00,'credit',2,4,0,0,1),(12,'2015-04-05',NULL,52.23,44.45,2.00,5.78,0.00,'cash',3,4,0,0,1),(13,'2015-04-06',NULL,14.41,10.98,2.00,1.43,0.00,'cash',1,4,0,0,1),(14,'2015-04-06',NULL,12.05,8.89,2.00,1.16,0.00,'cash',3,4,0,0,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,4,20,1),(2,4,21,1),(3,4,22,1),(4,4,20,1),(5,4,21,1),(6,4,22,1),(7,4,20,1),(8,4,21,1),(9,4,22,1),(10,5,20,4),(11,6,20,4),(12,7,20,4),(13,8,20,4),(14,2,20,2),(15,2,21,3),(16,2,22,4),(17,3,20,1),(18,3,21,2),(19,3,22,2),(20,4,16,2),(21,4,17,8),(22,4,7,1),(23,4,6,2),(24,4,5,1),(25,4,8,1),(26,5,20,5),(27,5,21,3),(28,5,22,2),(29,6,20,5),(30,6,21,3),(31,6,22,2),(32,7,20,1),(33,7,21,1),(34,7,22,1),(35,8,20,1),(36,8,21,1),(37,8,22,1),(38,9,20,1),(39,9,21,1),(40,10,3,1),(41,10,2,1),(42,10,1,1),(43,11,16,1),(44,11,17,1),(45,11,1,2),(46,12,20,8),(47,12,21,1),(48,12,2,1),(49,12,3,1),(50,12,4,1),(51,13,20,4),(52,13,21,1),(53,13,22,32),(54,13,16,1),(55,13,17,8),(56,13,18,1),(57,13,19,1),(58,13,1,1),(59,13,2,1),(60,14,21,2),(61,15,21,1),(62,16,20,3),(63,16,21,5),(64,16,17,8),(65,16,22,2),(66,17,20,9),(67,17,22,4),(68,17,21,3),(69,18,21,1),(70,20,21,2),(71,21,21,2),(72,22,21,1),(73,24,21,2),(74,25,21,2),(75,26,21,2),(76,27,20,3),(77,29,20,4),(78,31,21,1),(79,32,21,1),(80,33,20,4),(81,34,20,4),(82,35,20,4),(83,36,20,3),(84,37,21,1),(85,38,21,1),(86,39,21,1),(87,40,21,2),(88,41,21,2),(89,42,21,1),(90,43,21,1),(91,44,21,1),(92,45,21,1),(93,46,20,1),(94,47,20,1),(95,48,20,5),(96,49,21,1),(97,52,21,1),(98,53,20,5),(99,54,20,1),(100,0,20,4),(101,6,21,3),(102,7,20,3),(103,8,20,2),(104,9,20,2),(105,10,22,4),(106,11,20,4),(107,11,22,3),(108,11,16,1),(109,11,17,3),(110,12,21,5),(111,13,20,2),(112,14,21,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Small'),(2,'Regular'),(3,'Large');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
INSERT INTO `stage` VALUES (1,'Open'),(2,'Preparing'),(3,'Ready'),(4,'Out for delivery'),(5,'Delivered'),(6,'TEST');
/*!40000 ALTER TABLE `stage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-06  2:03:26
