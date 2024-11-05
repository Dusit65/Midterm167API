-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sautrip_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `myprofile_tb`
--

DROP TABLE IF EXISTS `myprofile_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myprofile_tb` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myprofile_tb`
--

/*!40000 ALTER TABLE `myprofile_tb` DISABLE KEYS */;
INSERT INTO `myprofile_tb` VALUES (1,'ds','1','dusit65@email.com','2024-10-30 15:11:05'),(2,'nkm','1','nekima72@gmail.com','2024-10-30 15:11:05');
/*!40000 ALTER TABLE `myprofile_tb` ENABLE KEYS */;

--
-- Table structure for table `trip_tb`
--

DROP TABLE IF EXISTS `trip_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_tb` (
  `trip_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_tb`
--

/*!40000 ALTER TABLE `trip_tb` DISABLE KEYS */;
INSERT INTO `trip_tb` VALUES (1,1,'2023-09-25','2023-09-28','Hokkaido',40.71277600,-74.00597400,1500.00,'2024-10-31 10:25:22'),(2,2,'2023-10-01','2023-10-05','Akita',34.05223500,-118.24368300,2000.00,'2024-10-31 10:25:23'),(3,1,'2023-10-10','2023-10-15','Iwate',48.85661300,2.35222200,2500.00,'2024-10-31 10:25:23'),(4,2,'2023-11-01','2023-11-07','Tokyo',35.68948700,139.69171100,3000.00,'2024-10-16 13:10:04'),(5,1,'2023-10-15','2023-10-20','Osaka',5.00000000,5.00000000,5000.00,'2024-10-16 13:10:04'),(7,2,'2024-10-10','2024-10-20','Aomori',99.99999999,999.99999999,30000.00,'2024-10-31 10:19:04'),(8,2,'2024-10-31','2024-10-04','Fukushima',0.00000000,0.00000000,25000.00,'2024-10-31 10:32:49');
/*!40000 ALTER TABLE `trip_tb` ENABLE KEYS */;

--
-- Dumping routines for database 'sautrip_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-05 20:49:59
