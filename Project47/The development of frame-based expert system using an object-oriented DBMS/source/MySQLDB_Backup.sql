-- MySQL dump 10.8
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	4.1.7-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `name` varchar(30) NOT NULL default '',
  `surename` varchar(30) NOT NULL default '',
  `sex` char(1) default NULL,
  `age` int(10) unsigned default NULL,
  `ID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--


/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
LOCK TABLES `patient` WRITE;
INSERT INTO `patient` VALUES ('Vichan','Chutitaporn','m',22,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `temperature` int(10) unsigned NOT NULL default '0',
  `weight` int(10) unsigned default '0',
  `patient_id` int(10) unsigned NOT NULL default '0',
  `dateadded` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--


/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
LOCK TABLES `profile` WRITE;
INSERT INTO `profile` VALUES (1,40,70,1,'2005-03-21'),(2,40,70,1,'2005-03-21'),(3,25,70,1,'2005-03-21'),(4,37,25,1,'2005-03-21'),(5,43,23,1,'2005-03-21'),(6,38,52,1,'2005-03-21'),(7,40,100,1,'2005-03-21'),(8,37,40,1,'2005-03-21'),(9,25,50,1,'2005-03-21'),(10,3,40,1,'2005-03-21'),(11,37,40,1,'2005-03-21'),(12,38,45,1,'2005-03-21'),(13,12,45,1,'2005-03-21'),(14,37,52,1,'2005-03-21'),(15,37,37,1,'2005-03-21'),(16,37,37,1,'2005-03-21'),(17,37,25,1,'2005-03-21'),(18,37,37,1,'2005-03-21'),(19,40,40,1,'2005-03-21'),(20,40,40,1,'2005-03-21'),(21,12,12,1,'2005-03-21'),(22,37,1,1,'2005-03-21'),(23,37,37,1,'2005-03-21'),(24,37,70,1,'2005-03-21'),(25,37,70,1,'2005-03-21'),(26,37,65,1,'2005-03-21'),(27,37,70,1,'2005-03-22'),(28,39,65,1,'2005-03-22');
UNLOCK TABLES;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

