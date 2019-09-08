-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: qiagua
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alb`
--

DROP TABLE IF EXISTS `alb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alb` (
  `ALB_ID` int(8) NOT NULL,
  `USER_AUTHOR` int(8) NOT NULL,
  `ALB_TIME` date DEFAULT NULL,
  `ALB_NAME` varchar(200) NOT NULL,
  `ALB_DES` varchar(300) NOT NULL,
  `ALB_SUM` varchar(10) NOT NULL DEFAULT '0',
  `ALB_LABLES` varchar(10) NOT NULL,
  PRIMARY KEY (`ALB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alb`
--

LOCK TABLES `alb` WRITE;
/*!40000 ALTER TABLE `alb` DISABLE KEYS */;
/*!40000 ALTER TABLE `alb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alb_label`
--

DROP TABLE IF EXISTS `alb_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alb_label` (
  `ALB_ID` int(10) NOT NULL,
  `LABELS_1` varchar(10) DEFAULT NULL,
  `LABELS_2` varchar(10) DEFAULT NULL,
  `LABELS_3` varchar(10) DEFAULT NULL,
  `LABELS_4` varchar(10) DEFAULT NULL,
  `LABELS_5` varchar(10) DEFAULT NULL,
  `LABELS_6` varchar(10) DEFAULT NULL,
  `LABELS_7` varchar(10) DEFAULT NULL,
  `LABELS_8` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ALB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alb_label`
--

LOCK TABLES `alb_label` WRITE;
/*!40000 ALTER TABLE `alb_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `alb_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `art` (
  `ART_ID` int(10) NOT NULL,
  `ART_AUTHOR` int(8) NOT NULL,
  `ART_TITLE` int(8) NOT NULL,
  `ART_TIME` date NOT NULL,
  `ART_PIC_URL` varchar(100) NOT NULL,
  `ART_WIDTH` int(5) NOT NULL DEFAULT '720',
  `ART_HEIGHT` int(5) NOT NULL DEFAULT '480',
  `ART_TIT_SIZE` varchar(10) NOT NULL,
  `ART_TIT_FONT` varchar(10) NOT NULL,
  `ART_TIT_COLOR` varchar(10) NOT NULL,
  `ART_CONTENT` varchar(10000) NOT NULL,
  `ART_SIZE` int(3) NOT NULL DEFAULT '12',
  `ART_FONT` varchar(10) NOT NULL DEFAULT '宋体',
  PRIMARY KEY (`ART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_label`
--

DROP TABLE IF EXISTS `art_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `art_label` (
  `ART_ID` int(10) NOT NULL,
  `LABELS_1` varchar(10) DEFAULT NULL,
  `LABELS_2` varchar(10) DEFAULT NULL,
  `LABELS_3` varchar(10) DEFAULT NULL,
  `LABELS_4` varchar(10) DEFAULT NULL,
  `LABELS_5` varchar(10) DEFAULT NULL,
  `LABELS_6` varchar(10) DEFAULT NULL,
  `LABELS_7` varchar(10) DEFAULT NULL,
  `LABELS_8` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_label`
--

LOCK TABLES `art_label` WRITE;
/*!40000 ALTER TABLE `art_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `collection` (
  `FANS_ID` int(8) NOT NULL,
  `SVHC_NID` text NOT NULL,
  `SVHC_TIME` date NOT NULL,
  PRIMARY KEY (`FANS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `SOURCE_ID` int(8) NOT NULL,
  `COMMENT_ID` int(8) NOT NULL DEFAULT '0',
  `USER_ID` int(8) NOT NULL,
  `COMMENT` varchar(100) NOT NULL,
  PRIMARY KEY (`COMMENT_ID`,`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `USER_NAME` varchar(30) NOT NULL,
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `PWD` varchar(32) NOT NULL,
  `LAST_TIME` date DEFAULT NULL,
  `STATE` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('111111',1,'admin','2019-01-01','已实名'),('盖伦127',11,'127','2019-09-05','已实名'),('qianmo',12,'qianmo','2019-09-05','已实名'),('a',13,'1','2019-09-07','已实名'),('盖伦211',14,'211','2019-09-07','已实名'),('盖伦123',15,'123456','2019-09-08','未实名');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `SEND_ID` int(8) NOT NULL,
  `RESV_ID` int(8) NOT NULL,
  `SEND_TIME` datetime NOT NULL,
  `CONTENT` varchar(1000) NOT NULL,
  PRIMARY KEY (`SEND_ID`,`RESV_ID`,`SEND_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pic`
--

DROP TABLE IF EXISTS `pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pic` (
  `PIC_ID` int(8) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `PIC_ADD` varchar(100) NOT NULL,
  `PIC_TIME` date NOT NULL,
  `PIC_ALBID` int(8) NOT NULL,
  `PIC_DES` varchar(300) NOT NULL,
  `PIC_LABLES` varchar(10) NOT NULL,
  PRIMARY KEY (`PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pic`
--

LOCK TABLES `pic` WRITE;
/*!40000 ALTER TABLE `pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pic_label`
--

DROP TABLE IF EXISTS `pic_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pic_label` (
  `PIC_ID` int(10) NOT NULL,
  `LABELS_1` varchar(10) DEFAULT NULL,
  `LABELS_2` varchar(10) DEFAULT NULL,
  `LABELS_3` varchar(10) DEFAULT NULL,
  `LABELS_4` varchar(10) DEFAULT NULL,
  `LABELS_5` varchar(10) DEFAULT NULL,
  `LABELS_6` varchar(10) DEFAULT NULL,
  `LABELS_7` varchar(10) DEFAULT NULL,
  `LABELS_8` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pic_label`
--

LOCK TABLES `pic_label` WRITE;
/*!40000 ALTER TABLE `pic_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `pic_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praise`
--

DROP TABLE IF EXISTS `praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `praise` (
  `SOURCE_ID` int(8) NOT NULL,
  `USER_ID` int(8) NOT NULL,
  `ISPRAISED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SOURCE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praise`
--

LOCK TABLES `praise` WRITE;
/*!40000 ALTER TABLE `praise` DISABLE KEYS */;
/*!40000 ALTER TABLE `praise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reply` (
  `SOURCE_ID` int(8) NOT NULL,
  `COMMENT_ID` int(8) NOT NULL,
  `REPLY_ID` int(8) NOT NULL,
  `REFERENCE_ID` int(8) NOT NULL,
  PRIMARY KEY (`SOURCE_ID`,`COMMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schv`
--

DROP TABLE IF EXISTS `schv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schv` (
  `FAN_ID` int(8) NOT NULL,
  `IDOL_ID` int(8) NOT NULL,
  `FAN_TIME` date NOT NULL,
  PRIMARY KEY (`FAN_ID`,`IDOL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schv`
--

LOCK TABLES `schv` WRITE;
/*!40000 ALTER TABLE `schv` DISABLE KEYS */;
/*!40000 ALTER TABLE `schv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(30) NOT NULL,
  `PWD` varchar(32) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `MOBILE` varchar(11) NOT NULL,
  `SMRZ` varchar(2) DEFAULT '0',
  `SID` varchar(80) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SENDER` varchar(2) DEFAULT NULL,
  `RTIME` date DEFAULT NULL,
  `USER_IMG` varchar(100) NOT NULL DEFAULT 'images/main/head.jpg',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'111111','admin','1106910397@qq.com','18362993928','1','123456789112345678','张三','f',NULL,'images/main/head.jpg'),(2,'OKAYas','12','122@123.com','13734932483','0','342456198102236785','李四','m',NULL,'images/main/head.jpg'),(11,'盖伦127','127','127@123.com','13734932427','1','342456198102236785','盖伦','m',NULL,'images/main/head.jpg'),(12,'qianmo','qianmo','QIANMO@163.com','13212345678','1','123456789112345678','张三','f',NULL,'images/main/head.jpg'),(13,'a','1','17@qq.com','13874429386','1','123456789112345678','张三','f',NULL,'images/main/head.jpg'),(14,'盖伦211','211','211@gailun.com','13734932211','1','123456789112345678','张三','f',NULL,'images/main/head.jpg'),(15,'盖伦123','123456','123@123.com','13734932123','0',NULL,NULL,NULL,NULL,'images/main/head.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inf`
--

DROP TABLE IF EXISTS `user_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_inf` (
  `USER_ID` int(8) NOT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `PROFILE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inf`
--

LOCK TABLES `user_inf` WRITE;
/*!40000 ALTER TABLE `user_inf` DISABLE KEYS */;
INSERT INTO `user_inf` VALUES (1,'11','本来是admin，后来一度在admin1与admin之间反复横跳2333'),(2,'南京',''),(14,NULL,NULL),(15,'南京','一度反复横跳');
/*!40000 ALTER TABLE `user_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-08 10:06:32
