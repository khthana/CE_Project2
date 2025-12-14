# MySQL-Front 3.2  (Build 6.14)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'tis620' */;

DROP DATABASE IF EXISTS `jia`;
CREATE DATABASE `jia` /*!40100 DEFAULT CHARACTER SET tis620 */;
USE `jia`;
CREATE TABLE `booker` (
  `Email` varchar(70) NOT NULL default '',
  `Name` varchar(30) default NULL,
  `Surname` varchar(30) default NULL,
  `PhoneNo` varchar(15) default NULL,
  PRIMARY KEY  (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

INSERT INTO `booker` VALUES ('oneoneone@hotmail.com','shon','prapa','02-222-2222');
INSERT INTO `booker` VALUES ('por@mail.com','por','por','011111111');
INSERT INTO `booker` VALUES ('Shollatham@hotmail.com','Shon','Parpa','02-222-2222');
INSERT INTO `booker` VALUES ('Shon@hotmail.com','Shon','Prapar','02-222-2222');
INSERT INTO `booker` VALUES ('Shoney121@hotmail.com','Shon','parpa','02-222-222');
INSERT INTO `booker` VALUES ('test2@test.com','Mr.B','BBB','098765432');
INSERT INTO `booker` VALUES ('test@test.com','Mr.A','AAA','012345678');
INSERT INTO `booker` VALUES ('up_191@hotmail.com','up','up','067672882');
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
INSERT INTO `booking` VALUES (5,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (6,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (7,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (8,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (9,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (10,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (11,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (12,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (13,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (14,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (15,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (16,8,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (17,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (18,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (19,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (20,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (21,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (22,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (23,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (24,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (25,5,'test@test.com',0,'85738573');
INSERT INTO `booking` VALUES (26,5,'test2@test.com',0,'24322432');
INSERT INTO `booking` VALUES (27,5,'test2@test.com',0,NULL);
INSERT INTO `booking` VALUES (28,6,'test2@test.com',0,NULL);
INSERT INTO `booking` VALUES (29,7,'test2@test.com',0,NULL);
INSERT INTO `booking` VALUES (30,5,'test@test.com',0,'44834483');
INSERT INTO `booking` VALUES (31,6,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (32,7,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (33,8,'test@test.com',0,NULL);
INSERT INTO `booking` VALUES (34,5,'test@test.com',0,'44834483');
INSERT INTO `booking` VALUES (35,5,'por@mail.com',0,'23002300');
INSERT INTO `booking` VALUES (36,5,'test@test.com',0,'63736373');
INSERT INTO `booking` VALUES (37,5,'up_191@hotmail.com',0,'72067206');
INSERT INTO `booking` VALUES (38,5,'test@test.com',0,'21322132');
INSERT INTO `booking` VALUES (39,1,'test2@test.com',0,'21742174');
INSERT INTO `booking` VALUES (40,3,'test2@test.com',0,NULL);
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
  `School` varchar(20) default 'Jia',
  PRIMARY KEY  (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620 ROW_FORMAT=DYNAMIC;

INSERT INTO `class` VALUES (1,'math','2006-02-23','2006-04-20','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu','Jia','Siam',150,148,2200,4,'Jia');
INSERT INTO `class` VALUES (2,'math','2006-02-23','2006-04-20','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu','Jia','Siam',150,149,2200,4,'Jia');
INSERT INTO `class` VALUES (3,'math','2006-03-01','2006-04-07','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Jia','Siam',150,149,2200,4,'Jia');
INSERT INTO `class` VALUES (4,'math','2006-03-01','2006-04-07','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Jia','Siam',150,150,2200,4,'Jia');
INSERT INTO `class` VALUES (5,'math','2006-06-03','2006-08-20','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Jia','Siam',150,126,2500,1,'Jia');
INSERT INTO `class` VALUES (6,'math','2006-06-03','2006-08-20','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Video','Siam',150,147,2200,1,'Jia');
INSERT INTO `class` VALUES (7,'math','2006-06-03','2006-08-20','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Jia','Siam',150,149,2500,1,'Jia');
INSERT INTO `class` VALUES (8,'math','2006-06-03','2006-08-20','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Video','Siam',150,148,2200,1,'Jia');
INSERT INTO `class` VALUES (9,'math','2006-09-01','2006-10-25','0000-00-00 09:00:00','0000-00-00 12:00:00','Mon-Wed-Fri','Jia','Siam',150,150,2600,2,'Jia');
INSERT INTO `class` VALUES (10,'math','2006-09-01','2006-10-25','0000-00-00 13:00:00','0000-00-00 16:00:00','Mon-Wed-Fri','Video','Siam',150,150,2100,2,'Jia');
INSERT INTO `class` VALUES (11,'math','2006-09-04','2006-10-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Tue-Thu-Sat','Jia','Siam',150,150,2600,2,'Jia');
INSERT INTO `class` VALUES (12,'math','2006-09-04','2006-10-26','0000-00-00 13:00:00','0000-00-00 16:00:00','Tue-Thu-Sat','Video','Siam',150,150,2100,2,'Jia');
INSERT INTO `class` VALUES (13,'math','2006-11-04','2006-12-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Jia','Siam',150,150,2000,3,'Jia');
INSERT INTO `class` VALUES (14,'math','2006-11-04','2006-12-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Video','Siam',150,150,1800,3,'Jia');
INSERT INTO `class` VALUES (15,'math','2006-11-04','2006-12-31','0000-00-00 09:00:00','0000-00-00 12:00:00','Sat-Sun','Jia','Siam',150,150,2000,3,'Jia');
INSERT INTO `class` VALUES (16,'math','2006-11-04','2006-12-31','0000-00-00 13:00:00','0000-00-00 16:00:00','Sat-Sun','Video','Siam',150,150,1800,3,'Jia');

ALTER TABLE `booking`
  ADD FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`),
  ADD FOREIGN KEY (`Booker`) REFERENCES `booker` (`Email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
