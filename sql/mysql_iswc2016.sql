-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: iswc2016
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `ISWCKEYS`
--

DROP TABLE IF EXISTS `ISWCKEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISWCKEYS` (
  `iswckey` varchar(10) NOT NULL,
  PRIMARY KEY (`iswckey`),
  UNIQUE KEY `iswckey_UNIQUE` (`iswckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISWCKEYS`
--

LOCK TABLES `ISWCKEYS` WRITE;
/*!40000 ALTER TABLE `ISWCKEYS` DISABLE KEYS */;
INSERT INTO `ISWCKEYS` VALUES ('a1'),('a2'),('a3'),('a4'),('a5'),('a6'),('a7'),('a8'),('a9');
/*!40000 ALTER TABLE `ISWCKEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ISWCVOTES`
--

DROP TABLE IF EXISTS `ISWCVOTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISWCVOTES` (
  `iswckey` varchar(10) NOT NULL,
  `vote` varchar(50) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iswckey`),
  UNIQUE KEY `iswckey_UNIQUE` (`iswckey`),
  CONSTRAINT `vote_iswckey` FOREIGN KEY (`iswckey`) REFERENCES `ISWCKEYS` (`iswckey`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISWCVOTES`
--

LOCK TABLES `ISWCVOTES` WRITE;
/*!40000 ALTER TABLE `ISWCVOTES` DISABLE KEYS */;
INSERT INTO `ISWCVOTES` VALUES ('a1','444sdfdsa','2016-08-22 16:32:00'),('a2','444sdfdsasdf','2016-08-22 16:32:10');
/*!40000 ALTER TABLE `ISWCVOTES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-22 16:36:54