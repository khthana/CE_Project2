-- phpMyAdmin SQL Dump
-- version 2.6.0-pl2
-- http://www.phpmyadmin.net
-- 
-- โฮสต์: localhost:3306
-- เวลาในการสร้าง: 07 ม.ค. 2005  12:44น.
-- รุ่นของเซิร์ฟเวอร์: 4.1.8
-- รุ่นของ PHP: 4.3.5
-- 
-- ฐานข้อมูล: `isagmq`
-- 

-- --------------------------------------------------------

-- 
-- โครงสร้างตาราง `user`
-- 

CREATE TABLE `user` (
  `USER_ID` bigint(10) NOT NULL default '0',
  `FIRST_NAME` varchar(64) NOT NULL default '',
  `LAST_NAME` varchar(64) NOT NULL default '',
  `NICK_NAME` varchar(255) NOT NULL default '',
  `SEX` char(1) NOT NULL default 'M',
  `AGE` tinyint(2) NOT NULL default '0',
  `EMAIL` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`USER_ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- dump ตาราง `user`
-- 

INSERT INTO `user` VALUES (1, 'ting_one', 'thai_one', 'theone', 'M', 16, 'tingone@yahoo.com');
INSERT INTO `user` VALUES (2, 'ting_two', 'thai_two', 'thetwo', 'M', 17, 'tingtwo@yahoo.com');
INSERT INTO `user` VALUES (3, 'ting_three', 'thai_three', 'thethree', 'M', 18, 'tingthree@yahoo.com');
INSERT INTO `user` VALUES (4, 'ting_four', 'thaifour', 'thefour', 'M', 19, 'tingfour@yahoo.com');
INSERT INTO `user` VALUES (16, 'ting_sixteen', 'thai_sixteen', 'thesixteen', 'M', 20, 'tingsixteen@yahoo.com');
INSERT INTO `user` VALUES (17, 'ting_seventeen', 'thai_seventeen', 'theseventeen', 'M', 16, 'tingseventeen@yahoo.com');
INSERT INTO `user` VALUES (18, 'ting_eightteen', 'thai_eightteen', 'theeightteen', 'M', 17, 'tingeightteen@yahoo.com');
INSERT INTO `user` VALUES (19, 'ting_nineteen', 'thai_nineteen', 'thenineteen', 'M', 18, 'tingnineteen@yahoo.com');
INSERT INTO `user` VALUES (20, 'ting_twenty', 'thai_twenty', 'thetwenty', 'M', 19, 'tingtwenty@yahoo.com');
