-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: cookdb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `commerce`
--

DROP TABLE IF EXISTS `commerce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commerce` (
  `comId` int(11) NOT NULL,
  `comName` char(20) NOT NULL,
  `comScore` int(11) NOT NULL,
  `engineer_engid` int(11) NOT NULL,
  `engineer_depart_id` int(11) NOT NULL,
  PRIMARY KEY (`comId`),
  KEY `fk_commerce_engineer1_idx` (`engineer_engid`,`engineer_depart_id`),
  CONSTRAINT `fk_commerce_engineer1` FOREIGN KEY (`engineer_engid`, `engineer_depart_id`) REFERENCES `engineer` (`engid`, `depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce`
--

LOCK TABLES `commerce` WRITE;
/*!40000 ALTER TABLE `commerce` DISABLE KEYS */;
INSERT INTO `commerce` VALUES (1,'물티슈',100,1,1),(2,'마이크',10,2,2),(3,'믹스커피',200,3,1),(4,'텀블러',50,4,3),(5,'마스크',1000,5,4),(6,'종이컵',550,6,3),(7,'초콜릿',102,7,5),(8,'틴트',80,8,3),(9,'립밤',95,9,5),(10,'사탕',300,10,4);
/*!40000 ALTER TABLE `commerce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 15:36:26
