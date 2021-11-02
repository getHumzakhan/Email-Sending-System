-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: email_sending_system
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `email_requests`
--

DROP TABLE IF EXISTS `email_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_requests` (
  `email_request_id` int unsigned NOT NULL AUTO_INCREMENT,
  `request_reference` varchar(255) NOT NULL,
  `webhook_url` varchar(255) DEFAULT NULL,
  `_from` varchar(255) NOT NULL,
  `_to` varchar(255) NOT NULL,
  `_cc` varchar(255) DEFAULT NULL,
  `_bcc` varchar(255) DEFAULT NULL,
  `_subject` varchar(255) NOT NULL,
  `_body` longtext NOT NULL,
  `merchant_id` int unsigned NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_request_id`),
  UNIQUE KEY `request_reference_UNIQUE` (`request_reference`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `email_requests_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`merchant_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_requests`
--

LOCK TABLES `email_requests` WRITE;
/*!40000 ALTER TABLE `email_requests` DISABLE KEYS */;
INSERT INTO `email_requests` VALUES (1,'7xaj42ada34alc9','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',8,'2021-11-01 08:12:39');
/*!40000 ALTER TABLE `email_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchants` (
  `merchant_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `credit_amount` bigint unsigned NOT NULL DEFAULT '100',
  `img_url` longtext,
  `jwt` longtext,
  PRIMARY KEY (`merchant_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (4,'Muhammad Hamza Khan','khanhumza37@gmail.com','Pakistan',100,'OTAxMTMyMDBfMjI5MDk5Mjc4NDkyOTM1Xzc1MjMxNTc1NTU2ODY2NzAzMzZfby5qcGc=','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzUzOTgwODEsImV4cCI6MTYzNTQ4NDQ4MSwiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiNCIsInVzZXJfbmFtZSI6Ik11aGFtbWFkIEhhbXphIEtoYW4iLCJlbWFpbCI6ImtoYW5odW16YTM3QGdtYWlsLmNvbSJ9fQ.CcSFw9C_Pdl906T-ReoWb5hPTVheghZ1IWelw8l_t0U'),(5,'Muhammad Yousaf Khan','yousafkhan@gmail.com','Lahore_212',100,'SU1HXzMzMDYuSlBH','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzUzOTA1NzMsImV4cCI6MTYzNTQ3Njk3MywiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiNSIsInVzZXJfbmFtZSI6Ik11aGFtbWFkIFlvdXNhZiBLaGFuIiwiZW1haWwiOiJ5b3VzYWZraGFuQGdtYWlsLmNvbSJ9fQ.ycZflutXm-0s8felxg05WjVCnuI-RY6ksbC9c4wBq0M'),(6,'Muhammad Saeed Khan','Saeedkhan@gmail.com','Pm_B9872',100,'SU1HXzMzMDYuSlBH','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzU0MTU3NjksImV4cCI6MTYzNTUwMjE2OSwiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiNiIsInVzZXJfbmFtZSI6Ik11aGFtbWFkIFNhZWVkIEtoYW4iLCJlbWFpbCI6IlNhZWVka2hhbkBnbWFpbC5jb20ifX0.KRHrJBQ25IzJjcUGTc5CIUW4sr5qM08ipBknsqJjPYY'),(7,'Haseeb Kasoori','m.h.kasoori@gmail.com','haseeb_123',100,'SU1HXzMzMDYuSlBH','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzU0MTYwNjUsImV4cCI6MTYzNTUwMjQ2NSwiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiNyIsInVzZXJfbmFtZSI6Ikhhc2VlYiBLYXNvb3JpIiwiZW1haWwiOiJtLmgua2Fzb29yaUBnbWFpbC5jb20ifX0.IzINOoHJqmEse6SuSzRfNXRVpUADmSQB1nMzacNk11w'),(8,'Jamal Khan','Jamal_khan@gmail.com','Jamal_123',100,'SU1HXzMzMDYuSlBH','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzU0MjU4MzAsImV4cCI6MTYzNTUxMjIzMCwiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiOCIsInVzZXJfbmFtZSI6IkphbWFsIEtoYW4iLCJlbWFpbCI6IkphbWFsX2toYW5AZ21haWwuY29tIn19.OvNj4U0R2DnNcTMWxJ1FmEhDq7PsZbOv0Cyc0gd4Yjw');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_no` int unsigned NOT NULL,
  `amount` int unsigned NOT NULL,
  `merchant_id` int unsigned NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`merchant_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response` (
  `response_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mesasge` varchar(255) NOT NULL,
  `status_code` int unsigned NOT NULL,
  `request_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`response_id`),
  UNIQUE KEY `request_reference` (`request_reference`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`request_reference`) REFERENCES `email_requests` (`request_reference`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_user`
--

DROP TABLE IF EXISTS `secondary_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondary_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `credit_amount` bigint unsigned NOT NULL DEFAULT '100',
  `img_url` longtext,
  `jwt` longtext,
  `send_mail_permit` int unsigned NOT NULL DEFAULT '0',
  `view_request_permit` int unsigned NOT NULL DEFAULT '0',
  `view_response_permit` int unsigned NOT NULL DEFAULT '0',
  `recharge_credit_permit` int unsigned NOT NULL DEFAULT '0',
  `add_secondary_user_permit` int unsigned NOT NULL DEFAULT '0',
  `merchant_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `secondary_user_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_user`
--

LOCK TABLES `secondary_user` WRITE;
/*!40000 ALTER TABLE `secondary_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `secondary_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02 12:12:28
