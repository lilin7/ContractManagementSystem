-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: gbc55311
-- ------------------------------------------------------
-- Server version	5.6.39

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
-- Table structure for table `CONTRACT`
--

DROP TABLE IF EXISTS `CONTRACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTRACT` (
  `contractNumber` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `manager_staffId` int(11) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `initialAmount` double DEFAULT NULL,
  `dateOfCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deliverableStage` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `satissfactionScore` int(11) DEFAULT NULL,
  PRIMARY KEY (`contractNumber`),
  UNIQUE KEY `id_UNIQUE` (`contractNumber`),
  KEY `fk_contract_manager1_idx` (`manager_staffId`),
  KEY `fk_contract_company1_idx` (`company_id`),
  KEY `FK_CATEGORY_idx` (`category`),
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`category`) REFERENCES `contractCategory` (`category_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COMPANY_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CT_MANAGER_ID` FOREIGN KEY (`manager_staffId`) REFERENCES `manager` (`manager_staffId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTRACT`
--

LOCK TABLES `CONTRACT` WRITE;
/*!40000 ALTER TABLE `CONTRACT` DISABLE KEYS */;
INSERT INTO `CONTRACT` VALUES (1,2,2,NULL,1064.95,'2018-07-20 05:45:52',NULL,'expired',NULL),(2,1,5,NULL,20000,'2018-07-20 04:25:34',NULL,'active',NULL),(3,1,3,NULL,10000,'2018-07-20 04:25:35',NULL,'active',NULL),(4,3,5,NULL,40000,'2018-07-20 05:45:52',NULL,'active',NULL),(5,2,6,NULL,7000,'2018-07-20 04:25:35',NULL,'active',NULL),(6,4,7,NULL,30000,'2018-07-20 04:25:35',NULL,'active',NULL),(7,4,4,NULL,23000,'2018-07-20 05:45:52',NULL,'active',NULL),(8,4,2,NULL,10000,'2018-07-20 04:25:35',NULL,'active',NULL),(9,4,8,NULL,40000,'2018-07-20 04:25:36',NULL,'active',NULL),(10,5,1,NULL,85000,'2018-07-20 04:25:36',NULL,'active',NULL);
/*!40000 ALTER TABLE `CONTRACT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `responsible` varchar(45) DEFAULT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `zipcode` char(6) DEFAULT NULL,
  `ACV` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'ABS','Zoe Chen','5147483647','abs@gmail.com','montreal','QC','H3H2B4',0),(2,'ALDO','Jimmy White','4162987234','info@aldo.com','toronto','ON','M4P2L2',0),(3,'AIC','Rachel Bell','4182760983','contact@aic.com','quebec','QC','G1V2M2',0),(4,'IRUN','Lily Gate','5142987345','info@irun.com','montreal','QC','H2K1J4',50000),(5,'CSC Corp.','Jean Green','5143978861','csc@gmail.com','montreal','QC','H3H2G1',115000);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractCategory`
--

DROP TABLE IF EXISTS `contractCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractCategory` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  `leadTime` int(11) DEFAULT NULL,
  `firstDeliverable` int(11) DEFAULT NULL,
  `secondDeliverable` int(11) DEFAULT NULL,
  `thirdDeliverable` int(11) DEFAULT NULL,
  `finalDeliverable` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `TYPE` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractCategory`
--

LOCK TABLES `contractCategory` WRITE;
/*!40000 ALTER TABLE `contractCategory` DISABLE KEYS */;
INSERT INTO `contractCategory` VALUES (1,'Diamond',18,6,11,NULL,18),(2,'Gold',20,8,14,NULL,20),(3,'Premiun',10,3,5,NULL,10),(4,'Silver',28,5,15,20,28);
/*!40000 ALTER TABLE `contractCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_staffId` int(11) NOT NULL,
  `manager_staffId` int(11) DEFAULT NULL,
  `totalWorkingHours` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_staffId`),
  KEY `FK_MANAGER_STAFFID_idx` (`manager_staffId`,`employee_staffId`),
  KEY `FK_EMPLOYEE_STAFFID_idx` (`employee_staffId`),
  CONSTRAINT `FK_EMPLOYEE_STAFFID_1` FOREIGN KEY (`employee_staffId`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MANAGER_STAFFID_1` FOREIGN KEY (`manager_staffId`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (16,NULL,NULL),(17,NULL,NULL),(18,NULL,NULL),(19,NULL,NULL),(20,NULL,NULL),(21,NULL,NULL),(22,NULL,NULL),(23,NULL,NULL),(24,NULL,NULL),(25,NULL,NULL),(26,NULL,NULL),(27,NULL,NULL),(28,NULL,NULL),(29,NULL,NULL),(30,NULL,NULL),(31,NULL,NULL),(32,NULL,NULL),(33,NULL,NULL),(34,NULL,NULL),(35,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `manager_staffId` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manager_staffId`),
  CONSTRAINT `FK_MANAGER_STAFFID_2` FOREIGN KEY (`manager_staffId`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Cloud Services'),(2,'Cloud Services'),(3,'Business Development'),(4,'Business Development'),(5,'Design'),(6,'Design'),(7,'Networking'),(8,'Networking'),(9,'Research'),(10,'Research');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `insurancePlan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `FK_insurancePlan_idx` (`insurancePlan`),
  CONSTRAINT `FK_insurancePlan` FOREIGN KEY (`insurancePlan`) REFERENCES `staffInsurance` (`insuranceType`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Josh','Fetcher','manager',NULL),(2,'Kavein','Park','manager',NULL),(3,'Arthur','Rayn','manager',NULL),(4,'Billy','Dolson','manager',NULL),(5,'Hock','Lee','manager',NULL),(6,'Harley','Wang','manager',NULL),(7,'Emma','Adams','manager',NULL),(8,'Catherine','Willams','manager',NULL),(9,'Robbert','Page','manager',NULL),(10,'Rachel','Roger','manager',NULL),(11,'Mira','Freeman','sales associate',NULL),(12,'Jake','Booth','sales associate',NULL),(13,'Joly','Walsh','sales associate',NULL),(14,'Austin','Price','sales associate',NULL),(15,'Ed','Newman','admin',NULL),(16,'Jamie','Howe','employee',NULL),(17,'Chenchen','Wu','employee',NULL),(18,'Ben','Mills','employee',NULL),(19,'Oliva','Arger','employee',NULL),(20,'Ann','Holt','employee',NULL),(21,'Jim','Hay','employee',NULL),(22,'Isla','Zhang','employee',NULL),(23,'Ivy','Watts','employee',NULL),(24,'David','Smith','employee',NULL),(25,'Makayla','Bush','employee',NULL),(26,'Celtic','Wilson','employee',NULL),(27,'Sam','Hill','employee',NULL),(28,'Jason','Zhang','employee',NULL),(29,'Molly','Haddad','employee',NULL),(30,'Jan','Wood','employee',NULL),(31,'Roger','Martin','employee',NULL),(32,'Mike','Scott','employee',NULL),(33,'Bill','Green','employee',NULL),(34,'Van','David','employee',NULL),(35,'Lisa','Li','employee',NULL),(36,'Rebecca','Louis','TAM',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffInsurance`
--

DROP TABLE IF EXISTS `staffInsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffInsurance` (
  `plan_id` int(11) NOT NULL,
  `insuranceType` varchar(45) DEFAULT NULL,
  `reimburseRatio` double DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `TYPE` (`insuranceType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffInsurance`
--

LOCK TABLES `staffInsurance` WRITE;
/*!40000 ALTER TABLE `staffInsurance` DISABLE KEYS */;
INSERT INTO `staffInsurance` VALUES (1,'Premium',0.9),(2,'Silver',0.8),(3,'Normal',0.7);
/*!40000 ALTER TABLE `staffInsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_staffId` int(11) DEFAULT NULL,
  `contract_number` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `working_hour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TS_contract_number_idx` (`contract_number`),
  KEY `FK_TS_employee_id` (`employee_staffId`),
  CONSTRAINT `FK_TS_contract_number` FOREIGN KEY (`contract_number`) REFERENCES `CONTRACT` (`contractNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TS_employee_id` FOREIGN KEY (`employee_staffId`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,4,2,'2018-07-11 09:00:00','2018-07-11 13:00:00',4),(2,12,4,'2018-07-12 10:00:00','2018-07-12 17:00:00',7),(3,10,6,'2018-07-10 09:00:00','2018-07-10 17:00:00',8),(4,2,8,'2018-07-11 09:00:00','2018-07-11 15:00:00',6),(5,15,2,'2018-07-11 09:00:00','2018-07-11 10:00:00',1),(6,1,10,'2018-07-12 09:00:00','2018-07-12 15:00:00',6),(7,3,3,'2018-07-11 09:00:00','2018-07-11 17:00:00',8),(8,12,7,'2018-07-12 09:00:00','2018-07-12 10:00:00',1);
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `userType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-20 20:00:41
