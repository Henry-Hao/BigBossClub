CREATE DATABASE  IF NOT EXISTS `bbc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bbc`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bbc
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `CLASS_ID` int(11) NOT NULL,
  `STD_ID` int(11) NOT NULL,
  `ATT_DATE` date NOT NULL,
  PRIMARY KEY (`CLASS_ID`,`STD_ID`),
  KEY `ATTENDANCE_STUDENT_idx` (`STD_ID`),
  CONSTRAINT `ATTENDANCE_CLASS` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ATTENDANCE_STUDENT` FOREIGN KEY (`STD_ID`) REFERENCES `student` (`STD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(11) NOT NULL,
  `CLASS_TIME` varchar(45) DEFAULT NULL,
  `CLASS_LEVEL` varchar(45) DEFAULT NULL,
  `CLASS_DAY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`),
  UNIQUE KEY `CLASS_ID_UNIQUE` (`CLASS_ID`),
  KEY `INST_ID_idx` (`INST_ID`),
  CONSTRAINT `CLASS_INSTRUCTOR` FOREIGN KEY (`INST_ID`) REFERENCES `instructor` (`INST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `FEES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STD_ID` int(11) NOT NULL,
  `FEES_TYPE` varchar(45) NOT NULL,
  `FEES_DATE` date NOT NULL,
  `FEES_AMOUNT` int(11) NOT NULL,
  PRIMARY KEY (`FEES_ID`),
  UNIQUE KEY `FEES_ID_UNIQUE` (`FEES_ID`),
  KEY `FEES_STUDENT_idx` (`STD_ID`),
  CONSTRAINT `FEES_STUDENT` FOREIGN KEY (`STD_ID`) REFERENCES `student` (`STD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `INST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INST_LNAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`INST_ID`),
  UNIQUE KEY `INST_ID_UNIQUE` (`INST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `PAR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAR_NAME` varchar(45) NOT NULL,
  `PAR_MOBILENUMBER` varchar(45) NOT NULL,
  `PAR_EMAIL` varchar(45) NOT NULL,
  `PAR_STU_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PAR_ID`),
  UNIQUE KEY `PAR_ID_UNIQUE` (`PAR_ID`),
  UNIQUE KEY `PAR_STU_ID_UNIQUE` (`PAR_STU_ID`),
  CONSTRAINT `PARENT_STUDENT` FOREIGN KEY (`PAR_STU_ID`) REFERENCES `student` (`STD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `RANK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STD_ID` int(11) NOT NULL,
  `RANK_COLOR` varchar(45) NOT NULL,
  `RANK_DATE` date NOT NULL,
  PRIMARY KEY (`RANK_ID`),
  UNIQUE KEY `RANK_ID_UNIQUE` (`RANK_ID`),
  KEY `RANK_STUDENT_idx` (`STD_ID`),
  CONSTRAINT `RANK_STUDENT` FOREIGN KEY (`STD_ID`) REFERENCES `student` (`STD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `STD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAR_ID` int(11) DEFAULT NULL,
  `STD_NAME` varchar(45) DEFAULT NULL,
  `STD_DOB` varchar(45) DEFAULT NULL,
  `STD_DOJOIN` varchar(45) DEFAULT NULL,
  `STD_MOBILENUMBER` varchar(45) DEFAULT NULL,
  `STD_EMAIL` varchar(45) DEFAULT NULL,
  `STD_ADD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`STD_ID`),
  UNIQUE KEY `STU_ID_UNIQUE` (`STD_ID`),
  KEY `STUDENT_PARENT_idx` (`PAR_ID`),
  CONSTRAINT `STUDENT_PARENT` FOREIGN KEY (`PAR_ID`) REFERENCES `parent` (`PAR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-05 17:44:44
