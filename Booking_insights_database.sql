CREATE DATABASE  IF NOT EXISTS `project1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project1`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: project1
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
-- Table structure for table `booking_table`
--

DROP TABLE IF EXISTS `booking_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_table` (
  `Booking_id` varchar(25) NOT NULL,
  `Booking_date` date DEFAULT NULL,
  `User_id` varchar(25) DEFAULT NULL,
  `Line_of_business` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Booking_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `booking_table_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user_table` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_table`
--

LOCK TABLES `booking_table` WRITE;
/*!40000 ALTER TABLE `booking_table` DISABLE KEYS */;
INSERT INTO `booking_table` VALUES ('b1','2022-03-23','u1','Flight'),('b10','2022-04-10','u1','Flight'),('b11','2022-04-12','u4','Flight'),('b12','2022-04-16','u1','Flight'),('b13','2022-04-19','u2','Flight'),('b14','2022-04-20','u5','Hotel'),('b15','2022-04-22','u6','Flight'),('b16','2022-04-26','u4','Hotel'),('b17','2022-04-28','u2','Hotel'),('b18','2022-04-30','u1','Hotel'),('b19','2022-05-04','u4','Hotel'),('b2','2022-03-27','u2','Flight'),('b20','2022-05-06','u1','Flight'),('b21','2022-05-07','u1','Hotel'),('b22','2022-05-07','u2','Flight'),('b23','2022-05-08','u3','Hotel'),('b24','2022-05-08','u4','Flight'),('b25','2022-05-09','u5','Flight'),('b26','2022-05-09','u6','Hotel'),('b27','2022-05-10','u7','Flight'),('b28','2022-05-10','u8','Hotel'),('b29','2022-05-11','u9','Flight'),('b3','2022-03-28','u1','Hotel'),('b30','2022-05-11','u10','Hotel'),('b31','2022-05-12','u11','Flight'),('b32','2022-05-12','u12','Hotel'),('b33','2022-05-13','u13','Flight'),('b34','2022-05-13','u14','Hotel'),('b35','2022-05-14','u15','Flight'),('b36','2022-05-14','u16','Hotel'),('b37','2022-05-15','u17','Flight'),('b38','2022-05-15','u18','Hotel'),('b39','2022-05-16','u19','Flight'),('b4','2022-03-31','u4','Flight'),('b5','2022-04-02','u1','Hotel'),('b6','2022-04-02','u2','Flight'),('b7','2022-04-06','u5','Flight'),('b8','2022-04-06','u6','Hotel'),('b9','2022-04-06','u2','Flight');
/*!40000 ALTER TABLE `booking_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_table` (
  `User_id` varchar(23) NOT NULL,
  `Segment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES ('u1','s1'),('u10','s3'),('u11','s1'),('u12','s1'),('u13','s1'),('u14','s2'),('u15','s2'),('u16','s3'),('u17','s3'),('u18','s3'),('u19','s3'),('u2','s1'),('u20','s3'),('u3','s1'),('u4','s2'),('u5','s2'),('u6','s3'),('u7','s3'),('u8','s3'),('u9','s3');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-22 21:48:50
