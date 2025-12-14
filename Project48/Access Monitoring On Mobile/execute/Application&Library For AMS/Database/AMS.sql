CREATE DATABASE `ams` /*!40100 DEFAULT CHARACTER SET utf8 */;
DROP TABLE IF EXISTS `ams`.`imagefile`;
CREATE TABLE `imagefile` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Filename` varchar(45) NOT NULL default '',
  `Path` varchar(100) NOT NULL default '',
  `URL` varchar(100) NOT NULL default '',
  `Date` date NOT NULL default '0000-00-00',
  `Time` time NOT NULL default '00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `ams`.`mobileaccount`;
CREATE TABLE `mobileaccount` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `email` varchar(45) NOT NULL default '',
  `tel` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `ams`.`videofile`;
CREATE TABLE `videofile` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Filename` varchar(45) NOT NULL default '',
  `Path` varchar(150) NOT NULL default '',
  `URL` varchar(150) NOT NULL default '',
  `Datestart` date NOT NULL default '0000-00-00',
  `Timestart` time NOT NULL default '00:00:00',
  `Timestop` time NOT NULL default '00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;