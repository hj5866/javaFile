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
-- Table structure for table `cheftbl`
--

DROP TABLE IF EXISTS `cheftbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cheftbl` (
  `chefID` int(11) NOT NULL,
  `chefName` varchar(20) NOT NULL,
  `chefBirth` date NOT NULL,
  `chefCareer` int(11) NOT NULL,
  `cookPart` char(10) NOT NULL,
  `buytbl_num` int(11) NOT NULL,
  PRIMARY KEY (`chefID`),
  KEY `fk_chefTBL_buytbl1_idx` (`buytbl_num`),
  CONSTRAINT `fk_chefTBL_buytbl1` FOREIGN KEY (`buytbl_num`) REFERENCES `buytbl` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheftbl`
--

LOCK TABLES `cheftbl` WRITE;
/*!40000 ALTER TABLE `cheftbl` DISABLE KEYS */;
INSERT INTO `cheftbl` VALUES (1,'강호동','1970-05-20',20,'중식',1),(2,'김제동','1967-05-05',15,'일식',2),(3,'김국진','1960-08-08',10,'한식',3),(4,'김용만','1955-07-05',5,'분식',4),(5,'유재석','1972-01-01',12,'양식',5);
/*!40000 ALTER TABLE `cheftbl` ENABLE KEYS */;
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
