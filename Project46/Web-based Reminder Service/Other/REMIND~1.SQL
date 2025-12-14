CREATE TABLE `reminder_note` (
  `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(60) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `note` TEXT NOT NULL,
  `day` INT(2) NOT NULL,
  `month` INT(2) NOT NULL,
  `year` INT(4) NOT NULL,
  `time` VARCHAR(5) NOT NULL,
  `extra` INT(2) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `icq` VARCHAR(50) NOT NULL,
  `pager` VARCHAR(50) NOT NULL,
  `from_calendar` INT(9),
  PRIMARY KEY (`id`)
);

CREATE TABLE `reminder_fail` (
  `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(60) NOT NULL,
  `note` TEXT NOT NULL,
  
  `email` VARCHAR(50) NOT NULL,
  `email_try_left` INT( 2 ) DEFAULT '4' NOT NULL,

  `phone` VARCHAR(50) NOT NULL,
  `phone_try_left` INT( 2 ) DEFAULT '4' NOT NULL,

  `icq` VARCHAR(50) NOT NULL,
  `icq_try_left` INT( 2 ) DEFAULT '4' NOT NULL,

  `pager` VARCHAR(50) NOT NULL,
  `pager_try_left` INT( 2 ) DEFAULT '4' NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `reminder_extra` (
`id` INT( 2 ) UNSIGNED NOT NULL AUTO_INCREMENT,
`shot_text` VARCHAR(20) NOT NULL,
`long_text` TEXT NOT NULL ,
PRIMARY KEY ( `id` ) 
);

CREATE TABLE diary (
  diary_id int(9) NOT NULL auto_increment,
  diary_name varchar(60) NOT NULL default '',
  diary_day int(2) NOT NULL default '0',
  diary_month int(2) NOT NULL default '0',
  diary_year int(4) NOT NULL default '0',
  diary_title text,
  diary_note text,
  PRIMARY KEY  (diary_id)
);

CREATE TABLE calendar (
  calen_id int(9) NOT NULL auto_increment,
  calen_name varchar(60) NOT NULL default '',
  calen_day int(2) NOT NULL default '0',
  calen_month int(2) NOT NULL default '0',
  calen_year int(2) NOT NULL default '0',
  calen_note text,
  remin_every int(2),
  PRIMARY KEY  (calen_id)
);

CREATE TABLE log_error (
  log_id int(9) NOT NULL auto_increment,
  username VARCHAR(60) NOT NULL,
  errortype TEXT NOT NULL,
  PRIMARY KEY  (log_id)
);

CREATE TABLE user_history (
  history_id int(9) NOT NULL auto_increment,
  history_username VARCHAR(60) NOT NULL,
  history_text TEXT NOT NULL,
  history_time VARCHAR(30) NOT NULL,
  PRIMARY KEY  (history_id)
);