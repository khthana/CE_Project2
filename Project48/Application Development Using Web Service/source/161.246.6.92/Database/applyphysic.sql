# MySQL-Front 3.2  (Build 6.14)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'tis620' */;

DROP DATABASE IF EXISTS `applyphysic`;
CREATE DATABASE `applyphysic` /*!40100 DEFAULT CHARACTER SET tis620 */;
USE `applyphysic`;
CREATE TABLE `booker` (
  `Email` varchar(70) NOT NULL default '',
  `Name` varchar(30) default NULL,
  `Surname` varchar(30) default NULL,
  `PhoneNo` varchar(15) default NULL,
  PRIMARY KEY  (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `booker` VALUES ('oneoneone@hotmail.com','Shon','parpa','02-222-2222');
INSERT INTO `booker` VALUES ('Shollatham@hotmail.com','Shon','Parpa','02-222-2222');
INSERT INTO `booker` VALUES ('Shon@hotmail.com','Shon','Prapar','02-222-2222');
INSERT INTO `booker` VALUES ('Shoney121@hotmail.com','Shon','parpa','02-222-2222');
INSERT INTO `booker` VALUES ('ssinlovely@hotmail.com','Sin','Vora','02-222-2222');
INSERT INTO `booker` VALUES ('test@test.com','Mr.A','AAA','012345678');
CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL auto_increment,
  `ClassID` int(11) NOT NULL default '0',
  `Booker` varchar(255) default NULL,
  `Cancel` tinyint(1) default NULL,
  `PayStatus` varchar(20) default NULL,
  PRIMARY KEY  (`BookingID`),
  KEY `FK` (`ClassID`),
  KEY `FK2` (`Booker`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `booking` VALUES (1,1,'shon@hotmail.com',0,'');
INSERT INTO `booking` VALUES (2,1,'shollatham@hotmail.com',0,'');
INSERT INTO `booking` VALUES (3,1,'shoney121@hotmail.com',0,'');
INSERT INTO `booking` VALUES (4,2,'shon@hotmail.com',0,NULL);
INSERT INTO `booking` VALUES (5,1,'shon@hotmail.com',0,NULL);
INSERT INTO `booking` VALUES (6,3,'shon@hotmail.com',0,NULL);
INSERT INTO `booking` VALUES (7,1,'ssinlovely@hotmail.com',1,NULL);
INSERT INTO `booking` VALUES (8,4,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (9,5,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (10,1,'oneoneone@hotmail.com',1,NULL);
INSERT INTO `booking` VALUES (11,2,'oneoneone@hotmail.com',0,NULL);
CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL auto_increment,
  `Subject` varchar(15) default 'physic',
  `StartDate` date default NULL,
  `FinishDate` date default NULL,
  `StartTime` datetime default NULL,
  `FinishTime` datetime default NULL,
  `CourseDate` varchar(20) default NULL,
  `Teacher` varchar(50) default NULL,
  `Area` varchar(50) default NULL,
  `TotalSeat` int(11) default NULL,
  `AvailableSeat` int(11) default NULL,
  `Cost` double(8,2) default NULL,
  `Period` int(11) default NULL,
  `School` varchar(11) default 'Apply',
  PRIMARY KEY  (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `class` VALUES (1,'physic','2006-03-02','2006-04-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu','Chatchai','Siam',60,56,1600,4,'Apply');
INSERT INTO `class` VALUES (2,'physic','2006-03-02','2006-04-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu','Chatchai','Siam',60,58,1600,4,'Apply');
INSERT INTO `class` VALUES (3,'physic','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Shoney','Central Ladpraw',40,59,1500,1,'Apply');
INSERT INTO `class` VALUES (4,'physic','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Shoney','Central Ladpraw',40,59,1500,1,'Apply');
INSERT INTO `class` VALUES (5,'physic','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Sindy','Zecon',40,59,1500,1,'Apply');
INSERT INTO `class` VALUES (6,'physic','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Chatchai','Siam',60,60,1800,1,'Apply');
INSERT INTO `class` VALUES (7,'physic','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Chatchai','Siam',60,60,1800,1,'Apply');
INSERT INTO `class` VALUES (8,'physic','2006-09-01','2006-10-30','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Chatchai','Siam',60,60,1600,2,'Apply');
INSERT INTO `class` VALUES (9,'physic','2006-09-01','2006-10-30','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Chatchai','Siam',60,60,1600,2,'Apply');
INSERT INTO `class` VALUES (10,'physic','2006-09-04','2006-10-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu-Sat','Joe','Siam',60,60,1600,2,'Apply');
INSERT INTO `class` VALUES (11,'physic','2006-09-04','2006-10-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu-Sat','Joe','Siam',60,60,1600,2,'Apply');
INSERT INTO `class` VALUES (12,'physic','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Chatchai','Siam',60,60,1800,3,'Apply');
INSERT INTO `class` VALUES (13,'physic','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Chatchai','Siam',60,60,1800,3,'Apply');
INSERT INTO `class` VALUES (14,'physic','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Shoney','Central Ladpraw',40,40,1500,3,'Apply');
INSERT INTO `class` VALUES (15,'physic','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Shoney','Central Ladpraw',40,40,1500,3,'Apply');

ALTER TABLE `booking`
  ADD FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  ADD FOREIGN KEY (`Booker`) REFERENCES `booker` (`Email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
