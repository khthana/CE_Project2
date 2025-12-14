# MySQL-Front Dump 2.5
#
# Host: localhost   Database: myproject
# --------------------------------------------------------
# Server version 4.0.16-nt


#
# Table structure for table 'board_ans'
#

CREATE TABLE board_ans (
  id_ans int(10) unsigned NOT NULL auto_increment,
  id_quest tinyint(3) unsigned default NULL,
  name varchar(50) default NULL,
  email varchar(50) default NULL,
  detail text,
  ip varchar(50) default NULL,
  datepost datetime default NULL,
  PRIMARY KEY  (id_ans)
) TYPE=MyISAM;



#
# Dumping data for table 'board_ans'
#

INSERT INTO board_ans VALUES("1", "12", "Wutthinai", "wuttthnai@hotmail.com", "ความสำเร็จกำลังใกล้เข้ามา อิอิ\r\nYes!", "127.0.0.1", "2004-01-03 21:19:34");
INSERT INTO board_ans VALUES("2", "8", "Wutthinai", "wuttthnai@hotmail.com", "test hello test\r\n&lt;b&gt;\r\n&lt;br&gt;\r\ntest again", "127.0.0.1", "2004-01-03 21:21:27");
INSERT INTO board_ans VALUES("3", "8", "Wutthinai", "wuttthnai@hotmail.com", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "127.0.0.1", "2004-01-03 21:23:31");
INSERT INTO board_ans VALUES("5", "12", "boy", "boy@hotmail.com", "aaaaaaaaa bbbbbbbbb ccccccccc ddddddddd eeeeeeeeee ", "127.0.0.1", "2004-01-04 14:44:24");
INSERT INTO board_ans VALUES("4", "5", "boy", "boy@hotmail.com", "ม่ายรู้สิ", "127.0.0.1", "2004-01-03 23:28:24");
INSERT INTO board_ans VALUES("6", "18", "boy", "boy@hotmail.com", "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB<br>BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB<br>BBBBBBBBBBBBBBBBBBBBBB\r\n\r\n\r\nBBBBBB", "127.0.0.1", "2004-01-04 15:42:55");
INSERT INTO board_ans VALUES("10", "22", "supersushi2002", "supersushi2002@hear.com", "เก่งจริง", "127.0.0.1", "2004-01-27 16:22:42");
INSERT INTO board_ans VALUES("7", "18", "boy", "boy@hotmail.com", "BBBBBBBBB BBBBBBBBB BBBBBBBBB BBBBBBBBB BBBBB\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r<br>\nBBBBBBBBBBBBBBB", "127.0.0.1", "2004-01-04 15:48:54");
INSERT INTO board_ans VALUES("8", "18", "boy", "boy@hotmail.com", "BBBBBBBBB BBBBBBBBB BBBBBBBBB BBBBBB\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nBBBBBBBBBB", "127.0.0.1", "2004-01-04 15:55:48");
INSERT INTO board_ans VALUES("9", "19", "boy", "boy@hotmail.com", "perfect แล้ว Yahoo Wow ว้าว 555 666 777\r\n(มั้ง)\r\n(maybe)", "127.0.0.1", "2004-01-04 15:59:16");
INSERT INTO board_ans VALUES("11", "22", "test", "tester@hotmail.com", "กวนน๊ะ\r\n", "127.0.0.1", "2004-03-12 12:26:41");
INSERT INTO board_ans VALUES("12", "23", "Wutthinai", "wuttthnai@hotmail.com", "I agree with you.", "127.0.0.1", "2004-03-14 02:29:04");


#
# Table structure for table 'board_quest'
#

CREATE TABLE board_quest (
  id int(10) unsigned NOT NULL auto_increment,
  topic varchar(150) default NULL,
  name varchar(50) default NULL,
  email varchar(50) default NULL,
  detail text,
  ip varchar(50) default NULL,
  datepost datetime default NULL,
  lastpost datetime default NULL,
  lastname varchar(50) default NULL,
  view smallint(5) unsigned default NULL,
  ans smallint(5) unsigned default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM;



#
# Dumping data for table 'board_quest'
#

INSERT INTO board_quest VALUES("1", "hello test topic", "test", "tester@hotmail.com", "Wutthinai Kanjanasorn", "127.0.0.1", "2004-01-02 21:47:07", "2004-01-02 21:47:07", "test", "3", "0");
INSERT INTO board_quest VALUES("2", "Hello again", "boy", "boy@hotmail.com", "Wutthinai Kanjanasorn\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\nวุฒินัย กาญจนศร\r\n\r\n&lt;center&gt;Boy บอย&lt;/center&gt;", "127.0.0.1", "2004-01-02 23:50:27", "2004-01-02 23:50:27", "boy", "0", "0");
INSERT INTO board_quest VALUES("3", "Wutthinai Kanjanasorn", "test", "tester@hotmail.com", "Wutthinai Kanjanasorn\r\n&lt;b&gt;Wutthinai Kanjanasorn&lt;/b&gt;", "127.0.0.1", "2004-01-03 16:51:36", "2004-01-03 16:51:36", "test", "1", "0");
INSERT INTO board_quest VALUES("4", "boy", "test", "tester@hotmail.com", "boy\r\nboy\r\nboy\r\n\r\n\r\nboy", "127.0.0.1", "2004-01-03 16:57:28", "2004-01-03 16:57:28", "test", "0", "0");
INSERT INTO board_quest VALUES("5", "แก้แล้วแก้อีก", "test", "tester@hotmail.com", "เมื่อไหร่จะหายเน่าอ่ะ", "127.0.0.1", "2004-01-03 17:01:43", "2004-01-03 23:28:24", "boy", "3", "1");
INSERT INTO board_quest VALUES("6", "ลองอีกครั้ง", "test", "tester@hotmail.com", "ลองแล้วแก้อีก", "127.0.0.1", "2004-01-03 17:10:08", "2004-01-03 17:10:08", "test", "0", "0");
INSERT INTO board_quest VALUES("7", "รอบที่ล้านแปด", "test", "tester@hotmail.com", "รอบที่ล้านแปด พอกันทีสำหรับวันนี้", "127.0.0.1", "2004-01-03 17:13:35", "2004-01-03 17:13:35", "test", "2", "0");
INSERT INTO board_quest VALUES("8", "อีกครั้งไม่เสียหาย", "test", "tester@hotmail.com", "เฮ้อ! เบื่อจริงๆ", "127.0.0.1", "2004-01-03 17:17:08", "2004-01-03 21:23:31", "Wutthinai", "14", "2");
INSERT INTO board_quest VALUES("9", "ความหวังอันริบหรี่", "Wutthinai", "wuttthnai@hotmail.com", "ที่จะสำเร็จ\r\nอย่างครบถ้วน", "127.0.0.1", "2004-01-03 18:08:10", "2004-01-03 18:08:10", "Wutthinai", "0", "0");
INSERT INTO board_quest VALUES("10", "perfect", "boy", "boy@hotmail.com", "maybe perfect", "127.0.0.1", "2004-01-03 19:20:01", "2004-01-03 19:20:01", "boy", "1", "0");
INSERT INTO board_quest VALUES("11", "Yeh!", "boy", "boy@hotmail.com", "yes yes yes...", "127.0.0.1", "2004-01-03 19:21:43", "2004-01-03 19:21:43", "boy", "1", "0");
INSERT INTO board_quest VALUES("12", "สำเร็จเกือบหมดแล้ว 555", "Wutthinai", "wuttthnai@hotmail.com", "อิอิ Yes!\r\nYahoo.....", "127.0.0.1", "2004-01-03 20:38:10", "2004-01-04 14:44:24", "boy", "9", "2");
INSERT INTO board_quest VALUES("15", "ทดลองเว้นบรรทัด", "Wutthinai", "wuttthnai@hotmail.com", "test     ทดสอบ\r\n&#92;n test\r\ntest", "127.0.0.1", "2004-01-04 15:13:30", "2004-01-04 15:13:30", "Wutthinai", "3", "0");
INSERT INTO board_quest VALUES("13", "aaaaaaaaaa", "Wutthinai", "wuttthnai@hotmail.com", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "127.0.0.1", "2004-01-03 21:28:10", "2004-01-03 21:28:10", "Wutthinai", "2", "0");
INSERT INTO board_quest VALUES("16", "haha", "boy", "boy@hotmail.com", "123456789012345678901234567890<br>123456789012345678901234567890<br>", "127.0.0.1", "2004-01-04 15:30:18", "2004-01-04 15:30:18", "boy", "2", "0");
INSERT INTO board_quest VALUES("14", "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "Wutthinai", "wuttthnai@hotmail.com", "bb", "127.0.0.1", "2004-01-03 21:28:42", "2004-01-03 21:28:42", "Wutthinai", "1", "0");
INSERT INTO board_quest VALUES("17", "Wutthinai Kanjanasorn Boy Wutt<br>hinai Kanjansorn Boy Wutthinai<br> Kanjanasorn Boy", "boy", "boy@hotmail.com", "Wutthinai Kanjanasorn Boy Wutt<br>hinai Kanjansorn Boy Wutthinai<br> Kanjanasorn Boy Wutthinai Kan<br>janasorn Boy Wutthinai Kanjans<br>orn Boy Wutthinai Kanjanasorn <br>Boy Wutthinai Kanjanasorn Boy <br>Wutthinai Kanjansorn Boy Wutth<br>inai Kanjanasorn Boy Wutthinai<br> Kanjanasorn Boy Wutthinai Kan<br>jansorn Boy Wutthinai Kanjanas<br>orn Boy", "127.0.0.1", "2004-01-04 15:38:52", "2004-01-04 15:38:52", "boy", "2", "0");
INSERT INTO board_quest VALUES("18", "Wutthinai Kanjanasorn Boy Wutt<br>hinai Kanjanasorn Boy Wutthina<br>i Kanjanasorn Boy Wutthinai Ka<br>njanasorn Boy Wutthinai Kanjan<br>asorn Boy Wutt", "boy", "boy@hotmail.com", "Wutthinai Kanjanasorn BoyWutthinai Kanjanasorn Boy Wutthinai<br> Kanjanasorn Boy Wutthinai Kanjanasorn Boy Wutthinai Kanjana<br>sorn Boy Wutthinai Kanjanasorn Boy Wutthinai Kanjanasorn Boy<br> Wutthinai Kanjanasorn Boy Wutthinai Kanjanasorn Boy Wutthin<br>ai Kanjanasorn Boy Wutthinai Kanjanasorn Boy Wutthinai Kanja<br>nasorn Boy", "127.0.0.1", "2004-01-04 15:40:08", "2004-01-04 15:55:48", "boy", "14", "3");
INSERT INTO board_quest VALUES("19", "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB<br>BBBBBBBBBB", "boy", "boy@hotmail.com", "test", "127.0.0.1", "2004-01-04 15:58:12", "2004-01-04 15:59:16", "boy", "7", "1");
INSERT INTO board_quest VALUES("20", "The last one", "boy", "boy@hotmail.com", "The last one", "127.0.0.1", "2004-01-04 16:06:15", "2004-01-04 16:06:15", "boy", "0", "0");
INSERT INTO board_quest VALUES("21", "again", "boy", "boy@hotmail.com", "again\r\nอีกครั้ง อีกครั้ง อีกครั้ง อีกครั้ง อีกครั้ง อีกคร<br>ั้ง อีกครั้ง อีกครั้ง ", "127.0.0.1", "2004-01-04 16:06:45", "2004-01-04 16:06:45", "boy", "4", "0");
INSERT INTO board_quest VALUES("22", "เก่ง", "supersushi2002", "supersushi2002@hear.com", "บอยเก่งนะ!\r\nช่วยโหวตหน่อย", "127.0.0.1", "2004-01-27 16:22:21", "2004-03-12 12:26:41", "test", "7", "2");
INSERT INTO board_quest VALUES("23", "ประสบความสำเร็จ", "test", "tester@hotmail.com", "เขียนเว็บอร์ดเรียบร้อยด้วยดี\r\nไม่มีปัญหา", "127.0.0.1", "2004-03-14 02:28:17", "2004-03-14 02:29:04", "Wutthinai", "3", "1");


#
# Table structure for table 'district'
#

CREATE TABLE district (
  id tinyint(2) unsigned NOT NULL auto_increment,
  distr_name char(50) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM COMMENT='district name';



#
# Dumping data for table 'district'
#

INSERT INTO district VALUES("1", "Bang_Bon");
INSERT INTO district VALUES("2", "Bang_Kapi");
INSERT INTO district VALUES("3", "Bang_Khae");
INSERT INTO district VALUES("4", "Bang_Khen");
INSERT INTO district VALUES("5", "Bang_Kholamm");
INSERT INTO district VALUES("6", "Bang_Khun_Thian");
INSERT INTO district VALUES("7", "Bang_Na");
INSERT INTO district VALUES("8", "Bangkok_Noi");
INSERT INTO district VALUES("9", "Bang_Rak");
INSERT INTO district VALUES("10", "Bang_Sue");
INSERT INTO district VALUES("11", "Bangkok_Yai");
INSERT INTO district VALUES("12", "Bang_Phlat");
INSERT INTO district VALUES("13", "Bueng_Kum");
INSERT INTO district VALUES("14", "Chatuchak");
INSERT INTO district VALUES("15", "Chom_Thong");
INSERT INTO district VALUES("16", "Din_Daeng");
INSERT INTO district VALUES("17", "Don_Mueang");
INSERT INTO district VALUES("18", "Dusit");
INSERT INTO district VALUES("19", "Khan_Na_Yao");
INSERT INTO district VALUES("20", "Khlong_Samwa");
INSERT INTO district VALUES("21", "Khlong_San");
INSERT INTO district VALUES("22", "Khlong_Toei");
INSERT INTO district VALUES("23", "Khuai_Khwang");
INSERT INTO district VALUES("24", "Lak_Si");
INSERT INTO district VALUES("25", "Lat_Krabang");
INSERT INTO district VALUES("26", "Lat_Phrao");
INSERT INTO district VALUES("27", "Min_Buri");
INSERT INTO district VALUES("28", "Nong_Chok");
INSERT INTO district VALUES("29", "Nong_Khaem");
INSERT INTO district VALUES("30", "Pathumwan");
INSERT INTO district VALUES("31", "Phasi_Charoen");
INSERT INTO district VALUES("32", "Phayathai");
INSERT INTO district VALUES("33", "PhraKhanong");
INSERT INTO district VALUES("34", "Phra_Nakhon");
INSERT INTO district VALUES("35", "Prawet");
INSERT INTO district VALUES("36", "Pom_Prap");
INSERT INTO district VALUES("37", "Taling_Chan");
INSERT INTO district VALUES("38", "Thawi_Watthana");
INSERT INTO district VALUES("39", "Thon_Buri");
INSERT INTO district VALUES("40", "Thung_Khru");
INSERT INTO district VALUES("41", "Rat_Burana");
INSERT INTO district VALUES("42", "Ratchathewi");
INSERT INTO district VALUES("43", "Sai_Mai");
INSERT INTO district VALUES("44", "Samphan_Tha_Wong");
INSERT INTO district VALUES("45", "Saphan_Sung");
INSERT INTO district VALUES("46", "Sathon");
INSERT INTO district VALUES("47", "Suan_Luang");
INSERT INTO district VALUES("48", "Wang_Thong_Lang");
INSERT INTO district VALUES("49", "Watthana");
INSERT INTO district VALUES("50", "Yan_Nawa");


#
# Table structure for table 'mapinfo'
#

CREATE TABLE mapinfo (
  id tinyint(5) unsigned NOT NULL auto_increment,
  node varchar(50) NOT NULL default '0',
  x_coord int(5) unsigned NOT NULL default '0',
  y_coord int(5) unsigned NOT NULL default '0',
  junction tinyint(1) unsigned NOT NULL default '0',
  image varchar(50) NOT NULL default '0',
  default_district varchar(50) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY id (id),
  KEY id_2 (id)
) TYPE=MyISAM;



#
# Dumping data for table 'mapinfo'
#

INSERT INTO mapinfo VALUES("1", "ROM KLAO-CHAO KHUN THAHAN", "45", "162", "3", "e10044600n1346000s4", "Bang_Khae");
INSERT INTO mapinfo VALUES("2", "CHAO KHUN THAHAN-Chalong Krung 3", "490", "213", "4", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("3", "CHAO KHUN THAHAN Uturn1", "271", "188", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("4", "ROM KLAO Uturn1", "43", "16", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("5", "ROM KLAO Uturn2", "45", "245", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("6", "ROM KLAO Uturn3", "47", "390", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("7", "ROM KLAO Uturn4", "48", "552", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("8", "CHALONG KRUNG Uturn1", "515", "577", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("9", "MOTOR WAY-Parallel", "6", "550", "2", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("10", "ROM KLAO-Parallel", "48", "540", "3", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("11", "ROM KLAO-MOTOR WAY", "48", "540", "3", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("12", "MOTOR WAY-ROM KLAO", "86", "542", "3", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("13", "CHALONG KRUNG Uturn4", "259", "116", "0", "e10047000n1346000s4", NULL);
INSERT INTO mapinfo VALUES("14", "CHALONG KRUNG Uturn3", "115", "397", "0", "e10047000n1346000s4", NULL);
INSERT INTO mapinfo VALUES("15", "CHAO KHUN THAHAN-CHALONG KRUNG", "167", "246", "3", "e10047000n1346000s4", "Bang_Bon");
INSERT INTO mapinfo VALUES("16", "ROM KLAO-LAD KRABANG", "50", "72", "3", "e10044600n1343600s4", "Lat_Krabang");
INSERT INTO mapinfo VALUES("17", "LAD KRABANG Uturn1", "110", "72", "0", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("18", "LAD KRABANG Uturn2", "176", "73", "0", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("19", "LAD KRABANG Uturn3", "223", "73", "0", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("20", "LAD KRABANG Uturn4", "365", "75", "0", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("21", "LAD KRABANG Uturn5", "474", "76", "0", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("22", "LAD KRABANG Uturn6", "537", "77", "0", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("23", "LAD KRABANG-To Bang Na", "24", "80", "3", "e10047000n1343600s4", "Bang_Kapi");
INSERT INTO mapinfo VALUES("24", "LAD KRABANG Uturn8", "100", "83", "0", "e10047000n1343600s4", NULL);
INSERT INTO mapinfo VALUES("25", "LAD KRABANG Uturn9", "288", "149", "0", "e10047000n1343600s4", NULL);
INSERT INTO mapinfo VALUES("26", "LAD KRABANG Uturn10", "463", "211", "0", "e10047000n1343600s4", NULL);
INSERT INTO mapinfo VALUES("27", "CHALONG KRUNG Uturn2", "589", "543", "0", "e10044600n1346000s4", NULL);
INSERT INTO mapinfo VALUES("29", "LAD KRABANG-CHALONG KRUNG", "550", "77", "3", "e10044600n1343600s4", NULL);
INSERT INTO mapinfo VALUES("30", "LAD KRABANG Uturn7", "592", "78", "0", "e10044600n1343600s4", NULL);


#
# Table structure for table 'matching'
#

CREATE TABLE matching (
  word varchar(50) NOT NULL default '',
  inter1 varchar(50) default NULL,
  inter2 varchar(50) default NULL,
  PRIMARY KEY  (word)
) TYPE=MyISAM;



#
# Dumping data for table 'matching'
#

INSERT INTO matching VALUES("Kehanakon", "LAD KRABANG Uturn1", "LAD KRABANG Uturn2");
INSERT INTO matching VALUES("PTT LAD  KRABANG", "LAD KRABANG Uturn8", "LAD KRABANG Uturn9");
INSERT INTO matching VALUES("FOOD LION", "LAD KRABANG-CHALONG KRUNG", "LAD KRABANG Uturn7");
INSERT INTO matching VALUES("PTT ROM KLAO", "ROM KLAO Uturn2", "ROM KLAO-CHAO KHUN THAHAN");
INSERT INTO matching VALUES("Moo Ka Ta", "CHALONG KRUNG Uturn3", "CHALONG KRUNG Uturn4");
INSERT INTO matching VALUES("MOTOR WAY Busstop", "ROM KLAO-LAD KRABANG", "ROM KLAO Uturn4");
INSERT INTO matching VALUES("BB Supermarket", "LAD KRABANG Uturn7", "LAD KRABANG Uturn8");
INSERT INTO matching VALUES("KMITL", "CHALONG KRUNG Uturn3", "LAD KRABANG-CHALONG KRUNG");
INSERT INTO matching VALUES("CHALONG KRUNG Uturn1", "CHALONG KRUNG Uturn1", NULL);
INSERT INTO matching VALUES("CHALONG KRUNG Uturn2", "CHALONG KRUNG Uturn2", NULL);
INSERT INTO matching VALUES("CHALONG KRUNG Uturn3", "CHALONG KRUNG Uturn3", NULL);
INSERT INTO matching VALUES("CHALONG KRUNG Uturn4", "CHALONG KRUNG Uturn4", NULL);
INSERT INTO matching VALUES("CHAO KHUN THAHAN Uturn1", "CHAO KHUN THAHAN Uturn1", NULL);
INSERT INTO matching VALUES("CHAO KHUN THAHAN-CHALONG KRUNG", "CHAO KHUN THAHAN-CHALONG KRUNG", NULL);
INSERT INTO matching VALUES("CHAO KHUN THAHAN-Chalong Krung3", "CHAO KHUN THAHAN-Chalong Krung3", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn1", "LAD KRABANG Uturn1", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn10", "LAD KRABANG Uturn10", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn2", "LAD KRABANG Uturn2", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn3", "LAD KRABANG Uturn3", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn4", "LAD KRABANG Uturn4", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn5", "LAD KRABANG Uturn5", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn6", "LAD KRABANG Uturn6", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn7", "LAD KRABANG Uturn7", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn8", "LAD KRABANG Uturn8", NULL);
INSERT INTO matching VALUES("LAD KRABANG Uturn9", "LAD KRABANG Uturn9", NULL);
INSERT INTO matching VALUES("LAD KRABANG-CHALONG KRUNG", "LAD KRABANG-CHALONG KRUNG", NULL);
INSERT INTO matching VALUES("LAD KRABANG-To Bang Na", "LAD KRABANG-To Bang Na", NULL);
INSERT INTO matching VALUES("MOTOR WAY-Parallel", "MOTOR WAY-Parallel", NULL);
INSERT INTO matching VALUES("ROM KLAO Uturn1", "ROM KLAO Uturn1", NULL);
INSERT INTO matching VALUES("ROM KLAO Uturn2", "ROM KLAO Uturn2", NULL);
INSERT INTO matching VALUES("ROM KLAO Uturn3", "ROM KLAO Uturn3", NULL);
INSERT INTO matching VALUES("ROM KLAO Uturn4", "ROM KLAO Uturn4", NULL);
INSERT INTO matching VALUES("ROM KLAO-CHAO KHUN THAHAN", "ROM KLAO-CHAO KHUN THAHAN", NULL);
INSERT INTO matching VALUES("ROM KLAO-LAD KRABANG", "ROM KLAO-LAD KRABANG", NULL);
INSERT INTO matching VALUES("ROM KLAO-MOTOR WAY", "ROM KLAO-MOTOR WAY", NULL);
INSERT INTO matching VALUES("ROM KLAO-Parallel", "ROM KLAO-Parallel", NULL);


#
# Table structure for table 'member'
#

CREATE TABLE member (
  id int(10) unsigned NOT NULL auto_increment,
  usr varchar(20) NOT NULL default '',
  pass varchar(20) NOT NULL default '',
  name varchar(50) NOT NULL default '',
  email varchar(50) NOT NULL default '',
  district varchar(50) default NULL,
  address varchar(100) default NULL,
  mobile varchar(9) default NULL,
  provider varchar(20) default NULL,
  mo_usr varchar(20) default NULL,
  mo_pass varchar(20) default NULL,
  start1 varchar(50) default NULL,
  dest1 varchar(50) default NULL,
  start2 varchar(50) default NULL,
  dest2 varchar(50) default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM;



#
# Dumping data for table 'member'
#

INSERT INTO member VALUES("1", "Wutthinai", "231025231025", "Wutthinai Kanjansorn", "wuttthnai@hotmail.com", "Lat_Krabang", "377 ถ.วชิรปราการ ต.บางปลาสร้อย อ.เมือง จ.ชลบุรี", "016839699", "DTAC", "wutthinai1", "23102523", "KMITL", "FOOD LION", "null", "null");
INSERT INTO member VALUES("6", "boy", "boy", "boy", "boy@hotmail.com", "Lat_Krabang", "377 ถ.วชิรปราการ ต.บางปลาสร้อย อ.เมือง จ.ชลบุรี", "", "Hutch", "", "", "FOOD LION", "KMITL", "null", "null");
INSERT INTO member VALUES("7", "test", "test", "tester", "tester@hotmail.com", "Lat_Krabang", "377 ถ.วชิรปราการ ต.บางปลาสร้อย อ.เมือง จ.ชลบุรี", "012345678", "Orange", "test", "test", "KMITL", "Moo Ka Ta", "Moo Ka Ta", "KMITL");
INSERT INTO member VALUES("8", "supersushi2002", "00000147", "san", "supersushi2002@hear.com", "Bang_Khun_Thian", "15/229 moo1 rama2 rd. bangkuntean", "016412616", "DTAC", "", "", "null", "null", "null", "null");
INSERT INTO member VALUES("9", "jump", "jump", "Sakesawad Iamsinwattana", "jumpkung@hotmail.com", "Khlong_Toei", "", "01310231", "null", "", "", "null", "null", "null", "null");
INSERT INTO member VALUES("10", "haha", "haha", "hahaha", "haha@hotmail.com", "", "", "", "AIS", "", "", "null", "null", "null", "null");
INSERT INTO member VALUES("11", "again1", "again1", "again1", "again1@again.com", "Chatuchak", "afsdgerge", "014567890", "Hutch", "no", "use", "FOOD LION", "Moo Ka Ta", "null", "null");


#
# Table structure for table 'nodeadjacent'
#

CREATE TABLE nodeadjacent (
  id int(10) NOT NULL auto_increment,
  node varchar(50) NOT NULL default '',
  adja varchar(50) NOT NULL default '0',
  straight_node varchar(50) NOT NULL default '0',
  right_node varchar(50) NOT NULL default '0',
  left_node varchar(50) NOT NULL default '0',
  uturn varchar(50) NOT NULL default '0',
  distance int(10) unsigned NOT NULL default '0',
  expressway int(4) unsigned NOT NULL default '0',
  density int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;



#
# Dumping data for table 'nodeadjacent'
#

INSERT INTO nodeadjacent VALUES("1", "ROM KLAO-CHAO KHUN THAHAN", "CHAO KHUN THAHAN Uturn1", "CHAO KHUN THAHAN-Chalong Krung3", "0", "0", "ROM KLAO-CHAO KHUN THAHAN", "1000", "40", "1");
INSERT INTO nodeadjacent VALUES("2", "ROM KLAO-CHAO KHUN THAHAN", "ROM KLAO Uturn1", "0", "0", "0", "ROM KLAO-CHAO KHUN THAHAN", "2000", "0", "0");
INSERT INTO nodeadjacent VALUES("3", "ROM KLAO-CHAO KHUN THAHAN", "ROM KLAO Uturn2", "ROM KLAO Uturn3", "0", "0", "ROM KLAO-CHAO KHUN THAHAN", "500", "0", "0");
INSERT INTO nodeadjacent VALUES("4", "ROM KLAO Uturn1", "ROM KLAO-CHAO KHUN THAHAN", "ROM KLAO Uturn2", "0", "CHAO KHUN THAHAN Uturn1", "ROM KLAO Uturn1", "2000", "0", "1");
INSERT INTO nodeadjacent VALUES("5", "CHAO KHUN THAHAN Uturn1", "ROM KLAO-CHAO KHUN THAHAN", "0", "ROM KLAO Uturn1", "ROM KLAO Uturn2", "0", "4000", "0", "1");
INSERT INTO nodeadjacent VALUES("6", "CHAO KHUN THAHAN-Chalong Krung3", "CHAO KHUN THAHAN-CHALONG KRUNG", "0", "CHALONG KRUNG Uturn3", "CHALONG KRUNG Uturn4", "0", "2000", "80", "1");
INSERT INTO nodeadjacent VALUES("7", "CHAO KHUN THAHAN-Chalong Krung3", "CHAO KHUN THAHAN Uturn1", "ROM KLAO-CHAO KHUN THAHAN", "0", "0", "CHAO KHUN THAHAN-Chalong Krung3", "300", "0", "1");
INSERT INTO nodeadjacent VALUES("8", "ROM KLAO Uturn2", "ROM KLAO-CHAO KHUN THAHAN", "ROM KLAO Uturn1", "CHAO KHUN THAHAN Uturn1", "0", "ROM KLAO Uturn2", "4500", "0", "0");
INSERT INTO nodeadjacent VALUES("9", "ROM KLAO Uturn2", "ROM KLAO Uturn3", "ROM KLAO-MOTOR WAY", "0", "0", "ROM KLAO Uturn2", "4500", "40", "2");
INSERT INTO nodeadjacent VALUES("10", "ROM KLAO Uturn3", "ROM KLAO Uturn2", "ROM KLAO-CHAO KHUN THAHAN", "0", "0", "ROM KLAO Uturn3", "500", "0", "3");
INSERT INTO nodeadjacent VALUES("11", "ROM KLAO Uturn3", "ROM KLAO-MOTOR WAY", "ROM KLAO Uturn4", "MOTOR WAY-Parallel", "ROM KLAO-Parallel", "ROM KLAO Uturn3", "3000", "0", "0");
INSERT INTO nodeadjacent VALUES("12", "ROM KLAO-MOTOR WAY", "ROM KLAO Uturn3", "ROM KLAO Uturn2", "0", "0", "ROM KLAO-MOTOR WAY", "2000", "0", "2");
INSERT INTO nodeadjacent VALUES("13", "ROM KLAO-MOTOR WAY", "MOTOR WAY-Parallel", "0", "0", "0", "ROM KLAO-MOTOR WAY", "100", "0", "0");
INSERT INTO nodeadjacent VALUES("14", "ROM KLAO-MOTOR WAY", "ROM KLAO-Parallel", "0", "0", "0", "0", "150", "0", "1");
INSERT INTO nodeadjacent VALUES("15", "ROM KLAO-MOTOR WAY", "ROM KLAO Uturn4", "ROM KLAO-LAD KRABANG", "0", "0", "ROM KLAO-MOTOR WAY", "200", "40", "2");
INSERT INTO nodeadjacent VALUES("16", "CHAO KHUN THAHAN Uturn1", "CHAO KHUN THAHAN-Chalong Krung3", "CHAO KHUN THAHAN-CHALONG KRUNG", "0", "0", "0", "500", "0", "1");
INSERT INTO nodeadjacent VALUES("17", "CHALONG KRUNG Uturn2", "CHALONG KRUNG Uturn3", "CHAO KHUN THAHAN-CHALONG KRUNG", "0", "0", "CHALONG KRUNG Uturn2", "400", "0", "0");
INSERT INTO nodeadjacent VALUES("18", "CHALONG KRUNG Uturn2", "CHALONG KRUNG Uturn1", "LAD KRABANG-CHALONG KRUNG", "LAD KRABANG Uturn6", "LAD KRABANG Uturn7", "CHALONG KRUNG Uturn2", "750", "0", "1");
INSERT INTO nodeadjacent VALUES("19", "CHALONG KRUNG Uturn1", "CHALONG KRUNG Uturn2", "CHALONG KRUNG Uturn3", "0", "0", "CHALONG KRUNG Uturn1", "550", "0", "3");
INSERT INTO nodeadjacent VALUES("20", "CHALONG KRUNG Uturn1", "LAD KRABANG-CHALONG KRUNG", "0", "0", "0", "0", "200", "0", "1");
INSERT INTO nodeadjacent VALUES("21", "ROM KLAO-Parallel", "ROM KLAO-MOTOR WAY", "MOTOR WAY-Parallel", "ROM KLAO Uturn3", "ROM KLAO Uturn4", "ROM KLAO Uturn3", "5000", "40", "2");
INSERT INTO nodeadjacent VALUES("22", "MOTOR WAY-Parallel", "ROM KLAO-MOTOR WAY", "ROM KLAO-Parallel", "ROM KLAO Uturn4", "0", "0", "3500", "0", "0");
INSERT INTO nodeadjacent VALUES("23", "ROM KLAO Uturn4", "ROM KLAO-LAD KRABANG", "0", "0", "LAD KRABANG Uturn1", "ROM KLAO-LAD KRABANG", "200", "0", "1");
INSERT INTO nodeadjacent VALUES("24", "ROM KLAO Uturn4", "ROM KLAO-MOTOR WAY", "ROM KLAO Uturn3", "ROM KLAO-Parallel", "MOTOR WAY-Parallel", "0", "3500", "0", "2");
INSERT INTO nodeadjacent VALUES("25", "CHAO KHUN THAHAN-CHALONG KRUNG", "CHAO KHUN THAHAN-Chalong Krung3", "CHAO KHUN THAHAN Uturn1", "0", "0", "CHAO KHUN THAHAN-CHALONG KRUNG", "150", "0", "2");
INSERT INTO nodeadjacent VALUES("26", "CHAO KHUN THAHAN-CHALONG KRUNG", "CHALONG KRUNG Uturn4", "0", "0", "0", "CHAO KHUN THAHAN-CHALONG KRUNG", "200", "0", "1");
INSERT INTO nodeadjacent VALUES("27", "CHAO KHUN THAHAN-CHALONG KRUNG", "CHALONG KRUNG Uturn3", "CHALONG KRUNG Uturn2", "0", "0", "CHAO KHUN THAHAN-CHALONG KRUNG", "300", "0", "2");
INSERT INTO nodeadjacent VALUES("28", "CHALONG KRUNG Uturn4", "CHAO KHUN THAHAN-CHALONG KRUNG", "CHALONG KRUNG Uturn3", "CHAO KHUN THAHAN-Chalong Krung3", "0", "CHONG KRUNG Uturn4", "600", "0", "2");
INSERT INTO nodeadjacent VALUES("29", "CHALONG KRUNG Uturn3", "CHAO KHUN THAHAN-CHALONG KRUNG", "CHALONG KRUNG Uturn4", "0", "CHAO KHUN THAHAN-Chalong Krung3", "CHALONG KRUNG Uturn3", "5000", "40", "1");
INSERT INTO nodeadjacent VALUES("30", "CHALONG KRUNG Uturn3", "CHALONG KRUNG Uturn2", "CHALONG KRUNG Uturn1", "0", "0", "CHALONG KRUNG Uturn3", "1000", "0", "0");
INSERT INTO nodeadjacent VALUES("31", "LAD KRABANG-To Bang Na", "LAD KRABANG Uturn8", "LAD KRABANG Uturn9", "0", "0", "LAD KRABANG-To Bang Na", "2500", "0", "0");
INSERT INTO nodeadjacent VALUES("32", "LAD KRABANG-To Bang Na", "LAD KRABANG Uturn7", "LAD KRABANG-CHALONG KRUNG", "0", "0", "LAD KRABANG-To Bang Na", "2000", "0", "2");
INSERT INTO nodeadjacent VALUES("33", "LAD KRABANG Uturn8", "LAD KRABANG-To Bang Na", "LAD KRABANG-CHALONG KRUNG", "0", "0", "0", "3000", "40", "1");
INSERT INTO nodeadjacent VALUES("34", "LAD KRABANG Uturn8", "LAD KRABANG Uturn9", "LAD KRABANG Uturn10", "0", "0", "LAD KRABANG Uturn8", "2500", "0", "1");
INSERT INTO nodeadjacent VALUES("35", "LAD KRABANG Uturn9", "LAD KRABANG Uturn8", "LAD KRABANG-To Bang Na", "0", "0", "LAD KRABANG Uturn9", "4000", "0", "2");
INSERT INTO nodeadjacent VALUES("36", "LAD KRABANG Uturn9", "LAD KRABANG Uturn10", "0", "0", "0", "0", "1000", "0", "2");
INSERT INTO nodeadjacent VALUES("37", "LAD KRABANG Uturn10", "LAD KRABANG Uturn9", "LAD KRABANG Uturn8", "0", "0", "LAD KRABANG Uturn10", "500", "80", "3");
INSERT INTO nodeadjacent VALUES("38", "ROM KLAO-LAD KRABANG", "ROM KLAO Uturn4", "ROM KLAO-MOTOR WAY", "0", "0", "0", "5000", "0", "3");
INSERT INTO nodeadjacent VALUES("39", "ROM KLAO-LAD KRABANG", "LAD KRABANG Uturn1", "LAD KRABANG Uturn2", "0", "0", "ROM KLAO-LAD KRABANG", "2000", "0", "3");
INSERT INTO nodeadjacent VALUES("40", "LAD KRABANG Uturn1", "LAD KRABANG Uturn2", "LAD KRABANG Uturn3", "0", "0", "LAD KRABANG Uturn1", "2500", "40", "2");
INSERT INTO nodeadjacent VALUES("41", "LAD KRABANG Uturn1", "ROM KLAO-LAD KRABANG", "0", "ROM KLAO Uturn4", "0", "0", "2000", "0", "3");
INSERT INTO nodeadjacent VALUES("42", "LAD KRABANG Uturn2", "LAD KRABANG Uturn3", "LAD KRABANG Uturn4", "0", "0", "LAD KRABANG Uturn2", "3000", "0", "1");
INSERT INTO nodeadjacent VALUES("43", "LAD KRABANG Uturn2", "LAD KRABANG Uturn1", "ROM KLAO-LAD KRABANG", "0", "0", "LAD KRABANG Uturn2", "4000", "0", "2");
INSERT INTO nodeadjacent VALUES("44", "LAD KRABANG Uturn3", "LAD KRABANG Uturn2", "LAD KRABANG Uturn1", "0", "0", "LAD KRABANG Uturn3", "750", "0", "2");
INSERT INTO nodeadjacent VALUES("45", "LAD KRABANG Uturn3", "LAD KRABANG Uturn4", "LAD KRABANG Uturn5", "0", "0", "LAD KRABANG Uturn3", "900", "0", "0");
INSERT INTO nodeadjacent VALUES("46", "LAD KRABANG Uturn4", "LAD KRABANG Uturn3", "LAD KRABANG Uturn2", "0", "0", "LAD KRABANG Uturn4", "5000", "0", "2");
INSERT INTO nodeadjacent VALUES("47", "LAD KRABANG Uturn4", "LAD KRABANG Uturn5", "LAD KRABANG Uturn6", "0", "0", "LAD KRABANG Uturn4", "4000", "0", "0");
INSERT INTO nodeadjacent VALUES("48", "LAD KRABANG Uturn5", "LAD KRABANG Uturn4", "LAD KRABANG Uturn3", "0", "0", "LAD KRABANG Uturn5", "4500", "0", "0");
INSERT INTO nodeadjacent VALUES("49", "LAD KRABANG Uturn5", "LAD KRABANG Uturn6", "LAD KRABANG-CHALONG KRUNG", "0", "0", "LAD KRABANG Uturn5", "2000", "0", "2");
INSERT INTO nodeadjacent VALUES("50", "LAD KRABANG Uturn6", "LAD KRABANG Uturn5", "LAD KRABANG Uturn4", "0", "0", "LAD KRABANG Uturn6", "1000", "0", "0");
INSERT INTO nodeadjacent VALUES("51", "LAD KRABANG Uturn6", "LAD KRABANG-CHALONG KRUNG", "LAD KRABANG Uturn7", "0", "CHALONG KRUNG Uturn1", "LAD KRABANG Uturn6", "3000", "0", "2");
INSERT INTO nodeadjacent VALUES("52", "LAD KRABANG-CHALONG KRUNG", "CHALONG KRUNG Uturn1", "CHALONG KRUNG Uturn1", "0", "0", "LAD KRABANG-CHALONG KRUNG", "2000", "0", "2");
INSERT INTO nodeadjacent VALUES("53", "LAD KRABANG-CHALONG KRUNG", "LAD KRABANG Uturn6", "LAD KRABANG Uturn5", "0", "0", "0", "2500", "0", "0");
INSERT INTO nodeadjacent VALUES("54", "LAD KRABANG-CHALONG KRUNG", "LAD KRABANG Uturn7", "LAD KRABANG-To Bang Na", "0", "0", "LAD KRABANG-CHALONG KRUNG", "2000", "0", "1");
INSERT INTO nodeadjacent VALUES("55", "LAD KRABANG Uturn7", "LAD KRABANG-CHALONG KRUNG", "LAD KRABANG Uturn6", "CHALONG KRUNG Uturn1", "0", "LAD KRABANG Uturn7", "4000", "0", "2");
INSERT INTO nodeadjacent VALUES("56", "LAD KRABANG Uturn7", "LAD KRABANG-To Bang Na", "LAD KRABANG Uturn8", "0", "0", "0", "500", "0", "1");


#
# Table structure for table 'report'
#

CREATE TABLE report (
  street varchar(50) NOT NULL default '',
  district varchar(50) NOT NULL default '',
  comment varchar(150) NOT NULL default '',
  date date default NULL,
  PRIMARY KEY  (street)
) TYPE=MyISAM;



#
# Dumping data for table 'report'
#

INSERT INTO report VALUES("ฉลองกรุง", "ลาดกระบัง", "การจราจรติดขัด เนื่องจากรถไฟตกราง กีดขวางการจราจร", "2004-06-01");
INSERT INTO report VALUES("อ่อนนุช", "ลาดกระบัง", "ม่ายมีอ่ะ หลอกเล่น", "0000-00-00");
INSERT INTO report VALUES("รามา2", "บางขุนเทียน", "บ้านสัน", NULL);
INSERT INTO report VALUES("Chalong Krung", "Lat_Krabang", "very slow traffic", NULL);


#
# Table structure for table 'sample'
#

CREATE TABLE sample (
  id int(3) unsigned NOT NULL auto_increment,
  name varchar(100) default NULL,
  age tinyint(3) unsigned default '0',
  email varchar(100) default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;



#
# Dumping data for table 'sample'
#

INSERT INTO sample VALUES("1", "Kevin", "20", "kevin@hotmail.com");
INSERT INTO sample VALUES("2", "Andrew", "25", "andrew@msn.com");
INSERT INTO sample VALUES("3", "Jame", "23", "jame@thaimail.com");
INSERT INTO sample VALUES("4", "Philip", "30", "philip@hotmail.com");
