
-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: mysqlkimai    Database: kimai
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `kimai_activities`
--

DROP TABLE IF EXISTS `kimai_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_activities` (
  `activityID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` text,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `filter` tinyint(1) NOT NULL DEFAULT '0',
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_activities`
--

LOCK TABLES `kimai_activities` WRITE;
/*!40000 ALTER TABLE `kimai_activities` DISABLE KEYS */;
INSERT INTO `kimai_activities` VALUES (1,'testing','',1,0,0);
/*!40000 ALTER TABLE `kimai_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_configuration`
--

DROP TABLE IF EXISTS `kimai_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_configuration` (
  `option` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`option`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_configuration`
--

LOCK TABLES `kimai_configuration` WRITE;
/*!40000 ALTER TABLE `kimai_configuration` DISABLE KEYS */;
INSERT INTO `kimai_configuration` VALUES ('adminmail','admin@example.com'),('allowRoundDown','0'),('check_at_startup','0'),('currency_first','0'),('currency_name','Euro'),('currency_sign','â‚¬'),('date_format_0','dd.mm.yy'),('date_format_1','%d.%m.'),('date_format_2','%d.%m.%Y'),('date_format_3','d.m.Y'),('decimalSeparator',','),('defaultStatusID','1'),('defaultVat','19'),('durationWithSeconds','0'),('editLimit','-'),('exactSums','0'),('language','en'),('login','1'),('loginBanTime','900'),('loginTries','3'),('revision','1389'),('roundMinutes','0'),('roundPrecision','0'),('roundSeconds','0'),('roundTimesheetEntries','0'),('show_daySeperatorLines','1'),('show_gabBreaks','0'),('show_RecordAgain','1'),('show_sensible_data','0'),('show_TrackingNr','1'),('show_update_warn','1'),('version','1.1.0');
/*!40000 ALTER TABLE `kimai_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_customers`
--

DROP TABLE IF EXISTS `kimai_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_customers` (
  `customerID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `passwordResetHash` char(32) DEFAULT NULL,
  `secure` varchar(60) NOT NULL DEFAULT '0',
  `comment` text,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `filter` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_customers`
--

LOCK TABLES `kimai_customers` WRITE;
/*!40000 ALTER TABLE `kimai_customers` DISABLE KEYS */;
INSERT INTO `kimai_customers` VALUES (1,'Test-Customer',NULL,NULL,'0','',1,0,'','','','','','',NULL,'','','','','','UTC',0);
/*!40000 ALTER TABLE `kimai_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_expenses`
--

DROP TABLE IF EXISTS `kimai_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_expenses` (
  `expenseID` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `userID` int(10) NOT NULL,
  `projectID` int(10) NOT NULL,
  `designation` text NOT NULL,
  `comment` text,
  `commentType` tinyint(1) NOT NULL DEFAULT '0',
  `refundable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `multiplier` decimal(10,2) NOT NULL DEFAULT '1.00',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`expenseID`),
  KEY `userID` (`userID`),
  KEY `projectID` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_expenses`
--

LOCK TABLES `kimai_expenses` WRITE;
/*!40000 ALTER TABLE `kimai_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_fixedRates`
--

DROP TABLE IF EXISTS `kimai_fixedRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_fixedRates` (
  `projectID` int(10) DEFAULT NULL,
  `activityID` int(10) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL,
  UNIQUE KEY `projectID` (`projectID`,`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_fixedRates`
--

LOCK TABLES `kimai_fixedRates` WRITE;
/*!40000 ALTER TABLE `kimai_fixedRates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai_fixedRates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_globalRoles`
--

DROP TABLE IF EXISTS `kimai_globalRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_globalRoles` (
  `globalRoleID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deb_ext-access` tinyint(4) DEFAULT '0',
  `adminPanel_extension-access` tinyint(4) DEFAULT '0',
  `ki_budget-access` tinyint(4) DEFAULT '0',
  `ki_expenses-access` tinyint(4) DEFAULT '0',
  `ki_export-access` tinyint(4) DEFAULT '0',
  `ki_invoice-access` tinyint(4) DEFAULT '0',
  `ki_timesheet-access` tinyint(4) DEFAULT '0',
  `demo_ext-access` tinyint(4) DEFAULT '0',
  `core-customer-otherGroup-add` tinyint(4) DEFAULT '0',
  `core-customer-otherGroup-edit` tinyint(4) DEFAULT '0',
  `core-customer-otherGroup-delete` tinyint(4) DEFAULT '0',
  `core-customer-otherGroup-assign` tinyint(4) DEFAULT '0',
  `core-customer-otherGroup-unassign` tinyint(4) DEFAULT '0',
  `core-project-otherGroup-add` tinyint(4) DEFAULT '0',
  `core-project-otherGroup-edit` tinyint(4) DEFAULT '0',
  `core-project-otherGroup-delete` tinyint(4) DEFAULT '0',
  `core-project-otherGroup-assign` tinyint(4) DEFAULT '0',
  `core-project-otherGroup-unassign` tinyint(4) DEFAULT '0',
  `core-activity-otherGroup-add` tinyint(4) DEFAULT '0',
  `core-activity-otherGroup-edit` tinyint(4) DEFAULT '0',
  `core-activity-otherGroup-delete` tinyint(4) DEFAULT '0',
  `core-activity-otherGroup-assign` tinyint(4) DEFAULT '0',
  `core-activity-otherGroup-unassign` tinyint(4) DEFAULT '0',
  `core-user-otherGroup-add` tinyint(4) DEFAULT '0',
  `core-user-otherGroup-edit` tinyint(4) DEFAULT '0',
  `core-user-otherGroup-delete` tinyint(4) DEFAULT '0',
  `core-user-otherGroup-assign` tinyint(4) DEFAULT '0',
  `core-user-otherGroup-unassign` tinyint(4) DEFAULT '0',
  `core-status-add` tinyint(4) DEFAULT '0',
  `core-status-edit` tinyint(4) DEFAULT '0',
  `core-status-delete` tinyint(4) DEFAULT '0',
  `core-group-add` tinyint(4) DEFAULT '0',
  `core-group-otherGroup-edit` tinyint(4) DEFAULT '0',
  `core-group-otherGroup-delete` tinyint(4) DEFAULT '0',
  `adminPanel_extension-editAdvanced` tinyint(4) DEFAULT '0',
  `ki_timesheets-ownEntry-add` tinyint(4) DEFAULT '0',
  `ki_timesheets-otherEntry-otherGroup-add` tinyint(4) DEFAULT '0',
  `ki_timesheets-ownEntry-edit` tinyint(4) DEFAULT '0',
  `ki_timesheets-otherEntry-otherGroup-edit` tinyint(4) DEFAULT '0',
  `ki_timesheets-ownEntry-delete` tinyint(4) DEFAULT '0',
  `ki_timesheets-otherEntry-otherGroup-delete` tinyint(4) DEFAULT '0',
  `ki_timesheets-showRates` tinyint(4) DEFAULT '0',
  `ki_timesheets-editRates` tinyint(4) DEFAULT '0',
  `ki_expenses-ownEntry-add` tinyint(4) DEFAULT '0',
  `ki_expenses-otherEntry-otherGroup-add` tinyint(4) DEFAULT '0',
  `ki_expenses-ownEntry-edit` tinyint(4) DEFAULT '0',
  `ki_expenses-otherEntry-otherGroup-edit` tinyint(4) DEFAULT '0',
  `ki_expenses-ownEntry-delete` tinyint(4) DEFAULT '0',
  `ki_expenses-otherEntry-otherGroup-delete` tinyint(4) DEFAULT '0',
  `core-customer-otherGroup-view` tinyint(4) DEFAULT '0',
  `core-project-otherGroup-view` tinyint(4) DEFAULT '0',
  `core-activity-otherGroup-view` tinyint(4) DEFAULT '0',
  `core-group-otherGroup-view` tinyint(4) DEFAULT '0',
  `core-user-otherGroup-view` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`globalRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_globalRoles`
--

LOCK TABLES `kimai_globalRoles` WRITE;
/*!40000 ALTER TABLE `kimai_globalRoles` DISABLE KEYS */;
INSERT INTO `kimai_globalRoles` VALUES (1,'Admin',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,'User',0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `kimai_globalRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_groups`
--

DROP TABLE IF EXISTS `kimai_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_groups` (
  `groupID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_groups`
--

LOCK TABLES `kimai_groups` WRITE;
/*!40000 ALTER TABLE `kimai_groups` DISABLE KEYS */;
INSERT INTO `kimai_groups` VALUES (1,'admin',0);
/*!40000 ALTER TABLE `kimai_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_groups_activities`
--

DROP TABLE IF EXISTS `kimai_groups_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_groups_activities` (
  `groupID` int(11) NOT NULL,
  `activityID` int(11) NOT NULL,
  UNIQUE KEY `groupID` (`groupID`,`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_groups_activities`
--

LOCK TABLES `kimai_groups_activities` WRITE;
/*!40000 ALTER TABLE `kimai_groups_activities` DISABLE KEYS */;
INSERT INTO `kimai_groups_activities` VALUES (1,1);
/*!40000 ALTER TABLE `kimai_groups_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_groups_customers`
--

DROP TABLE IF EXISTS `kimai_groups_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_groups_customers` (
  `groupID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  UNIQUE KEY `groupID` (`groupID`,`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_groups_customers`
--

LOCK TABLES `kimai_groups_customers` WRITE;
/*!40000 ALTER TABLE `kimai_groups_customers` DISABLE KEYS */;
INSERT INTO `kimai_groups_customers` VALUES (1,1);
/*!40000 ALTER TABLE `kimai_groups_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_groups_projects`
--

DROP TABLE IF EXISTS `kimai_groups_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_groups_projects` (
  `groupID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  UNIQUE KEY `groupID` (`groupID`,`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_groups_projects`
--

LOCK TABLES `kimai_groups_projects` WRITE;
/*!40000 ALTER TABLE `kimai_groups_projects` DISABLE KEYS */;
INSERT INTO `kimai_groups_projects` VALUES (1,1);
/*!40000 ALTER TABLE `kimai_groups_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_groups_users`
--

DROP TABLE IF EXISTS `kimai_groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_groups_users` (
  `groupID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `membershipRoleID` int(10) NOT NULL,
  PRIMARY KEY (`groupID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_groups_users`
--

-- LOCK TABLES `kimai_groups_users` WRITE;
/*!40000 ALTER TABLE `kimai_groups_users` DISABLE KEYS */;
-- INSERT INTO `kimai_groups_users` VALUES (1,886516044,1);
/*!40000 ALTER TABLE `kimai_groups_users` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `kimai_membershipRoles`
--

DROP TABLE IF EXISTS `kimai_membershipRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_membershipRoles` (
  `membershipRoleID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `core-customer-add` tinyint(4) DEFAULT '0',
  `core-customer-edit` tinyint(4) DEFAULT '0',
  `core-customer-delete` tinyint(4) DEFAULT '0',
  `core-customer-assign` tinyint(4) DEFAULT '0',
  `core-customer-unassign` tinyint(4) DEFAULT '0',
  `core-project-add` tinyint(4) DEFAULT '0',
  `core-project-edit` tinyint(4) DEFAULT '0',
  `core-project-delete` tinyint(4) DEFAULT '0',
  `core-project-assign` tinyint(4) DEFAULT '0',
  `core-project-unassign` tinyint(4) DEFAULT '0',
  `core-activity-add` tinyint(4) DEFAULT '0',
  `core-activity-edit` tinyint(4) DEFAULT '0',
  `core-activity-delete` tinyint(4) DEFAULT '0',
  `core-activity-assign` tinyint(4) DEFAULT '0',
  `core-activity-unassign` tinyint(4) DEFAULT '0',
  `core-user-add` tinyint(4) DEFAULT '0',
  `core-user-edit` tinyint(4) DEFAULT '0',
  `core-user-delete` tinyint(4) DEFAULT '0',
  `core-user-assign` tinyint(4) DEFAULT '0',
  `core-user-unassign` tinyint(4) DEFAULT '0',
  `core-user-view` tinyint(4) DEFAULT '0',
  `core-group-edit` tinyint(4) DEFAULT '0',
  `core-group-delete` tinyint(4) DEFAULT '0',
  `ki_timesheets-otherEntry-ownGroup-add` tinyint(4) DEFAULT '0',
  `ki_timesheets-otherEntry-ownGroup-edit` tinyint(4) DEFAULT '0',
  `ki_timesheets-otherEntry-ownGroup-delete` tinyint(4) DEFAULT '0',
  `ki_expenses-otherEntry-ownGroup-add` tinyint(4) DEFAULT '0',
  `ki_expenses-otherEntry-ownGroup-edit` tinyint(4) DEFAULT '0',
  `ki_expenses-otherEntry-ownGroup-delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`membershipRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_membershipRoles`
--

LOCK TABLES `kimai_membershipRoles` WRITE;
/*!40000 ALTER TABLE `kimai_membershipRoles` DISABLE KEYS */;
INSERT INTO `kimai_membershipRoles` VALUES (1,'Admin',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,'User',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,'Groupleader',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1);
/*!40000 ALTER TABLE `kimai_membershipRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_preferences`
--

DROP TABLE IF EXISTS `kimai_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_preferences` (
  `userID` int(10) NOT NULL,
  `option` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`,`option`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_preferences`
--

LOCK TABLES `kimai_preferences` WRITE;
/*!40000 ALTER TABLE `kimai_preferences` DISABLE KEYS */;
INSERT INTO `kimai_preferences` VALUES (886516044,'timezone','UTC'),(886516044,'ui.hideOverlapLines','1'),(886516044,'ui.rowlimit','100'),(886516044,'ui.showCommentsByDefault','0'),(886516044,'ui.showTrackingNumber','1'),(886516044,'ui.skin','standard');
/*!40000 ALTER TABLE `kimai_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_projects`
--

DROP TABLE IF EXISTS `kimai_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_projects` (
  `projectID` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` text,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `filter` tinyint(1) NOT NULL DEFAULT '0',
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  `budget` decimal(10,2) DEFAULT '0.00',
  `effort` decimal(10,2) DEFAULT NULL,
  `approved` decimal(10,2) DEFAULT NULL,
  `internal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectID`),
  KEY `customerID` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_projects`
--

LOCK TABLES `kimai_projects` WRITE;
/*!40000 ALTER TABLE `kimai_projects` DISABLE KEYS */;
INSERT INTO `kimai_projects` VALUES (1,1,'Test-Project','',1,0,0,0.00,NULL,NULL,0);
/*!40000 ALTER TABLE `kimai_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_projects_activities`
--

DROP TABLE IF EXISTS `kimai_projects_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_projects_activities` (
  `projectID` int(11) NOT NULL,
  `activityID` int(11) NOT NULL,
  `budget` decimal(10,2) DEFAULT '0.00',
  `effort` decimal(10,2) DEFAULT NULL,
  `approved` decimal(10,2) DEFAULT NULL,
  UNIQUE KEY `projectID` (`projectID`,`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_projects_activities`
--

LOCK TABLES `kimai_projects_activities` WRITE;
/*!40000 ALTER TABLE `kimai_projects_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai_projects_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_rates`
--

DROP TABLE IF EXISTS `kimai_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_rates` (
  `userID` int(10) DEFAULT NULL,
  `projectID` int(10) DEFAULT NULL,
  `activityID` int(10) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL,
  UNIQUE KEY `userID` (`userID`,`projectID`,`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_rates`
--

LOCK TABLES `kimai_rates` WRITE;
/*!40000 ALTER TABLE `kimai_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_statuses`
--

DROP TABLE IF EXISTS `kimai_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_statuses` (
  `statusID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_statuses`
--

LOCK TABLES `kimai_statuses` WRITE;
/*!40000 ALTER TABLE `kimai_statuses` DISABLE KEYS */;
INSERT INTO `kimai_statuses` VALUES (1,'open'),(2,'review'),(3,'closed');
/*!40000 ALTER TABLE `kimai_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_timeSheet`
--

DROP TABLE IF EXISTS `kimai_timeSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_timeSheet` (
  `timeEntryID` int(10) NOT NULL AUTO_INCREMENT,
  `start` int(10) NOT NULL DEFAULT '0',
  `end` int(10) NOT NULL DEFAULT '0',
  `duration` int(6) NOT NULL DEFAULT '0',
  `userID` int(10) NOT NULL,
  `projectID` int(10) NOT NULL,
  `activityID` int(10) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `comment` text,
  `commentType` tinyint(1) NOT NULL DEFAULT '0',
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `location` varchar(50) DEFAULT NULL,
  `trackingNumber` varchar(30) DEFAULT NULL,
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fixedRate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `budget` decimal(10,2) DEFAULT NULL,
  `approved` decimal(10,2) DEFAULT NULL,
  `statusID` smallint(6) NOT NULL,
  `billable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`timeEntryID`),
  KEY `userID` (`userID`),
  KEY `projectID` (`projectID`),
  KEY `activityID` (`activityID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_timeSheet`
--

LOCK TABLES `kimai_timeSheet` WRITE;
/*!40000 ALTER TABLE `kimai_timeSheet` DISABLE KEYS */;
INSERT INTO `kimai_timeSheet` VALUES (1,1510356086,1510356090,4,886516044,1,1,NULL,NULL,0,0,NULL,NULL,0.00,0.00,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `kimai_timeSheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai_users`
--

DROP TABLE IF EXISTS `kimai_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kimai_users` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  `alias` varchar(160) DEFAULT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `mail` varchar(160) NOT NULL DEFAULT '',
  `password` varchar(254) DEFAULT NULL,
  `passwordResetHash` char(32) DEFAULT NULL,
  `ban` int(1) NOT NULL DEFAULT '0',
  `banTime` int(10) NOT NULL DEFAULT '0',
  `secure` varchar(60) NOT NULL DEFAULT '0',
  `lastProject` int(10) NOT NULL DEFAULT '1',
  `lastActivity` int(10) NOT NULL DEFAULT '1',
  `lastRecord` int(10) NOT NULL DEFAULT '0',
  `timeframeBegin` varchar(60) NOT NULL DEFAULT '0',
  `timeframeEnd` varchar(60) NOT NULL DEFAULT '0',
  `apikey` varchar(30) DEFAULT NULL,
  `globalRoleID` int(10) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `apikey` (`apikey`)
) ENGINE=InnoDB AUTO_INCREMENT=886516045 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai_users`
--

-- LOCK TABLES `kimai_users` WRITE;
/*!40000 ALTER TABLE `kimai_users` DISABLE KEYS */;
-- INSERT INTO `kimai_users` VALUES (886516044,'admin',NULL,0,1,'admin@example.com','2dc7c127f0b5bf4698533d074da7c979',NULL,0,0,'PFTNblk4jIGuSQqGIKehcZtzE9m69p',1,1,0,'1509494400','1510444799',NULL,1);
/*!40000 ALTER TABLE `kimai_users` ENABLE KEYS */;
-- UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-11 10:49:46
