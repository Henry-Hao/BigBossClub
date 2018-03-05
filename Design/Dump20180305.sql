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
  `ATT_CLASS` int(11) NOT NULL,
  `ATT_STD` int(11) NOT NULL,
  `ATT_DATE` varchar(45) NOT NULL,
  PRIMARY KEY (`ATT_CLASS`,`ATT_STD`,`ATT_DATE`),
  KEY `ATTENDANCE_STU_idx` (`ATT_STD`),
  CONSTRAINT `ATTENDANCE_CLASS` FOREIGN KEY (`ATT_CLASS`) REFERENCES `class` (`CLASS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `attendance_ATT_STD_b7642215_fk_student_STD_ID` FOREIGN KEY (`ATT_STD`) REFERENCES `student` (`STD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2018-02-09'),(1,1,'2018-02-23'),(1,2,'2018-02-09'),(1,2,'2018-02-16'),(1,2,'2018-02-23'),(1,3,'2018-02-16'),(1,3,'2018-02-23'),(2,3,'2018-02-16'),(1,5,'2018-02-09'),(1,5,'2018-02-16'),(2,5,'2018-02-16'),(2,6,'2018-02-16'),(2,9,'2018-02-23');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add django migrations',8,'add_djangomigrations'),(20,'Can change django migrations',8,'change_djangomigrations'),(21,'Can delete django migrations',8,'delete_djangomigrations'),(22,'Can add attendance',9,'add_attendance'),(23,'Can change attendance',9,'change_attendance'),(24,'Can delete attendance',9,'delete_attendance'),(25,'Can add class',10,'add_class'),(26,'Can change class',10,'change_class'),(27,'Can delete class',10,'delete_class'),(28,'Can add fees',11,'add_fees'),(29,'Can change fees',11,'change_fees'),(30,'Can delete fees',11,'delete_fees'),(31,'Can add instructor',7,'add_instructor'),(32,'Can change instructor',7,'change_instructor'),(33,'Can delete instructor',7,'delete_instructor'),(34,'Can add parent',12,'add_parent'),(35,'Can change parent',12,'change_parent'),(36,'Can delete parent',12,'delete_parent'),(37,'Can add rank',13,'add_rank'),(38,'Can change rank',13,'change_rank'),(39,'Can delete rank',13,'delete_rank'),(40,'Can add student',14,'add_student'),(41,'Can change student',14,'change_student'),(42,'Can delete student',14,'delete_student');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$E9n5BcIArxhf$iJpZNc4GNwCJFW6b+lNyugJRDlgWzdp7n3fVP6f46ZU=','2018-03-05 00:52:12.202013',1,'root','','','root@uwindsor.ca',1,1,'2018-02-06 00:46:01.000000'),(2,'pbkdf2_sha256$30000$tH21QQQiKuSj$yWaPtSUBsDmhIsLjI4a793dHbNjV9VqHZ4sNCuvqfg8=','2018-02-09 15:59:09.767838',0,'new','','','asd@qwe.com',0,1,'2018-02-09 15:50:29.678082');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `CLASS_TIME` varchar(45) NOT NULL,
  `CLASS_LEVEL` varchar(45) DEFAULT NULL,
  `CLASS_DAY` varchar(45) DEFAULT NULL,
  `CLASS_NAME` varchar(45),
  PRIMARY KEY (`CLASS_ID`),
  UNIQUE KEY `CLASS_ID_UNIQUE` (`CLASS_ID`),
  KEY `INST_ID_idx` (`INST_ID`),
  CONSTRAINT `CLASS_INSTRUCTOR` FOREIGN KEY (`INST_ID`) REFERENCES `instructor` (`INST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,3,'13:05','Beginner','Friday','666'),(2,3,'15:08','Advanced','Friday','ASD');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-06 00:48:37.939304','1','root',2,'[]',2,1),(2,'2018-02-06 00:48:54.664067','1','root',2,'[]',2,1),(3,'2018-02-06 01:04:11.948359','3','Instructor object',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(9,'bbc_db','attendance'),(10,'bbc_db','class'),(8,'bbc_db','djangomigrations'),(11,'bbc_db','fees'),(7,'bbc_db','instructor'),(12,'bbc_db','parent'),(13,'bbc_db','rank'),(14,'bbc_db','student'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-06 00:39:58.605992'),(2,'auth','0001_initial','2018-02-06 00:39:59.604904'),(3,'admin','0001_initial','2018-02-06 00:39:59.781545'),(4,'admin','0002_logentry_remove_auto_add','2018-02-06 00:39:59.797199'),(5,'contenttypes','0002_remove_content_type_name','2018-02-06 00:39:59.953441'),(6,'auth','0002_alter_permission_name_max_length','2018-02-06 00:40:00.047199'),(7,'auth','0003_alter_user_email_max_length','2018-02-06 00:40:00.125333'),(8,'auth','0004_alter_user_username_opts','2018-02-06 00:40:00.125333'),(9,'auth','0005_alter_user_last_login_null','2018-02-06 00:40:00.187838'),(10,'auth','0006_require_contenttypes_0002','2018-02-06 00:40:00.187838'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-06 00:40:00.203465'),(12,'auth','0008_alter_user_username_max_length','2018-02-06 00:40:00.281599'),(13,'sessions','0001_initial','2018-02-06 00:40:00.344105'),(14,'bbc_db','0001_initial','2018-02-17 12:27:13.083853'),(15,'bbc_db','0002_class_class_name','2018-02-17 12:27:13.089149'),(16,'bbc_db','0003_remove_class_class_name','2018-02-17 13:39:50.043525'),(17,'bbc_db','0004_class_class_name','2018-02-17 13:41:08.335923'),(18,'bbc_db','0005_auto_20180217_1351','2018-02-17 13:51:16.902244'),(19,'bbc_db','0006_auto_20180219_1905','2018-02-19 19:05:26.520304'),(20,'bbc_db','0007_auto_20180219_1907','2018-02-19 19:07:27.154109'),(21,'bbc_db','0008_auto_20180219_1942','2018-02-19 19:42:36.846152'),(22,'bbc_db','0009_auto_20180219_1949','2018-02-19 19:49:31.659537'),(23,'bbc_db','0010_auto_20180219_1957','2018-02-19 19:57:44.488261'),(24,'bbc_db','0011_auto_20180219_2214','2018-02-19 22:14:26.842377'),(25,'bbc_db','0012_auto_20180220_0031','2018-02-20 00:31:28.148360'),(26,'bbc_db','0013_auto_20180220_0058','2018-02-20 00:58:25.684642'),(27,'bbc_db','0014_auto_20180220_0059','2018-02-20 01:00:10.628409'),(28,'bbc_db','0015_auto_20180220_0100','2018-02-20 01:00:10.649029'),(29,'bbc_db','0016_auto_20180220_0102','2018-02-20 01:02:09.025042'),(30,'bbc_db','0017_auto_20180220_1520','2018-02-20 15:21:07.373127'),(31,'bbc_db','0018_auto_20180220_1535','2018-02-20 15:35:58.807117'),(32,'bbc_db','0019_auto_20180220_1536','2018-02-20 15:36:17.260375'),(33,'bbc_db','0020_auto_20180220_1536','2018-02-20 15:36:23.026556'),(34,'bbc_db','0021_auto_20180220_1540','2018-02-20 15:40:15.379140'),(35,'bbc_db','0022_auto_20180220_1540','2018-02-20 15:41:06.029053'),(36,'bbc_db','0023_auto_20180220_1541','2018-02-20 15:41:27.796148'),(37,'bbc_db','0024_auto_20180220_1541','2018-02-20 15:45:58.603122'),(38,'bbc_db','0025_auto_20180220_1545','2018-02-20 15:45:58.614152'),(39,'bbc_db','0026_auto_20180220_1608','2018-02-20 16:09:01.702321');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7z50ilkg40b8gsxs68unmg05f8s025yo','NjdhZTliZDNkM2I0NzUwYmZhZWZkYTRhNGIyNTMxMjA4MmVjNGY3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmNjN2Y3NmIwZDU0NGQ2NjdiMjYwNWFkMjllNDQ5YzBjNjY5NzUxIn0=','2018-03-06 17:30:02.545718'),('rzuu2tz5gsvk9a5jjjyzcqmdwa3pqdnf','NjdhZTliZDNkM2I0NzUwYmZhZWZkYTRhNGIyNTMxMjA4MmVjNGY3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmNjN2Y3NmIwZDU0NGQ2NjdiMjYwNWFkMjllNDQ5YzBjNjY5NzUxIn0=','2018-03-09 20:52:00.949553'),('xgvby7uprxksj5ws5a5jjm2er1p0j0b9','NjdhZTliZDNkM2I0NzUwYmZhZWZkYTRhNGIyNTMxMjA4MmVjNGY3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmNjN2Y3NmIwZDU0NGQ2NjdiMjYwNWFkMjllNDQ5YzBjNjY5NzUxIn0=','2018-03-19 00:52:12.217555');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
  `FEES_DATE` varchar(45) NOT NULL,
  `FEES_AMOUNT` int(11) NOT NULL,
  PRIMARY KEY (`FEES_ID`),
  UNIQUE KEY `FEES_ID_UNIQUE` (`FEES_ID`),
  KEY `FEES_STUDENT_idx` (`STD_ID`),
  CONSTRAINT `fees_STD_ID_bd5c7522_fk_student_STD_ID` FOREIGN KEY (`STD_ID`) REFERENCES `student` (`STD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (9,3,'Tuition','2018-03-04 00:28:11',123),(10,2,'Utility','2018-03-04 00:28:31',321);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'testname'),(2,'testname2'),(3,'name3');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `MEM_NUM` int(5) NOT NULL AUTO_INCREMENT,
  `MEM_FNAME` varchar(20) NOT NULL,
  `MEM_LNAME` varchar(20) NOT NULL,
  `MEM_STREET` varchar(20) NOT NULL,
  `MEM_CITY` varchar(20) NOT NULL,
  `MEM_STATE` varchar(10) NOT NULL,
  `MEM_ZIP` int(5) NOT NULL,
  `MEM_BALANCE` int(5) NOT NULL,
  PRIMARY KEY (`MEM_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (3,'parent3','2269613299','parent3@email.com',NULL),(4,'parent2','2269611243','abc@uwindsor.ca',NULL);
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
  `RANK_DATE` varchar(45) NOT NULL,
  PRIMARY KEY (`RANK_ID`),
  UNIQUE KEY `RANK_ID_UNIQUE` (`RANK_ID`),
  KEY `RANK_STUDENT_idx` (`STD_ID`),
  CONSTRAINT `rank_STD_ID_59d81ffd_fk_student_STD_ID` FOREIGN KEY (`STD_ID`) REFERENCES `student` (`STD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (3,5,'White','2018-02-19 22:57:04'),(4,6,'White','2018-02-19 22:58:23'),(8,6,'Yellow','2018-03-01 13:57:39'),(9,9,'White','2018-03-04 15:34:03'),(11,6,'Half Green','2018-03-04 18:25:55');
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
  CONSTRAINT `student_PAR_ID_08af56b4_fk_parent_PAR_ID` FOREIGN KEY (`PAR_ID`) REFERENCES `parent` (`PAR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,3,'student1','1994-07-01','2017-09-01','2269619876','hao119@uwindror.ca','add1'),(2,4,'student2','1995-07-01','2017-10-01','1234567891','h2@email.com','add2'),(3,3,'test','2018-02-07','2018-02-18','asdsadasd','assad','add3'),(5,4,'student3','2018-03-01','2018-02-19','11133334444','student3@iuwind.ca','add5'),(6,NULL,'student5','1980-07-18','2018-02-19','12313','1231','add6777'),(9,NULL,'student4','1994-07-01','2018-03-04','2269613209','haoyixian1994@hotmail.com','505 Randolph Ave');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bbc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-05 15:05:06
