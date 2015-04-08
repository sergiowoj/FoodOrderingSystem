CREATE DATABASE  IF NOT EXISTS `fos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fos`;
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
INSERT INTO `address` VALUES (9,'Sergio\'s House','16 Deerfield Dr','Unit 9','Ottawa','ON','K2G3R6','6138908083','No',5),(10,'Sergios House','16 Deerfield Dr','Unit 9','Ottawa','ON','K2G3R6','6138908083','No',5);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'No category','Sem categoria'),(2,'Pizza','Pizza'),(3,'Drinks','Bebidas'),(4,'Deserts','Sobremesas'),(5,'Poutines','Poutines'),(6,'Sandwiches','Sandubas'),(7,'Dips','Pate'),(8,'Chicken Wings','Asinhas'),(9,'Salads','Saladas'),(10,'Sides','Acompanhamento');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (5,'Sergio','Oliveira','6138908083','6138908083','sergioclc@yahoo.com.br','ð‘‚e‹°LÂz¥‚žÊ¯,ª™','}FÁÌkÐ‰','no');
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
INSERT INTO `item` VALUES (1,'Buffalo Chicken',7.00,'Hot N Spice Chicken','',1,2,'Galinha Buffalo','Galinha Apimentada'),(2,'Buffalo Chicken',9.00,'Hot N Spice Chicken','',2,2,'Galinha Buffalo','Galinha Apimentada'),(3,'Buffalo Chicken',12.00,'Hot N Spice Chicken','',3,2,'Galinha Buffalo','Galinha Apimentada'),(4,'Chipotle Chicken',7.50,'More Chicken!','',1,2,'Galinha Chipotle','Mais galinha!'),(5,'Chipotle Chicken',9.50,'More Chicken!','',2,2,'Galinha Chipotle','Mais galinha!'),(6,'Chipotle Chicken',12.50,'More Chicken!','',3,2,'Galinha Chipotle','Mais galinha!'),(7,'Canadian Bacon',6.50,'Bacon bacon bacon','',1,2,'Bacon Canadense','Bacon eh vida'),(8,'Canadian Bacon',8.50,'Bacon bacon bacon','',2,2,'Bacon Canadense','Bacon eh vida'),(9,'Canadian Bacon',10.50,'Bacon bacon bacon','',3,2,'Bacon Canadense','Bacon eh vida'),(10,'Pepperoni',6.50,'Pepperoni is the new black.','',1,2,'Pepperoni','Pepperoni eh o novo preto?'),(11,'Pepperoni',8.50,'Pepperoni is the new black.','',2,2,'Pepperoni','Pepperoni eh o novo preto?'),(12,'Pepperoni',10.50,'Pepperoni is the new black.','',3,2,'Pepperoni','Pepperoni eh o novo preto?'),(13,'Veggie',9.50,'Never felt so fresh!','',1,2,'Vegetariana','Muita frescura'),(14,'Veggie',11.50,'Never felt so fresh!','',2,2,'Vegetariana','Muita frescura'),(15,'Veggie',12.50,'Never felt so fresh!','',3,2,'Vegetariana','Muita frescura'),(16,'Can pop',1.20,'350ml','',2,3,'Latinha','350ml'),(17,'4 Can Pack',3.99,'4 x 350ml','',2,3,'Pacote 4 Latinhas','4 x 350ml'),(18,'8 Can Pack',6.99,'8 x 350ml','',2,3,'Pacote 8 Latinhas','8 x 350ml'),(19,'Bottle Pop',1.99,'600ml','',2,3,'Garrafa','600ml'),(20,'6 Chicken Wings',5.49,'Six pieces of delicious chicken wings.','',1,8,'6 Asinhas','Seis pedacos deliciosos de asinha de frango'),(21,'10 Chicken Wings',8.89,'Ten pieces of delicious chicken wings.','',2,8,'10 Asinhas','Dez pedacos deliciosos de asinha de frango'),(22,'20 Chicken Wings',17.59,'Twenty pieces of delicious chicken wings.','',3,8,'20 Asinhas','Vinte pedacos deliciosos de asinha de frango');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (84,'2015-04-07',NULL,38.13,31.97,2.00,4.16,0.00,'cash',10,5,0,0,5),(85,'2015-04-07',NULL,70.07,60.24,2.00,7.83,0.00,'cash',9,5,0,0,5),(86,'2015-04-07',NULL,22.09,17.78,2.00,2.31,0.00,'cash',10,5,0,0,5),(87,'2015-04-08',NULL,200.47,175.64,2.00,22.83,0.00,'cash',10,5,0,0,3),(88,'2015-04-08',NULL,96.68,83.79,2.00,10.89,0.00,'cash',10,5,0,0,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (179,84,21,1),(180,84,20,1),(181,84,22,1),(182,85,20,2),(183,85,22,2),(184,85,16,1),(185,85,17,1),(186,85,21,1),(187,86,21,2),(188,87,20,1),(189,87,21,1),(190,87,22,1),(191,87,16,1),(192,87,17,1),(193,87,19,1),(194,87,18,1),(195,87,1,1),(196,87,2,1),(197,87,3,1),(198,87,4,1),(199,87,6,1),(200,87,5,1),(201,87,7,1),(202,87,8,1),(203,87,9,1),(204,87,10,1),(205,87,12,1),(206,87,11,1),(207,87,13,1),(208,87,14,1),(209,88,20,3),(210,88,21,2),(211,88,22,2),(212,88,16,2),(213,88,17,2),(214,88,19,2);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Small','Pequeno'),(2,'Regular','Medio'),(3,'Large','Grande');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
INSERT INTO `stage` VALUES (1,'Open','Aberto'),(2,'Preparing','Preparando'),(3,'Ready','Pronto'),(4,'Out for delivery','Saiu para entrega'),(5,'Delivered','Entregue');
/*!40000 ALTER TABLE `stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fos'
--

--
-- Dumping routines for database 'fos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-08  1:24:21
