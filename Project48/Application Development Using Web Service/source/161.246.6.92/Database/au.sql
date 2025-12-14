# MySQL-Front 3.2  (Build 6.14)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'tis620' */;

DROP DATABASE IF EXISTS `au`;
CREATE DATABASE `au` /*!40100 DEFAULT CHARACTER SET tis620 */;
USE `au`;
CREATE TABLE `booker` (
  `Email` varchar(70) NOT NULL default '',
  `Name` varchar(30) default NULL,
  `Surname` varchar(30) default NULL,
  `PhoneNo` varchar(15) default NULL,
  PRIMARY KEY  (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `booker` VALUES ('go@go.com','rung','kung','012345678');
INSERT INTO `booker` VALUES ('h@h.com','Hong','ky','012345678');
INSERT INTO `booker` VALUES ('oneoneone@hotmail.com','shon','prapa','02-222-2222');
INSERT INTO `booker` VALUES ('Shollatham@hotmail.com','Shon','Parpa','02-222-2222');
INSERT INTO `booker` VALUES ('Shon@hotmail.com','Shon','Prapar','02-222-2222');
INSERT INTO `booker` VALUES ('Shoney121@hotmail.com','Shon','parpa','02-222-222');
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

INSERT INTO `booking` VALUES (1,1,'Shon@hotmail.com',0,'02-222-2222');
INSERT INTO `booking` VALUES (2,1,'Shollatham@hotmail.com',1,NULL);
INSERT INTO `booking` VALUES (3,1,'Shoney121@hotmail.com',1,'02-222-2222');
INSERT INTO `booking` VALUES (4,7,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (5,2,'oneoneone@hotmail.com',0,NULL);
INSERT INTO `booking` VALUES (6,5,'test@test.com',0,'49134913');
INSERT INTO `booking` VALUES (7,5,'test@test.com',0,'49134913');
INSERT INTO `booking` VALUES (8,5,'test@test.com',0,'49134913');
INSERT INTO `booking` VALUES (9,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (10,5,'test@test.com',0,'49134913');
INSERT INTO `booking` VALUES (11,5,'go@go.com',0,'74287428');
INSERT INTO `booking` VALUES (12,6,'go@go.com',1,NULL);
INSERT INTO `booking` VALUES (13,6,'go@go.com',0,NULL);
INSERT INTO `booking` VALUES (14,7,'go@go.com',0,NULL);
INSERT INTO `booking` VALUES (15,5,'test@test.com',1,NULL);
INSERT INTO `booking` VALUES (16,5,'test@test.com',1,NULL);
INSERT INTO `booking` VALUES (17,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (18,10,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (19,9,'test@test.com',0,'21512151');
INSERT INTO `booking` VALUES (20,5,'test@test.com',0,'44834483');
INSERT INTO `booking` VALUES (21,5,'test@test.com',0,'44834483');
INSERT INTO `booking` VALUES (22,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (23,5,'test@test.com',0,'89568956');
INSERT INTO `booking` VALUES (24,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (25,7,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (26,5,'test@test.com',0,'89568956');
INSERT INTO `booking` VALUES (27,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (28,8,'h@h.com',0,'87868786');
INSERT INTO `booking` VALUES (29,6,'h@h.com',0,'40754075');
INSERT INTO `booking` VALUES (30,5,'h@h.com',0,'81888188');
INSERT INTO `booking` VALUES (31,7,'h@h.com',0,'96229622');
INSERT INTO `booking` VALUES (32,5,'h@h.com',0,'81888188');
INSERT INTO `booking` VALUES (33,5,'h@h.com',1,NULL);
INSERT INTO `booking` VALUES (34,6,'h@h.com',1,NULL);
INSERT INTO `booking` VALUES (35,5,'test@test.com',0,'89568956');
CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL auto_increment,
  `Subject` varchar(15) default 'chem',
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
  `School` varchar(20) default 'Au',
  PRIMARY KEY  (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `class` VALUES (1,'chem','2006-02-23','2006-04-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu','Au','Siam',150,149,1900,4,'Au');
INSERT INTO `class` VALUES (2,'chem','2006-02-23','2006-04-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu','Au','Siam',150,149,1900,4,'Au');
INSERT INTO `class` VALUES (3,'chem','2006-02-24','2006-04-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Au','Siam',150,150,1900,4,'Au');
INSERT INTO `class` VALUES (4,'chem','2006-02-24','2006-04-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Au','Siam',150,150,1900,4,'Au');
INSERT INTO `class` VALUES (5,'chem','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Au','Siam',150,138,2500,1,'Au');
INSERT INTO `class` VALUES (6,'chem','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Video','Siam',150,143,2000,1,'Au');
INSERT INTO `class` VALUES (7,'chem','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Au','Siam',150,146,2500,1,'Au');
INSERT INTO `class` VALUES (8,'chem','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Video','Siam',150,149,2000,1,'Au');
INSERT INTO `class` VALUES (9,'chem','2006-09-01','2006-10-30','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Au','Siam',150,149,2600,2,'Au');
INSERT INTO `class` VALUES (10,'chem','2006-09-01','2006-10-30','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Video','Siam',150,149,2100,2,'Au');
INSERT INTO `class` VALUES (11,'chem','2006-09-04','2006-10-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu-Sat','Au','Siam',150,150,2600,2,'Au');
INSERT INTO `class` VALUES (12,'chem','2006-09-04','2006-10-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu-Sat','Video','Siam',150,150,2100,2,'Au');
INSERT INTO `class` VALUES (13,'chem','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Au','Siam',150,150,2000,3,'Au');
INSERT INTO `class` VALUES (14,'chem','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Video','Siam',150,150,1500,3,'Au');
INSERT INTO `class` VALUES (15,'chem','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Au','Siam',150,150,2000,3,'Au');
INSERT INTO `class` VALUES (16,'chem','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Video','Siam',150,150,1500,3,'Au');

ALTER TABLE `booking`
  ADD FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  ADD FOREIGN KEY (`Booker`) REFERENCES `booker` (`Email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
