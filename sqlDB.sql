CREATE DATABASE  IF NOT EXISTS `sqldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sqldb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sqldb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buytbl` (
  `num` int NOT NULL AUTO_INCREMENT,
  `userID` char(8) NOT NULL,
  `prodName` char(6) NOT NULL,
  `groupName` char(4) DEFAULT NULL,
  `price` int NOT NULL,
  `amount` smallint NOT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `buytbl_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buytbl`
--

LOCK TABLES `buytbl` WRITE;
/*!40000 ALTER TABLE `buytbl` DISABLE KEYS */;
INSERT INTO `buytbl` VALUES (1,'KBS','운동화',NULL,30,2),(2,'KBS','노트북','전자',1000,1),(3,'JYP','모니터','전자',200,1),(4,'BBK','모니터','전자',200,5),(5,'KBS','청바지','의류',50,3),(6,'BBK','메모리','전자',80,10),(7,'SSK','책','서적',15,5),(8,'EJW','책','서적',15,2),(9,'EJW','청바지','의류',50,1),(10,'BBK','운동화',NULL,30,2),(11,'EJW','책','서적',15,1),(12,'BBK','운동화',NULL,30,2);
/*!40000 ALTER TABLE `buytbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertbl`
--

DROP TABLE IF EXISTS `usertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertbl` (
  `userID` char(8) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birthYear` int NOT NULL,
  `addr` char(2) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint DEFAULT NULL,
  `mDATE` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertbl`
--

LOCK TABLES `usertbl` WRITE;
/*!40000 ALTER TABLE `usertbl` DISABLE KEYS */;
INSERT INTO `usertbl` VALUES ('BBK','바비킴',1973,'서울','010','00000000',176,'2013-05-05'),('EJW','은지원',1972,'경북','011','88888888',174,'2014-03-03'),('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10'),('JYP','조용필',1950,'경기','011','44444444',166,'2009-04-04'),('KBS','김범수',1979,'경남','011','22222222',173,'2012-04-04'),('KKH','김경호',1971,'전남','019','33333333',177,'2007-07-07'),('LJB','임재범',1963,'서울','016','66666666',182,'2009-09-09'),('LSG','이승기',1987,'서울','011','1111111',182,'2008-08-08'),('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12'),('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-05-05');
/*!40000 ALTER TABLE `usertbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sqldb'
--

--
-- Dumping routines for database 'sqldb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-29 22:25:49
