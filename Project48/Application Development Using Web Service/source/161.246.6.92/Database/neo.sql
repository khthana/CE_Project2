# MySQL-Front 3.2  (Build 6.14)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'tis620' */;

DROP DATABASE IF EXISTS `neo`;
CREATE DATABASE `neo` /*!40100 DEFAULT CHARACTER SET tis620 */;
USE `neo`;
CREATE TABLE `booker` (
  `Email` varchar(70) NOT NULL default '',
  `Name` varchar(30) default NULL,
  `Surname` varchar(30) default NULL,
  `PhoneNo` varchar(15) default NULL,
  PRIMARY KEY  (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `booker` VALUES ('go@go.com','rung','kung','012345678');
INSERT INTO `booker` VALUES ('h@h.com','Hong','ky','012345678');
INSERT INTO `booker` VALUES ('oneoneone@hotmail.com','shon','oneoneone','02-222-2222');
INSERT INTO `booker` VALUES ('Shollatham@hotmail.com','Shon','Parpa','02-222-2222');
INSERT INTO `booker` VALUES ('Shon@hotmail.com','Shon','Prapar','02-222-2222');
INSERT INTO `booker` VALUES ('Shoney121@hotmail.com','Shon','parpa','02-222-222');
INSERT INTO `booker` VALUES ('test2@test.com','Mr.B','BBB','098765432');
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
INSERT INTO `booking` VALUES (4,2,'oneoneone@hotmail.com',0,NULL);
INSERT INTO `booking` VALUES (5,7,'test@test.com',0,'73547354');
INSERT INTO `booking` VALUES (6,7,'test@test.com',0,'73547354');
INSERT INTO `booking` VALUES (7,8,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (8,7,'test@test.com',0,'73547354');
INSERT INTO `booking` VALUES (9,8,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (10,7,'test2@test.com',0,'50485048');
INSERT INTO `booking` VALUES (11,7,'test2@test.com',0,'71787178');
INSERT INTO `booking` VALUES (12,7,'go@go.com',0,NULL);
INSERT INTO `booking` VALUES (13,7,'test@test.com',0,'73547354');
INSERT INTO `booking` VALUES (14,8,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (15,7,'h@h.com',0,'87868786');
INSERT INTO `booking` VALUES (16,7,'h@h.com',0,'92459245');
INSERT INTO `booking` VALUES (17,8,'h@h.com',1,NULL);
CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL auto_increment,
  `Subject` varchar(15) default NULL,
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
  `School` varchar(11) default 'Neo',
  PRIMARY KEY  (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `class` VALUES (1,'physic','2006-02-23','2006-04-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu','Sin','Siam',60,59,1500,4,'Neo');
INSERT INTO `class` VALUES (2,'physic','2006-02-23','2006-04-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu','Sin','Siam',60,59,1500,4,'Neo');
INSERT INTO `class` VALUES (3,'physic','2006-02-24','2006-04-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Sin','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (4,'physic','2006-02-24','2006-04-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Sin','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (6,'physic','2005-12-12','2006-03-03','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Thu','Shoney','saim',40,40,200,2,'Neo');
INSERT INTO `class` VALUES (7,'physic','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Sin','Siam',60,55,2000,1,'Neo');
INSERT INTO `class` VALUES (8,'physic','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Chon','Siam',60,58,2000,1,'Neo');
INSERT INTO `class` VALUES (9,'physic','2006-09-01','2006-10-30','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Sin','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (10,'physic','2006-09-01','2006-10-30','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Chon','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (11,'physic','2006-09-04','2006-10-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu-Sat','Sin','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (12,'physic','2006-09-04','2006-10-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu-Sat','Chon','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (13,'physic','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Sin','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (14,'physic','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Chon','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (15,'physic','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Sin','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (16,'physic','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Chon','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (17,'math','2006-02-23','2006-04-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu','Chang','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (18,'math','2006-02-23','2006-04-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu','Chang','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (19,'math','2006-02-24','2006-04-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Chang','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (20,'math','2006-02-24','2006-04-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Chang','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (21,'math','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Chang','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (22,'math','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Bird','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (23,'math','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Chang','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (24,'math','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Bird','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (25,'math','2006-09-01','2006-10-30','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Chang','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (26,'math','2006-09-01','2006-10-30','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Bird','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (27,'math','2006-09-04','2006-10-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu-Sat','Chang','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (28,'math','2006-09-04','2006-10-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu-Sat','Bird','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (29,'math','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Chang','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (30,'math','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Bird','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (31,'math','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Chang','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (32,'math','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Bird','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (33,'chem','2006-02-23','2006-04-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu','Prapa','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (34,'chem','2006-02-23','2006-04-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu','Prapa','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (35,'chem','2006-02-24','2006-04-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Prapa','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (36,'chem','2006-02-24','2006-04-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Prapa','Siam',60,60,1500,4,'Neo');
INSERT INTO `class` VALUES (37,'chem','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Prapa','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (38,'chem','2006-06-03','2006-08-27','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Uun','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (39,'chem','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Prapa','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (40,'chem','2006-06-03','2006-08-27','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Uun','Siam',60,60,2000,1,'Neo');
INSERT INTO `class` VALUES (41,'chem','2006-09-01','2006-10-30','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Prapa','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (42,'chem','2006-09-01','2006-10-30','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Uun','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (43,'chem','2006-09-04','2006-10-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu-Sat','Prapa','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (44,'chem','2006-09-04','2006-10-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu-Sat','Uun','Siam',60,60,1700,2,'Neo');
INSERT INTO `class` VALUES (45,'chem','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Prapa','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (46,'chem','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Uun','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (47,'chem','2006-11-04','2007-01-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Prapa','Siam',60,60,2000,3,'Neo');
INSERT INTO `class` VALUES (48,'chem','2006-11-04','2007-01-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Uun','Siam',60,60,2000,3,'Neo');

ALTER TABLE `booking`
  ADD FOREIGN KEY (`Booker`) REFERENCES `booker` (`Email`),
  ADD FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
