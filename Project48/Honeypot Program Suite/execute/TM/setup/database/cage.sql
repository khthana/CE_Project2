#create database for cage information
CREATE DATABASE cage;

USE cage;

CREATE TABLE `information` (
  `cage_id` int(5) NOT NULL auto_increment,
  `cname` varchar(50) NOT NULL default '',
  `cip` varchar(50) NOT NULL default '',
  `cpath` varchar(50) NOT NULL default '',
  `chostname` varchar(50) NOT NULL default '',
  `cstate` varchar(10) NOT NULL default 'stop',
  `cuser_current` tinyint(4) NOT NULL default '23',
  `cuser_limit` tinyint(4) default NULL,
  `cgrp_current` int(11) NOT NULL default '1',
  `cgrp_limit` int(11) default NULL,
  PRIMARY KEY  (`cage_id`));
