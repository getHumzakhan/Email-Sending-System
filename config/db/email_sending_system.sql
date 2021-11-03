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
  KEY `fk_merchants_requests_idx` (`merchant_id`),
  CONSTRAINT `fk_merchants_requests` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`merchant_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_requests`
--

LOCK TABLES `email_requests` WRITE;
/*!40000 ALTER TABLE `email_requests` DISABLE KEYS */;
INSERT INTO `email_requests` VALUES (1,'3hd7a8j4nd9vma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',1,'2021-11-02 14:59:46'),(2,'3hdja93hdkavma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',1,'2021-11-02 15:04:27'),(3,'3d92093hdkavma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',2,'2021-11-02 15:05:33'),(5,'3d9so38fhdkavma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',2,'2021-11-02 16:05:02'),(6,'3ddk208fhdkavma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',2,'2021-11-02 16:10:31'),(8,'3ddfehs3d208fhdkavma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon Doe! I am testing my API',2,'2021-11-03 06:38:28'),(9,'3d20d938dadjd3dkavma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 06:40:11'),(10,'3ddksl10913d01vma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 06:45:57'),(11,'3324fi39ad321vma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 07:01:37'),(12,'33x0sn2kk1vma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 07:05:37'),(13,'33xdkki3k1vma','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 07:06:51'),(14,'33d2dkki33lwsa','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 07:08:29'),(15,'33lsk98233lwsa','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',2,'2021-11-03 07:12:43'),(16,'33lskkso92gm0qws3','','ahood.khalid@dnsc.uol.edu.pk','getjhondoe@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',1,'2021-11-03 07:14:28'),(18,'ladma901gm0qws30dp21','','ahood.khalid@dnsc.uol.edu.pk','hkhurshid95@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',1,'2021-11-03 07:17:08'),(19,'xmsd910loid73sh38d','','ahood.khalid@dnsc.uol.edu.pk','hkhurshid95@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',1,'2021-11-03 07:25:52'),(20,'xmsdjj238asd8d','','ahood.khalid@dnsc.uol.edu.pk','hkhurshid95@gmail.com','khanhumza37@gmail.com','ohumzakhan@gmail.com','API testing ','Hello Jhon! This is Ahood, I am testing my API',1,'2021-11-03 07:36:05');
/*!40000 ALTER TABLE `email_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_status`
--

DROP TABLE IF EXISTS `email_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_status` (
  `status_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `_status` varchar(50) NOT NULL,
  `_status_code` tinyint unsigned NOT NULL,
  `_description` varchar(255) DEFAULT NULL,
  `_request_reference` varchar(255) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_id_UNIQUE` (`status_id`),
  UNIQUE KEY `_request_reference_UNIQUE` (`_request_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_status`
--

LOCK TABLES `email_status` WRITE;
/*!40000 ALTER TABLE `email_status` DISABLE KEYS */;
INSERT INTO `email_status` VALUES (1,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3hd7a8j4nd9vma','2021-11-02 14:59:45'),(2,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3hdja93hdkavma','2021-11-02 15:04:27'),(3,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3d92093hdkavma','2021-11-02 15:05:33'),(4,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3d93hdkavma','2021-11-02 15:53:17'),(5,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3d9so38fhdkavma','2021-11-02 16:05:02'),(6,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3ddk208fhdkavma','2021-11-02 16:10:31'),(8,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3ddfehs3d208fhdkavma','2021-11-03 06:38:27'),(9,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3d20d938dadjd3dkavma','2021-11-03 06:40:11'),(10,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3ddksl10913d01vma','2021-11-03 06:45:57'),(11,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','3324fi39ad321vma','2021-11-03 07:01:37'),(12,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','33x0sn2kk1vma','2021-11-03 07:05:37'),(13,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','33xdkki3k1vma','2021-11-03 07:06:51'),(14,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','33d2dkki33lwsa','2021-11-03 07:08:29'),(15,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','33lsk98233lwsa','2021-11-03 07:12:43'),(16,'Sent',200,'Email has been successfully sent to getjhondoe@gmail.com','33lskkso92gm0qws3','2021-11-03 07:14:28'),(18,'Sent',200,'Email has been successfully sent to hkhurshid95@gmail.com','ladma901gm0qws30dp21','2021-11-03 07:17:08'),(19,'Sent',200,'Email has been successfully sent to hkhurshid95@gmail.com','xmsd910loid73sh38d','2021-11-03 07:25:52'),(20,'Sent',200,'Email has been successfully sent to hkhurshid95@gmail.com','xmsdjj238asd8d','2021-11-03 07:36:05');
/*!40000 ALTER TABLE `email_status` ENABLE KEYS */;
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
  `credit_amount` double unsigned NOT NULL DEFAULT '100',
  `img_url` longtext,
  `jwt` longtext,
  PRIMARY KEY (`merchant_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'Muhammad Hamza Khan','gethumzakhan@gmail.com','hamza_123',99.7555,'SU1HXzMzMDYuSlBH','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzU4NjUxMDYsImV4cCI6MTYzNTk1MTUwNiwiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiMSIsInVzZXJfbmFtZSI6Ik11aGFtbWFkIEhhbXphIEtoYW4iLCJlbWFpbCI6ImdldGh1bXpha2hhbkBnbWFpbC5jb20ifX0.O6AttBgU5wZgd1vjQZGF9JOstA8NocxfEdZG3E9mdAY'),(2,'Muhammad Yousaf Khan','iamyousafkhan@gmail.com','yousaf_123',99.9511,'SU1HXzMzMDYuSlBH','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJpYXQiOjE2MzU4NjUzNjMsImV4cCI6MTYzNTk1MTc2MywiYXVkIjoibWVyY2hhbnQiLCJkYXRhIjp7ImlkIjoiMiIsInVzZXJfbmFtZSI6Ik11aGFtbWFkIFlvdXNhZiBLaGFuIiwiZW1haWwiOiJpYW15b3VzYWZraGFuQGdtYWlsLmNvbSJ9fQ.jYQjT7yHU0MM_SrsBmoIYwr3VG2XwcgiqsLeS0Kxskw');
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
  KEY `fk_user_payments_idx` (`merchant_id`),
  CONSTRAINT `fk_user_payments` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`merchant_id`) ON DELETE RESTRICT ON UPDATE CASCADE
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
  KEY `fk_merchant_secondary_user_idx` (`merchant_id`),
  CONSTRAINT `fk_merchant_secondary_user` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`merchant_id`) ON DELETE RESTRICT
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

-- Dump completed on 2021-11-03 19:11:16
