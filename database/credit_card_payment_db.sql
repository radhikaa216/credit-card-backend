-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: credit_card_payment_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Blacklisted Token',7,'add_blacklistedtoken'),(26,'Can change Blacklisted Token',7,'change_blacklistedtoken'),(27,'Can delete Blacklisted Token',7,'delete_blacklistedtoken'),(28,'Can view Blacklisted Token',7,'view_blacklistedtoken'),(29,'Can add Outstanding Token',8,'add_outstandingtoken'),(30,'Can change Outstanding Token',8,'change_outstandingtoken'),(31,'Can delete Outstanding Token',8,'delete_outstandingtoken'),(32,'Can view Outstanding Token',8,'view_outstandingtoken'),(33,'Can add saved card',9,'add_savedcard'),(34,'Can change saved card',9,'change_savedcard'),(35,'Can delete saved card',9,'delete_savedcard'),(36,'Can view saved card',9,'view_savedcard'),(37,'Can add transaction',10,'add_transaction'),(38,'Can change transaction',10,'change_transaction'),(39,'Can delete transaction',10,'delete_transaction'),(40,'Can view transaction',10,'view_transaction');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$3m4c15FGrt5cEykum4UuHO$DIpV9Fah/IQSRVgHckppIJDt3cvEGbv2m3jbqxe4K7Y=',NULL,0,'testuser1','Test','User','testuser1@gmail.com',0,1,'2026-09-25 18:36:36.399626'),(2,'pbkdf2_sha256$1000000$r66lbAh8qFZIpJe0qXkjZF$VOUAlkVzyWrPz6iiAXJjeK5lJ6VlVdE6drVTPKp9C4I=',NULL,0,'radhika','radhika','T','radhi@gmail.com',0,1,'2026-09-26 11:05:54.484800'),(3,'pbkdf2_sha256$1000000$EjbPKO6a7Gw8RmeOTkBdJ6$/t1TNwrJ6p8IZm/Jlrl5F3CHeO/OQQ2swQdfULMqfrk=',NULL,0,'anvika','anvika','siva','anvika@gmail.com',0,1,'2026-09-26 11:07:02.400491'),(4,'pbkdf2_sha256$1000000$gOEfnV3I0rAfRecYjKkTdH$1bz6thGi4CFzP+qpO8fzjWMlXaoLC46DoSAPrnJ2Yp4=',NULL,0,'suganya','suganya','mano','sugan@gmail.com',0,1,'2026-09-26 11:08:31.660441'),(5,'pbkdf2_sha256$1000000$QqneGw1w64jxhCDhvirq3O$mpHNv703QoNjf4vzt26MDC3Cy9dV9x+ZRHZmvzA6QxU=','2026-09-29 08:07:18.088576',1,'admin','','','admin@gmail.com',1,1,'2026-09-29 08:00:25.521009');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_savedcard`
--

DROP TABLE IF EXISTS `cards_savedcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards_savedcard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `card_holder_name` varchar(100) NOT NULL,
  `card_type` varchar(10) NOT NULL,
  `masked_card` varchar(19) NOT NULL,
  `last_four` varchar(4) NOT NULL,
  `expiry_month` smallint unsigned NOT NULL,
  `expiry_year` smallint unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_savedcard_user_id_7d223147_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cards_savedcard_user_id_7d223147_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cards_savedcard_chk_1` CHECK ((`expiry_month` >= 0)),
  CONSTRAINT `cards_savedcard_chk_2` CHECK ((`expiry_year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_savedcard`
--

LOCK TABLES `cards_savedcard` WRITE;
/*!40000 ALTER TABLE `cards_savedcard` DISABLE KEYS */;
INSERT INTO `cards_savedcard` VALUES (1,'Radhika','CREDIT','************4242','4242',12,2030,'2026-09-26 17:46:30.830698',2),(2,'Radhika','DEBIT','************4444','4444',10,2030,'2026-09-26 18:39:26.313460',2),(4,'suganya','CREDIT','444433332222','2222',10,2029,'2026-09-29 11:30:55.535422',4);
/*!40000 ALTER TABLE `cards_savedcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-09-29 11:30:55.540004','4','CREDIT - 444433332222',1,'[{\"added\": {}}]',9,5),(2,'2026-09-29 13:34:07.217526','1','testuser1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'cards','savedcard'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'token_blacklist','blacklistedtoken'),(8,'token_blacklist','outstandingtoken'),(10,'transactions','transaction');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-25 11:46:40.817222'),(2,'auth','0001_initial','2026-09-25 11:46:42.892425'),(3,'admin','0001_initial','2026-09-25 11:46:43.358181'),(4,'admin','0002_logentry_remove_auto_add','2026-09-25 11:46:43.377064'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-25 11:46:43.394006'),(6,'contenttypes','0002_remove_content_type_name','2026-09-25 11:46:43.715478'),(7,'auth','0002_alter_permission_name_max_length','2026-09-25 11:46:43.903114'),(8,'auth','0003_alter_user_email_max_length','2026-09-25 11:46:43.972607'),(9,'auth','0004_alter_user_username_opts','2026-09-25 11:46:43.990930'),(10,'auth','0005_alter_user_last_login_null','2026-09-25 11:46:44.151443'),(11,'auth','0006_require_contenttypes_0002','2026-09-25 11:46:44.161386'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-25 11:46:44.182769'),(13,'auth','0008_alter_user_username_max_length','2026-09-25 11:46:44.376415'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-25 11:46:44.601279'),(15,'auth','0010_alter_group_name_max_length','2026-09-25 11:46:44.653405'),(16,'auth','0011_update_proxy_permissions','2026-09-25 11:46:44.673526'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-25 11:46:44.875013'),(18,'sessions','0001_initial','2026-09-25 11:46:44.992194'),(19,'token_blacklist','0001_initial','2026-09-26 12:33:28.283893'),(20,'token_blacklist','0002_outstandingtoken_jti_hex','2026-09-26 12:33:28.452498'),(21,'token_blacklist','0003_auto_20171017_2007','2026-09-26 12:33:28.476456'),(22,'token_blacklist','0004_auto_20171017_2013','2026-09-26 12:33:28.697518'),(23,'token_blacklist','0005_remove_outstandingtoken_jti','2026-09-26 12:33:28.872111'),(24,'token_blacklist','0006_auto_20171017_2113','2026-09-26 12:33:28.948786'),(25,'token_blacklist','0007_auto_20171017_2214','2026-09-26 12:33:29.539819'),(26,'token_blacklist','0008_migrate_to_bigautofield','2026-09-26 12:33:30.334651'),(27,'token_blacklist','0010_fix_migrate_to_bigautofield','2026-09-26 12:33:30.367116'),(28,'token_blacklist','0011_linearizes_history','2026-09-26 12:33:30.374975'),(29,'token_blacklist','0012_alter_outstandingtoken_user','2026-09-26 12:33:30.398944'),(30,'token_blacklist','0013_alter_blacklistedtoken_options_and_more','2026-09-26 12:33:30.425300'),(31,'cards','0001_initial','2026-09-26 16:45:40.614329'),(32,'transactions','0001_initial','2026-09-28 06:54:46.573249');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d4aahupjkei8v17ljd0pbdhv76rjjdwk','.eJxVjDEOgzAMAP_iuYocJwHC2L1vQCY2DW0VJAJT1b9XSAztene6Nwy8b3nYq67DLNBDgMsvGzk9tRxCHlzui0lL2dZ5NEdiTlvNbRF9Xc_2b5C5ZujBckPWNx0S-9T62FodbUAOngKRE2xSjBGRHFLnEFEUp0m0c2iVEsLnC5uQNic:1xBXyB:7fyYWpGyjb0M5GnY9iZ7syjT7b4wK7KiG2r0YhFFU6o','2026-10-13 13:34:07.287196');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_blacklistedtoken` VALUES (1,'2026-09-26 15:17:06.990538',4),(2,'2026-09-26 15:33:15.635329',5);
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_auth_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUxNTYwNywiaWF0IjoxNzkwNDI5MjA3LCJqdGkiOiI4YTM3ODBhOTE5MTc0NGY4YjZjZGViYjhiYWYzNTNiYyIsInVzZXJfaWQiOiIzIn0.QFET51aL2dmMVUISdSIVmtkWiTab82xV7D1_qMIAuFw','2026-09-26 13:26:47.495970','2026-09-27 13:26:47.000000',3,'8a3780a9191744f8b6cdebb8baf353bc'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUxNzE3NCwiaWF0IjoxNzkwNDMwNzc0LCJqdGkiOiIxMmE3MWU0MTI2Y2E0MTU0YmQ5YWZjYWQ4YjhlZDVkMyIsInVzZXJfaWQiOiIzIn0.Jarijj6AZ-3x0vNWK6PLJneu_gZm-2JifdLr8gCYI2o','2026-09-26 13:52:54.912981','2026-09-27 13:52:54.000000',3,'12a71e4126ca4154bd9afcad8b8ed5d3'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUxNzcxMywiaWF0IjoxNzkwNDMxMzEzLCJqdGkiOiI4ZTMxZDliNmE1MDY0MDI1YTAzZjM4MGU3OTg4ZTliNCIsInVzZXJfaWQiOiIzIn0.Z81JQgEaAQXJuHoqmwtY1elDlGEB8mu1DjHhUFIlHLU','2026-09-26 14:01:53.179785','2026-09-27 14:01:53.000000',3,'8e31d9b6a5064025a03f380e7988e9b4'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUyMjExNCwiaWF0IjoxNzkwNDM1NzE0LCJqdGkiOiJjM2RiM2JhMzZlZDY0OWE4OGYzMjdmODlhMzk1NTRmMyIsInVzZXJfaWQiOiIzIn0.l3-a-nWdPHCKHbOyuQWDdRd019p38K8CC_kHlTHAe-Q','2026-09-26 15:15:14.114643','2026-09-27 15:15:14.000000',3,'c3db3ba36ed649a88f327f89a39554f3'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUyMjgzOSwiaWF0IjoxNzkwNDM2NDM5LCJqdGkiOiI3ZmM5MmNiYzk3NWU0NjlkYjVhNjZkZWRhYzM5ODA0OSIsInVzZXJfaWQiOiIzIn0.-D_tGgdxvC74cuI_4o1L-1InTe2E9I9y7jFBQAaVVVw','2026-09-26 15:27:19.744684','2026-09-27 15:27:19.000000',3,'7fc92cbc975e469db5a66dedac398049'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUyMjk0NiwiaWF0IjoxNzkwNDM2NTQ2LCJqdGkiOiI1MTFiMmNhMjIxYzg0MDk1OWFlYmY1MTI4NzMwZmIxNSIsInVzZXJfaWQiOiIzIn0.bre6pyiuXBtq8vePESV7L9pdXN24qdmd3kEOCJ57mQI','2026-09-26 15:29:06.269203','2026-09-27 15:29:06.000000',3,'511b2ca221c840959aebf5128730fb15'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUyMzcwMywiaWF0IjoxNzkwNDM3MzAzLCJqdGkiOiJmYmMwZDY5MjliYjM0NWY5OGQ2N2E3MWRlY2M1YTBkYSIsInVzZXJfaWQiOiIyIn0.TqWssnHRuTEobzfvCbVdd1cas3FpXvDsgwGo8VXr1fE','2026-09-26 15:41:43.479346','2026-09-27 15:41:43.000000',2,'fbc0d6929bb345f98d67a71decc5a0da'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUzMDk2OSwiaWF0IjoxNzkwNDQ0NTY5LCJqdGkiOiJjODNkYTJjYmY2NmI0ODljOTViY2YyZTZlODExN2UzMCIsInVzZXJfaWQiOiIyIn0.BPcFMjqgbkVqA4hIvlqw3usLNSIMaxcTG1xBmAZOZ14','2026-09-26 17:42:49.588649','2026-09-27 17:42:49.000000',2,'c83da2cbf66b489c95bcf2e6e8117e30'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUzMjc3NiwiaWF0IjoxNzkwNDQ2Mzc2LCJqdGkiOiI5NmVkZGNhYjk1ZTc0N2Y4YjE1Y2FiNWUwOTQwZGZjYSIsInVzZXJfaWQiOiIyIn0.QUc_R1Tqph9LgLCSNj2kCVmBqvlDwvgL2Z7ROtDucBE','2026-09-26 18:12:56.180851','2026-09-27 18:12:56.000000',2,'96eddcab95e747f8b15cab5e0940dfca'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUzMzI1OSwiaWF0IjoxNzkwNDQ2ODU5LCJqdGkiOiIxYjViZmJlZGU5NmY0MmY4YjNhZGE4ZDNjZGFjZDYyMiIsInVzZXJfaWQiOiIyIn0.pKx3PNMlkkBWqpwlm2uKSUHV4LjB7tJo8ufNWaMzN2w','2026-09-26 18:20:59.238297','2026-09-27 18:20:59.000000',2,'1b5bfbede96f42f8b3ada8d3cdacd622'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUzMzcwMCwiaWF0IjoxNzkwNDQ3MzAwLCJqdGkiOiI0ZmUyNzhmZjdjZjE0ZDBiODUxOGVhOTQ0ODI5NGQxYyIsInVzZXJfaWQiOiIyIn0.XV_tO_9AdY-swfvZZhWWCSB4QcHffgi7wGKwVIRqf0s','2026-09-26 18:28:20.227268','2026-09-27 18:28:20.000000',2,'4fe278ff7cf14d0b8518ea9448294d1c'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDUzNDI3MywiaWF0IjoxNzkwNDQ3ODczLCJqdGkiOiJkNjgzMjkyMDVkMTk0OTI4YjgzMjlmMmIxZDdlMWY4NCIsInVzZXJfaWQiOiIyIn0.GsEORtJGcG_tL9Et3VXc8MfTmey4K8TpQhX1QYQam6k','2026-09-26 18:37:53.206764','2026-09-27 18:37:53.000000',2,'d68329205d194928b8329f2b1d7e1f84'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxMDQzOSwiaWF0IjoxNzkwNTI0MDM5LCJqdGkiOiJhZjJjZjk3NjhhZDQ0YTE3OWMxMTc5MWYyNTNlOGJhNSIsInVzZXJfaWQiOiI0In0.TCzXWXJtSBTkCAAhx6iw5sVldjqrkiv8neuR11uIVI4','2026-09-27 15:47:19.196371','2026-09-28 15:47:19.000000',4,'af2cf9768ad44a179c11791f253e8ba5'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxMDkyMywiaWF0IjoxNzkwNTI0NTIzLCJqdGkiOiIxODM4Y2E3ZTg0NzQ0Y2RiYjczZTJiNDlmYTk2NWZkNiIsInVzZXJfaWQiOiI0In0.UYQn_eAFE1mxQjFqgNo05aLTeJwQqx-6d0Wdt1lHnM8','2026-09-27 15:55:23.365524','2026-09-28 15:55:23.000000',4,'1838ca7e84744cdbb73e2b49fa965fd6'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxMTg4NCwiaWF0IjoxNzkwNTI1NDg0LCJqdGkiOiIxYjI3MmI5YzZjNjc0NWVkYjA1YmIyZWNlOWQ4Yzg0ZCIsInVzZXJfaWQiOiI0In0.zav5SRgvmFK2-3tUZMhJ1Wu04Ld6n5622x2P6deg1U4','2026-09-27 16:11:24.603245','2026-09-28 16:11:24.000000',4,'1b272b9c6c6745edb05bb2ece9d8c84d'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxMjE3NiwiaWF0IjoxNzkwNTI1Nzc2LCJqdGkiOiJlNTU4MjM0OTMyNzk0YjMwYWRiYThjMzQ0NDcxM2QwYSIsInVzZXJfaWQiOiIyIn0.F8giEdMBun3bbEupBIjx-_78vMSXL_ycTRNHEFZi5dw','2026-09-27 16:16:16.418992','2026-09-28 16:16:16.000000',2,'e558234932794b30adba8c3444713d0a'),(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxNjk3NywiaWF0IjoxNzkwNTMwNTc3LCJqdGkiOiJiMDZiZjhlMDQ1NWM0YjM4YjYyOTViOTYxNGU3NTE2MSIsInVzZXJfaWQiOiIzIn0.lu1mnpQYWTPJOTkfTkn9h_R-tPmOLCmvNI6GRefjc8c','2026-09-27 17:36:17.123857','2026-09-28 17:36:17.000000',3,'b06bf8e0455c4b38b6295b9614e75161'),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxODA3OCwiaWF0IjoxNzkwNTMxNjc4LCJqdGkiOiIzZTUyMjdmMjkxNDg0Zjc5ODYzZmYzODBiYmYwN2QxNSIsInVzZXJfaWQiOiI0In0.JLG-SHd3weGhoG7RFvKAdnwP54B3lGLRIUuEhfpV8ag','2026-09-27 17:54:38.891335','2026-09-28 17:54:38.000000',4,'3e5227f291484f79863ff380bbf07d15'),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDYxODU0NSwiaWF0IjoxNzkwNTMyMTQ1LCJqdGkiOiI4MWJmNmU2YTg3Y2M0MGNjODc4NzdjMDU3NjExY2I5MyIsInVzZXJfaWQiOiIzIn0.-G6WkCIN-ZGX0H2vmNXfz2anN_l6SmGcLZ21kIixeCU','2026-09-27 18:02:25.542755','2026-09-28 18:02:25.000000',3,'81bf6e6a87cc40cc87877c057611cb93'),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDY4NDUwMSwiaWF0IjoxNzkwNTk4MTAxLCJqdGkiOiIzNjE5N2NlZmVjMmI0M2Q5YmY0N2U2YjRlNTU4Y2EwYSIsInVzZXJfaWQiOiIyIn0.BnDzMFzBoYMb23T9_PpN9pii7s7mbPzSwIEcbMDNAJI','2026-09-28 12:21:41.653433','2026-09-29 12:21:41.000000',2,'36197cefec2b43d9bf47e6b4e558ca0a'),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDY5MjcxNCwiaWF0IjoxNzkwNjA2MzE0LCJqdGkiOiI5ZmFlZmEwZmMxYjc0OTkxODdjZTQ0OTJmMTQwYmE2ZCIsInVzZXJfaWQiOiIyIn0.F8W1NlL_6fxlZkIqGj07MHq1T5KT6inkbGegojnImtU','2026-09-28 14:38:34.682806','2026-09-29 14:38:34.000000',2,'9faefa0fc1b7499187ce4492f140ba6d'),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDY5NDA0MiwiaWF0IjoxNzkwNjA3NjQyLCJqdGkiOiIyZDI5NjgwNGJjNDE0ODcxODU2YzlkZTJlYjI4ZTI4ZSIsInVzZXJfaWQiOiIzIn0.yADiMwStXDwzdStqxdDjr4tKoWfn35o9ykGoM90rmNY','2026-09-28 15:00:42.749742','2026-09-29 15:00:42.000000',3,'2d296804bc414871856c9de2eb28e28e'),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDY5NDQ5MiwiaWF0IjoxNzkwNjA4MDkyLCJqdGkiOiI4ZTFlZWQwNzFjMWY0YTIwODg1YmVlZGQ1MWQ5ZTFkYyIsInVzZXJfaWQiOiIyIn0.uYSbf3zvc84dG1HCSkzxON58tSTDAyAOvy97u-Ljjas','2026-09-28 15:08:12.308932','2026-09-29 15:08:12.000000',2,'8e1eed071c1f4a20885beedd51d9e1dc'),(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDcwNTk1NCwiaWF0IjoxNzkwNjE5NTU0LCJqdGkiOiIzN2Q5ZThkODYzNjE0YmNjYTI1YmNiYmI2NzZhNGU0YyIsInVzZXJfaWQiOiIyIn0.csigaMk5yLKRMetLyDJYVnjVew-oRLZdAksdqRg_i0Q','2026-09-28 18:19:14.528845','2026-09-29 18:19:14.000000',2,'37d9e8d863614bcca25bcbbb676a4e4c'),(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDcwNjIwOSwiaWF0IjoxNzkwNjE5ODA5LCJqdGkiOiI0YTBjYWVjNmJhZWI0MTRhYjAxZTIyYjAxYzAxMzQ2NCIsInVzZXJfaWQiOiIyIn0.xp6AROft6P9EW_zSRAMpFRTwazyKpjzHc5bxPOIErj4','2026-09-28 18:23:29.353515','2026-09-29 18:23:29.000000',2,'4a0caec6baeb414ab01e22b01c013464'),(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc0NzM5NiwiaWF0IjoxNzkwNjYwOTk2LCJqdGkiOiJlYjBlZTdlMDA5MDA0YWMwOWJhMjgyNjY1MTNjNTQxMCIsInVzZXJfaWQiOiIyIn0.qjDvaT0ybl-bsIXEMjGfZINdtEKwNqLCQzKQvaGVet0','2026-09-29 05:49:56.473003','2026-09-30 05:49:56.000000',2,'eb0ee7e009004ac09ba28266513c5410'),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc0ODc1MywiaWF0IjoxNzkwNjYyMzUzLCJqdGkiOiI3MzU0OWM3OWZmZTY0MzNmOWJjYjg3MDg0M2RhNzJhOSIsInVzZXJfaWQiOiIyIn0.m5isLMOc8Zpav98k3rWbpEMgZnNz3trGWkuL1E09JEo','2026-09-29 06:12:33.374341','2026-09-30 06:12:33.000000',2,'73549c79ffe6433f9bcb870843da72a9'),(28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc0OTQ5MywiaWF0IjoxNzkwNjYzMDkzLCJqdGkiOiIwOWE2YTgwNGZlYTg0YWU3Yjk2Y2VkNTI2OWUzYzU4OCIsInVzZXJfaWQiOiIyIn0.F_rUBZ3EykuOjIYod1JZISE3m1Rm_mjPAuHQz7bMv-w','2026-09-29 06:24:53.519552','2026-09-30 06:24:53.000000',2,'09a6a804fea84ae7b96ced5269e3c588'),(29,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc1MDY0MCwiaWF0IjoxNzkwNjY0MjQwLCJqdGkiOiIyOGNiYTQ4MjliNGU0MWNlYWYwNGVkYTA2ZTZmODVhZCIsInVzZXJfaWQiOiIyIn0.ipA96rGyJTsKkxo3hlaE9Oq_rdGo7F1ND_EJ_O9UEp8','2026-09-29 06:44:00.054641','2026-09-30 06:44:00.000000',2,'28cba4829b4e41ceaf04eda06e6f85ad'),(30,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc1MDcyNiwiaWF0IjoxNzkwNjY0MzI2LCJqdGkiOiI4MTY5ZjY1YWY4OTI0NTk4YTkyYTMzOTIyNmZhOTY4NCIsInVzZXJfaWQiOiIyIn0.tZ5HvIdBOncYwxuhIpATK9YIl81K4zsA18HgiBqAHzw','2026-09-29 06:45:26.758516','2026-09-30 06:45:26.000000',2,'8169f65af8924598a92a339226fa9684'),(31,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc1NDEzMiwiaWF0IjoxNzkwNjY3NzMyLCJqdGkiOiIyMTg1MmU3ZDI0ZmY0YmYzYTY5ODQwOGY2NTUxNmQzYyIsInVzZXJfaWQiOiIyIn0.X1ijFJRF32-VgoqCpAGQVHkR7hy4H1q9UBLWe7HVHL8','2026-09-29 07:42:12.086204','2026-09-30 07:42:12.000000',2,'21852e7d24ff4bf3a698408f65516d3c'),(32,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2MDAwNywiaWF0IjoxNzkwNjczNjA3LCJqdGkiOiI1NzMzOTQzYmEwYTQ0OTFlOTQ2N2U3YThjYWRmNGY4MyIsInVzZXJfaWQiOiIyIn0.5GMNpum-DhGB6Dc_hC5fFxac5W5VmAyiN2a_j_ZDH1I','2026-09-29 09:20:07.291273','2026-09-30 09:20:07.000000',2,'5733943ba0a4491e9467e7a8cadf4f83'),(33,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2MDgxMCwiaWF0IjoxNzkwNjc0NDEwLCJqdGkiOiI4ZjIzY2U4ZTEzZDg0YzE0OTA2YzUyMzM3YTM3Y2YwNyIsInVzZXJfaWQiOiI1In0.S2SSUFSiOtB0g7cjIoXlvt0ztiI50lkI_vq6ts2zKPw','2026-09-29 09:33:30.235566','2026-09-30 09:33:30.000000',5,'8f23ce8e13d84c14906c52337a37cf07'),(34,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2MTIyNywiaWF0IjoxNzkwNjc0ODI3LCJqdGkiOiI0NWZkMTVmNDEzMjM0Mzk2YWU4ZDBkODQ4NzU2OTM2MiIsInVzZXJfaWQiOiI1In0.4lfYSPlSnGpSskNE7AQjFkNJiuQEd_N81rbNjEqucpA','2026-09-29 09:40:27.981557','2026-09-30 09:40:27.000000',5,'45fd15f413234396ae8d0d8487569362'),(35,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2MzMwMSwiaWF0IjoxNzkwNjc2OTAxLCJqdGkiOiJkMjBjMWJhODA0Yzc0MTM1YTllNzk1MjYwYzYyYmIwNSIsInVzZXJfaWQiOiIyIn0.2uSWLofn0AcwC6dC5AQYs0EVzuR15dyTn8PZKNSA1Wg','2026-09-29 10:15:01.477699','2026-09-30 10:15:01.000000',2,'d20c1ba804c74135a9e795260c62bb05'),(36,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2MzUzOSwiaWF0IjoxNzkwNjc3MTM5LCJqdGkiOiJkNWFlMGRjNzE3ODk0ZWY0YTAyNDY4ZWM3YTExOTRmNCIsInVzZXJfaWQiOiI1In0.1WZ6QCEQrb3i0gjV9LApSLrCMqfMnNNCAqO-f6ETNJk','2026-09-29 10:18:59.764419','2026-09-30 10:18:59.000000',5,'d5ae0dc717894ef4a02468ec7a1194f4'),(37,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2NjY4NSwiaWF0IjoxNzkwNjgwMjg1LCJqdGkiOiI4ODVkM2EyMzgxM2Q0NzhiYmVlYTBlNDA4NzZjYjViYiIsInVzZXJfaWQiOiI0In0.IOoU0hTOYBgeYiWcAvLrp3jpa4tlk55tTyeDr1t9G3A','2026-09-29 11:11:25.980682','2026-09-30 11:11:25.000000',4,'885d3a23813d478bbeea0e40876cb5bb'),(38,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2Nzk5MywiaWF0IjoxNzkwNjgxNTkzLCJqdGkiOiI0Mzg5NjlhZWYzMDA0OWNkYWVkNDhiZjhhYzEzZDFlOSIsInVzZXJfaWQiOiI0In0.k-8WN5iw0iTyMRKkCNgcU7aKIMqvW2T_X9kUVWLuhB8','2026-09-29 11:33:13.253430','2026-09-30 11:33:13.000000',4,'438969aef30049cdaed48bf8ac13d1e9'),(39,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2ODM2MCwiaWF0IjoxNzkwNjgxOTYwLCJqdGkiOiI1OWJkMjQ4ZDNjODM0NWQ0YjI3Yzg2MjhjNzYwY2YzMiIsInVzZXJfaWQiOiI0In0.Q9Q1HR_8rSQ5iPpWyUh8FGs9qbBBJu1QMR2Scgfjy7U','2026-09-29 11:39:20.171446','2026-09-30 11:39:20.000000',4,'59bd248d3c8345d4b27c8628c760cf32'),(40,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2ODkxNSwiaWF0IjoxNzkwNjgyNTE1LCJqdGkiOiJkOGY3MzNmOTU0MGQ0ZDVkODEzODBkMDc1ZGMxMDJhOSIsInVzZXJfaWQiOiI0In0.MRoYJKFgVc-cKtSovTmzFVjzKgRrV94PRkpMWz2TGFI','2026-09-29 11:48:35.938016','2026-09-30 11:48:35.000000',4,'d8f733f9540d4d5d81380d075dc102a9'),(41,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc2OTAyMiwiaWF0IjoxNzkwNjgyNjIyLCJqdGkiOiI5MDcxMmY4NzYxMDE0YjU1ODViMzcxNjA5NmYzN2QyYiIsInVzZXJfaWQiOiI1In0.NJcscAZJSXBx7X9VMpEYRwdstWS4JI63jSlUwBNp-yk','2026-09-29 11:50:22.762026','2026-09-30 11:50:22.000000',5,'90712f8761014b5585b3716096f37d2b'),(42,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc3MjA4MiwiaWF0IjoxNzkwNjg1NjgyLCJqdGkiOiI3ZjU4ODEwNjI0ZGM0NjU0YTU0MTk3OTViNjI2OTFmMCIsInVzZXJfaWQiOiI0In0.UA_Yoe1rJLIt6VjxVh73e00ysBTBWCfUvmQLZx9MUGk','2026-09-29 12:41:22.945622','2026-09-30 12:41:22.000000',4,'7f58810624dc4654a5419795b62691f0'),(43,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc3Mjk2OCwiaWF0IjoxNzkwNjg2NTY4LCJqdGkiOiIzMWU0ODFmMWUwMWI0OWI1OTIwMTFkMjI5OTIxYjRjYiIsInVzZXJfaWQiOiI0In0.b4Lwjcs4Wjmon1rkKz7zklLSrO7aK4B_LoCNndnodmg','2026-09-29 12:56:08.423858','2026-09-30 12:56:08.000000',4,'31e481f1e01b49b592011d229921b4cb'),(44,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc5MDc3NTI3OSwiaWF0IjoxNzkwNjg4ODc5LCJqdGkiOiIyZGUzOWQ3YTZkZjk0MjZjYWM4ZDhkMTc2OTQwODAzNyIsInVzZXJfaWQiOiIxIn0.lnvN1wIJptmDK4iAugb3bhG4EgdjEKe96OZmU5O1p0w','2026-09-29 13:34:39.074503','2026-09-30 13:34:39.000000',1,'2de39d7a6df9426cac8d8d1769408037');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_transaction`
--

DROP TABLE IF EXISTS `transactions_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `card_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_transaction_card_id_b6891695_fk_cards_savedcard_id` (`card_id`),
  KEY `transactions_transaction_user_id_b9ecc248_fk_auth_user_id` (`user_id`),
  CONSTRAINT `transactions_transaction_card_id_b6891695_fk_cards_savedcard_id` FOREIGN KEY (`card_id`) REFERENCES `cards_savedcard` (`id`),
  CONSTRAINT `transactions_transaction_user_id_b9ecc248_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_transaction`
--

LOCK TABLES `transactions_transaction` WRITE;
/*!40000 ALTER TABLE `transactions_transaction` DISABLE KEYS */;
INSERT INTO `transactions_transaction` VALUES (1,2000.00,'SUCCESS','2026-09-28 14:52:08.348530','2026-09-28 15:09:49.189728',1,2),(2,3500.00,'SUCCESS','2026-09-28 15:15:33.376688','2026-09-28 15:25:38.976524',1,2),(3,3500.00,'PENDING','2026-09-28 15:24:15.977576','2026-09-28 15:24:15.977580',1,2),(4,2500.00,'SUCCESS','2026-09-28 20:09:11.596760','2026-09-28 20:40:51.801138',1,2),(5,5000.00,'SUCCESS','2026-09-29 17:04:25.585423','2026-09-29 17:09:43.093834',4,4);
/*!40000 ALTER TABLE `transactions_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 10:48:28
