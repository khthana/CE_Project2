/*
SQLyog - Free MySQL GUI v5.11
Host - 4.1.21-community-nt : Database - conference
*********************************************************************
Server version : 4.1.21-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `conference`;

USE `conference`;

/*Table structure for table `agenda` */

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `ANO` int(10) NOT NULL auto_increment,
  `A_NAME` varchar(100) character set tis620 NOT NULL default '',
  PRIMARY KEY  (`ANO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agenda` */

insert into `agenda` (`ANO`,`A_NAME`) values (1,'เรื่องแจ้งให้ทราบ');
insert into `agenda` (`ANO`,`A_NAME`) values (2,'การรับรองรายงานการประชุมครั้งที่ผ่านมา');
insert into `agenda` (`ANO`,`A_NAME`) values (3,'เรื่องสืบเนื่องจากการประชุมครั้งที่ผ่านมา');
insert into `agenda` (`ANO`,`A_NAME`) values (4,'เรื่องใหม่ที่จะประชุมในครั้งนี้');
insert into `agenda` (`ANO`,`A_NAME`) values (5,'เรื่องอื่นๆ');

/*Table structure for table `committee_result` */

DROP TABLE IF EXISTS `committee_result`;

CREATE TABLE `committee_result` (
  `CRNO` int(10) NOT NULL auto_increment,
  `VNO` int(10) NOT NULL default '0',
  `MEMBERID` int(10) NOT NULL default '0',
  `ISSNO` int(10) NOT NULL default '0',
  `POINT` int(10) NOT NULL default '0',
  PRIMARY KEY  (`CRNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `committee_result` */

/*Table structure for table `issue` */

DROP TABLE IF EXISTS `issue`;

CREATE TABLE `issue` (
  `ISSNO` int(10) NOT NULL auto_increment,
  `ISSNAME` varchar(50) character set tis620 NOT NULL default '',
  `VNO` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ISSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issue` */

/*Table structure for table `item_business` */

DROP TABLE IF EXISTS `item_business`;

CREATE TABLE `item_business` (
  `INO` int(10) NOT NULL auto_increment,
  `IT_NAME` varchar(100) character set tis620 NOT NULL default '',
  `ANO` int(10) NOT NULL default '0',
  `MNO` int(10) NOT NULL default '0',
  PRIMARY KEY  (`INO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_business` */

insert into `item_business` (`INO`,`IT_NAME`,`ANO`,`MNO`) values (1,'สนับสนุนตู้ไฟด่านตรวจแอลกอฮอล์เพิ่มเติม',1,1);
insert into `item_business` (`INO`,`IT_NAME`,`ANO`,`MNO`) values (2,'แจ้งการโยกย้ายข้าราชการ',1,1);
insert into `item_business` (`INO`,`IT_NAME`,`ANO`,`MNO`) values (3,'ผลการสำรวจความคิดเห็น',1,1);
insert into `item_business` (`INO`,`IT_NAME`,`ANO`,`MNO`) values (4,'นโยบายรัฐบาลที่สำคัญและเร่งด่วน',4,1);
insert into `item_business` (`INO`,`IT_NAME`,`ANO`,`MNO`) values (5,'โครงการสภากาแฟสัญจร',6,1);

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `LNO` int(10) NOT NULL auto_increment,
  `L_NAME` varchar(100) character set tis620 NOT NULL default '',
  PRIMARY KEY  (`LNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert into `location` (`LNO`,`L_NAME`) values (1,'ห้องประชุมทวารวดี');

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `MNO` int(10) NOT NULL auto_increment,
  `M_NAME` varchar(100) character set tis620 NOT NULL default '',
  `DATE` char(2) character set tis620 NOT NULL default '',
  `MONTH` char(2) character set tis620 NOT NULL default '',
  `YEAR` varchar(4) character set tis620 NOT NULL default '',
  `ST_TIME` varchar(10) character set tis620 NOT NULL default '',
  `END_TIME` varchar(10) character set tis620 NOT NULL default '',
  `LNO` int(10) NOT NULL default '0',
  PRIMARY KEY  (`MNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `meeting` */

insert into `meeting` (`MNO`,`M_NAME`,`DATE`,`MONTH`,`YEAR`,`ST_TIME`,`END_TIME`,`LNO`) values (1,'การประชุมประจำเดือนกุมภาพันธ์','11','2','2550','09:00:00','12:00:00',1);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `MemberID` int(10) NOT NULL auto_increment,
  `Rank` varchar(20) character set tis620 NOT NULL default '',
  `MemberName` varchar(40) character set tis620 NOT NULL default '',
  `MemberSurname` varchar(40) character set tis620 NOT NULL default '',
  `Dean` varchar(20) character set tis620 NOT NULL default '',
  `MemberEmail` varchar(40) character set tis620 NOT NULL default '',
  `MemberMobile` varchar(9) character set tis620 NOT NULL default '',
  `MemberTel` varchar(9) character set tis620 NOT NULL default '',
  `UserName` varchar(12) character set tis620 NOT NULL default '',
  `PassWord` varchar(12) character set tis620 NOT NULL default '',
  `Granted` varchar(10) character set tis620 NOT NULL default '',
  PRIMARY KEY  (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `member` */

insert into `member` (`MemberID`,`Rank`,`MemberName`,`MemberSurname`,`Dean`,`MemberEmail`,`MemberMobile`,`MemberTel`,`UserName`,`PassWord`,`Granted`) values (1,'นาย','ทองดี','สุขสมบูรณ์','Head of Meeting','xxxx@hotmail.com','041456362','027380066','111','111','chairman');
insert into `member` (`MemberID`,`Rank`,`MemberName`,`MemberSurname`,`Dean`,`MemberEmail`,`MemberMobile`,`MemberTel`,`UserName`,`PassWord`,`Granted`) values (19,'นางสาว','นิภา','ทองอยู่','secretary','xxx@hotmail.com','041456362','027380066','222','222','secretary');
insert into `member` (`MemberID`,`Rank`,`MemberName`,`MemberSurname`,`Dean`,`MemberEmail`,`MemberMobile`,`MemberTel`,`UserName`,`PassWord`,`Granted`) values (20,'นาย','สันติ','งามเจริญ','committee','xxx@hotmail.com','041456362','027380066','333','333','committee');
insert into `member` (`MemberID`,`Rank`,`MemberName`,`MemberSurname`,`Dean`,`MemberEmail`,`MemberMobile`,`MemberTel`,`UserName`,`PassWord`,`Granted`) values (21,'ไม่มี','เครื่อง','โปรเจคเตอร์','projector','xxx@hotmail.com','041456362','027380066','444','444','projector');

/*Table structure for table `pathmeeting` */

DROP TABLE IF EXISTS `pathmeeting`;

CREATE TABLE `pathmeeting` (
  `MeetID` int(10) NOT NULL default '0',
  `Session` char(2) character set tis620 NOT NULL default '',
  `Num` char(2) character set tis620 NOT NULL default '',
  `hTopic` varchar(100) character set tis620 NOT NULL default '',
  `Subject1` varchar(255) character set tis620 NOT NULL default '',
  `Subject2` varchar(255) character set tis620 NOT NULL default '',
  `Message` text character set tis620 NOT NULL,
  `numFile` int(3) NOT NULL default '0',
  `PathFile` varchar(255) character set tis620 NOT NULL default '',
  `Poster` varchar(255) character set tis620 NOT NULL default '0',
  PRIMARY KEY  (`MeetID`,`Session`,`Num`,`numFile`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pathmeeting` */

insert into `pathmeeting` (`MeetID`,`Session`,`Num`,`hTopic`,`Subject1`,`Subject2`,`Message`,`numFile`,`PathFile`,`Poster`) values (1,'1','1','Topic Number 1','Topic Number 1','Topic Number 1','Details',1,'upload/8086.pdf','chairman');
insert into `pathmeeting` (`MeetID`,`Session`,`Num`,`hTopic`,`Subject1`,`Subject2`,`Message`,`numFile`,`PathFile`,`Poster`) values (1,'1','2','Topic Number 2','Topic Number 2','Topic Number 2','Details',1,'upload/Thesis.pdf','chairman');
insert into `pathmeeting` (`MeetID`,`Session`,`Num`,`hTopic`,`Subject1`,`Subject2`,`Message`,`numFile`,`PathFile`,`Poster`) values (1,'1','3','Topic Number 3','Topic Number 3','Topic Number 3','Details',1,'upload/ItemOfBusiness.pdf','chairman');

/*Table structure for table `preparemeeting` */

DROP TABLE IF EXISTS `preparemeeting`;

CREATE TABLE `preparemeeting` (
  `MeetID` int(10) NOT NULL auto_increment,
  `Subject` varchar(255) character set tis620 NOT NULL default '',
  `Num` varchar(10) character set tis620 NOT NULL default '0',
  `D` char(2) character set tis620 NOT NULL default '',
  `M` char(2) character set tis620 NOT NULL default '',
  `Y` varchar(4) character set tis620 NOT NULL default '',
  `MeetSentPaper` varchar(10) character set tis620 NOT NULL default '',
  `MeetStart` varchar(6) character set tis620 NOT NULL default '',
  `MeetEnd` varchar(6) character set tis620 NOT NULL default '',
  `MeetPlace` varchar(255) character set tis620 NOT NULL default '',
  PRIMARY KEY  (`MeetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `preparemeeting` */

insert into `preparemeeting` (`MeetID`,`Subject`,`Num`,`D`,`M`,`Y`,`MeetSentPaper`,`MeetStart`,`MeetEnd`,`MeetPlace`) values (1,'Engineering','13/2549','26','07','2549','26/07/2549','10.00','18.00','Room 1');

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `VNO` int(10) NOT NULL auto_increment,
  `V_NAME` varchar(50) character set tis620 NOT NULL default '',
  `NUM` int(10) NOT NULL default '0',
  `V_POINT` int(10) NOT NULL default '0',
  `CP_INDIC` varchar(50) character set tis620 NOT NULL default '',
  `INO` int(10) NOT NULL default '0',
  `TNO` int(10) NOT NULL default '0',
  PRIMARY KEY  (`VNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vote` */

/*Table structure for table `vote_result` */

DROP TABLE IF EXISTS `vote_result`;

CREATE TABLE `vote_result` (
  `RNO` int(10) NOT NULL auto_increment,
  `ISSNO` int(10) NOT NULL default '0',
  `R_POINT` int(10) NOT NULL default '0',
  PRIMARY KEY  (`RNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vote_result` */

/*Table structure for table `vote_type` */

DROP TABLE IF EXISTS `vote_type`;

CREATE TABLE `vote_type` (
  `TNO` int(10) NOT NULL auto_increment,
  `T_NAME` varchar(50) character set tis620 NOT NULL default '',
  PRIMARY KEY  (`TNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vote_type` */

insert into `vote_type` (`TNO`,`T_NAME`) values (1,'ใช่/ไม่ใช่');
insert into `vote_type` (`TNO`,`T_NAME`) values (2,'เรียงลำดับความสำคัญตามการให้คะแนน');
insert into `vote_type` (`TNO`,`T_NAME`) values (3,'เรียงลำดับความสำคัญ');
