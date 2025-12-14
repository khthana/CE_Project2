CREATE DATABASE webservices;
USE webservices;

# --------------------------------------------------------
# โครงสร้างตาราง `user`
# --------------------------------------------------------
CREATE TABLE user (
  id varchar(20) NOT NULL default '',
  position varchar(10) NOT NULL default '',
  sex char(1) NOT NULL default '',
  name varchar(50) NOT NULL default '',
  surname varchar(50) NOT NULL default '',
  birthdate varchar(50) NOT NULL default '',
  phone varchar(10) default NULL,
  mobile varchar(10) default NULL,
  email varchar(30) NOT NULL default '',
  icq varchar(10) default NULL,
  username varchar(50) NOT NULL default '',
  password varchar(32) NOT NULL default '',
  question varchar(50) NOT NULL default '',
  secret varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

# --------------------------------------------------------
# โครงสร้างตาราง `newstopic`
# --------------------------------------------------------
CREATE TABLE newstopic (
  topicid int(5) NOT NULL auto_increment,
  postto varchar(5) NOT NULL default '',
  title varchar(55) NOT NULL default '',
  content mediumtext NOT NULL,
  postname varchar(30) NOT NULL default '',
  date_ann int(20) NOT NULL default '0',
  date_expired int(20) NOT NULL default '0',
  del char(1) NOT NULL default 'N',
  PRIMARY KEY  (topicid)
) TYPE=MyISAM;

# --------------------------------------------------------
# โครงสร้างตาราง `newsfileattach`
# --------------------------------------------------------
CREATE TABLE newsfileattach (
  fileid int(5) NOT NULL auto_increment,
  topicid int(5) NOT NULL default '0',
  filename varchar(40) NOT NULL default '',
  timestamp varchar(20) NOT NULL default '',
  PRIMARY KEY  (fileid)
) TYPE=MyISAM;

# --------------------------------------------------------
# โครงสร้างตาราง `board_question`
# --------------------------------------------------------
CREATE TABLE board_question (
  q_id int(5) NOT NULL auto_increment,
  q_post int(50) NOT NULL default '0',
  q_topic varchar(200) NOT NULL default '',
  q_message mediumtext NOT NULL,
  q_name varchar(50) NOT NULL default '',
  q_email varchar(50) default NULL,
  q_icq varchar(10) default NULL,
  q_ip varchar(50) NOT NULL default '',
  q_date varchar(50) default NULL,
  q_time varchar(50) default NULL,
  q_update int(50) default NULL,
  q_reng int(50) default NULL,
  q_member char(1) NOT NULL default 'n',
  PRIMARY KEY  (q_id)
) TYPE=MyISAM;

# --------------------------------------------------------
# โครงสร้างตาราง `board_answer`
# --------------------------------------------------------
CREATE TABLE board_answer (
  a_id int(5) NOT NULL auto_increment,
  a_qid int(5) NOT NULL default '0',
  a_message mediumtext NOT NULL,
  a_name varchar(50) NOT NULL default '',
  a_email varchar(50) default NULL,
  a_icq varchar(10) default NULL,
  a_ip varchar(50) NOT NULL default '',
  a_datetime varchar(50) default NULL,
  a_update int(50) default NULL,
  a_member char(1) NOT NULL default 'n',
  PRIMARY KEY  (a_id)
) TYPE=MyISAM;