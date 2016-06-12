CREATE DATABASE  IF NOT EXISTS `capsule` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `capsule`;
-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: capsule
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.12.04.1

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
-- Table structure for table `base`
--

DROP TABLE IF EXISTS `base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base`
--

LOCK TABLES `base` WRITE;
/*!40000 ALTER TABLE `base` DISABLE KEYS */;
INSERT INTO `base` VALUES (1,'Pan'),(2,'Thick'),(3,'Crusty'),(4,'Normal'),(5,'Cheesy'),(6,'Spicy'),(7,'Meaty'),(8,'Loafy'),(9,'Special');
/*!40000 ALTER TABLE `base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(19,2) NOT NULL,
  `base_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nj7c1i8q771o0kkxjkcx6jiql` (`base_id`),
  CONSTRAINT `FK_nj7c1i8q771o0kkxjkcx6jiql` FOREIGN KEY (`base_id`) REFERENCES `base` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'Veggie Delight',1234.00,3),(2,'Veggie Supreme',2234.00,2),(3,'Veggie Excellent',1500.00,1),(4,'Veggie Simple',534.00,2);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_order`
--

DROP TABLE IF EXISTS `pizza_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_price` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_order`
--

LOCK TABLES `pizza_order` WRITE;
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
INSERT INTO `pizza_order` VALUES (1,4968.00);
/*!40000 ALTER TABLE `pizza_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_order_pizzas`
--

DROP TABLE IF EXISTS `pizza_order_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_order_pizzas` (
  `pizza_order_id` bigint(20) NOT NULL,
  `pizzas_id` bigint(20) NOT NULL,
  PRIMARY KEY (`pizza_order_id`,`pizzas_id`),
  KEY `FK_3u332q2mjaoppgj47ki1te1gq` (`pizzas_id`),
  CONSTRAINT `FK_3u332q2mjaoppgj47ki1te1gq` FOREIGN KEY (`pizzas_id`) REFERENCES `pizza` (`id`),
  CONSTRAINT `FK_el1bc52ag1t4su7rcp881vvwk` FOREIGN KEY (`pizza_order_id`) REFERENCES `pizza_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_order_pizzas`
--

LOCK TABLES `pizza_order_pizzas` WRITE;
/*!40000 ALTER TABLE `pizza_order_pizzas` DISABLE KEYS */;
INSERT INTO `pizza_order_pizzas` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `pizza_order_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_toppings`
--

DROP TABLE IF EXISTS `pizza_toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_toppings` (
  `pizza_id` bigint(20) NOT NULL,
  `toppings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`pizza_id`,`toppings_id`),
  KEY `FK_doqvgtmlmie1ghuwpq1mrschf` (`toppings_id`),
  CONSTRAINT `FK_3yllsss7xsteu7hrf2sxjwpw0` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`),
  CONSTRAINT `FK_doqvgtmlmie1ghuwpq1mrschf` FOREIGN KEY (`toppings_id`) REFERENCES `topping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_toppings`
--

LOCK TABLES `pizza_toppings` WRITE;
/*!40000 ALTER TABLE `pizza_toppings` DISABLE KEYS */;
INSERT INTO `pizza_toppings` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(2,3),(4,3),(1,4),(2,4),(3,4),(4,4),(2,5),(3,11);
/*!40000 ALTER TABLE `pizza_toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,'Pineapple'),(2,'Capsicum'),(3,'Onion'),(4,'Tomato'),(5,'Olives'),(6,'Ham'),(7,'Chicken'),(8,'Pepperoni'),(10,'Tuna'),(11,'Hashbrowns'),(12,'Jalapenos');
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-22 13:42:46
