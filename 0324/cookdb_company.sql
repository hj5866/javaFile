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
-- Table structure for table `buytbl`
--

DROP TABLE IF EXISTS `buytbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buytbl` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(8) NOT NULL,
  `prodName` char(6) NOT NULL,
  `proupName` char(4) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `amount` smallint(6) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buytbl`
--

LOCK TABLES `buytbl` WRITE;
/*!40000 ALTER TABLE `buytbl` DISABLE KEYS */;
INSERT INTO `buytbl` VALUES (1,'KHD','운동화',NULL,30,2),(2,'KHD','운동화',NULL,30,2),(3,'KHD','노트북','전자',200,1),(4,'KYM','모니터','전자',200,1),(5,'KJD','청바지','의류',5,3);
/*!40000 ALTER TABLE `buytbl` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `cooktbl`
--

DROP TABLE IF EXISTS `cooktbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cooktbl` (
  `cookID` int(11) NOT NULL,
  `cookName` varchar(20) NOT NULL,
  `cookPart` char(10) NOT NULL,
  `cookPrice` int(11) NOT NULL,
  `chefID` int(11) NOT NULL,
  `chefTBL_chefID` int(11) NOT NULL,
  PRIMARY KEY (`cookID`),
  KEY `fk_cookTBL_chefTBL1_idx` (`chefTBL_chefID`),
  CONSTRAINT `fk_cookTBL_chefTBL1` FOREIGN KEY (`chefTBL_chefID`) REFERENCES `cheftbl` (`chefid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooktbl`
--

LOCK TABLES `cooktbl` WRITE;
/*!40000 ALTER TABLE `cooktbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `cooktbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depart`
--

DROP TABLE IF EXISTS `depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `depart` (
  `id` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depart`
--

LOCK TABLES `depart` WRITE;
/*!40000 ALTER TABLE `depart` DISABLE KEYS */;
INSERT INTO `depart` VALUES (1,'총무부',500),(2,'마케팅부',300),(3,'디자인부',400),(4,'재무부',200),(5,'개발부',350);
/*!40000 ALTER TABLE `depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `engineer` (
  `engid` int(11) NOT NULL,
  `engName` char(20) NOT NULL,
  `engScore` int(11) NOT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY (`engid`,`depart_id`),
  KEY `fk_engineer_depart1_idx` (`depart_id`),
  CONSTRAINT `fk_engineer_depart1` FOREIGN KEY (`depart_id`) REFERENCES `depart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES (1,'유재석',50,1),(2,'정준하',50,2),(3,'이미주',55,1),(4,'신봉선',65,3),(5,'이이경',40,4),(6,'박진주',20,3),(7,'박명수',35,5),(8,'조세호',10,3),(9,'박미선',25,5),(10,'김숙',15,4);
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertbl`
--

DROP TABLE IF EXISTS `usertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usertbl` (
  `userID` char(8) NOT NULL,
  `userName` varchar(10) NOT NULL,
  `birthYear` int(11) NOT NULL,
  `addr` char(2) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertbl`
--

LOCK TABLES `usertbl` WRITE;
/*!40000 ALTER TABLE `usertbl` DISABLE KEYS */;
INSERT INTO `usertbl` VALUES ('KHD','강호동',1970,'경북','010','22223333',182,'2007-07-07'),('KJD','김제동',1974,'경남',NULL,NULL,173,'2017-11-11'),('KKJ','김국진',1965,'서울','010','33334444',171,'2021-10-20'),('KYM','김용만',1967,'서울','010','44445555',177,'2015-09-08'),('YJS','유재석',1972,'서울','010','11112222',178,'2020-08-08');
/*!40000 ALTER TABLE `usertbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 15:39:32
