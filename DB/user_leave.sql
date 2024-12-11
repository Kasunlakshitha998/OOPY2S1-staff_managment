-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: user
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave` (
  `Lid` int NOT NULL AUTO_INCREMENT,
  `SID` int NOT NULL,
  `empname` varchar(45) DEFAULT NULL,
  `empemail` varchar(45) DEFAULT NULL,
  `empno` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `leavetype` varchar(45) DEFAULT NULL,
  `leaveto` date DEFAULT NULL,
  `leavefrom` date DEFAULT NULL,
  `leavedescription` varchar(45) DEFAULT NULL,
  `statues` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Lid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
INSERT INTO `leave` VALUES (19,2,'rusiru','rusiru@gmail.com','0718348070','HR','Sickleave','2023-10-21','2023-10-28','hellow','Reject'),(26,1,'navinda','navindaviraj@gmail.com','0705883793','HR','Sickleave','2023-10-28','2023-11-03','dsfds','Approve'),(28,1,'navinda','navindaviraj@gmail.com','0705883753','department','MaternityLeave(Ml','2023-10-28','2023-10-31','sdbdshjf','Reject'),(30,2,'rusiru','nimalsuriya@gmail.com','0705883753','HR','Sickleave','2023-10-28','2023-11-11','sdhsdiugfdsfgfdgf666','Approve'),(32,1,'kasun','lakshithakasun998@gmail.com','5555','jjj','MaternityLeave(Ml','2023-10-12','2023-10-04','jjj','Approve'),(33,1,'kasun','lakshithakasun998@gmail.com','5555','jjj','MaternityLeave(Ml','2023-10-12','2023-10-04','jjj','Approve'),(34,1,'kasun','lakshithakasun998@gmail.com','5555','jjj','MaternityLeave(Ml','2023-10-12','2023-10-04','jjj','Approve'),(35,1,'kasun','lakshithakasun998@gmail.com','5555','jjj','MaternityLeave(Ml','2023-10-12','2023-10-04','jjj','Reject'),(36,1,'kasun','lakshithakasun998@gmail.com','5555','jjj','MaternityLeave(Ml','2023-10-12','2023-10-04','jjj','pending'),(39,12,'kasun','lakshithakasun998@gmail.com','5555','se','MaternityLeave(Ml)','2023-11-01','2023-10-24','jj','pending'),(40,12,'kasun','kasun@gmail.com','764585263','it','Sickleave','2023-10-24','2023-10-25','sick','Approve');
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26 20:46:57
