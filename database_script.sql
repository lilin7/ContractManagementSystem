-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_province_id_idx` (`province_id`),
  CONSTRAINT `fk_province_id` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Montreal',NULL,NULL),(2,1,'Candiac',NULL,NULL),(3,1,'Brossard',NULL,NULL),(4,1,'Quebec City',NULL,NULL),(5,2,'Toronto',NULL,NULL),(6,2,'Ottowa',NULL,NULL),(7,2,'Kingston',NULL,NULL),(8,2,'Thunder Bay',NULL,NULL),(9,4,'Edmonton',NULL,NULL),(10,8,'Halifax',NULL,NULL),(11,3,'Vancouver',NULL,NULL),(12,3,'Victoria',NULL,NULL),(13,12,'Yellowknife',NULL,NULL),(14,8,'Halifax',NULL,NULL),(15,4,'Edmonton',NULL,NULL),(16,4,'Calgary',NULL,NULL),(17,1,'Sherbrooke',NULL,NULL),(18,3,'Victoria',NULL,NULL),(19,9,'Kensington',NULL,NULL),(20,11,'Whitehorse',NULL,NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `responsible` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `zipcode` char(6) DEFAULT NULL,
  `ACV` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_user_id_idx` (`user_id`),
  CONSTRAINT `fk_company_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'ABS','Zoe Chen','80012345678','1','1','H3H2B4',30000,NULL,NULL,18),(2,'ALDO','Jimmy White','8002234567','5','2','M4P2L2',7000,NULL,NULL,19),(3,'AIC','Rachel Bell','8003225567','4','1','G1V2M2',40000,NULL,NULL,20),(4,'IRUN','Lily Gate','8004266567','1','1','H2K1J4',103000,NULL,NULL,21),(5,'CSC Corp.','Jean Green','8005254567','1','1','H3H2G1',85000,NULL,NULL,22),(6,'Nike','oscar Johnson ','8001234567','3','1','J4S1J6',10000,'2018-07-29 09:57:37','2018-07-29 09:57:37',4),(7,'Sony','Peter Wang','8008884567','11','3','V5K0A4',40000,NULL,NULL,17),(8,'Talent Plus','Jacob Williams  ','8008114567','5','2','B4B1B4',10000,NULL,NULL,23),(9,'South Mountain','Liam Taylor','8002224567','6','2','K1A1K3',30000,NULL,NULL,24),(10,'Badger Mining','Michael Lee','8003334567','7','2','K7K1J7',10000,NULL,NULL,25),(11,'Square Root','Alexander Clark ','8004444567','9','4','T5A0P9',25000,NULL,NULL,26),(12,'Axis Communications','James Hill','8005554567','10','8','B3H2Y9',200000,NULL,NULL,27),(13,'Stellar Solutions','Benjamin Stewart ','8006664567','13','12','X1A0A3',40000,NULL,NULL,28),(14,'AnswerLab','William  Hall','8007774567','15','4','T5A0P8',30000,NULL,NULL,29),(15,'ONTRAPORT','Daniel Ross','8009994567','6','1','K1A5D3',40000,NULL,NULL,30),(16,'Intuitive Research and Technology','Edward Lee','8007774111','4','1','G1V2F3',50000,NULL,NULL,31),(17,'Return Path','Frank Brown','8007774222','6','2','K1A1K4',60000,NULL,NULL,32),(18,'Assurance Agency','David Moore','8007774333','3','1','J4S2H3',70000,NULL,NULL,33),(19,'Centro Institute','Andrew Hill','8007774444','1','1','H3E1J4',80000,NULL,NULL,34),(20,'Cirrus Logic','Ethan White','8007774555','3','1','J4S1J1',90000,NULL,NULL,35),(21,'Summer Hill','Peter Leong','8007776558','4','1','U8Y9P3',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_categories`
--

DROP TABLE IF EXISTS `contract_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `leadTime` int(11) DEFAULT NULL,
  `firstDeliverable` int(11) DEFAULT NULL,
  `secondDeliverable` int(11) DEFAULT NULL,
  `thirdDeliverable` int(11) DEFAULT NULL,
  `fourthDeliverable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TYPE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_categories`
--

LOCK TABLES `contract_categories` WRITE;
/*!40000 ALTER TABLE `contract_categories` DISABLE KEYS */;
INSERT INTO `contract_categories` VALUES (1,'Diamond',18,6,11,18,0),(2,'Gold',20,8,14,20,0),(3,'Premium',10,3,5,10,0),(4,'Silver',28,5,15,20,28);
/*!40000 ALTER TABLE `contract_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `manager_staffId` int(11) DEFAULT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `business_line` int(11) DEFAULT NULL,
  `initialAmount` double NOT NULL,
  `payment` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_deliverable` datetime DEFAULT NULL,
  `second_deliverable` datetime DEFAULT NULL,
  `third_deliverable` datetime DEFAULT NULL,
  `fourth_deliverable` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `satissfactionScore` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`initialAmount`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_contract_company1_idx` (`company_id`),
  KEY `FK_CATEGORY_idx` (`category`),
  KEY `FK_CT_MANAGER_ID_idx` (`manager_staffId`),
  KEY `FK_BUSINESS_LINE_idx` (`business_line`),
  KEY `FK_SALES_ID_idx` (`sales_id`),
  CONSTRAINT `FK_BUSINESS_LINE` FOREIGN KEY (`business_line`) REFERENCES `line_of_businesses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`category`) REFERENCES `contract_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COMPANY_ID` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CT_MANAGER_ID` FOREIGN KEY (`manager_staffId`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SALES_ID` FOREIGN KEY (`sales_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,1,3,2,2,1,20000,20000,'2018-08-12 21:41:45','2017-07-09 02:46:06','2017-07-23 02:46:06','2017-08-12 02:46:06','0000-00-00 00:00:00','active',0,'2018-07-30 05:59:10'),(2,1,7,9,1,1,10000,10000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',7,'2018-07-30 04:40:12'),(3,3,8,10,1,1,40000,40000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',8,NULL),(4,2,22,13,1,1,7000,7000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',9,NULL),(5,4,23,43,1,2,30000,30000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',7,NULL),(6,4,3,43,1,2,23000,23000,'2018-08-12 21:41:45','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',0,NULL),(7,4,7,13,1,2,10000,10000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',8,NULL),(8,4,8,10,1,3,40000,40000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',8,NULL),(9,5,22,9,4,3,85000,85000,'2017-07-01 02:46:06','2017-07-06 02:46:06','2017-07-20 02:46:06','2017-08-10 02:46:06','2017-08-28 02:46:06','active',8,NULL),(10,6,23,2,4,3,10000,10000,'2017-07-01 02:46:06','2017-07-06 02:46:06','2017-07-21 02:46:06','2017-08-10 02:46:06','2017-08-28 02:46:06','active',9,NULL),(11,7,3,2,3,3,40000,40000,'2018-08-12 21:41:45','2017-07-04 02:46:06','2017-07-09 02:46:06','2017-07-19 02:46:06','0000-00-00 00:00:00','active',0,NULL),(12,8,7,9,2,4,10000,10000,'2017-07-01 02:46:06','2017-07-09 02:46:06','2017-07-23 02:46:06','2017-07-09 02:46:06','0000-00-00 00:00:00','active',9,NULL),(13,9,8,10,4,4,30000,30000,'2017-07-01 02:46:06','2017-07-06 02:46:06','2017-07-20 02:46:06','2017-08-10 02:46:06','2017-08-28 02:46:06','active',10,NULL),(14,10,22,13,4,4,10000,10000,'2017-07-01 02:46:06','2017-07-06 02:46:06','2017-07-20 02:46:06','2017-08-10 02:46:06','2017-08-28 02:46:06','active',10,NULL),(15,11,23,43,3,5,25000,25000,'2017-07-01 02:46:06','2017-07-04 02:46:06','2017-07-09 02:46:06','2017-07-19 02:46:06','0000-00-00 00:00:00','active',10,NULL),(16,12,3,43,2,5,200000,200000,'2018-08-12 21:41:45','2017-07-09 02:46:06','2017-07-23 02:46:06','2017-07-09 02:46:06','0000-00-00 00:00:00','active',0,NULL),(17,13,7,13,4,5,40000,40000,'2017-07-01 02:46:06','2017-07-06 02:46:06','2017-07-20 02:46:06','2017-08-10 02:46:06','2017-08-28 02:46:06','active',8,NULL),(18,14,8,10,3,4,30000,30000,'2017-07-01 02:46:06','2017-07-04 02:46:06','2017-07-09 02:46:06','2017-07-19 02:46:06','0000-00-00 00:00:00','active',8,NULL),(19,15,22,9,1,3,40000,40000,'2017-07-01 02:46:06','2017-07-07 02:46:06','2017-07-18 02:46:06','2017-08-05 02:46:06','0000-00-00 00:00:00','active',9,NULL),(20,16,23,2,2,2,50000,50000,'2017-07-01 02:46:06','2017-07-09 02:46:06','2017-07-23 02:46:06','2017-07-09 02:46:06','0000-00-00 00:00:00','active',9,NULL),(21,17,3,2,4,5,60000,60000,'2018-08-01 02:46:06','2018-08-06 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(22,18,7,9,4,5,70000,70000,'2018-08-01 02:46:06','2018-08-06 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(23,19,8,10,3,1,80000,80000,'2018-08-01 02:46:06','2018-08-04 02:46:06','2018-08-09 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(24,20,22,13,3,5,90000,90000,'2018-08-01 02:46:06','2018-08-04 02:46:06','2018-08-09 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(25,20,23,43,4,5,10000,10000,'2018-08-01 02:46:06','2018-08-06 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(26,19,3,43,4,3,70000,70000,'2018-08-01 02:46:06','2018-08-06 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(27,18,7,13,4,2,80000,80000,'2018-08-01 02:46:06','2018-08-06 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(28,17,8,10,4,2,100000,100000,'2018-08-01 02:46:06','2018-08-06 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(29,16,22,9,2,1,35000,35000,'2018-08-01 02:46:06','2018-08-08 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL),(30,15,23,2,3,2,50000,50000,'2018-08-01 02:46:06','2018-08-04 02:46:06','2018-08-09 02:46:06','0000-00-00 00:00:00','0000-00-00 00:00:00','active',0,NULL);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_plans`
--

DROP TABLE IF EXISTS `insurance_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_plans` (
  `plan_id` int(11) NOT NULL,
  `insuranceType` varchar(45) DEFAULT NULL,
  `reimburseRatio` double DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `TYPE` (`insuranceType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_plans`
--

LOCK TABLES `insurance_plans` WRITE;
/*!40000 ALTER TABLE `insurance_plans` DISABLE KEYS */;
INSERT INTO `insurance_plans` VALUES (1,'Premium',0.9),(2,'Silver',0.8),(3,'Normal',0.7);
/*!40000 ALTER TABLE `insurance_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_of_businesses`
--

DROP TABLE IF EXISTS `line_of_businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_of_businesses` (
  `id` int(11) NOT NULL,
  `line_name` varchar(45) DEFAULT NULL,
  `TAM` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TAM_idx` (`TAM`),
  CONSTRAINT `FK_TAM` FOREIGN KEY (`TAM`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_of_businesses`
--

LOCK TABLES `line_of_businesses` WRITE;
/*!40000 ALTER TABLE `line_of_businesses` DISABLE KEYS */;
INSERT INTO `line_of_businesses` VALUES (1,'Cloud Services',5),(2,'Business Development',6),(3,'Design',14),(4,'Networking',15),(5,'Research',16);
/*!40000 ALTER TABLE `line_of_businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_contract`
--

DROP TABLE IF EXISTS `manager_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_manager_id_idx` (`manager_id`),
  KEY `fk_contract_id_idx` (`contract_id`),
  CONSTRAINT `fk_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_contract`
--

LOCK TABLES `manager_contract` WRITE;
/*!40000 ALTER TABLE `manager_contract` DISABLE KEYS */;
INSERT INTO `manager_contract` VALUES (1,3,1),(2,7,2),(3,8,3),(4,22,4),(5,23,5),(6,3,6),(7,7,7),(8,8,8),(9,22,9),(10,23,10),(11,3,11),(12,7,12),(13,8,13),(14,22,14),(15,23,15),(16,3,16),(17,7,17),(18,8,18),(19,22,19),(20,23,20),(21,3,21),(22,7,22),(23,8,23),(24,22,24),(25,23,25),(26,3,26),(27,7,27),(28,8,28),(29,22,29),(30,23,30);
/*!40000 ALTER TABLE `manager_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2018_07_28_005019_create_provinces_table',1),(2,'2018_07_28_023430_create_citys_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Quebec',NULL,NULL),(2,'Ontario',NULL,NULL),(3,'British Columbia',NULL,NULL),(4,'Alberta',NULL,NULL),(5,'Saskatchewan',NULL,NULL),(6,'Manitoba',NULL,NULL),(7,'New Brunswick',NULL,NULL),(8,'Nova Scotia',NULL,NULL),(9,'Prince Edward Island',NULL,NULL),(10,'Newfoundland',NULL,NULL),(11,'Yukon',NULL,NULL),(12,'Northwest Territories',NULL,NULL),(13,'Nunavut',NULL,NULL);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_plan` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `hometown` int(10) unsigned DEFAULT NULL,
  `contract_category` int(11) DEFAULT NULL,
  `current_contract` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insurancePlan_idx` (`insurance_plan`),
  KEY `FK_MANAGER_ID_idx` (`manager_id`),
  KEY `FK_USER_ID_idx` (`user_id`),
  KEY `FK_HOMETOWN_idx` (`hometown`),
  KEY `FK_CONTRACT_CATEGORY_idx` (`contract_category`),
  KEY `FK_CURRENT_CONTRACT_idx` (`current_contract`),
  CONSTRAINT `FK_CONTRACT_CATEGORY` FOREIGN KEY (`contract_category`) REFERENCES `contract_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CURRENT_CONTRACT` FOREIGN KEY (`current_contract`) REFERENCES `contracts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_HOMETOWN` FOREIGN KEY (`hometown`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_INSURANCEPLAN_ID` FOREIGN KEY (`insurance_plan`) REFERENCES `insurance_plans` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,1,1,1,NULL,NULL,NULL,NULL),(2,2,2,2,11,NULL,NULL,NULL,NULL),(3,1,5,3,6,NULL,NULL,NULL,NULL),(5,2,5,5,2,NULL,NULL,NULL,NULL),(6,1,6,6,5,NULL,NULL,NULL,NULL),(7,2,6,7,2,NULL,NULL,'2018-08-02 04:07:56',NULL),(8,3,14,8,9,NULL,NULL,'2018-08-01 23:40:05',NULL),(9,2,9,9,2,NULL,NULL,NULL,NULL),(10,2,10,10,3,NULL,NULL,NULL,NULL),(11,2,3,11,6,4,21,NULL,NULL),(12,2,7,12,2,4,22,NULL,NULL),(13,2,13,13,4,NULL,NULL,NULL,NULL),(14,2,14,14,9,NULL,NULL,NULL,NULL),(15,3,15,15,6,NULL,NULL,NULL,NULL),(16,1,16,16,5,NULL,NULL,NULL,NULL),(17,2,8,36,1,3,23,NULL,NULL),(18,2,3,37,2,3,24,NULL,NULL),(19,2,7,38,4,4,25,NULL,NULL),(20,2,8,39,2,4,26,NULL,NULL),(21,2,42,40,1,4,27,NULL,NULL),(22,3,15,41,11,NULL,NULL,NULL,NULL),(23,1,16,42,7,NULL,NULL,NULL,NULL),(24,1,43,43,4,NULL,NULL,NULL,NULL),(25,1,41,44,2,4,28,NULL,NULL),(26,1,41,45,10,2,29,NULL,NULL),(27,1,42,46,3,3,30,NULL,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_staffId` int(11) DEFAULT NULL,
  `contract_number` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `working_hour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TS_employee_id` (`employee_staffId`),
  KEY `FK_TS_CONTRACT_ID_idx` (`contract_number`),
  CONSTRAINT `FK_TS_CONTRACT_ID` FOREIGN KEY (`contract_number`) REFERENCES `contracts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TS_employee_id` FOREIGN KEY (`employee_staffId`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,11,21,'2018-07-11 09:00:00','2018-07-11 13:00:00',4),(2,12,22,'2018-07-12 10:00:00','2018-07-12 17:00:00',7),(3,17,23,'2018-07-10 09:00:00','2018-07-10 17:00:00',8),(4,18,24,'2018-07-11 09:00:00','2018-07-11 15:00:00',6),(5,19,25,'2018-07-11 09:00:00','2018-07-11 10:00:00',1),(6,20,26,'2018-07-12 09:00:00','2018-07-12 15:00:00',6),(7,21,27,'2018-07-11 09:00:00','2018-07-11 17:00:00',8),(8,25,28,'2018-07-12 09:00:00','2018-07-12 10:00:00',1),(9,26,29,'2018-07-11 09:00:00','2018-07-12 14:00:00',5),(10,27,30,'2018-07-11 09:00:00','2018-07-12 11:00:00',2);
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'oscar','Gu','1@qq.com','$2y$10$1bHMCMn1h6JYru2DuyH/ae4Td7SJA0x4RR/Mqo5NP.fGQVV1SjqG.','OqDQvT853nBQyHqUELjctCu0gRUIQVnCpEqFLDPBIhe2ECOZjKEQNbwUp4jr','2018-07-21 04:27:26','2018-07-21 04:27:26','admin'),(2,'Shengyun','Gu','1@gmail.com','$2y$10$whxJYGoR81OMBgEnJCshJusl865HzxCVdYl8ZlwY9VOwIBDOX/bZ.','UY1jTOh3KhyTlCUQYoYV4C49AjlgbqJMj41JwkQ41hSLCXsAFFvZVZQPwQRa','2018-07-27 06:25:41','2018-07-27 06:25:41','sales'),(3,'zoe','zhang','21@hotmail.com','$2y$10$RLv7EjXOEZ5M8lmxuUzz8eSwjVm4O.4GapuW1EnQPEXWuPPf.hPlO','EAw6xv3re4laUq9weSKG8qsRFTNJLGhCCzQH4YjHQFlapyMU2VulPGOm7LbL','2018-07-29 05:29:18','2018-07-29 05:29:18','manager'),(4,'nike',NULL,'2@hotmail.com','$2y$10$n1WG5UyG72W2tKRCdfXgQOyh/B1EmDImCnhMeSLm.81MLqOqLnujy','an1EWIjqvuQRCIT4Swe34eNgDTarMeDhhDbtJe8gQ82y8dD3DmvOG3GdTCBh','2018-07-29 05:57:37','2018-07-29 05:57:37','company'),(5,'Alice','Li','12@gmail.com','$2y$10$0aqGmPMROlXxWJjSdTALl.g0Twb1SEGoCs5pec1gIVmnRpLeRw2aG','IqxsVYkRoMUlpT8MDZEwNc5XNUFOmrzBCbMxJAbr6DKRrZn6yu6W7DjRRyvf','2018-07-30 06:38:05','2018-07-30 06:38:05','tam'),(6,'Fang','Wu','12@qq.com','$2y$10$XsTF.qm/kWsiC56NSY.VJuAsguVQ3cMa0IN3klrVcErFRCRjKyfIu','mFPRBGZsuqbeJX1rYZ8tNTR7TQouPcKI8jOgb4qF3RPVblw51mS5bE45btcC','2018-07-31 01:51:39','2018-07-31 01:51:39','tam'),(7,'Jame','Bush','3@qq.com','$2y$10$JvoNo6.DwFFoDE7UY7oCaejbiq4eSTynbcEQ5H72Obb7pSal7zwji','a7oKdHkqOgJE3ZeVsUr7UFKA0PfCPMJ14GtHO6aG33eg0ZCEeBcZmxn82Rzo','2018-08-01 00:49:30','2018-08-01 00:49:30','manager'),(8,'Lora','Chris','3@gmail.com','$2y$10$DdGG1syK5oPNwi2ZUXxj3eVNo55zBecdzqXZ61ukKbVM2VAd.GPIu','2D0nWQTdNEInL0mavuoIL9KToswPKS1QB5Wwq9un9MukSOjCOafzKSIrM9yt','2018-08-01 01:26:33','2018-08-01 01:26:33','manager'),(9,'Joy','Chen','joy.chen@hotmail.com','$2y$10$QBPWMr4cSnh3xJbjk5PqOO1G3kANhdoTph9LiSlGcfXZ02xVvgJpK','oMGrwPucIjOW9OrAur8X6JOckUk441bsqGldItazVUC0wuNI4j6u1UvKbroU','2018-08-08 22:56:37','2018-08-08 22:56:37','sales'),(10,'Sarah','Hillman','s.hillman@gmail.com','$2y$10$K1IG7jAEoW9fG5oHI8ZleulLAHbRWOxBw1UgppW1L7aqxmJIjlXxW','mv4dnyKgvhevXSePLnmUCS0ONYp9VspoT7ILEXM0rqwFkYkNDkpl8TwF5AhX','2018-08-08 22:59:07','2018-08-08 22:59:07','sales'),(11,'Derek','Cooper','derek.cooper@hotmail.com','$2y$10$tLS/tAHYoBjLnV7i.MEkd.e3zY910tAFjncgDREKIE34nqJJuesju','F77NGNuxGRmuW7yhmIsjEmMCreo4YGq6l7GDE4oJjHw1VM1oFr1Brsar2kEt','2018-08-08 23:02:09','2018-08-08 23:02:09','employee'),(12,'Vicki','Foss','v.foss@gmail.com','$2y$10$Ol33uf8cIbQTI/1J43r5j.1Sfv4A3N8tGXys8.cDJfbFggngtVm/W','87RbuiZzci7ygkDFBr7gAuzGChdRuKmiKSITWK6emN38aYAHTcKLSNGTrQJB','2018-08-08 23:08:20','2018-08-08 23:08:20','employee'),(13,'Marina','Wang','marinawang@gmail.com','$2y$10$8ScE/cP3y.FLg/zHvttbieIVw2PkDz7drkUW1fLSVNSGOTlla/Nve','yEEc4Chxlb5Qze7OnEjWgVU5xQnOW1HKioRXYS6oRlGCNZxdhou4joVKONqh','2018-08-08 23:09:15','2018-08-08 23:09:15','sales'),(14,'Tina','Smith','T.Smith@gmail.com','$2y$10$1kQqGEf3UTo1RXNUJ6W8seJVgA1RZ.Tv8fOHVnRTOZgITqUGpAnAy','dqeT1g6xr942COXosof0SIfusPqnysN0d8QbMEfk6KVQ9dilSA6gi1v90iLx','2018-08-08 23:10:41','2018-08-08 23:10:41','tam'),(15,'Robin','Pollitt','R.Pollitt@hotmail.com','$2y$10$AiM.ab3TP8xdy9ae4chrmeLu0lmhy9sJ2VXsub7q4PXeuljdfragS','gGj9mJiGUqeWLJi5GIuC3y3rRj4oRJNDGVuytcM7YbE7lWbaIjc34h0cUi9U','2018-08-08 23:17:06','2018-08-08 23:17:06','tam'),(16,'Patrick','Williams','PatrickWilliams@gmail.com','$2y$10$lYrljl8M0XCVnCJk.YcDPeSDNU8js9rxCYbxqCrS8v3s7RzEa5o1u','EgwhwghOqgfvceY0xvuLh1TzOSLQ76mbPCR7c5UXALgOTicCosgOsEzO4qmH','2018-08-08 23:19:16','2018-08-08 23:19:16','tam'),(17,'Sony',NULL,'sony@gmail.com','$2y$10$cln6As/sSyOKetooHGjIX.7nN/Mtono.dgLk4cRuWGC8DcYJzKMua','RbCcJiptOte5zj95Bfg7vuuLlMVQu4KvGLFV1thZFDdeBgz5e7d5bBu3h5Mk','2018-08-09 01:48:23','2018-08-09 01:48:23','company'),(18,'ABS',NULL,'abs@gmail.com','$2y$10$4pwWboL9tN7DaRrJk671NeYrY7nDZW7MVfkrO62bD9L0/.1BPPU3S','GVxLRzfwqzHcbnbwalx6Qe3Wmh48QfNQilYgxiPQF9RmHH3E9a34ApZbTNd5','2018-08-09 02:10:10','2018-08-09 02:10:10','company'),(19,'ALDO',NULL,'info@aldo.com','$2y$10$AGLGRHC2TS1z/h48CsOute9OjZhd.jl2vbMksEBnB7MCwjAae.aBS','wEFpdCA36sF14smawOZidf5eGedWMl21JMsHyl6MT1UzCIvPxSFM1l2MZgZr','2018-08-09 02:10:38','2018-08-09 02:10:38','company'),(20,'AIC',NULL,'contact@aic.com','$2y$10$RklbgXQoHZzIF1ZdmHsqVO.E0t2nQ3ND/01BGC8vuc1xCCgnRyWQa','UUUdtTXZuBjJbp2x5RWcWlQ5q4oVzVCqjri88lBHDT2tNkJLFoEBeZ0b6jTd','2018-08-09 02:11:06','2018-08-09 02:11:06','company'),(21,'IRUN',NULL,'info@irun.com','$2y$10$lj0b1thWRygIEoY74d.Xd..a/jy4fiRQUitqE3PdYexPY8V68OEB2','DmYQASMpLdb1f6cCiIs2sOSv4xfrZHQBfuq2oNcSQhRnuNUvi3diYsANDOml','2018-08-09 02:11:30','2018-08-09 02:11:30','company'),(22,'CSC Corp.',NULL,'csc@gmail.com','$2y$10$fyPxzJcwFMHUaJwmZsdFnuTEPcwGlqS8phfosnYB2.QmSoOD8FfZq','LcZqBBjuOQDxU0pAyPZhO80JyUVsZn25kaLar39MZd4q82aZZEDFnHN6hEaT','2018-08-09 02:12:00','2018-08-09 02:12:00','company'),(23,'Talent Plus',NULL,'Talent.Plus@gmail.com','$2y$10$7wIm2kJbcutoNgxN/LL8YuCt5fnP/16sl3w6sfN029NiLvoEXnnVe','xztQM8UHI4idIQPeMoWkOHOJhbbQCaTtteGv8CS8RvxcXEDUV8aMa13fuWNk','2018-08-09 21:11:46','2018-08-09 21:11:46','company'),(24,'South Mountain',NULL,'South.Mountain@gmail.com','$2y$10$ACdOzyG0zBxInyUJs8R80eiNhgTzCjHwiPNKKsITAa90qk6mnsHcO','iSkFkZ6dngcQBUxudERXJSuNntVlsmrPeNsnuCDcIu0qUW7tTZmbOBvdH8Cf','2018-08-09 21:12:36','2018-08-09 21:12:36','company'),(25,'Badger Mining',NULL,'Badger.Mining@gmail.com','$2y$10$IaA8obLG9KNLq/RLmXEP2OUniG/XtVaaQa012wbZ9/GZRbcxYMJ.m','pojlx0eZvooXsK5V6BP0AnwHbCbphnhCMcw5WohCF87u8pKfaTApyvKEyQLJ','2018-08-09 21:13:40','2018-08-09 21:13:40','company'),(26,'Square Root',NULL,'Square.Root@gmail.com','$2y$10$CNOGzW/B91q2MCVjpDfpJegEBJhDJIp6R.tlO1BK3rEmne/tkjr7W','oemSFQjSEHGQShXQla0c1srvn1IuuyEpmjFFps6orlViQ7cVJR0rj3sOS5tH','2018-08-09 21:15:05','2018-08-09 21:15:05','company'),(27,'Axis Communications',NULL,'Axis.Communications@gmail.com','$2y$10$7akjlEueb0KXx7ujgEGnY.obiU8q3OICChbz48UGLqwBkPTqCmlkO','rqDXp4ZXHznBSKPQhveLpmQOCtZ7PNY4DFYIVkTIh2uOIIPsAPtPW6OMF5LZ','2018-08-09 21:15:42','2018-08-09 21:15:42','company'),(28,'Stellar Solutions',NULL,'Stellar.Solutions@gmail.com','$2y$10$gQrAph1FaWZarOp1fzyHh.SghAZ53q911UAAEBudMOhFe16oVP8FS','tvFuU0TGFUGDMduZQVuf02trdtkI2RiFYWJM66DqazlJJ7TJybuOSV7XhBiH','2018-08-09 21:16:22','2018-08-09 21:16:22','company'),(29,'AnswerLab',NULL,'AnswerLab@gmail.com','$2y$10$6cm6BIWekzXM8jdpBoC4YORZO6V6H5s6zbTDwb7n02kKTQy9P3nmu','kb6HYFHBkcJTaFuae5ivq1erptwMDQl8btbqrGUH3a4WulzXSxtQ8uyK52Zc','2018-08-09 21:17:48','2018-08-09 21:17:48','company'),(30,'ONTRAPORT',NULL,'ONTRAPORT@gmail.com','$2y$10$.c0vDwsmVLb0309CWvQYturRTYKbN8X9BqcPAjclwEO3pmw3D9ZAC','fAV61SVoVi8zG4FTZuCwijNvkilJuFeYqQMC5SfPuBeQFSPo359XdaTxgfN6','2018-08-09 21:18:23','2018-08-09 21:18:23','company'),(31,'Intuitive Research and Technology',NULL,'Intuitive.RandT@gmail.com','$2y$10$caSOpQBrqVqswHgVYjKx/e.DsJkXuQ1GbVZMcAv6.znK9/xRTaK2e','mrdEX3cZs5dL9FQu7FRl4KX5ftiJNYhqojXkSgoHrIZTaslii0f36e7ttL9A','2018-08-09 21:20:33','2018-08-09 21:20:33','company'),(32,'Return Path',NULL,'Return.Path@gamil.com','$2y$10$BwMn0XQp09Y5ZU0WiHTCQuK0zh3EhRLLfR1nFNFTJls0wKTmBrA2i','KetxQP4I24caRH4IlxbNSuSEH4yxjVzfbHh3NGOGZIQhpC8WneWzzBf7zXkC','2018-08-09 21:21:11','2018-08-09 21:21:11','company'),(33,'Assurance Agency',NULL,'Assurance.Agency@gmail.com','$2y$10$Poa0zC2EBAmv0ivEx9HJOONxQNREovT8zfHLoMjSkf3y7Y48Heswe','z2WHJfDlJvFxPqMxS5ovBiaPfpvK3RF1mObk4tNc6lmVUZS5l4SkpseQEAEE','2018-08-09 21:21:49','2018-08-09 21:21:49','company'),(34,'Centro Institute',NULL,'Centro.Institute@gmail.com','$2y$10$uNPIO9o15Y3laMGd0zcQWO51AYmUJllaJmoE9t33KtM.0utxmalDW','Q42sIAFn2TipcJ7uSpfilFlki3ZegKkWoTAYE1sGwIoMHEY3HYjPAzjZRAo1','2018-08-09 21:22:55','2018-08-09 21:22:55','company'),(35,'Cirrus Logic',NULL,'Cirrus.Logic@gmail.com','$2y$10$B23eyaZ/ze5oahsaXy40Ie1svCe9bYBKa5GzeARumtqmnv/EG.3Ma','LUHUeEQrALFsU4jqc36HwXybpDlYI7dGX3EcsCsrW2aoKYZD1dOzEr8DbcY5','2018-08-09 21:23:31','2018-08-09 21:23:31','company'),(36,'Amy','Smith','A.Smith@gmail.com','$2y$10$ww1otGpk9n.l8U0okRYxlOjcdJmJO024r67lvGP1FZbkkHw6Rq5TC','DdPRwtqGuuGPek44vY58BtlLVEFbSQCwneCOD6kOagyNQEgjHV6PALsE01dI','2018-08-10 02:08:33','2018-08-10 02:08:33','employee'),(37,'Julien','Guo','Julien.Guo@gmail.com','$2y$10$oaiv/7cVAKodNJnY5.BeWu1otG9uYiuTnr4a48.cC1ScKNp35.5ZK','b8P1Hvo7dvrNCeIRiGxcTufoCEDPHYecXLLCwQZyPOil8nFdn2vi7GLVPKQ4','2018-08-10 02:09:32','2018-08-10 02:09:32','employee'),(38,'Maya','Chris','Maya.Chris@hotmail.com','$2y$10$HvKszadLrKXG6MUnjkDf../Wj2/JXWTLopXPsnIc7ULAGHh5umldu','B7prYEHK3sioCpP1by8J04fQ1FO4TpvbWQTrg9VpScxT7MHmU9SBZ9hEeSt2','2018-08-10 02:10:25','2018-08-10 02:10:25','employee'),(39,'Min','Liu','Liumin@hotmail.com','$2y$10$MiRgspRBYMIli131QOzW4OLg8vJOjq4K8DIPJJ3ynz0H27Jrd61a6','aCsrxyqD6lyrAaMaPvj3kGQ5FMXad2c9OjZwm3wDOfr22AAwi5JKtdFso3WC','2018-08-10 02:11:00','2018-08-10 02:11:00','employee'),(40,'Daniel','Li','Danielli@gmail.com','$2y$10$90XGJw1ZmEdLXHXszxd7POVFUWR/pd2R3dNB/TUTn7W0oAFOs9NJ2',NULL,'2018-08-10 02:15:38','2018-08-10 02:15:38','employee'),(41,'Anna','Davis','Anna.Davis@gmail.com','$2y$10$uvH.3YdjXogakdGmgnzcs.WooIv3kkpQZ1d8QO2829bJa75ZLqFku','OkDkXJW1HVmP7BgXeX1M0wH96EcKNJIwdjpQupzsiSyvFBB5hfVpr7DcxQ7l','2018-08-10 06:28:06','2018-08-10 06:28:06','manager'),(42,'Elizabeth','Green','Elizabeth.Green@hotmail.com','$2y$10$0ThN3ga7HLsVfxBLAyHeaOF.5r1qgj2WtzJuFk7Il8N.lf7Ru57vu','38QSBjMaeCBqbTruzs3S48AMyYcPbvBPFKuFqwYZN48FNpnGnCtdksLrHMTm','2018-08-10 06:28:54','2018-08-10 06:28:54','manager'),(43,'Emma','Thomas','Emma.Thomas@gmail.com','$2y$10$5tGaAk43Mw49ToW0LE.nW.w1fpUM0IJUfTcUgBY630.DpyPjNCOmW','q0nmwRViQMQE47PbDwOhuugcWTlr5j1FlzffR3ybvYZoNCArgl1gPADR9x6N','2018-08-10 06:29:44','2018-08-10 06:29:44','sales'),(44,'Alice','Martin','Alice.Martin@gmail.com','$2y$10$aTnHyrWUqvr7UuKtdTMOcO4fCIuV3W6Gnbw8YK8p6YEAF7S9jGHh6','aHnGqi3qOnbUcw0QyipAny7Gv8I85wdBs9OD9kWL3mNaaaMfLX80Rh4BlqYg','2018-08-10 06:30:29','2018-08-10 06:30:29','employee'),(45,'Marie','Bailey','Marie.Bailey@gmail.com','$2y$10$oSg59aBb2drBcwrTmXsm7OyCfO4fdeH4tT6Qy.66DePOqZveduVt6','BDsnmnOi1KAlnnvdjRF4kHlgs6JiQoKn3J6F9GGpIJGTINis9rOliRsQyHLd','2018-08-10 06:32:31','2018-08-10 06:32:31','employee'),(46,'Annie','Baker','Annie.Baker@gmail.com','$2y$10$uxoCuGBtFStrqjvpipqwL.fWZUrJTZnFtpTJlxmc5Mza2ZNkIdCom','aR10ycb28Zk3xBLyM7fIJudz0s6EfgrIcmwbDMcloGrVbcKnekbiouAZOAVg','2018-08-10 06:33:15','2018-08-10 06:33:15','employee');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-12 18:36:41
