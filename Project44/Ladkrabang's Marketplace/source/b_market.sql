# MySQL dump 8.14
#
# Host: localhost    Database: kmitl_market
#--------------------------------------------------------
# Server version	3.23.41

#
# Table structure for table 'address_ans'
#

CREATE TABLE address_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'address_ans'
#

INSERT INTO address_ans VALUES (1,'H00000','หอพักนี้ดีนะครับอยู่มาหลายปีไม่มีปัญหาเลยครับ สงบเรียบร้อย ตอนนี้เขามีกุญแจหน้าหอให้คนละดอกด้วยครับ ป้องกันจักรยานหายครับ จ่ายค่าหอกลางเดือนก็ได้นะครับ แล้วแต่ตกลงกันหอสะอาดครับ มีคนมาทำควาสะอาดเกือบทุกวัน น้ำ ไฟ โทรศัพท์พร้อมครับ <img src=\"pics/tasty.gif\">','doctork','','161.246.5.215','30/01/02',NULL);
INSERT INTO address_ans VALUES (2,'H00001','เปิดใหม่แล้วมี UBC ให้ดูด้วยหรือเปล่าครับ <img src=\"pics/confused.gif\">','doctork','','161.246.5.215','03/02/02',NULL);
INSERT INTO address_ans VALUES (3,'H00001','มีห้องแอร์ไม๊ครับ','นักศึกษาปีหน้า','','203.152.53.194','08/02/02',NULL);
INSERT INTO address_ans VALUES (4,'H00001','UBC เห็นบอกว่าจะติดให้ ไม่แน่ใจนะ แต่แอร์สามารถขอติดได้แต่ราคาเพิ่มแน่ ๆ น่าจะ 3800 บ./เดือนนะ <img src=\"pics/smokin.gif\">','กิสโม่ 3D','','161.246.6.146','15/02/02',NULL);
INSERT INTO address_ans VALUES (5,'H00001','ที่มันกะลังสร้างอยู่หรือเปล่าอ่ะคะ<br>\n<br>\nอยากรู้ๆ  <img src=\"pics/smile.gif\">','kanoam','','161.246.51.206','20/02/02',NULL);
INSERT INTO address_ans VALUES (6,'H00004','ผมว่านะครับ ติดต่อไว้ตั้งแต่ช่วง มกราฯ-กุมภาฯ จะดีกว่า แล้วมาทำสัญญา พอคนเก่าออกไปเราก็ได้เสียบเลย  <img src=\"pics/smokin.gif\"><br>\nปล. ได้หอมาก็เพราะวิธีนี้แหละครับ เพิ่งย้ายเข้าเมื่อวันเสาร์นี้เอง','surachet','','161.246.45.222','25/02/02',NULL);
INSERT INTO address_ans VALUES (7,'H00001','เมือ่ไหร่ จะทำถนนในซอย เกกี2 สักที ??? ','mister_sk','','161.246.51.149','26/02/02',NULL);
INSERT INTO address_ans VALUES (8,'H00001','ต้องรอให้หอเสร็จก่อนหล่ะครับ ถึงจะสร้างไม่งั้นถนนพังแน่ เพราะมีรถใหญ่วิ่งทั้งวัน <img src=\"pics/blue.gif\">','K','','161.246.5.12','27/02/02',NULL);
INSERT INTO address_ans VALUES (9,'H00000','ผมได้โควต้าไปเรียนที่สถาบันฯ ตอนนี้อยู่ต่างจังหวัด อยากทราบว่าจะต้องเสียค่าใช้จ่ายเท่าไหร่ในการเช่าครั้งแรกครับ<br>\n','วัชรพงศ์','ratsuwan@chaiyo.com','202.183.152.105','27/02/02',NULL);
INSERT INTO address_ans VALUES (10,'H00005','มีแอร์หรือเปล่า เพราะต้องการมาก อยู่ได้กี่คน','วิศวะอาหารหน้าใหม่','','203.152.53.199','27/02/02',NULL);
INSERT INTO address_ans VALUES (11,'H00000','พี่จ๋า ถ้าติดแอร์ด้วยได้ป่าว คิดราคาเท่าไร','เด็กหญิงคนหนึ่ง','','203.152.53.199','27/02/02',NULL);
INSERT INTO address_ans VALUES (12,'H00005','ไม่มีแอร์หรอกคครับ แต่อากาศกำลังดีอยู่ได้ประมาณ 4 คนครับ <img src=\"pics/lol.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (13,'H00006','หอพักสวัสดิ์สุขมีแอร์ครับ อยู่ในซอยร้าน punch เข้าไปลึกนิดหน่อยอยู่ซ้ายมือหอดีครับ มีแอร์ด้วย ไม่มี ubc เดือนละ 2500 บาท โทร 027390334 <img src=\"pics/biggrin.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (14,'H00006','ขอบคุณพี่ K ที่บอกครับ แล้วมีหออื่่นๆอีกไหมครับ จะได้มีหลายตัวเลือกครับ','น้องใหม่','','203.146.35.149','28/02/02',NULL);
INSERT INTO address_ans VALUES (15,'H00006','ขอโทษครับ พิมพ์ผิด  หออื่นๆ ครับ','น้องใหม่','','203.146.35.149','28/02/02',NULL);
INSERT INTO address_ans VALUES (16,'H00006','ซอยกีเกงาม 3 ก็มีนะครับ หลังสถาบัน มีแอร์ 3500 บาท ไม่มีแอร์ 2800 บาท มีหลายราคาให้เลือก มี ubc ให้ด้วยนะครับ มีอีกหลายที่นะ แต่ก็รู้ไม่หมดหรอก นะ <img src=\"pics/blue.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (17,'H00006','ลืมบอกชื่อไปหอถาวรพฤกษ์ครับ สุดซอยเกกีงาม 3 <img src=\"pics/biggrin.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (18,'H00000','หอพักนาคบำรุงศรี ไม่มีแอร์ครับ มีแต่พัดลมให้อยู่ลาดกระบังกก็เย็นแล้วครับ ไม่ต้องใช้แอร์ก็ได้ <img src=\"pics/blue.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (19,'H00000','ถ้าเป็นนาคบำรุงศรีก็ประมาณ 3500 บาทนะค่ามัดจำนะ ไม่เกิน 4000 บาท ล่วงหน้า 2 เดือนครับ ก็เบ็ดเสร็จประมาณ 6500-7000 บาทน่ะครับ <img src=\"pics/sleepy.gif\">','doctork','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (20,'H00006','ถามพี่ k มีหอไหนที่อีกที่ติดแอร์ราคาถูก<br>\nแล้วพี่ k ครับ ผมอยากรู้ขนาดดของห้องด้วยละ <img src=\"pics/tasty.gif\">','ppt','','203.146.35.169','28/02/02',NULL);
INSERT INTO address_ans VALUES (21,'H00001','ขอเบอร์ติดต่ิอด้วยครับ','คุณ P','','203.146.35.169','28/02/02',NULL);
INSERT INTO address_ans VALUES (22,'H00006','ติดแอร์แล้วราคาถูกไม่ค่อยมีหรอกนะ มีแต่ราคาแพงทั้งนั้น 3000 บาทขึ้นทั้งนั้นแถวนี้มีหอเยอะครับ มีบ้านให้เช่าเป้นหลังก็มีนะครับ ที่หมู่บ้านมนสินี น่ะครับ ใกล้มหาลัยเหมือนกัน ก็ประมาณ 4*6 นะ <img src=\"pics/lol.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO address_ans VALUES (23,'H00000','need more infomation<br>\nโต๊ะ ตู้ เตียง ???<br>\nห้องน้ำในตัว ???<br>\n<br>\n <img src=\"pics/smile.gif\">','123','','161.246.12.40','01/03/02',NULL);
INSERT INTO address_ans VALUES (24,'H00000','ถ้าเป็นหอพักนาคบำรุงศรีที่สร้างใหม่ก็จะมี เตียง ตู้เสื้อผ้า ให้ครับ มีห้องน้ำในตัวครับ ทุกห้อง ส่วนโต๊ะไม่มีครับ <img src=\"pics/lol.gif\">','doctork','','161.246.5.215','06/03/02',NULL);
INSERT INTO address_ans VALUES (25,'H00007','หอพักยุคลรัตน์ไง  ถูกด้วยนะ  รีบๆๆไปจองนะเด๊ยวมันจะเต็ม <img src=\"pics/smokin.gif\">','พพ','','203.113.66.8','06/03/02',NULL);
INSERT INTO address_ans VALUES (26,'H00007','อยู่ตรงไหนหล่ะครับ แล้วมี ubc ไหมครับ <img src=\"pics/biggrin.gif\">','เค','','161.246.5.215','06/03/02',NULL);
INSERT INTO address_ans VALUES (27,'H00000','ที่คอนโดยุคคลรัตน์มีอยู่ 1 ห้อง ที่มีครบ<br>\nไม่ว่า แอร์ เตียง ที่นอน ตู้เสื้อผ้า ตู้เย็น<br>\nมุ้งลวด เหล็กดัด โทรศัพท์สายตรง เครื่องทำน้ำอุ่น<br>\nลองไปติดต่อดู อยู่ซอยเดียวกับสถานีตำรวจใหม่','รุ่นพี่','','161.246.38.144','07/03/02',NULL);
INSERT INTO address_ans VALUES (28,'H00007','ขอบอกอยู่ที่เดียวกับสถานีตำรวจจรเข้น้อย<br>\nและสถานีดับเพลิงลาดกระบัง<br>\nมีอยู่ 1 ห้องที่มีครบทุกอย่างยกเว้น UBC<br>\nสนใจลองติดต่อโครงการดู','คนหวังดี','','161.246.38.144','07/03/02',NULL);
INSERT INTO address_ans VALUES (29,'H00005','ใครบอกว่าไม่มี  ห้องแอร์มีเยอะแยะ  ถึงไม่มีก็บอกให้เค้าติดได้ อยากได้อารายก็บอกเค้าได้  ','alfa','','161.246.5.12','07/03/02',NULL);
INSERT INTO address_ans VALUES (30,'H00005','อ้อ!!!!  ลืมบอกไปอย่างหนึ่งว่า  อย่าเลือกห้องที่อยู่ชั้น4  หรือห้องที่อยู่ติดถนนล่ะ  ไม่งั้น  จะกลายเป็นเป็ดย่างไปได้  ขอบอกว่าร้อนมากก   <img src=\"pics/smokin.gif\">','alfa','','161.246.5.12','07/03/02',NULL);
INSERT INTO address_ans VALUES (31,'H00004','ช่ายๆๆๆ  พอรู้ว่าติดแล้วให้รีบมาหาหอด่วนนนจะได้เลือกได้<br>\nไม่งั้นเต็มหมดแน่  ปีที่แล้วพอผลเอนท์ออก ก็มีน้องๆๆมาหาหอเยอะแยะไปหมด  โดยเฉพาะหอใหญ่ๆๆเต็มเร็วมาก<br>\n <img src=\"pics/sleepy.gif\">','alfa','','161.246.5.12','07/03/02',NULL);
INSERT INTO address_ans VALUES (32,'H00008','ก็ดีนะ ทั้ง 2 หอน่ะ ที่ว่ามาลองมาดูด้วยตาตัวเองจะดีกว่านะ   <img src=\"pics/shy.gif\">','K','-','161.246.5.215','10/03/02',0);
INSERT INTO address_ans VALUES (33,'H00001','ค่าเช่า 3000 ครับ และก็ ไม่มี UBC ด้วย <img src=\"pics/crying.gif\">','.....','.....','202.22.41.102','12/03/02',0);
INSERT INTO address_ans VALUES (34,'H00008','หอทิพวารีย์ก็ดี เน้นที่สาวสวยเยอะ มากที่สุดในลาดกระบัง แต่แพงหน่อย <img src=\"pics/lol.gif\">','พันธมิตร','','161.246.5.42','13/03/02',0);
INSERT INTO address_ans VALUES (35,'H00010','หอพักนาคบำรุงศรนี่แหล่ะ ดีแล้วก็ถูก ปลอดภัยด้วยนะ อยู่ซอยเกกีงาม 3 หลังสถาบันมีให้เลือกตั้ง 7 หอน่ะ เบอร์โทร 027391042  <img src=\"pics/blue.gif\">','K','','161.246.5.215','14/03/02',0);
INSERT INTO address_ans VALUES (36,'H00010','-Thank you <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\">','newway','newway@yahoo.com','203.148.188.206','18/03/02',0);
INSERT INTO address_ans VALUES (37,'H00000','หอนาคคิดแพง ทั้งค่าน้ำ โทรศัพท์ ไฟฟ้า แพงหมด','555','','161.246.18.219','19/03/02',0);
INSERT INTO address_ans VALUES (38,'H00005','ต้องชั้น 5 ครับ เย็นสบายมีสวนหย่อมด้วย','???','','161.246.12.29','19/03/02',0);
INSERT INTO address_ans VALUES (39,'H00001','ทำไมอย่างได้กันจริ๊ง<font color=red>***</font>องแอร์น่ะ มาเรียนนะไม่ใช่อยู่บ้าน เด็กลาดกระบังเดี๋ยวนี้คงมีแต่ลูกคุณหนู แล้วนี่เวลาจบไปทำงานเอกลักษณ์ของเด็กลาดกระบังที่ ถึก ทน สู้งาน คงไม่มีอีกแล้ว <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\">','???','','161.246.12.29','19/03/02',0);
INSERT INTO address_ans VALUES (40,'H00006','ทำไมอย่างได้กันจริ๊ง<font color=red>***</font>องแอร์น่ะ มาเรียนนะไม่ใช่อยู่บ้าน เด็กลาดกระบังเดี๋ยวนี้คงมีแต่ลูกคุณหนู แล้วนี่เวลาจบไปทำงานเอกลักษณ์ของเด็กลาดกระบังที่ ถึก ทน สู้งาน คงไม่มีอีกแล้ว <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\">','???','','161.246.12.29','19/03/02',0);
INSERT INTO address_ans VALUES (41,'H00005','ทำไมอย่างได้กันจริ๊ง<font color=red>***</font>องแอร์น่ะ มาเรียนนะไม่ใช่อยู่บ้าน เด็กลาดกระบังเดี๋ยวนี้คงมีแต่ลูกคุณหนู แล้วนี่เวลาจบไปทำงานเอกลักษณ์ของเด็กลาดกระบังที่ ถึก ทน สู้งาน คงไม่มีอีกแล้ว <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\">','ปีแก่','','161.246.12.29','19/03/02',0);
INSERT INTO address_ans VALUES (42,'H00000','ทำไมอย่างได้กันจริ๊ง<font color=red>***</font>องแอร์น่ะ มาเรียนนะไม่ใช่อยู่บ้าน เด็กลาดกระบังเดี๋ยวนี้คงมีแต่ลูกคุณหนู แล้วนี่เวลาจบไปทำงานเอกลักษณ์ของเด็กลาดกระบังที่ ถึก ทน สู้งาน คงไม่มีอีกแล้ว <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\">','ปีแก่','','161.246.12.29','19/03/02',0);
INSERT INTO address_ans VALUES (43,'H00000','เด็กในหอนาคบำรุงศรีที่ปิดประตูเสียงดัง ไม่มีมารยาทในการอยู่ร่วมกันในสังคม มารยาททรามมาก <img src=\"pics/blue.gif\">','mod##','-','161.246.11.188','26/03/02',0);
INSERT INTO address_ans VALUES (44,'H00001','ค่าเช่า 3000 ครับ มี UBC เฟอร์ ตู้ เตียง ครับ<br>\nตอนนี้หอ 1 กับ 2 เหลือไม่กี่ห้อง หอ 3 ยังไม่เสร็จ กำลังจะเปิดจองประมาณ มิถุนายนครับ <img src=\"pics/supergrin.gif\">','WolfZ','','161.246.7.38','26/03/02',0);
INSERT INTO address_ans VALUES (45,'H00003','ขายอย่างเดียวหรอคะ  ให้เช่าหรือเปล่าคะ  <br>\nแล้วถ้าขาย จะขายยังงัย  วางเงินอะไร ยังงัยคะ สนใจค่ะ   ','อ้อม','phumarin99@hotmail.com','202.183.137.113','27/03/02',0);
INSERT INTO address_ans VALUES (46,'H00006','ผมว่าเรื่องติดแอร์ไม่ใช่ประเด็นเรื่องสู้งานหรอกครับ หากแต่ว่าต้องรู้จักประเมินตน ถ้ามีเงินอยากอยู่แอร์ก็ตามสบาย อาจดีต่อการอ่านหนังสืออีกต่างหาก แต่ถ้าไม่มีเงินแล้วอยากอยู่แอร์ก็ต้องทำงานหารายได้พิเคษด้วยการใช้สติปัญญาที่มี โดยไม่กระทบกับการเรียน ซึ่งเป็นเรื่องที่ยาก และเป็นคนสู้งานอย่างแท้จริง เพื่อให้ได้มาซึ่งสิ่งที่เราต้องการครับ <img src=\"pics/sunglasses.gif\"> <img src=\"pics/smokin.gif\">','พี่ต้น (รุ่น 29)','saranyu.i@thaicrt.com','202.183.225.194','30/03/02',0);
INSERT INTO address_ans VALUES (47,'H00005',' <img src=\"pics/clown.gif\">ฮ่าๆๆๆๆๆๆๆ พูดมากเดี๋ยวเจอดี <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/aysmile.gif\"> <img src=\"pics/grazy.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\">','โก๋','','203.155.48.3','01/04/02',0);
INSERT INTO address_ans VALUES (48,'H00013','แพงจัง','มอส','','203.146.212.62','01/04/02',0);
INSERT INTO address_ans VALUES (49,'H00014','webmaster ไม่มีเวลาไปเดินหาที่พักให้หรอกครับมีอย่างอื่นต้องทำอีกเยอะครับ <img src=\"pics/smokin.gif\">','webmaster','','161.246.5.215','01/04/02',0);
INSERT INTO address_ans VALUES (50,'H00014','การให้ข้อมูล ข้อมูลแต่และอย่างก้อต้องเอาที่คนประกาศให้เช่าดิ จะมาเอาอะไรกลับ webmaster หละ <img src=\"pics/grazy.gif\">','บ.บู๋','','202.44.32.9','01/04/02',0);
INSERT INTO address_ans VALUES (51,'H00014','<a href=\"http://www.kmitl.ac.th/sic/achieve/table/link/houetakae.html\" target=\"www.kmitl.ac.th/sic/achieve/table/link/houetakae.html\">http://www.kmitl.ac.th/sic/achieve/table/link/houetakae.html</a>','สุรเชษฐ์','surachet@iname.com','161.246.45.222','01/04/02',0);
INSERT INTO address_ans VALUES (52,'H00014','คุณน้องใหม่ครับ รู้จักคำว่า webmaster ไหมครับ เขาคือผู้ดูแลโฮมเพจ และอีกหลาย ๆ อย่างใน web เรื่องนี้ผมว่าคุณน้องใหม่ไม่น่าไปตำหนิ webmaster นะครับ อยากให้คุณน้องใหม่ลองเขียนใส่กระดาษดูก่อนก็ได้นะครับว่าโฮมเพจที่คุณน้องใหม่จะทำนั้นมีอะไรบ้าง จะได้รู้ว่าเราไม่สามารถที่จะทำอะไรที่ perfect 100% ได้ (หรือถ้ามีแล้วก็ขอดูหน่อย ผมจะได้กระจ่าง) และโฮมเพจนี้เป็นเพียง webboard ใช้สำหรับประกาศข่าวต่าง ๆ ไม่ใช่ search engine ของหอพักนะครับ ผมว่าคุณน้องใหม่ควรขอโทษ webmaster ด้วยนะครับ <img src=\"pics/supergrin.gif\">','สุรเชษฐ์','surachet@iname.com','161.246.45.222','01/04/02',1);
INSERT INTO address_ans VALUES (53,'H00014','<a href=\"http://www.kmitl.ac.th/sic/achieve/table/dorm.html\" target=\"www.kmitl.ac.th/sic/achieve/table/dorm.html\">http://www.kmitl.ac.th/sic/achieve/table/dorm.html</a><br>\nอันนี้รวมทั้งหมดเท่าที่เจอมา','สุรเชษฐ์','surachet@iname.com','161.246.45.222','02/04/02',0);
INSERT INTO address_ans VALUES (54,'H00013','ห้องเบอร์ไร <img src=\"pics/smile.gif\">','kp','','203.130.158.195','02/04/02',0);

#
# Table structure for table 'address_data'
#

CREATE TABLE address_data (
  code varchar(6) NOT NULL default '',
  name varchar(40) default NULL,
  type varchar(20) default NULL,
  address text,
  no_room tinyint(5) default NULL,
  size varchar(20) default NULL,
  tela varchar(40) default NULL,
  detail text,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'address_data'
#

INSERT INTO address_data VALUES ('H00000','นาคบำรุงศรี 5','หอพัก','ซ.เกกีงาม 3 ครับ หลังสถาบันครับ มีห้องว่างให้เช่า',0,'4*4','027391042','ติดต่อคุณจงดีครับ ที่เบอร์ข้างบนครับ มีห้องว่างให้เลือกตั้ง 7 หอน่ะครับ','29/05/02');
INSERT INTO address_data VALUES ('H00001','หอพักกมล','หอพัก','ซอยเกกีงาม2',0,'4*6.5 เมตร','-','เป็นหอพักกว้าง สะอาด มีเตียง เฟอร์นิเจอร์ ใกล้สถาบัน','02/05/02');
INSERT INTO address_data VALUES ('H00002','ดวงระวี','หอพัก','ปากซอยเกกีงาม 1 อยู่ติดรั้ว 12 ชั้น คณะวิศวะ',0,'ไม่ระบุ','017629797,038275757','เปิดจองห้องพักแล้ว<br>\n017629797,038275757','18/02/03');
INSERT INTO address_data VALUES ('H00003','ม. ชัยพฤกษ์','บ้าน','ถนนคุ้มเกล้า',0,'ไม่ระบุ','02 914 8014','บ้านเดี่ยวสองชั้น 3 ห้องนอน 2 ห้องน้ำ พื้นที่ 63 ตารางวา สนใจติดต่อ 02 914 8014, 055 413 743','22/05/02');
INSERT INTO address_data VALUES ('H00004','ไม่ระบุ','หอพัก','ไม่ระบุ',0,'ไม่ระบุ','ไม่ระบุ','ถ้าเราต้องการหาหอพักใหม่ควรหาในเดือนมีนาคม เพราะเด็กเก่ากำลังจะจบออกไป แล้วต้องแจ้งเจ้าของหอ จะทำให้เราสามารถ หาหอพักที่ถูกใจเราได้ ในช่วงเวลานี้แต่ถ้าหลังจากประกาศผลสอบเข้าได้แล้ว จะทำให้หาหอได้ยากมากขึ้น พึงระวังไว้','24/07/02');
INSERT INTO address_data VALUES ('H00005','ถาวรพพฤกษ์','หอพัก','ซ.เกกีงาม 3 หลังสถาบัน',0,'ไม่ระบุ','ไม่ระบุ','มี ubc ให้ดูด้วยนะครับ ราคาแพงไปหน่อยแต่ห้องใหญ่มากนะครับ สนใจติดต่อเองนะ ครับ ไปดูบอลหอเพื่อนบ่อบ เลยรู้ครับ','27/02/03');
INSERT INTO address_data VALUES ('H00006','-','หอพัก','-',0,'-','-','ต้องการหาหอพักรวม ใกล้มหาลัย มีแอร์ และห้องกว้างๆหน่อยครับ ถ้าจะให้ดี เอาแถวตลาดหัวตะเข้น่ะครับ','28/05/02');
INSERT INTO address_data VALUES ('H00007','ไม่ระบุ','หอพัก','ไม่ระบุ',0,'ไม่ระบุ','ไม่ระบุ','บริเวณลาดกระบังน่ะครับ มีที่ไหนดีแล้วถูกอีก','05/09/02');
INSERT INTO address_data VALUES ('H00008','ไม่ระบุ','หอพัก','ใกล้กับพระจอมเกล้า',1,'ไม่ระบุ','ไม่ระบุ','ตอนนี้กำลังหาหอพักที่มีโทรศัพท์สายตรง  ห้องมีขนาดไม่เล็กจนเกินไป  ห้องน้ำสะอาด ถ้ามี UBC ด้วยก็ดี เห็นเพื่อนบอกว่าที่ห้องพักชายยุคลรัตน์ หรือชัยพฤษ  หรือราชพฤษ ดีมาก  ไม่รู้ว่าจริงหรือเปล่า  ใครเคยอยูหรือเคยไปช่วยแนะนำหน่อย ','10/06/02');
INSERT INTO address_data VALUES ('H00009','ไม่ระบุ','หอพัก','ไม่ระบุ',0,'ไม่ระบุ','ไม่ระบุ','รับสมัครสมาชิกชมรมศิลปวัฒนธรรมอิสาน<br>\nช่วงเปิดเทอมใหม่  ที่ชมรมอิสาน บนโรงอาหารวิทยาศาสตร์ มีเน็ทบริการน้องด้วย ฟรี','13/06/02');
INSERT INTO address_data VALUES ('H00010','ไม่ระบุ','หอพัก','แถวหัวตะเข้',1,'ไม่ระบุ','ไม่ระบุ','อยู่คนเดียว ไม่แพงมาก ถ้ารู้ช่วยบอกที่  อาจเป้น หอรวม<br>\nหรือ ญ ล้วน ก้อได้<br>\n','14/12/02');
INSERT INTO address_data VALUES ('H00011','ไม่ระบุ','หอพัก','ไม่ระบุ',0,'ไม่ระบุ','ไม่ระบุ','ช่วงนี้หอพักกำลังว่าง ใครอยากย้ายรีบด่วน เพราะเด็กเก่ากำลังจบ เด็กใหม่กำลังสอบเข้าใครอยากหอต้องรีบหน่อยไม่งั้น พอประกาศผลแล้วจะหาได้ยากมากขึ้น','15/06/02');
INSERT INTO address_data VALUES ('H00012','บ้านเดี่ยวในมณสินี','บ้าน','179/81 ม.มณสินี ลาดกระบัง',4,'เล็ก 3 ใหญ่ 1','097837403','จะย้ายออกประมาณกลางเมษา ถึง ปลายเมษานี้','24/06/02');
INSERT INTO address_data VALUES ('H00013','หอออมสิน','หอพัก','ซอยเกกีงามสอง ครับ',1,'4*6','ไม่ระบุ','คือจะย้ายออกตอนนี้แล้วอ่ะครับ สนใจแล้วติดต่อด่วนนะครับ','26/06/02');
INSERT INTO address_data VALUES ('H00014','ไม่ระบุ','หอพัก','ไม่ระบุ',0,'ไม่ระบุ','ไม่ระบุ','น้องใหม่อยากให้บอกรายละเอียดมากกว่านี้ ถ้าผมเป็นเจ้าของที่พักจะบอกมากกว่านี้แน่นอน เวปหาที่พักที่อื่นทำดีกว่านี้มาก ถ้าใครรู้ว่ามีข้อมูลเกี่ยวกับหอพักมากกว่านี้กรุณาให้รายละเอียดด้วย เพราะอยู่ต่างจังหวัดเดินทางลำบาก อยากให้ช่วยกันให้ข้อมูลหน่อย ถ้าผมเป็นเวปมาสเตอร์จะให้ข้อมูลมากกว่านี้แน่นอน','01/07/02');

#
# Table structure for table 'book_ans'
#

CREATE TABLE book_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'book_ans'
#

INSERT INTO book_ans VALUES (1,'B00000','ทราบแล้วเปลี่ยน <img src=\"pics/sleepy.gif\">','Terry','','161.246.51.202','31/01/02',NULL);
INSERT INTO book_ans VALUES (6,'B00012','เป็นของภาค control หรือภาค elec ครับ<br>\nเนื้อหาข้างในมีการเขียนโปรแกรม matlab ประกอบด้วยครับ ถ้าสนใจก็ติดต่อมาได้นะครับ <img src=\"pics/lol.gif\">','ปิติพงษ์  ประภามณฑล','','161.246.51.200','25/02/02',NULL);
INSERT INTO book_ans VALUES (5,'B00012','หนังสือเป็นของภาควิชาไหนใช้เรียนหรือครับ <img src=\"pics/blue.gif\">','บี','','161.246.5.215','24/02/02',NULL);
INSERT INTO book_ans VALUES (4,'B00012','ลืมบอกไปครับ ถ้าสนใจติดต่อได้ที่เบอร์ 0-2642-5810 กด 2 ครับ','ปิติพงษ์  ประภามณฑล','champnarak@hotmail.com','161.246.51.130','22/02/02',NULL);
INSERT INTO book_ans VALUES (16,'','อะ อะ','อะอะ','','161.246.5.9','18/03/02',0);
INSERT INTO book_ans VALUES (17,'','เดก','กดเ','กดเ','161.246.5.9','18/03/02',0);
INSERT INTO book_ans VALUES (18,'B00020',' <img src=\"pics/shy.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/cool.gif\"><br>\nลืมบอกไปเป็นฉบับ internationnal editions <img src=\"pics/devil.gif\"> <img src=\"pics/devil.gif\">','yelly','nasjang@lenononline.com','161.246.5.12','18/03/02',1);
INSERT INTO book_ans VALUES (21,'B00017','ทำไมแพงจัง<br>\nเพื่อนๆ ว่าม่ะ<br>\nน่าจะรวมกลุ่มกันต่อราคาน่ะ','4D คนนึง','','203.148.189.95','25/03/02',0);
INSERT INTO book_ans VALUES (22,'B00015','480เหรอ ลดได้ไหม สนใจนะ <img src=\"pics/pukey.gif\">','แจง','JJ_enduro@hotmail.com','161.246.67.170','25/03/02',1);
INSERT INTO book_ans VALUES (23,'B00020','ลืมบอกไป สนใจติดต่อ 01 8545262 <img src=\"pics/redface.gif\"> <img src=\"pics/redface.gif\"> <img src=\"pics/sleepy.gif\"> <img src=\"pics/sunglasses.gif\">','yelly','nasja@room5.org','203.146.235.40','25/03/02',1);
INSERT INTO book_ans VALUES (24,'B00010','มีก้าวแรกสู๋สังเวียน เล่มที่  1-16 ไหม ถ้ามีติดต่อกลับ job_<a href=mailto:j@thaimail>j@thaimail</a>','job','','203.155.70.253','25/03/02',0);
INSERT INTO book_ans VALUES (25,'B00006','แบ่งขายก้าวแรกสู่สังเวียนได้ไหม 1-12 ,16','job','job_j@thaimail.com','203.155.70.253','25/03/02',0);
INSERT INTO book_ans VALUES (26,'B00006','ขอเบอร์โทรกลับหน่อยได้ไหมครับ ','ยัน','yan01@chaiyo.com','161.246.2.252','29/03/02',1);
INSERT INTO book_ans VALUES (27,'B00017','เห็นด้วยน่ะครับน่าจะสัก 100 ก็พอแล้ว','3P','','161.246.5.226','30/03/02',0);

#
# Table structure for table 'book_data'
#

CREATE TABLE book_data (
  code varchar(6) NOT NULL default '',
  bookname text,
  author text,
  publisher text,
  condition varchar(40) default NULL,
  percent tinyint(3) default NULL,
  usedyear tinyint(2) default NULL,
  usedmonth tinyint(2) default NULL,
  detail text,
  howsend varchar(40) default NULL,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'book_data'
#

INSERT INTO book_data VALUES ('B00000','the asian wall street journal','-','-','ของใหม่',0,0,0,'มารับได้ที่ธุรการหน้าภาคครับ แจกฟรีไม่ขายครับ หยิบได้ไม่จำกัด','หยิบเอาเอง','29/04/02');
INSERT INTO book_data VALUES ('B00001','MySQL','ไม่ระบุ','ไม่ระบุ','ของมือสอง',90,0,0,'ต้องการซื้อครับ ถ้ามีก็ติดต่อมาตาม Email นะครับ<br>\nใครมีหนังสือ MySql ที่เป็น Text หรือ ภาษาไทยก็ได้บ้างครับ','นัดเจอเพื่อมารับสินค้า','29/04/02');
INSERT INTO book_data VALUES ('B00002','แบบเรียนภาษาไทยชั้นประถมศึกษา','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'หนังสือแบบเรียนภาษาไทยที่เป็นเรื่องมานะ-มานี ให้ราคาดีครับ ติดต่อมาด้วยนะครับ ตั้งแต่เล่มชั้น ป.1-ป.6 มีทั้งหมด 12 เล่มใครมีช่วยเอามาขายด้วยครับ ต้องการไว้ศึกษาและสะสม','นัดเจอเพื่อมารับสินค้า','01/05/02');
INSERT INTO book_data VALUES ('B00019','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',95,1,0,'text Math ของ Zill  2nd edition ซื้อมาแล้วไม่เคยอ่านเลย ห่อปกไว้อย่างดี เนื้อหาใช้เรียนตอน ปี1เทอม 2 กะ ปี 2 เทอม 2 ','ค่อยว่ากัน','10/04/02');
INSERT INTO book_data VALUES ('','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ต้องการการ์ตูนครบชุดตามนี้ ให้ราคา 50 %<br>\n1. ไดตะลุยแดนเวทย์มนต์<br>\n2. Ah! My Goddess<br>\n3. DNA<br>\n4. Video Girl','ตกลงทีหลัง','14/05/02');
INSERT INTO book_data VALUES ('B00013','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ทุกเล่มอยู่ในสภาพดี ผู้สนใจติดต่อสัง่ซื้อผ่านทางอีเมล์ที่แจ้งไว้นะครับ <a href=mailto:jobook2001@yahoo.com>jobook2001@yahoo.com</a> <br>\n<br>\nวิบูลย์กิจ <br>\n- เขาชื่อซาซ่า (3เล่มจบ) 105 บาท ขาย 70 บาท <br>\n<br>\n- เซนกิ เจ้าชายเทพอสูร (12เล่มจบ) 380 บาท ขาย 250 บาท <br>\n<br>\n- ปิงปองซุปเปอร์เพี้ยน (4เล่มจบ) 140 บาท ขาย 95 บาท <br>\n<br>\n- Brand New (3 เล่มจบ) 105 บาท ขาย 70 บาท <br>\n<br>\n- ฺBang2 (6 เล่มจบ) 210 บาท ขาย 150 บาท <br>\n<br>\n- Manic Knight Rayearth(6 เล่มจบ) 240 บาท ขาย 165 บาท <br>\n<br>\n- เกราะอสูรบรายโอ(2 เล่มจบ) 70 บาท ขาย 45 บาท <br>\n<br>\n- ตำนานดาบดู้แผ่นดิน(3เล่มจบ) 105 บาท ขาย 70 บาท <br>\n<br>\n- สงครามจอมยุทธ(5เล่มจบ) 150 บาท ขาย 100 บาท <br>\n<br>\n- Galo(3เล่มจบ) 90 บาท ขาย 60 บาท <br>\n<br>\n- ศิษย์ซ่าอาจารย์แสบ (8เล่มจบ) 280 บาท ขาย 200 บาท <br>\n<br>\n- Elna Saga(12เล่มจบ) 420 บาท ขาย 290 บาท <br>\n<br>\n- Jungle Boy (เล่ม1-7) 225 บาท ขาย 150 บาท <br>\n<br>\n- คู่หูสืบสะเด็ด(เล่ม1-3) 105 บาท ขาย 65 บาท <br>\n<br>\n- น้องหนูพันธ์ดุ(เล่ม1-5) 150 บาท ขาย 95 บาท <br>\n<br>\n<br>\n<br>\nบงกช <br>\n- คัตสึโอะเห่ยกำลังสอง(เล่ม1-8) 245 บาท ขาย 175 บาท <br>\n<br>\n- หุ่นพะโล้ก็มีหัวใจ (2เล่มจบ) 60 บาท ขาย 30 บาท <br>\n<br>\n<br>\n<br>\nสยามอินเตอร์คอมิกส์ <br>\n- DNA2(5เล่มจบ) 150 บาท ขาย 100 บาท <br>\n<br>\n- Gun Smith Cats(8 เล่มจบ) 240 บาท ขาย 150 บาท <br>\n<br>\n- เพนกวินน้อยคอยรัก(10 เล่มจบ) 300 บาท ขาย 170 บาท <br>\n<br>\n- คู่หูคู่เพี้ยน(4 เล่มจบ) 120 บาท ขาย 70 บาท <br>\n<br>\n- ลุ้นรักลุ้นเรียน(เล่ม1-6) 180 บาท ขาย 100 บาท <br>\n<br>\n- รักนี้เจ้าตัวแสบ(2 เล่มจบ) 60 บาท ขาย 35 บาท <br>\n<br>\n- วงกตมรณะ ตอนฆาตกรทะเลสาปมังกร 30บาท ขาย 15 บาท <br>\n<br>\n- อาสุกะ ตอนรีเทิร์น 30 บาท ขาย 15 บาท <br>\n<br>\n- Love คู่รัก(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- 130 ลุ้นหารัก(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- สู้สุดหัวใจ(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- เก็บใจไว้ให้เธอ(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- คู่หูอลเวง(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- แหวกใจให้โลกกว้าง(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- ร้อนนี้ยังมีรัก(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- เรื่องของหัวใจ(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- ด้วยเกรียรติยศและศรัทธา(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- โรเมโอและจูเลียต(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- รักทะเล้นไม่เว้นวันหยุด(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n<br>\nสำนักพิมพ์ NewType <br>\n- Hen รักอลเวง ภาคยามาดะ โยชิดะ(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- Hen รักอลเวง ภาคก่อกำเนิด(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n<br>\n<br>\nLove Book <br>\n- Wonderful World(เล่มเดียวจบ) 35 บาท ขาย 15 บาท <br>\n<br>\n- B Love(รวมเรื่องสั้นจบในเล่ม) ฉบับ3/2000,5/2000,6/2001,8/2001,9/2001 ราคารวม 175 บาท ขาย 90 บาท <br>\n<br>\n- The Ring 2(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n<br>\n- โอยูเร(เล่มเดียวจบ) 35 บาท ขาย 15 บาท <br>\n<br>\n- ประสบการณ์วิญญาณหลอน(เล่มเดียวจบ) 35 บาท ขาย 15 บาท <br>\n<br>\n<br>\n<br>\nMr.Comics <br>\n- Parasite Eve(เล่มเดียวจบ) 50 บาท ขาย 30 บาท <br>\n<br>\n<br>\n<br>\nMagic Comics <br>\n- Parasite Eve2(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- อีวานเกเลี่ยน 2 Special(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\nบันได <br>\n- ซากุระ วอร์ ภาคพิเศษ(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- Street Fighter 3(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- Wanted(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- เหยื่อรายที่9 คนสยองหวีดจิตอุบาทว์(จบในเล่ม) 35 บาท ขาย 15 บาท <br>\n<br>\n- เหยื่อรายที่12 คนโหดไม่นับญาติ(จบในเล่ม) 35 บาท ขาย 15 บาท <br>\n<br>\n- The X File(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- ยูกิ เกมกลคนอัจฉริยะ ภาคพิเศษ(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n<br>\n<br>\nเนชั่น <br>\n- Slam Dunk เล่ม 1-15 ขาย 250 บาท <br>\n<br>\n<br>\n<br>\nEak Cartoon <br>\n- มิซากิ จอมเฮ้ว(เล่มเดียวจบ) 35 บาท ขาย 15 บาท <br>\n<br>\n- ตามล่าข้ามพิภา(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n<br>\n<br>\nหมึกจีน <br>\n- รอยรักไฟแค้น(เล่มเดียวจบ) 22 บาท ขาย 10 บาท <br>\n<br>\n- ศืนขนหัวลุก(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n- ครอบครัวบ้าจี้(เล่มเดียวจบ) 32 บาท ขาย 20 บาท <br>\n<br>\n- King of Fighter96(เล่มเดียวจบ) 56 บาท ขาย 30 บาท <br>\n<br>\n<br>\nNew Project Comics <br>\n- ยมฑูตคร่าวิญญาณ(2เล่มจบ) ราคารวม 60 บาท ขาย 30 บาท <br>\n<br>\n<br>\n<br>\nWorld Book <br>\n1.เทพธิดากับอสูร(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n2.ตำรวจเหล็กปราบปิศาจ(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n3.ตากล้องที่รัก(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n<br>\n<br>\nสำนักพิมพ์อื่น ๆ <br>\n1.Samurai Spirits ภาค2(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n2.มือปราบปืนสะเตอะ(เล่มเดียวจบ) 50บาท ขาย 30 บาท <br>\n3.พยัคฆ์สาวฉ่ำเดี่ยว(เล่มเดียวจบ) 25 บาท ขาย 15 บาท <br>\n4.ต้นไม้ในฝัน(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n5.คนนี้แหละพระเอกตัวจริง(เล่มเดียวจบ) 28 บาท ขาย 15 บาท <br>\n6.คืนขย้ำคอ(เล่มเดียวจบ) 30 บาท ขาย 15 บาท <br>\n7.โตเกียวนครอสูร(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n8.สื่อรักจากต่างดาว(เล่มเดียวจบ) 40 บาท ขาย 25 บาท <br>\n9.ศึกตระดูลเพี้ยน(เล่มเดียวจบ) 50บาท ขาย 30 บาท <br>\n10.ดราก้อน บอล ภาคพิเศษ(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n11.Macross II(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n12.หยุดเวลาผ่านรก(เล่มเดียวจบ) 45 บาท ขาย 25 บาท <br>\n13.วูล์ฟ มนุษย์หมาป่า(เล่มเดียวจบ) 35 บาท ขาย 20 บาท <br>\n14.เก็ตเตอร์โก(เล่มเดียวจบ) 70 บาท ขาย 35 บาท <br>\n<br>\n','นัดเจอเพื่อมารับสินค้า','24/08/02');
INSERT INTO book_data VALUES ('B00005','มังกรอหังการ','Yo<font color=red>***</font>o Yamahara','วิบูลกิจย์','ของมือสอง',90,0,0,'หนังสือการ์ตูนมังกรอหังการ ใครมีติดต่อมาที่ mail นะครับ เล่ม 1-13 ครับ บอกราคามา','นัดเจอเพื่อมารับสินค้า','19/07/02');
INSERT INTO book_data VALUES ('B00006','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'มีทั้งเรื่องที่หายากมากๆและการ์ตูนตลาดทั่วไป เหมาะแก่ผู้ที่กำลังจะเปิดร้านเช่าหนังสือครับ<br>\nSUPER DR.K 1-44 <br>\nDR.K 1-10<br>\nก้าวแรกสู่สังเวียน 1-57 ขาดเล่ม 2/3/4/6<br>\nโคทาโร่(ภาคเก่า) 1-52 ขาดเล่ม 1/3/4/5/9<br>\nแสบกว่านี้ 1-21<br>\nสิงห์นักปั่น 1-18<br>\nคนแบบนี้มีคนเดียวในโลก 1-17<br>\nโคนัน 1-30<br>\nโคโค่ 1-20<br>\nคินดะอิจิ 1-27 + CASE 1-7<br>\nKYO 1-10<br>\nGTO 1-20<br>\nGET BACKERS 1-11<br>\nGODAGUN 1-8<br>\nEIJI 1-25<br>\nBERSERK 1-20<br>\nRAVE 1-10<br>\nST.SEIYA 1-7<br>\nจอมโหดกะทะเหล็ก 1-23<br>\nจอมลุยทะเลคลั่ง 1-6<br>\nล่าอสูรกาย 1-21 + ภาคพิเศส<br>\nคู่คนลุยเลอะ 1-8<br>\nกลมกลิ้งสิงห์ปิงปอง 1-8<br>\nยุทธการใต้สมุทร 1-19<br>\n<font color=red>***</font>หนุ่มหมัดเต็มร้อย 1-6<br>\nมังกรอหังการ 1-12<br>\nต้องรอด 1-9<br>\nเซสทัส 1-4<br>\nโปลิสป่วนโลก 1-4<br>\nยอดคน 1-7<br>\nCITY HUNTER 1-35<br>\nได ตะลุยแดนเวทย์มนต์ 1-37<br>\nอิตโต้(ภาค 2) 1-7<br>\nROOKIES 1-16<br>\nINTIAL D ถนนสายนี้ข้าจอง 1-11<br>\nสิงห์ผจญเพลิง 1-20 <br>\nเทพเจ้ามังกรฟ้า 1-11<br>\nบ.ก.ระห่ำ 1-10<br>\nเจาะเวลาหาจิ๋นซี 1-24<br>\nสิงห์ทะเลทราย 1-3<br>\nมหัศจรรย์สิงห์นักเตะ 1-3<br>\nหนุ่ม<font color=red>***</font>วพันธุ์ระห่ำ 1-6<br>\nเซียวฮื่อยี้ 1-22<br>\n3 ก๊ก(ภาค เตียวก๊ก) 1-5<br>\nราคาปกทั้งหมดประมาณ 25000 ผมขาย21000 ครับ ถ้าใครที่สนใจลองเมล์มาหาผมหรือทิ้งเบอร์อีเมล์ของคุณไว้นะครับแล้วผมจะส่งเบอร์ติดต่อไปให้<br>\n<br>\n','ไม่ระบุ','19/05/02');
INSERT INTO book_data VALUES ('B00007','The Lord of The Rings เล่ม 1 ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ติดต่อมาที่ mail นะ','ไม่ระบุ','19/05/02');
INSERT INTO book_data VALUES ('B00008','kc.weekly','ไม่ระบุ','vibulkij','ของมือสอง',0,0,0,'ขาย kc.weekly ย้อนหลัง ตั้งแต่ปี 2000 ในราคาเล่มละ -3 บาท<br>\n01-8258428 <br>\nลาดพร้าว 122 บางกะปิ ','ตกลงทีหลัง','19/05/02');
INSERT INTO book_data VALUES ('B00009','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,' วันก่อนจัดหนังสือในลัง พอดีมีที่มันซ้ำๆกันอยู่เลยเอามาขายเผื่อตรงกับความต้องการของใครบ้าง <br>\n1.วางไม่ลง (kiss! kiss!)/โรอัล ดาห์ล/สาลินี คำฉันท์/สนพ.กะรัต/ขาย55 <br>\n2.อกาธา ตอนแม่หนูนักสืบ ( Crooked house) /ปรีชา-ดวงตา/น้องใหม่/55 <br>\n3.แผ่นดินนี้เราจอง/ริชาร์ด เพาเวล/เทศภักดิ์/สนพ.เทศภักดิ์/70 <br>\n4.ไท-ปัน/เจมส์ คลาเวลส์/วรปัญจา/สนพ.เซอร์เคิล บุ๊ค/90 <br>\n5.ชายชาติทหาร/ริาร์ด เพาเวล/เทศภักดิ์/สนพ.มติชน/200 (กระดาษปอนด์) <br>\n6.มังกร (dragon)/Anne McCaffy/สินนภา สารสาส/ออบิท แฟนตาซี/90 (นิยายวิทยาศาสตร์เกี่ยวกับมังกรบินทะลุระหว่าง2โลก) <br>\n','ติดต่อทีหลัง','20/05/02');
INSERT INTO book_data VALUES ('B00010','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',90,0,0,' มีหลายเรื่องมาก ไม่มีที่เก็บเลยอยากขาย อาทิ..<br>\nboyd,จอมคนทาเครุ,มืออสูรล่าปีศาจ, dear boy ,jojo,ฯลฯ<br>\nลองบอกเรื่องและเล่มมาเผื่อว่ามีราคา50%','นัดเจอเพื่อมารับสินค้า','20/05/02');
INSERT INTO book_data VALUES ('B00011','ทาร์จัง จ้าวป่า เล่ม 1-17','ไม่ระบุ','ไม่ระบุ','ของมือสอง',95,0,0,' ราคานี้รวมค่าจัดส่งแล้ว <br>\nถ้ามารับสินค้าเองที่ร้าน ลดเหลือ 255 บาท <br>\nแผนที่ร้าน <a href=\"http://baansorsor.iwebland.com/images/bssmap.jpg\" target=\"baansorsor.iwebland.com/images/bssmap.jpg\">http://baansorsor.iwebland.com/images/bssmap.jpg</a><br>\nโทร09-9898123 ','ไม่ระบุ','20/05/02');
INSERT INTO book_data VALUES ('B00012','modern control engineering','katsuhiko ogata','prentice hall','ของใหม่',0,0,4,'เป็นเล่มที่เป็น third edition ปกสีฟ้าน่ะ<br>\nสภาพใหม่มากเลยเพราะใช้แค่ไม่กี่ครั้งเอง','นัดเจอเพื่อมารับสินค้า','22/02/03');
INSERT INTO book_data VALUES ('B00014','ได...ตะลุยแดนเวทมนตร์','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ตามที่บอกในหัวข้อ ครับ ขาย 1350 บาท ได..ตะลุยแดนเวทมนตร์<br>\nใหม่เอี่ยม ห่อปกอย่างดี(ไม่มีรอยปั้มใดๆครับ อย่าคิดว่าเป็นของร้านเช่า) ของสะสมคับ จะเสนอราคามาก็ได้ ครับติดต่อได้ครับโทรมา024271782','นัดเจอเพื่อมารับสินค้า','24/05/02');
INSERT INTO book_data VALUES ('B00015','เบอร์เซิร์ก','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'สภาพดีมาก ทำปกพลาสติกแล้วทุกเล่ม <br>\nราคานี้รวมค่าจัดส่งทางไปรษณีย์แล้ว<br>\nถ้ามารับสินค้าเองที่ร้านลดเหลือ 480 บาท','นัดเจอเพื่อมารับสินค้า','24/05/02');
INSERT INTO book_data VALUES ('B00016','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'แนวข้อสอบเก่าพร้อมเฉลย วิศวกรรมศาสร์, ครุศาสตร์ ย้อนหลังกว่า 20 ปี (ฉบับจริง) สำหรับ นศ.ปวส.ต่อ ป.ตรี (วิศวะ ต่อเนื่อง) สำหรับ KMIT-T, KMIT-L, KMIT-NB ราคา 390 บาท ความหนา 400 หน้า พิมพ์เข้าเล่มเป็นอย่างดี เหมาะสำหรับนักศึกษาที่ต้องการรู้แนวข้อสอบเก่า เนื่องจากข้อสอบร้อยละ 95% ก็ล้วนมักจะออกแนวเดิม เปลี่ยนตัวเลขนิดหน่อย หรือบางข้อยกของเดิมมาทั้งโจทย์และตัวเลือกเลยก็เห็นอยู่บ่อยๆ<br>\nพิเศษ (Option) : พร้อมเฉลย 2 แบบต่อ 1 ข้อ คือเฉลยละเอียด 100% (แบบเต็ม) และแนวคิดลัด ซึ่งรวมถึงการตัดตัวเลือกหรือการแทนค่าในโจทย์ และ Trick Short อีกมากจากประสปการณ์ติวเตอร์กวดวิชาของพี่และเพื่อนๆมากกว่า 10 ปี เพื่อช่วยให้น้องๆทำข้อสอบได้ถูกต้องและรวดเร็วยิ่งขึ้น<br>\n<br>\n(โปรดระวังของปลอม)<br>\nสนใจขอรายละเอียดเพิ่มเติมเรื่องแนวข้อสอบเก่าได้ที่ verawat_<a href=mailto:k@hotmail.com>k@hotmail.com</a><br>\n','ติดต่อมาก่อน','24/05/02');
INSERT INTO book_data VALUES ('B00017','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'เข้าเล่มปริญญานิพนธ์ 120 บาท ไม่รวมถ่ายเอกสาร ที่ร้านแตงกวา ใครทำเสร็จแล้วนำไปเข้าเล่มได้ร้านแตงกวาฝากแจ้งมา','ไปเอง','28/05/02');
INSERT INTO book_data VALUES ('B00018','hikaru เซียนโกะ ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ซื้อได้ที่ร้านพิมชนกนะ หน้าตึก 12 ชั้น','ซื้อเอง','07/06/02');
INSERT INTO book_data VALUES ('B00020','BASIC ELECTRIC CIRCUIT ANALYSIS','ไม่ระบุ','prenticehal','ของมือสอง',85,0,6,'BASIC ELECTRIC CIRCUIT ANALYSIS ของprenticehal ใช้เรียนปี1สำหรับวิศวะไฟฟ้า(รวม) เเละปี2สำหรับภาคelec ','ยังไงก็ได้','18/03/03');
INSERT INTO book_data VALUES ('B00021','Digital Signal Procesing',' อ.อรรถสิทธ์ หล่าสกุล','ซีรอก','ของมือสอง',98,0,0,'เป็นซีรอก หน้าคู่ครับ','นัดเจอเพื่อมารับสินค้า','01/05/02');
INSERT INTO book_data VALUES ('B00022','ImageProcessingAnlysis and MachineVision','Songka','ไม่ระบุ','ของมือสอง',99,0,0,'เป็น Zerox บทที่ 1-5+Index+สารบัญ <br>\nเข้าเล็ม','นัดเจอเพื่อมารับสินค้า','01/05/02');

#
# Table structure for table 'date_delete'
#

CREATE TABLE date_delete (
  code varchar(6) NOT NULL default '',
  date varchar(15) NOT NULL default '',
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'date_delete'
#

INSERT INTO date_delete VALUES ('B00000','29/04/02');
INSERT INTO date_delete VALUES ('N00000','29/07/02');
INSERT INTO date_delete VALUES ('A00022','29/06/02');
INSERT INTO date_delete VALUES ('L00000','29/04/02');
INSERT INTO date_delete VALUES ('H00000','29/05/02');
INSERT INTO date_delete VALUES ('V00000','29/05/02');
INSERT INTO date_delete VALUES ('F00000','29/07/02');
INSERT INTO date_delete VALUES ('A00000','29/10/02');
INSERT INTO date_delete VALUES ('V00007','28/05/02');
INSERT INTO date_delete VALUES ('F00001','29/07/02');
INSERT INTO date_delete VALUES ('N00002','29/07/02');
INSERT INTO date_delete VALUES ('A00017','28/05/02');
INSERT INTO date_delete VALUES ('B00018','07/06/02');
INSERT INTO date_delete VALUES ('N00005','29/04/02');
INSERT INTO date_delete VALUES ('N00006','29/04/02');
INSERT INTO date_delete VALUES ('N00007','29/04/02');
INSERT INTO date_delete VALUES ('A00001','29/07/02');
INSERT INTO date_delete VALUES ('A00002','29/04/02');
INSERT INTO date_delete VALUES ('B00001','29/04/02');
INSERT INTO date_delete VALUES ('N00008','29/04/02');
INSERT INTO date_delete VALUES ('B00015','24/05/02');
INSERT INTO date_delete VALUES ('L00002','29/04/02');
INSERT INTO date_delete VALUES ('N00009','29/04/02');
INSERT INTO date_delete VALUES ('N00010','29/04/02');
INSERT INTO date_delete VALUES ('L00003','29/04/02');
INSERT INTO date_delete VALUES ('H00006','28/05/02');
INSERT INTO date_delete VALUES ('B00014','24/05/02');
INSERT INTO date_delete VALUES ('B00013','24/08/02');
INSERT INTO date_delete VALUES ('N00050','28/05/02');
INSERT INTO date_delete VALUES ('F00002','30/04/02');
INSERT INTO date_delete VALUES ('H00007','05/09/02');
INSERT INTO date_delete VALUES ('F00006','30/04/02');
INSERT INTO date_delete VALUES ('L00009','12/05/02');
INSERT INTO date_delete VALUES ('N00018','04/03/02');
INSERT INTO date_delete VALUES ('A00023','01/07/02');
INSERT INTO date_delete VALUES ('N00015','31/05/02');
INSERT INTO date_delete VALUES ('F00009','01/05/02');
INSERT INTO date_delete VALUES ('F00008','01/05/02');
INSERT INTO date_delete VALUES ('F00007','30/04/02');
INSERT INTO date_delete VALUES ('N00046','24/04/02');
INSERT INTO date_delete VALUES ('N00014','30/04/02');
INSERT INTO date_delete VALUES ('F00004','30/04/02');
INSERT INTO date_delete VALUES ('L00005','30/04/02');
INSERT INTO date_delete VALUES ('F00005','30/04/02');
INSERT INTO date_delete VALUES ('F00003','30/04/02');
INSERT INTO date_delete VALUES ('N00049','25/04/02');
INSERT INTO date_delete VALUES ('N00017','04/03/02');
INSERT INTO date_delete VALUES ('H00001','02/05/02');
INSERT INTO date_delete VALUES ('B00002','01/05/02');
INSERT INTO date_delete VALUES ('A00007','14/05/02');
INSERT INTO date_delete VALUES ('F00015','14/09/02');
INSERT INTO date_delete VALUES ('A00008','14/04/02');
INSERT INTO date_delete VALUES ('H00004','24/07/02');
INSERT INTO date_delete VALUES ('H00009','13/06/02');
INSERT INTO date_delete VALUES ('N00031','19/05/02');
INSERT INTO date_delete VALUES ('A00006','13/08/02');
INSERT INTO date_delete VALUES ('B00019','10/04/02');
INSERT INTO date_delete VALUES ('A00005','10/05/02');
INSERT INTO date_delete VALUES ('A00004','10/05/02');
INSERT INTO date_delete VALUES ('F00014','08/06/02');
INSERT INTO date_delete VALUES ('L00008','08/05/02');
INSERT INTO date_delete VALUES ('E00003','08/02/03');
INSERT INTO date_delete VALUES ('E00004','08/02/03');
INSERT INTO date_delete VALUES ('F00010','14/05/02');
INSERT INTO date_delete VALUES ('N00027','15/05/02');
INSERT INTO date_delete VALUES ('N00052','06/06/02');
INSERT INTO date_delete VALUES ('F00013','07/06/02');
INSERT INTO date_delete VALUES ('N00019','06/05/02');
INSERT INTO date_delete VALUES ('','14/05/02');
INSERT INTO date_delete VALUES ('A00009','14/08/02');
INSERT INTO date_delete VALUES ('A00010','14/05/02');
INSERT INTO date_delete VALUES ('N00025','15/04/02');
INSERT INTO date_delete VALUES ('F00018','15/06/02');
INSERT INTO date_delete VALUES ('V00003','19/05/02');
INSERT INTO date_delete VALUES ('N00062','25/06/02');
INSERT INTO date_delete VALUES ('N00028','17/04/02');
INSERT INTO date_delete VALUES ('V00004','17/02/03');
INSERT INTO date_delete VALUES ('F00011','17/05/02');
INSERT INTO date_delete VALUES ('N00029','18/05/02');
INSERT INTO date_delete VALUES ('H00002','18/02/03');
INSERT INTO date_delete VALUES ('N00030','18/07/02');
INSERT INTO date_delete VALUES ('A00011','19/05/02');
INSERT INTO date_delete VALUES ('B00017','28/05/02');
INSERT INTO date_delete VALUES ('A00012','19/05/02');
INSERT INTO date_delete VALUES ('A00013','19/05/02');
INSERT INTO date_delete VALUES ('A00014','19/05/02');
INSERT INTO date_delete VALUES ('A00015','19/05/02');
INSERT INTO date_delete VALUES ('B00005','19/07/02');
INSERT INTO date_delete VALUES ('B00006','19/05/02');
INSERT INTO date_delete VALUES ('B00007','19/05/02');
INSERT INTO date_delete VALUES ('B00008','19/05/02');
INSERT INTO date_delete VALUES ('B00009','20/05/02');
INSERT INTO date_delete VALUES ('B00010','20/05/02');
INSERT INTO date_delete VALUES ('A00018','20/04/02');
INSERT INTO date_delete VALUES ('V00005','20/02/03');
INSERT INTO date_delete VALUES ('B00011','20/05/02');
INSERT INTO date_delete VALUES ('E00005','20/08/02');
INSERT INTO date_delete VALUES ('N00034','20/05/02');
INSERT INTO date_delete VALUES ('N00061','20/06/02');
INSERT INTO date_delete VALUES ('N00036','20/05/02');
INSERT INTO date_delete VALUES ('N00037','20/04/02');
INSERT INTO date_delete VALUES ('N00038','20/08/02');
INSERT INTO date_delete VALUES ('N00039','21/05/02');
INSERT INTO date_delete VALUES ('L00011','21/05/02');
INSERT INTO date_delete VALUES ('E00006','21/05/02');
INSERT INTO date_delete VALUES ('B00012','22/02/03');
INSERT INTO date_delete VALUES ('N00041','22/05/02');
INSERT INTO date_delete VALUES ('L00016','01/05/02');
INSERT INTO date_delete VALUES ('F00012','22/04/02');
INSERT INTO date_delete VALUES ('H00003','22/05/02');
INSERT INTO date_delete VALUES ('N00044','22/05/02');
INSERT INTO date_delete VALUES ('N00045','22/05/02');
INSERT INTO date_delete VALUES ('L00012','23/05/02');
INSERT INTO date_delete VALUES ('L00013','24/05/02');
INSERT INTO date_delete VALUES ('A00016','24/05/02');
INSERT INTO date_delete VALUES ('B00016','24/05/02');
INSERT INTO date_delete VALUES ('N00047','24/04/02');
INSERT INTO date_delete VALUES ('H00012','24/06/02');
INSERT INTO date_delete VALUES ('H00005','27/02/03');
INSERT INTO date_delete VALUES ('V00006','27/08/02');
INSERT INTO date_delete VALUES ('L00014','28/05/02');
INSERT INTO date_delete VALUES ('N00053','08/09/02');
INSERT INTO date_delete VALUES ('E00007','08/06/02');
INSERT INTO date_delete VALUES ('H00008','10/06/02');
INSERT INTO date_delete VALUES ('N00054','10/05/02');
INSERT INTO date_delete VALUES ('L00015','11/03/03');
INSERT INTO date_delete VALUES ('N00055','11/03/03');
INSERT INTO date_delete VALUES ('N00056','12/03/03');
INSERT INTO date_delete VALUES ('H00010','14/12/02');
INSERT INTO date_delete VALUES ('N00057','15/06/02');
INSERT INTO date_delete VALUES ('A00024','01/07/02');
INSERT INTO date_delete VALUES ('F00019','01/07/02');
INSERT INTO date_delete VALUES ('H00014','01/07/02');
INSERT INTO date_delete VALUES ('A00021','27/06/02');
INSERT INTO date_delete VALUES ('A00020','27/06/02');
INSERT INTO date_delete VALUES ('F00017','15/06/02');
INSERT INTO date_delete VALUES ('H00013','26/06/02');
INSERT INTO date_delete VALUES ('N00064','26/04/02');
INSERT INTO date_delete VALUES ('N00063','26/06/02');
INSERT INTO date_delete VALUES ('A00019','26/06/02');
INSERT INTO date_delete VALUES ('N00060','19/06/02');
INSERT INTO date_delete VALUES ('N00059','19/06/02');
INSERT INTO date_delete VALUES ('B00020','18/03/03');
INSERT INTO date_delete VALUES ('N00058','15/05/02');
INSERT INTO date_delete VALUES ('H00011','15/06/02');
INSERT INTO date_delete VALUES ('B00021','01/05/02');
INSERT INTO date_delete VALUES ('B00022','01/05/02');
INSERT INTO date_delete VALUES ('A00025','01/04/03');
INSERT INTO date_delete VALUES ('N00065','03/04/03');

#
# Table structure for table 'equipment_ans'
#

CREATE TABLE equipment_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'equipment_ans'
#


#
# Table structure for table 'equipment_data'
#

CREATE TABLE equipment_data (
  code varchar(6) NOT NULL default '',
  brand varchar(30) default NULL,
  model varchar(30) default NULL,
  condition varchar(40) default NULL,
  percent tinyint(3) default NULL,
  usedyear tinyint(2) default NULL,
  usedmonth tinyint(2) default NULL,
  detail text,
  howsend varchar(40) default NULL,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'equipment_data'
#

INSERT INTO equipment_data VALUES ('E00007','paint work','ไม่ระบุ','ของใหม่',0,0,0,'เฟรมผ้าใบสำหรับวาดภาพ ราคาไม่แพงจากผู้ผลิต คุณภาพดี มีทั้งผ้าเรียบและมีเทคเจอร์ ลงสีรองพื้นพร้อมใช้งาน มีทุกขนาดและตามสั่ง ส่งถึงที่','นัดเจอเพื่อมารับสินค้า','08/06/02');
INSERT INTO equipment_data VALUES ('E00003','rotring','3.2','ของมือสอง',99,0,0,'ไม้บรรทัด  rotring สีส้ม อยากได้ สีฟ้าอ่ะ ','นัดเจอเพื่อมารับสินค้า','08/02/03');
INSERT INTO equipment_data VALUES ('E00004','rotring','ไม่ระบุ','ของมือสอง',99,0,0,'ไม้บรรทัด rotring สีส้ม อยากได้ สีฟ้าอ่ะ ','นัดเจอเพื่อมารับสินค้า','08/02/03');
INSERT INTO equipment_data VALUES ('E00005','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ใครยืมเครื่องคิดเลขสถาบันไปนำไปคืนด้วย ที่ตึก 12 ชั้นเจ้าหน้าที่ ฝากมาบอกว่าปีสุดท้ายที่กำลังจะจบนำไปคืนด้วยไม่งั้นน้องเองจะเดือดร้อนนะจ๊ะ รุ่นน้องจะได้มี เครื่องคิดเลขฟรีใช้ไม่ต้องเสียตังค์ซื้อ','เอาไปคืนด้วย','20/08/02');
INSERT INTO equipment_data VALUES ('E00006','ไม่ระบุ','ไม่ระบุ','ของมือสอง',80,0,10,'เป็น แรมของคอม notebook ขนาด 32 M  ใครที่มี notebook แล้วอยากได้ ram ราคาถูกใสเพิ่มประสิทธิภาพ ติดต่อได้  ( ราคาอาจต่อรองได้นะ )','นัดเจอเพื่อมารับสินค้า','21/05/02');

#
# Table structure for table 'etc_ans'
#

CREATE TABLE etc_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'etc_ans'
#

INSERT INTO etc_ans VALUES (1,'A00002','เจ้าของเป็นเกย์ ครับ <img src=\"pics/lol.gif\">','คู่ขา','','161.246.5.221','02/02/02',NULL);
INSERT INTO etc_ans VALUES (2,'A00004','85 ได้ไหมพี่','meawnam','','161.246.6.144','11/02/02',NULL);
INSERT INTO etc_ans VALUES (3,'A00004','80 ไปเลยละกันจะได้ทอนง่าย ๆ สนใจก็ติดต่อมาละกันนะ เจ้าของร้อนเงินน่ะ <img src=\"pics/eek.gif\">','doctork','','161.246.6.139','13/02/02',NULL);
INSERT INTO etc_ans VALUES (4,'A00004','งั้นเป็น 50 เลยมั้ยพี่ จะได้ทอนง่ายๆ สะดวกๆ','...','','161.246.6.89','14/02/02',NULL);
INSERT INTO etc_ans VALUES (5,'A00004','50 ขายไม่ได้อะไรเลยน้อง 80 ละกันนะอย่าต่อรองเลยนะ เป็นของคณะวิศวะนะลืมบอกไป <img src=\"pics/frown.gif\">','doctork','','161.246.6.73','14/02/02',NULL);
INSERT INTO etc_ans VALUES (6,'A00004','ถึงขนาดต้องขาย shop รับประทานเลยเหรอน้อง <img src=\"pics/lol.gif\">','เอ่อนะ','','161.246.48.233','15/02/02',NULL);
INSERT INTO etc_ans VALUES (7,'A00004','ไม่ได้ขายเพื่อมารับประทานครับ แต่เสื้อมันไม่ได้ใส่เลยน่ะครับ ทิ้งเอาไว้ก็เสียดาย เอาไปให้คนอื่นที่ต้องการใส่ดีกว่า ได้ประโยชน์ทั้ง 2 ฝ่าย <img src=\"pics/biggrin.gif\">','doctork','','161.246.5.215','15/02/02',NULL);
INSERT INTO etc_ans VALUES (8,'A00009',' <img src=\"pics/sunglasses.gif\"> ถ้าสนใจยี่ห้อ Marshall 20 w ราคา<br>\nคุยหันได้รับรองไม่แพง 092145145','Music man','man1899@yahoo.com','203.148.204.41','17/02/02',NULL);
INSERT INTO etc_ans VALUES (9,'A00009','ขายได้แล้ว',' music man','man1899@yahoo.com','161.246.6.89','19/02/02',NULL);
INSERT INTO etc_ans VALUES (10,'A00014','ทำไมขายแพงจังอ่ะ 3 บาทได้ป่าว  <img src=\"pics/supergrin.gif\">','บีจัง','','202.183.201.133','19/02/02',NULL);
INSERT INTO etc_ans VALUES (11,'A00014','ต้องขอเรียนคุณบีจังนะครับว่างานนี้เป็นงาน hand made ครับ ตู้หนึ่งใช้เวลาทำประมาณ 3 วัน แต่ขายไม่ได้ทุกวัน คุณลองคิดดูเอาแล้วกันนะครับ ว่าคนทำจะกินอะไร ผมว่าราคานี้เหมาะสมดีแล้วครับ <img src=\"pics/supergrin.gif\">','surachet','','161.246.45.222','20/02/02',NULL);
INSERT INTO etc_ans VALUES (12,'A00004','ความคิดดีขายshopกิน  เลวมากมากมาก <img src=\"pics/devil.gif\">','kmit\'nb','','202.44.45.25','20/02/02',NULL);
INSERT INTO etc_ans VALUES (13,'A00004','ไม่ได้เลวครับ ถ้าไม่ใส่จะเก็บไว้ทำไมตัวมันก็ใหญ่น่ะครับ แล้วสภาพดีด้วย พ่อแม่ไม่ได้รวยล้นฟ้านี่ครับเก็บไว้ก็เก่าเอามาขายให้น้องแล้วมันผิดด้วยเหรอ งั้นคนที่ตัดเสื้อ shop ให้เราก็เลวหมดทุกคนน่ะสิ  <img src=\"pics/pukey.gif\">','doctork','','161.246.5.215','20/02/02',NULL);
INSERT INTO etc_ans VALUES (14,'A00014','คูณบีจัง ถ้าไม่ต้องการซื้อจริง ๆ ก็อย่าตอบประกาศแบบนี้นะครับ   <img src=\"pics/smile.gif\">','webmaster','','161.246.5.215','20/02/02',NULL);
INSERT INTO etc_ans VALUES (15,'A00014','ถ้าต้องการให้ลบคำตอบไหนที่ไม่เหมาะสมก็แจ้งมานะครับคุณ surachet ที่ menu ติดต่อผู้ดูแลระบบ <img src=\"pics/confused.gif\">','webmaster','','161.246.5.215','20/02/02',NULL);
INSERT INTO etc_ans VALUES (16,'A00004','ขอฟรีได้ไหม รุ่นน้องจะได้นับถือๆ นะๆๆๆ','ins','','161.246.5.12','22/02/02',NULL);
INSERT INTO etc_ans VALUES (17,'A00004','ถ้าจะเอาก็ติดต่อมานะครับจะได้เอามาให้ ให้เลยละกันตอนนี้ไม่เดือดร้อนเรื่องเงินแล้ว <img src=\"pics/frown.gif\">','doctork','','161.246.6.139','23/02/02',NULL);
INSERT INTO etc_ans VALUES (18,'A00017','เลือกซื้อบางอย่างได้ไหมครับเช่นอยากได้ตู้เย็นครับ ขนาดเท่าไหร่ กี่ คิวครับ แล้วราคาเท่าไหร่ ประหยัดไฟหรือเปล่าครับ เบอร์ 5 <img src=\"pics/sleepy.gif\">','K','','161.246.5.215','28/02/02',NULL);
INSERT INTO etc_ans VALUES (19,'A00015','ตู้เหมือนในรูปหรือเปล่าครับ<br>\n','ตะกาน','kennoby2000@hotmail.com','161.246.60.103','01/03/02',NULL);
INSERT INTO etc_ans VALUES (20,'A00000','อยากได้มากเหรอ <img src=\"pics/biggrin.gif\">','bank','s2015299@kmitl.ac.th','161.246.5.215','09/03/02',1);
INSERT INTO etc_ans VALUES (21,'A00000','เออ <img src=\"pics/smile.gif\"> <img src=\"pics/frown.gif\">','tum','s2015299@kmitl.ac.th','161.246.5.215','09/03/02',0);
INSERT INTO etc_ans VALUES (22,'A00017','อยากได้จักรยาน ของเราเพิ่งโดนโขมยยกไป ไม่มีรถขี่เลย ถ้าราคาไม่เกิน 400-600 สนใจคับ ไหนๆก็ไม่อยากขนกลับอย่แล้วนี่  ถ้าจะขายติดต่อ 01-9191102 <img src=\"pics/supergrin.gif\">','เอส','edd_me03@yahoo.com','161.246.12.38','19/03/02',0);
INSERT INTO etc_ans VALUES (23,'A00018','อยากได้ของดี ๆ ราคาถูก ๆ  ไม่เกิน  15000  ขอเป็นเพนเที่ยม3ขึ้นไป','น้องออฟ','aromhup@thaimail.com','202.29.26.61','25/03/02',1);
INSERT INTO etc_ans VALUES (24,'A00018','ถ้าเป็น โน๊ตบุค คงยากครับ แต่ถ้าเป็น Desk top รุ่นใหม่ของ Compaq ไม่แน่ครับขอไปดูของก่อน และจะระบุราคาให้ว่า ที่คุณ aromhup ต้องการในราคา 15000 มีหรือเปล่า ผมมีแต่ของ Bran name นะครับ น่าจะได้ประมาณ Pantium4 จะได้ไหม ทรีหายากแล้วและราคาประมาณ 15000 ผมจะพยายามหาให้เพื่อน้อง ชาว Kmitl จะได้ใช้ของดีราคาถูกนะครับ (น่าจะได้รุ่น Aspire ELD)','wan','pe_wan@hotmail.com','203.149.41.123','25/03/02',0);
INSERT INTO etc_ans VALUES (25,'A00020','ผมมี Seagate 1.2 GB อยู๋ตัวนึง หมดประกันแล้ว แต่ไม่มี Badsector (เช็คแล้ว) สภาพดีครับเพราะไม่ค่อยได้เอาออกจาก Case  <img src=\"pics/supergrin.gif\">','surachet','surachet@iname.com','161.246.45.222','28/03/02',1);
INSERT INTO etc_ans VALUES (26,'A00020','ปล. ลองเสนอราคามานะครับ แบบว่าไม่เคยขายอ่ะนะ  <img src=\"pics/supergrin.gif\">','surachet','surachet@iname.com','161.246.45.222','28/03/02',0);
INSERT INTO etc_ans VALUES (27,'A00020','500 บาทได้ไหมครับ อยากได้เหมือนกันครับ ถ้าไม่ได้ก็ไม่เป็นไรครับ <img src=\"pics/lol.gif\">','doctork','doctork@liverpool.in.th','161.246.5.215','28/03/02',0);
INSERT INTO etc_ans VALUES (28,'A00020','550 บาทได้ไหมครับ อยากได้เหมือนกันครับ ถ้าไม่ได้ก็ไม่เป็นไรครับ <img src=\"pics/devil.gif\">','one_one','','161.246.5.228','29/03/02',0);
INSERT INTO etc_ans VALUES (29,'A00020','580 บาทได้ไหมครับ อยากได้เหมือนกันครับ ถ้าไม่ได้ก็ไม่เป็นไรครับ อย่ามาตัดหน้าผมนะ <img src=\"pics/biggrin.gif\">','doctork','doctork@liverpool.in.th','161.246.5.215','29/03/02',0);
INSERT INTO etc_ans VALUES (30,'A00022','ถ้าเอาเฉพาะ Microwave อย่งเดียวจะว่ายังไงครับ ราคาเท่าไหร่','<(BoY)>','','203.113.34.237','01/04/02',0);
INSERT INTO etc_ans VALUES (31,'A00020','600 บาทได้ไหมครับ อยากได้เหมือนกันครับ ถ้าไม่ได้ก็ไม่เป็นไรครับ อย่ามาตัดหน้าผมนะ  <img src=\"pics/supergrin.gif\">','one_one','','203.155.236.134','01/04/02',0);
INSERT INTO etc_ans VALUES (32,'A00024','คนดีชอบแก้ไข คน _ _ ชอบหลอกลวง<br>\n<br>\nแผ่นซีดี 6 แผ่น รวมทั้งหมดแล้ว ต้นทุนไม่ถึงร้อย ขายตั้ง 999 ใครซื้อก็โง่แล้น','x-tem','','161.246.66.16','01/04/02',0);
INSERT INTO etc_ans VALUES (33,'A00020','610 บาทได้ไหมครับ อยากได้เหมือนกันครับ ถ้าไม่ได้ก็ไม่เป็นไรครับ หัดพิมพ์เองซะบ้างสิ<br>\n <img src=\"pics/embarass.gif\">','doctork','','161.246.5.215','01/04/02',0);
INSERT INTO etc_ans VALUES (34,'A00015','สนใจครับ ลดได้มั้ย..... ให้เฉพาะตู้เปล่าๆเหรอครับ','a','aun_virgo@hotmail.com','202.133.163.40','02/04/02',0);
INSERT INTO etc_ans VALUES (35,'A00018','ตอนนี้รุ่นไหนคุ้มสุด ประมาณเท่าไหร่ครับโพสต์ไว้หน่อยก็ดี <img src=\"pics/clown.gif\">','m','','202.133.159.1','02/04/02',0);

#
# Table structure for table 'etc_data'
#

CREATE TABLE etc_data (
  code varchar(6) NOT NULL default '',
  brand varchar(40) default NULL,
  model varchar(40) default NULL,
  condition varchar(40) default NULL,
  percent tinyint(3) default NULL,
  usedyear tinyint(2) default NULL,
  usedmonth tinyint(2) default NULL,
  detail text,
  howsend varchar(40) default NULL,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'etc_data'
#

INSERT INTO etc_data VALUES ('A00000','ไม่ระบุ','ไม่ระบุ','ของมือสอง',90,0,0,'ต้องการ cd robbie william ครับ ชุดใหม่ล่าสุด ใครมีติดต่อมาครับ','นัดเจอเพื่อมารับสินค้า','29/10/02');
INSERT INTO etc_data VALUES ('A00001','ไม่ระบุ','ไม่ระบุ','ของมือสอง',100,0,0,'ต้องการเช่าเกม tiberian sun : fire storm แผ่นเต็ม (มี movie) เพื่อมาทดลองเล่น เป็นเวลา 3 วันน่ะครับ','นัดเจอเพื่อมารับสินค้า','29/07/02');
INSERT INTO etc_data VALUES ('A00002','Skitter','ทรง Les pauls','ของมือสอง',95,0,8,'ติดต่อที่ คุณอนันต์ครับ หรือ mail มาก็ได้<br>\n<br>\n','นัดเจอเพื่อมารับสินค้า','29/04/02');
INSERT INTO etc_data VALUES ('A00006','Canon','Tamron 28-200 super II (Canon)','ของมือสอง',95,0,0,'Tamron 28-200 super II (Canon) body สีดำ เลนส์อยู่ในประกันบริษัทอีก 4 ปีกว่า พร้อมเอกสารและใบรับประกันครบ สภาพ 95 % โทร 022528216 กด 1\r\nราคา 8500 บาท','นัดเจอเพื่อมารับสินค้า','13/08/02');
INSERT INTO etc_data VALUES ('A00004','ไม่ระบุ','ไม่ระบุ','ของมือสอง',90,2,5,'Size XL รุ่นน้องท่านใดสนใจติดต่อได้ที่ mail <a href=mailto:doctork@mweb.co.th>doctork@mweb.co.th</a> ครับ ใส่ไม่กี่ครั้งเองไม่รู้จะเก็บไว้ทำไมครับ','นัดเจอเพื่อมารับสินค้า','10/05/02');
INSERT INTO etc_data VALUES ('A00005','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,8,'Duron 700 MHz 128MB VGA Sound onboard<br>\nHHD. 4GB cd-rom 52x <br>\nkeyboard mouse<br>\nส๓าพดี 8 เดือน ราคาต่อรองได้ <br>\nสนใจติดต่อ<br>\n02 - 7195404 กด 1 , 01 - 3756857','นัดเจอเพื่อมารับสินค้า','10/05/02');
INSERT INTO etc_data VALUES ('A00007','thaisecondhand','ไม่ระบุ','ของใหม่',0,0,0,'      ถ้าท่านเห็นว่า ThaiSecondhand.com , TARAD.com เป็นเว็บไซต์ที่น่าสนับสนุน ให้สามารถดำเนินงานต่อไปได้ การสนับสนุน โดยการสั่งซื้อเสื้อที่ระลึกจาก ThaiSecondhand.com จะเป็นการสนับสนุน ด้านกำลังใจ และ รายได้จากการจำหน่ายเสื้อนี้ จะนำมาเป็นค้าใช้จ่าย สำหรับเครื่อง server ที่ทีมงานหวังว่าจะทำให้ ThaiSecondhand.com เร็วขึ้นบ้าง<br>\n    โดย เสื้อ ThaiSecondhand.com เป็นเสื้อ COTTON 100% เนื้อผ้าเดียวกับเสื้อส่งออก ผลิตโดย บริษัทผลิตเสื้อผ้ายี่ห้อดัง สำหรับส่งออก แน่นอนครับ คุณภาพเดียวกัน ขนาด Free Size รอบอก 43 นิ้ว โดยจัดส่งถึงท่านทางไปรษณีย์ สะดวกมากครับ <br>\n <br>\nขั้นตอนการซื้อHow to Order ?<br>\n1.โอนเงินค่าสินค้า ตาม หมายเลย บัญชี ธนาคาร ตามราคา (ราคาเสื้อดังกล่าวได้ รวมค่าขนส่งแล้ว) และกรุณาเก็บ slip เพื่อเป็นหลักฐานการชำระเงิน<br>\n2. เมื่อให้ท่านโอนเงินแล้ว แจ้งรายละเอียดการสั่งซื้อ (Order Now) โดยระบุจำนวน และรายละเอียดท่าน ให้ครบถ้วน เพื่อความสะดวกในการจัดส่งสินค้า ท่านสามารถส่ง สลิป มาพร้อมกับรายละเอียดการสั่งซื้อได้ โดยการ Browse เลือก ไฟล์สลิป<br>\nหรือ<br>\nส่งแฟกซ์ ใบสลิปการโอนเงินมาที่ <br>\nFAX หมายเลย : 0-2275-5066 (Auto)  <br>\n3.   สินค้าจะจัดส่งให้ท่านภายใน 3 วันทำการ  <br>\n   <br>\n::: ถ้าไม่ได้รับสินค้าหลังจาก ท่านทำตามขั้นตอนอย่างถูกต้องแล้ว กรุณาแจ้ง ทีมงาน TARAD.com ด่วน ::: <br>\nLink ที่<br>\n<a href=\"http://www.tarad.com/_tarad/MAIN/coat/index.html\" target=\"www.tarad.com/_tarad/MAIN/coat/index.html\">http://www.tarad.com/_tarad/MAIN/coat/index.html</a>','โอนเงิน','14/05/02');
INSERT INTO etc_data VALUES ('A00008','D-Link','PCI 56k','ของมือสอง',99,0,2,' ขาย โมเด็ม internal D-Link PCI 56K ของยังไหม่ซื้อมาพร้อมคอมฯ ยังไม่ถึง 2เดือนเลย ขายเพราะอยากเปลี่ยนเป็นแบบ External มี CD driver 09-8714583 หลัง1 ทุ่มครับ ','นัดเจอเพื่อมารับสินค้า','14/04/02');
INSERT INTO etc_data VALUES ('A00009','ไม่ระบุ','ไม่ระบุ','ของมือสอง',90,0,0,'ต้องการ amp guitar มือ2ราคาถูก เสียงอยู่ในเกณฑ์ดี  มีเสียงแตกในตัว ประมาณ 15-20 watt','ไม่ระบุ','14/08/02');
INSERT INTO etc_data VALUES ('A00010','Lite On','Lite On','ของมือสอง',99,1,8,'Cd -Writer ของ Lite oN รุ่น LTR12101B ความเร็ว 12x10x32x มี BurnProof กันแผ่นเสีย Buffer 2Mb +อุปกรณ์ครบ ไม่ค่อยได้ใช้เลยยังมีประกันจาก D-Com ขาย 2500 บาท<br>\nโทร 02-7356639 เล็ก','ตกลงทีหลัง','14/05/02');
INSERT INTO etc_data VALUES ('A00011','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'ตู้ปลาขนาด 10 X 10 cm.(ฐานนะครับ ส่วนสูงคงต้องประเมินเองเพราะไม่ได้วัดมาครับ) ตู้ทำจากกระจก โครงนอกเป็นไม้ มีไฟข้างในตู้ด้วยครับ งาน hand made 100% ครับ','นัดเจอเพื่อมารับสินค้า','19/05/02');
INSERT INTO etc_data VALUES ('A00012','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'ตู้ปลาขนาด 15 X 10 cm.(ฐานนะครับ ส่วนสูงคงต้องประเมินเองเพราะไม่ได้วัดมาครับ) ตู้ทำจากกระจก โครงนอกเป็นไม้ มีไฟข้างในตู้ด้วยครับ งาน hand made 100% ครับ','นัดเจอเพื่อมารับสินค้า','19/05/02');
INSERT INTO etc_data VALUES ('A00013','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'ตู้ปลาขนาด 15 X 10 cm.(ฐานนะครับ ส่วนสูงคงต้องประเมินเองเพราะไม่ได้วัดมาครับ) ตู้ทำจากกระจก โครงนอกเป็นไม้ มีไฟข้างในตู้ด้วยครับ งาน hand made 100% ครับ','นัดเจอเพื่อมารับสินค้า','19/05/02');
INSERT INTO etc_data VALUES ('A00014','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'ตู้ปลาขนาด 20 X 10 cm.(ฐานนะครับ ส่วนสูงคงต้องประเมินเองเพราะไม่ได้วัดมาครับ) ตู้ทำจากกระจก โครงนอกเป็นไม้ มีไฟข้างในตู้ด้วยครับ งาน hand made 100% ครับ','นัดเจอเพื่อมารับสินค้า','19/05/02');
INSERT INTO etc_data VALUES ('A00015','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'ตู้ปลาขนาด 20 X 20 cm.(ฐานนะครับ ส่วนสูงคงต้องประเมินเองเพราะไม่ได้วัดมาครับ) ตู้ทำจากกระจก โครงนอกเป็นไม้ มีไฟข้างในตู้ด้วยครับ งาน hand made 100% ครับ','นัดเจอเพื่อมารับสินค้า','19/05/02');
INSERT INTO etc_data VALUES ('A00016','Nokia','3310','ของมือสอง',0,0,0,'ขาย Nokia 3310 ทุกระบบรับประกันจากศูนย์ขายเพียง 4700 บาท สนใจติดต่อ 013483450(ไอซ์) หรือ 023274886 ห้อง 210','ติดต่อมาก่อน','24/05/02');
INSERT INTO etc_data VALUES ('A00017','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ตู้เย็น + รถจักรยาน + โต๊ะเขียนหนังสือ จบแล้วเลยขาย ขนกลับบ้านลำบาก  เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ','ไม่ระบุ','28/05/02');
INSERT INTO etc_data VALUES ('A00018','ไม่ระบุ','ไม่ระบุ','ของใหม่',100,0,0,'สนใจในรายละเอียดส่งเมล์สอบถามรายละเอียดที่ pe_<a href=mailto:wan@hotmail.com>wan@hotmail.com</a> ถูกกว่าท้องตลาดแน่นอน กว่าเยอะด้วย สั่งได้ทุกรุ่นที่ต้องการ','นัดเจอเพื่อมารับสินค้า','20/04/02');
INSERT INTO etc_data VALUES ('A00019','ไม่ระบุ','ไม่ระบุ','ของมือสอง',100,1,5,'ตู้เย็น  +ตู้เสื้อผ้า จบแล้วเลยขาย ขนกลับบ้านลำบาก เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ ราคาต่อรองกันได้ <br>\nตู้เย็นเบอร์ 5 ประมาณ 5.9 คิว ','ไม่ระบุ','26/06/02');
INSERT INTO etc_data VALUES ('A00020','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'เสนอ  ราคามาเลยด่วนเพราะจะจบแล้ว','นัดเจอเพื่อมารับสินค้า','27/06/02');
INSERT INTO etc_data VALUES ('A00021','GSM','ไม่ระบุ','ของมือสอง',99,1,0,'ขายเบอร์ GSM รายเดือนครับ เบอร์สวย (01) 7-536-536','นัดเจอเพื่อมารับสินค้า','27/06/02');
INSERT INTO etc_data VALUES ('A00022','mitsubishi , sharp','ไม่ระบุ','ของมือสอง',100,0,7,'สภาพดีมากครับ ใช้ไปแป๋ปเดียวเอง เสียดายเหมือนกัน แต่<font color=red>***</font>เกียจขนกลับครับ ตู้เย็นซื้อมา 4700 ไมโครเวฟนี่ 2800 ได้มั๊งครับ ถือว่าลดแหลกแล้วเพราะ<font color=red>***</font>เกียจขนจริงๆ<br>\nสนใจติดต่อ 02 691 3604 คุณต่อ ฝากข้อความไว้ได้ครับหากไม่มีคนอยู่','ไม่ระบุ','29/06/02');
INSERT INTO etc_data VALUES ('A00023','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ขนาดไม่ต้องมากนัก เอาให้ใช้งานได้กับเครื่องรุ่นเก่า<br>\nด่วนมาก<br>\nกรุณาติดต่ิอทาง email','นัดเจอเพื่อมารับสินค้า','01/07/02');
INSERT INTO etc_data VALUES ('A00024','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'เว็บไซต์ที่ยอดเยี่ยมที่สุดในการหารายได้จากเน็ตในเมืองไทย<br>\nสอนคุณถึงวิธีการทำเงินจากอินเตอร์เน็ตอย่างง่ายดายที่สุด<br>\nด้วยเงินทุนแค่หลักร้อย คุณจะมีเว็บไซต์เป็นของตัวเอง<br>\nและพร้อมทำธุรกิจอีคอมเมิร์ซได้ทันที เรียนรู้การหาเงินล้านฟรี<br>\nสำรวจตรวจตราข้อมูลอย่างละเอียดที่<br>\nwww.net4rich.com?up=34<br>\n','ไม่ระบุ','01/07/02');
INSERT INTO etc_data VALUES ('A00025','ไม่ระบุ','ไม่ระบุ','ของใหม่',0,0,0,'* อวสานของไขมันส่วนเกิน !!*<br>\n* โปรแกรมธรรมชาติสำหรับผู้ที่ต้องการควบคุมน้ำหนัก 5-15 kgs. ใน 1 เดือน<br>\n* ไม่ใช่ยา ไม่ต้องอดอาหาร ไม่ต้องออกกำลังกาย<br>\n* ผ่านการับรองจาก อย. กว่า 51 ประเทศ<br>\n* มีผู้ใช้ได้ผลกว่า 40 ล้านคนทั่วโลก<br>\n* ประสบการณ์มากกว่า 21 ปี ทั่วโลก<br>\n* ภายใต้การดูแล ติดตามผลอย่างถูกต้อง จากผู้เชี่ยวชาญ<br>\n* รับประกันผลใน 30 วัน คืนเงิน<br>\nwww.inhealthy.com/healthyfull<br>\nคุณปริญ (09) 772-1626 (เวลา 9.00-21.00 น.)<br>\n','ส่งสินค้าผ่านไปรษณีย์(พ.ก.ง.)','01/04/03');

#
# Table structure for table 'friends_ans'
#

CREATE TABLE friends_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'friends_ans'
#

INSERT INTO friends_ans VALUES (1,'F00000','ถ้าหน้าตาดีก็ลงรูปให้ดูสิครับ ไม่แน่จริงนี่นา <img src=\"pics/devil.gif\">','KingOfKop','','161.246.5.227','29/01/02',NULL);
INSERT INTO friends_ans VALUES (2,'F00000','หล่อนิดหน่อยเองง่ะ อย่าลงเลย หยอง อิอิ <img src=\"pics/grazy.gif\">','ไม่บอกปล่อยให้งง','','161.246.6.89','29/01/02',NULL);
INSERT INTO friends_ans VALUES (3,'F00000','เอารูปมาดูหน่อยยยย  <img src=\"pics/smile.gif\">','เด็กน้อย','','203.107.146.204','29/01/02',NULL);
INSERT INTO friends_ans VALUES (4,'F00000','อะนะคนเรา กล้ามาบอกว่าตัวเองดูดี ไม่ละอายบ้างเหรอค่ะพี่ .... 55555 <img src=\"pics/lol.gif\">','oranje','','161.246.51.114','29/01/02',NULL);
INSERT INTO friends_ans VALUES (5,'F00000','หน้าตาดีสุดในภาควิชาแล้วหล่ะครับคนนี้ไม่ต้องห่วง <img src=\"pics/yawn.gif\">','Pim','','161.246.5.215','30/01/02',NULL);
INSERT INTO friends_ans VALUES (6,'F00000','อยากรู้จักติดต่อที่ Mail ได้รับรองไม่ผิดหวัง <img src=\"pics/confused.gif\">','บู๋','','161.246.5.215','30/01/02',NULL);
INSERT INTO friends_ans VALUES (7,'F00000','หล่อ อยู่แล้ว ม่ายต้องกลัวหรอก ถ้าไงมาเจอกันได้นะ<br>\nเดี๋ยวจัดให้.. <img src=\"pics/smokin.gif\">','บ.บู๋','','161.246.5.227','30/01/02',NULL);
INSERT INTO friends_ans VALUES (8,'F00004','โทษทีจ้าเราไม่มีนะ แล้วเธอล่ะ เป็นยังงันบ้าง web นี้ <img src=\"pics/eek.gif\">','ตั้ม','','161.246.5.215','30/01/02',NULL);
INSERT INTO friends_ans VALUES (9,'F00004','ก็ดีน่ารักดีน่ะ  <img src=\"pics/smile.gif\">','อาย','','203.146.65.164','30/01/02',NULL);
INSERT INTO friends_ans VALUES (10,'F00004','ดูที่อื่นๆให้ทั่วด้วยซิ','ตั้ม','','161.246.5.215','30/01/02',NULL);
INSERT INTO friends_ans VALUES (11,'F00004','จ้า พยายามดูอยู่น่ะ','อาย','','203.146.65.164','30/01/02',NULL);
INSERT INTO friends_ans VALUES (12,'F00004','ตั้มหรือ แล้วจะเอาเราไปไว้ที่ไหนหละ พิม.... พี่ตั้มใจร้าย','น้องพิม','pimpim43@hotmail.com','161.246.5.227','30/01/02',NULL);
INSERT INTO friends_ans VALUES (13,'F00009','กล้วย...','บ.บู๋','pimpim43@hotmail.com','161.246.5.227','01/02/02',NULL);
INSERT INTO friends_ans VALUES (14,'F00006','แล้วจะติดต่อที่ไหนล่ะครับ','.','','203.148.151.254','01/02/02',NULL);
INSERT INTO friends_ans VALUES (15,'F00003','โถ่ไม่น่าเลยนะค่ะ อิอิ','oranje','','203.148.151.254','01/02/02',NULL);
INSERT INTO friends_ans VALUES (16,'F00006','ก็ลงชื่อไว้ในบอร์ดนี้ละมั๊ง ถ้าสนใจนะ','เด็กน้อย','','203.107.149.34','02/02/02',NULL);
INSERT INTO friends_ans VALUES (17,'F00009','ขอสมัครเป็นเพื่อนชาย  เพียงชั่วโมงล่ะ 20 บาท','คุณแมงดานา','แมงดา@hotmail.com','161.246.7.44','04/02/02',NULL);
INSERT INTO friends_ans VALUES (18,'F00005','อยู่ภาคคอมครับ  แล้วจะติดต่ออย่างไรครับ','UV','','161.246.7.44','04/02/02',NULL);
INSERT INTO friends_ans VALUES (19,'F00000','ถ้าหล่อแต่นิสัยไม่ดีก็ไม่เอานะ','nuknik','','168.120.12.181','04/02/02',NULL);
INSERT INTO friends_ans VALUES (20,'F00006','เชื่อใจได้เหรอ <img src=\"pics/smile.gif\">','elightka','','161.246.6.76','06/02/02',NULL);
INSERT INTO friends_ans VALUES (21,'F00000','นิสัยดีสิ','บ.บู๋','pimpim43@hotmail.com','161.246.5.227','08/02/02',NULL);
INSERT INTO friends_ans VALUES (22,'F00006','ผมชิน 4D1 ครับ','ชิน','meawnam@hotmail.com','161.246.6.144','11/02/02',NULL);
INSERT INTO friends_ans VALUES (23,'F00005',' <img src=\"pics/smile.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/pukey.gif\"> <img src=\"pics/embarass.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/smile.gif\"> <img src=\"pics/smile.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/confused.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/embarass.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/smile.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/embarass.gif\">','.','','168.120.26.45','11/02/02',NULL);
INSERT INTO friends_ans VALUES (24,'F00005',' <img src=\"pics/smile.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/pukey.gif\"> <img src=\"pics/embarass.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/smile.gif\"> <img src=\"pics/smile.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/confused.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/blue.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/shy.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/embarass.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/smile.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/embarass.gif\">','.','','168.120.26.45','11/02/02',NULL);
INSERT INTO friends_ans VALUES (25,'F00006','หาด้วยคนดิครับ หล่นหายแถวไหนไม่รู้เพื่อนเรา<br>\nใครเจอเก็บมาฝากด้วยนะครับ อิอิ','RedRibbon','','161.246.51.211','14/02/02',NULL);
INSERT INTO friends_ans VALUES (26,'F00009','ป โท ปี2 ขอเป็นเพื่อนด้วยคนครับ <img src=\"pics/tasty.gif\">','m_nakarin','nakarin_machan@yahoo.com','161.246.61.142','14/02/02',NULL);
INSERT INTO friends_ans VALUES (46,'F00005',' <img src=\"pics/sleepy.gif\"> <img src=\"pics/sleepy.gif\"> <img src=\"pics/sleepy.gif\"> <img src=\"pics/sleepy.gif\"> <img src=\"pics/sleepy.gif\"> <img src=\"pics/sleepy.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/confused.gif\"> <img src=\"pics/confused.gif\"> <img src=\"pics/crying.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/yawn.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/devil.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/sunglasses.gif\">','ไม่บอก','','168.120.26.152','23/02/02',NULL);
INSERT INTO friends_ans VALUES (45,'F00008','สวัสดีค่ะ<br>\nหาคนรู้ใจ <img src=\"pics/shy.gif\">','ปุ๊กกี้','','203.113.34.237','22/02/02',NULL);
INSERT INTO friends_ans VALUES (43,'F00009','อยาดคุยด้วยจัง อ่ะ','เอก','chatree_ce@yahoo.com','161.246.51.151','21/02/02',NULL);
INSERT INTO friends_ans VALUES (44,'F00008','สวัสดีค่ะ<br>\nหาคนรู้ใจ <img src=\"pics/sunglasses.gif\">','ปุ๊กกี้','','203.113.57.132','22/02/02',NULL);
INSERT INTO friends_ans VALUES (41,'F00000','ไป<font color=red>***</font>เลยไป <img src=\"pics/tongue.gif\">','tok','','161.246.42.233','15/02/02',NULL);
INSERT INTO friends_ans VALUES (47,'F00012','<a href=\"http://161.246.13.211/stdscience/com16\" target=\"161.246.13.211/stdscience/com16\">http://161.246.13.211/stdscience/com16</a><br>\nปล. เห็นว่ากำลังทำอยู่ครับ','surachet','','161.246.45.222','25/02/02',NULL);
INSERT INTO friends_ans VALUES (48,'F00006',' <img src=\"pics/devil.gif\">','ต.โต้ง','b_surasuk@hotmail.com','161.246.51.42','26/02/02',NULL);
INSERT INTO friends_ans VALUES (49,'F00011',' <img src=\"pics/lol.gif\">ใครจะไปรู้วะ <img src=\"pics/lol.gif\">','ผู้ยิ่งใหญ่แห่งตึกกิ','','203.150.14.77','26/02/02',NULL);
INSERT INTO friends_ans VALUES (50,'F00008','หาคนรู้ใจไปทำไม มีแต่เรื่องยุ่งๆเปล่าๆ <img src=\"pics/lol.gif\">','ผู้ยิ่งใหญ่','','203.150.14.77','26/02/02',NULL);
INSERT INTO friends_ans VALUES (51,'F00008',' <img src=\"pics/devil.gif\"> <img src=\"pics/yawn.gif\"> <img src=\"pics/sleepy.gif\">','beck','','203.146.166.193','28/02/02',NULL);
INSERT INTO friends_ans VALUES (52,'F00000','คิดถึงทุกคนครับ   ต้องการเพื่อนคุยรับแก้ปัญหาทุกเรื่อง  Tel.  09-9786192  ข้อสาย  แนท  น่ะครับ <img src=\"pics/sleepy.gif\">','wachirasak','wachirasak.son@chaiyo.com','202.28.251.2','28/02/02',NULL);
INSERT INTO friends_ans VALUES (53,'F00008',' <img src=\"pics/pukey.gif\"> <img src=\"pics/pukey.gif\"> <img src=\"pics/pukey.gif\">','nnn','','161.246.12.13','02/03/02',NULL);
INSERT INTO friends_ans VALUES (54,'F00011','ขอบใจมากเลยที่ตอบโว้ย <img src=\"pics/reallymad.gif\"><br>\n <img src=\"pics/smokin.gif\">','soljar','soljar@thaimail.com','203.170.159.157','02/03/02',NULL);
INSERT INTO friends_ans VALUES (55,'F00008',' <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\">','ยิ่งยง','','158.108.107.7','02/03/02',NULL);
INSERT INTO friends_ans VALUES (56,'F00009',' <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/yawn.gif\"> <img src=\"pics/yawn.gif\">','ยิ่งยง','','158.108.107.7','02/03/02',NULL);
INSERT INTO friends_ans VALUES (57,'F00008',' <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/sunglasses.gif\">','-','','161.246.11.149','06/03/02',NULL);
INSERT INTO friends_ans VALUES (58,'F00008','ถ้าหาจิงๆๆ   ส่งเมล์มาคุยกันได้นะ  ที่   <a href=mailto:mataba@chaiyo.com>mataba@chaiyo.com</a> <img src=\"pics/smile.gif\">','tae','mataba@chaiyo.com','203.113.66.8','06/03/02',NULL);
INSERT INTO friends_ans VALUES (59,'F00006','ลองเมล์มาคุยกันนะ <img src=\"pics/tasty.gif\">','tae','mataba@chaiyo.com','203.113.34.237','06/03/02',NULL);
INSERT INTO friends_ans VALUES (60,'F00006','ต.โต้ง มาม่ออยู้ได้ ','adenalin','','161.246.51.239','06/03/02',NULL);
INSERT INTO friends_ans VALUES (61,'F00009',' <img src=\"pics/eek.gif\">','5623','','161.246.45.75','06/03/02',NULL);
INSERT INTO friends_ans VALUES (62,'F00013','ใครวะ<br>\nถ้าอาบน้ำแสดงว่าสกปรก ยังไม่สกปรกก้อไม่ต้องอาบน้ำ <img src=\"pics/biggrin.gif\">','G','pimpim43@hotmail.com','161.246.5.223','11/03/02',0);
INSERT INTO friends_ans VALUES (63,'F00013','งั้นแสดงว่าคุณ G ไม่ชอบอาบน้ำน่ะสิครับ <img src=\"pics/sarcblink.gif\">','K','','161.246.5.215','11/03/02',0);
INSERT INTO friends_ans VALUES (64,'F00006','ติดต่อไงครับ <img src=\"pics/lol.gif\">','ต.ซา','salavj@hotmail.com','203.146.0.134','12/03/02',1);
INSERT INTO friends_ans VALUES (65,'F00000','โ ค ร ต ฝื ด เ ล ย ','M','','161.246.51.160','13/03/02',0);
INSERT INTO friends_ans VALUES (66,'F00011','ล อ ง ใ ช่  วิ ธี Search  All files and folders ดู ดิ<br>\nเ อ า แ บ บ ทุ ก ไ ด ร ฟ์ เ ล ย น ะ ','M','','161.246.51.160','13/03/02',0);
INSERT INTO friends_ans VALUES (67,'F00006',' <img src=\"pics/dead.gif\">','perm','','202.44.130.163','14/03/02',0);
INSERT INTO friends_ans VALUES (68,'F00017','ได้เสมอครับ เด็กวิดวะยินดีต้อนครับ คุยกันได้ทุกเรื่องครับ ยกเว้นเรื่องตัง กะเรื่องแฟน <img src=\"pics/biggrin.gif\">','K','-','161.246.5.215','15/03/02',0);
INSERT INTO friends_ans VALUES (70,'F00017','ได้เสมอครับ เด็กวิดวะยินดีต้อนครับ คุยกันได้ทุกเรื่องครับ ยกเว้นเรื่องตัง กะเรื่องแฟน ทิ้งเบอร์ icq ไว้สิแล้วจะติดต่อกลับ  : <img src=\"pics/tasty.gif\">','K','-','161.246.5.215','15/03/02',0);
INSERT INTO friends_ans VALUES (71,'F00018','อยากรู้จัง ... <img src=\"pics/pukey.gif\"> ','หมู','','203.149.37.130','15/03/02',0);
INSERT INTO friends_ans VALUES (72,'F00018','มีเบอร์ icq ไหมจะได้คุนกันสะดวกน่ะ <img src=\"pics/biggrin.gif\">','K','-','161.246.5.215','15/03/02',0);
INSERT INTO friends_ans VALUES (73,'F00011','มุขนี้คิดได้ไง','1เจ้าของกระทู้','','202.183.254.123','17/03/02',0);
INSERT INTO friends_ans VALUES (74,'F00017','เด็กวิดวะยินดีได้รู้จักครับ     ว่างๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆทฟรสหาได้น่ะค <img src=\"pics/sleepy.gif\">','เด็กดี','toon431','161.246.12.20','19/03/02',1);
INSERT INTO friends_ans VALUES (75,'F00002','<br>\nน่ารักจัง   ว่างๆๆๆๆๆๆๆๆ <img src=\"pics/lol.gif\">   mail   คุยกันได้ครับ  ','เด็กวิดวะ','toon  431  @hotmail','161.246.12.20','19/03/02',0);
INSERT INTO friends_ans VALUES (76,'F00009','หวัดดี','BomBerBoy','pramatep@yahoo.com','161.246.18.219','19/03/02',0);
INSERT INTO friends_ans VALUES (77,'F00011','Search Engine เลยดีกว่า กว้างดี Yahoo หรือ Google ก็ได้นะ <img src=\"pics/reallymad.gif\">','???','','161.246.12.29','19/03/02',0);
INSERT INTO friends_ans VALUES (78,'F00001','อยากสมัครมากเลยค่ะ ขอรายละเอียดหน่อย','กบ','piti@imtoosexy.com','161.246.2.200','20/03/02',0);
INSERT INTO friends_ans VALUES (79,'F00002','สวยมาก','อาร์ท','k-umbro@chaiyo','202.183.196.197','21/03/02',0);
INSERT INTO friends_ans VALUES (80,'F00017','ไม่ค่อยได้เล่น ICQ เล่นแต่ MSN เข้ามาคุยกันมั้ยล่ะคะ <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\">','sarah','sknui@hotmail.com','161.246.42.211','21/03/02',1);
INSERT INTO friends_ans VALUES (81,'F00017','ก็ได้ครับ Msn ก็คุยกันได้ครับ แล้วจะทักนะถ้า online','K','K','161.246.5.215','25/03/02',0);
INSERT INTO friends_ans VALUES (82,'F00018',' <img src=\"pics/aysmile.gif\"> <img src=\"pics/aysmile.gif\"> <img src=\"pics/aysmile.gif\"> <img src=\"pics/aysmile.gif\">','123','','203.170.254.165','26/03/02',0);
INSERT INTO friends_ans VALUES (83,'F00009',' <img src=\"pics/tasty.gif\"> <img src=\"pics/tasty.gif\"> <img src=\"pics/tasty.gif\"> <img src=\"pics/tasty.gif\"><br>\nสูง 180 cm<br>\nหนัก 62 kg <br>\nหน้าตา พอควงไปดูหนังได้<br>\nความสามารถ อันนี้ต้องลองคบเอง<br>\n','ตากล้อง','aod_sic@hotmail.com','161.246.13.181','27/03/02',0);
INSERT INTO friends_ans VALUES (84,'F00018','fsfdsfsdfsf','fddfdsfsdfds','','161.246.14.34','28/03/02',0);
INSERT INTO friends_ans VALUES (85,'F00003','น่าเสียดายแทนลิเวอร์พูลอ่ะนะ  <img src=\"pics/sunglasses.gif\">','JunY','','203.130.158.195','28/03/02',0);
INSERT INTO friends_ans VALUES (86,'F00015','I\'d like to help you but ,sory I don\'t know','Tom','','203.155.70.253','01/04/02',0);
INSERT INTO friends_ans VALUES (87,'F00019',' <img src=\"pics/sleepy.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/embarass.gif\"> <img src=\"pics/dead.gif\"> <img src=\"pics/cool.gif\"> <img src=\"pics/clown.gif\">','A','','161.246.29.8','02/04/02',0);
INSERT INTO friends_ans VALUES (88,'F00019','เป็นคนหนึ่ง ที่ต้องใช้ภาษา ติดต่อสื่อสาร แต่พูดไม่เก่ง ยังไงแวะคุยกันบ้างนะค่ะ icq 69942541 <img src=\"pics/shy.gif\">','romny  แห่ง สถุล_cha','romny1980@hotmail.com','203.107.149.121','02/04/02',0);
INSERT INTO friends_ans VALUES (89,'F00011','ถเผมรู้ผนจะบอกคุณเรอะ <img src=\"pics/devil.gif\">','notzx','','161.246.51.207','03/04/02',0);

#
# Table structure for table 'friends_data'
#

CREATE TABLE friends_data (
  code varchar(6) NOT NULL default '',
  fullname text,
  nickname varchar(20) default NULL,
  faculty varchar(40) default NULL,
  department varchar(40) default NULL,
  e_mail varchar(40) default NULL,
  icq varchar(15) default NULL,
  tel varchar(20) default NULL,
  pager varchar(10) default NULL,
  detail text,
  duration varchar(15) default NULL,
  year varchar(5) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'friends_data'
#

INSERT INTO friends_data VALUES ('F00000','-','-','-','-','-','-','-','-','ผมหน้าตาหล่อนิดหน่อยนะครับ อยากมีแฟนครับ ถ้าไงติดต่อมานะครับ','29/07/02','-');
INSERT INTO friends_data VALUES ('F00001','-','-','-','-','doctork@mweb.co.th','11349748','-','-','เปิดรับสมาชิกใหม่ครับติดต่อได้ที่ชมรมเปตองหน้าโรงยิมวิศวะ ตั้งแต่ 5 โมงเป็นต้นไปครับ ไม่เสียเงินสมัครสมาชิกครับ พี่ ๆ ที่ชมรมใจดีทุกคนครับ','29/07/02','-');
INSERT INTO friends_data VALUES ('F00002','-','-','-','-','pimpim43@hotmail.com','-','-','-',' <br>\n ชื่อเจ้าของภาพ rY_nOy <br>\n Mail <a href=mailto:cherrynoy@hotmail.com>cherrynoy@hotmail.com</a> <br>\n ICQ 119789219 <br>\nLink ถ้าอยาก Vote ก็ได้นะ <a href=\"http://www.mthai.com/sticker/oo/morganbeat/100541.shtml\" target=\"www.mthai.com/sticker/oo/morganbeat/100541.shtml\">http://www.mthai.com/sticker/oo/morganbeat/100541.shtml</a><br>\n','30/04/02','-');
INSERT INTO friends_data VALUES ('F00003','-','-','-','-','doctork@mweb.co.th','-','-','-','ตอนนี้ผมย้ายไปอยู่ Leeds United แล้วครับ มีปัญหาติดต่อสโมสรผมนะครับ ที่ <a href=\"http://www.liverpoolfc.tv\" target=\"www.liverpoolfc.tv\">http://www.liverpoolfc.tv</a> นะครับ ยินดีต้อนรับครับ รักเมืองไทยมานะครับ อยากไปบอลโลกที่ เกาหลีใต้+ญี่ปุ่น ครับ จึงต้องย้ายจาก Liverpool มา','30/04/02','-');
INSERT INTO friends_data VALUES ('F00004','อาย','อาย','วิดวะ','เหอๆๆ','aya_naruk@hotmail.com','135415525','ไม่บอกได้ป่าว','ไม่มี','เหอะๆๆ ตั้มๆๆน่ารักดี<br>\nส่งรูปมาหน่อยสิ','30/04/02','เหอๆๆ');
INSERT INTO friends_data VALUES ('F00005','news','news','-','-','-','-','ไม่บอกจ้ะ','-','อยากมีเพื่อนน่ะสนใจติดต่อได้น่ะค่ะ','30/04/02','-');
INSERT INTO friends_data VALUES ('F00006','news','news','-','-','-','-','ไม่บอกจ้ะ','-','อยากมีเพื่อนน่ะสนใจติดต่อได้น่ะค่ะ','30/04/02','-');
INSERT INTO friends_data VALUES ('F00007','-','-','-','-','-','-','-','-','หาเพื่อน','30/04/02','-');
INSERT INTO friends_data VALUES ('F00008','-','-','-','-','-','-','-','-','หาแฟน','01/05/02','-');
INSERT INTO friends_data VALUES ('F00009','jar','jar','oo','oo','gg','72383089','-','-','หาเพื่อนชาย','01/05/02','-');
INSERT INTO friends_data VALUES ('F00010','กองทัพโบแดง','RedRibbon','-','-','-','-','-','-','เพื่อนผมหล่นหายแถวๆนี้ใครเจอโพสบอกด้วยนะครับ <br>\nอิอิ','14/05/02','-');
INSERT INTO friends_data VALUES ('F00011','โอ...','โอ','เกษตร','พืชสวน','soljar@thaimail.com','-','02','-','ผมอยากรู้จักคุณคับแต่อายมากเลย เธอนั่งรถไฟไปกลับครับ อยู่คณะวิทยา มีเพื่อนผู้หญิง ร่วมทาง 4 คน <br>\nโอ้เรารู้ได้ไงนี่ อยู่ฝั่งธน แถววงเวียนใหญ่ อย่าตกใจ บ้านผมอยู่แถวนั้น อย่าคิดว่าผมโรคจิตล่ะ เธอใส่แว่นครับ<br>\nแต่ช่วงนี้เธอไม่กลับบ้านไม่ทราบว่าเหตุอันใด<br>\nใกล้สอบ หรือ .... ก็ไม่รุ ถ้าเพื่อนเธอหรือคนรุจักคนใด<br>\nช่วยบอกเธอให้ทราบหน่อยว่ามีคนนิยมในตัวคุณ เมลล์มาคุยกานซักนิด หรือบอกสถานะซักหน่อย ถ้า บอกเบอร์โทรกลับจะรีบโทรทันทีเลยครับ  เอาว่าแค่เธอรู้ว่าผมเขียน<br>\nได้อย่างนี้ เธอรู้แน่ว่าผมคือใคร  ช่วยผมหน่อยนะคับ','17/05/02','1 ต่อ');
INSERT INTO friends_data VALUES ('F00012','โดเรมี','โดเรมี','วิทยาศาสตร์','เคมี','-','-','-','-','ใครพอจะรู้ว่า  ภาคคอม รุ่น 16 คณะวิทยาศาสตร์มีพวก web ไหนบ้าง  บอกด้วยนะ ขอบคุณค่ะ','22/04/02','3');
INSERT INTO friends_data VALUES ('F00013','-','-','-','-','-','-','-','-','เขาหายไปไม่ยอมกลับบ้านเลย เพื่อน ๆ เป็นห่วงเห็นเขาบอกว่าทำ project ที่ภาค นาน ๆ กลับบ้านอาบน้ำทีหายไปนาน ๆ เพื่อน ๆ คิดถึงมาก ชื่อย่อเขาคือนาย G','07/06/02','-');
INSERT INTO friends_data VALUES ('F00014','วัฒนพงษ์ จุลกมนตรี','อุ๊','-','-','zero_ou@hotmail.com','2947079','01-9316005','-','สวัสดีครับ ชื่อ อุ๊ เรียนอยู่รังสิตครับ <br>\nยินดีที่ได้รู้จัก icq 2947079 ครับ','08/06/02','-');
INSERT INTO friends_data VALUES ('F00015','Jariyaporn Lankford','toon','-','-','jariyaporn@charter.net','-','-','-','My name is Toon. I am looking for one of the students in Engineering Department name Mr. Kitisak Pilachai. I think he is in 3rd or  4th year. I am sorry I don\'t have any more information to tell you and this is all I know. Please help put him in touch with me if you can find him or please advise me how to find him. It is very important.<br>\n <br>\nThank you.<br>\nToon<br>\n','14/09/02','-');
INSERT INTO friends_data VALUES ('F00018','-','กิก','-','-','kmin_1234@yahoo.com','-','-','-','เพื่อน เพื่อนกัน ....เพื่อนกัน.....เพื่อนที่รู้ใจ<br>\n     คำพูดไม่ต้อง เพียงแค่แววตาก็เข้าใจ ','15/06/02','-');
INSERT INTO friends_data VALUES ('F00017','-','sarah','วิดยา','-','-','-','-','-','เหงาๆๆๆๆๆๆๆ ปิดเทอมแล้ว เหงาจัง เด็กวิทยาไม่ค่อยอยู่หอกันเลย เห็นมีแต่เด็กวิดวะ อยากเป็นเพื่อนกันมั้ยจ้ะ','15/06/02','-');
INSERT INTO friends_data VALUES ('F00019','J_Thanachai','tom','Engineer','-','s4015193@kmitl.ac.th','123040660','-','-','หาเพื่อนฝึกภาษาอังกฤษครับยินดีแลกเปลี่ยนประสบการณ์ทุกคนเพราะผมก็ไม่เก่ง icq จะ online ตอนดึกๆหลัง 4 ทุ่มครับ','01/07/02',' -');

#
# Table structure for table 'introduce'
#

CREATE TABLE introduce (
  no int(11) NOT NULL auto_increment,
  username varchar(20) NOT NULL default '',
  detail text,
  sender varchar(20) default NULL,
  email varchar(40) default NULL,
  date varchar(15) NOT NULL default '',
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'introduce'
#

INSERT INTO introduce VALUES (1,'doctork','ประกาศแล้วเอาจริงไหมครับ ถ้าเอาจะได้ขายให้ <img src=\"pics/blue.gif\">','Olala05','','15/02/02');
INSERT INTO introduce VALUES (2,'surachet','ใหม่ไปใหมพี่ <img src=\"pics/shy.gif\">','art','som-cm@chuiyo.com','21/03/02');
INSERT INTO introduce VALUES (3,'surachet','','','','21/03/02');
INSERT INTO introduce VALUES (4,'surachet',' <img src=\"pics/biggrin.gif\">','art','','21/03/02');

#
# Table structure for table 'lost_ans'
#

CREATE TABLE lost_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'lost_ans'
#

INSERT INTO lost_ans VALUES (24,'L00005','รถผมก็หายเหมือนกันครับ เบื่อมากเลยพวกชอบเอาของคนอื่นไป ผมก็ได้แต่หวังว่าซักวันเขาคงจะได้รับผลกรรมที่เขาทำ <img src=\"pics/shy.gif\">','เด็กลาดกระบัง','','161.246.14.74','25/02/02',NULL);
INSERT INTO lost_ans VALUES (2,'L00000','&lt;h1&gt;&lt;font color=red&gt; I\'m test &lt;/font&gt;&lt;/h1&gt; \' &quot; / \\','test','','161.246.5.16','30/01/02',NULL);
INSERT INTO lost_ans VALUES (23,'L00002','เรื่องของหายเป็นเรื่องธรรมชาติครับ มันคงหลงทางอยู่ที่ไหนซักแห่งครับเดี๋ยวมันเบื่อมันก็กลับมาเองละครับ <img src=\"pics/lol.gif\">','เป็นธรรมชาติ','','161.246.14.74','25/02/02',NULL);
INSERT INTO lost_ans VALUES (7,'L00005','นานขนาดนั้นนะ โดนแยกชิ้นส่วนไปแล้วมั้ง ไปตามเก็บเอาเองแล้วกันนะ <img src=\"pics/devil.gif\"> <img src=\"pics/lol.gif\"> <img src=\"pics/lol.gif\">','บ.ปอ','','161.246.5.215','01/02/02',NULL);
INSERT INTO lost_ans VALUES (8,'L00003','เราเจอแล้วนะ มาเอาที่เราได้น่ะตอนนี้เก็บไว้ให้อย่างดีแล้วครับ ฮ่ะๆ','Dude','','161.246.6.76','03/02/02',NULL);
INSERT INTO lost_ans VALUES (6,'L00002','จักรยานผมหาย หาใต้ภาคครับ ตั้งแต่เทอมที่แล้วใครเอาไปนำมาคืนด้วยครับ.. <img src=\"pics/blue.gif\">','บ.บู๋','pimpim43@hotmail.com','161.246.5.227','30/01/02',NULL);
INSERT INTO lost_ans VALUES (9,'L00003','เจอที่ไหนเหรอค่ะ ช่วยบอกหน่อยอยากรู้ว่ามันหายไปอยู่ไหน','masaki','','203.148.151.254','03/02/02',NULL);
INSERT INTO lost_ans VALUES (10,'L00003','เจออยู่ข้างๆใจเรานี่แหละ <img src=\"pics/smokin.gif\">','MangMug','s2010159@ce.kmitl.ac.th','161.246.5.38','12/02/02',NULL);
INSERT INTO lost_ans VALUES (11,'L00009',' <img src=\"pics/smokin.gif\"> โม้ปล่าว น้องแมงหมัก(หมม)','XtuM','','161.246.5.9','12/02/02',NULL);
INSERT INTO lost_ans VALUES (12,'L00009','มันไม่ได้หาไปไหนหรอกครับ มันอยู่กับตัวเราตลอดเวลาน่ะ หล่ะ <img src=\"pics/supergrin.gif\">','DoctorK','','161.246.5.215','12/02/02',NULL);
INSERT INTO lost_ans VALUES (13,'L00009','เรื่องของความ(ทรง)จำเนี่ย ก็เหมือนความรู้ ยิ่งมีมาก ก็ยิ่งลืมมาก<br>\nผมเองไม่ค่อยชอบถ่ายรูปก็เพราะไม่อยากเอาประสบการณ์ครั้งใหม่ มารำลึกถึง ประสบการณ์ครั้งเก่า ทั้งๆที่มันไม่เกี่ยวข้องกันเลย นอกเสียจากว่า มีภาพแห่งความทรงจำคล้ายกัน<br>\n<br>\nผมมีชีวิตอยู่บนความรู้สึก ไม่ใช่ภาพหรือความคิด :) <img src=\"pics/smokin.gif\">','MangMug','s2010159@kmitl.ac.th','161.246.5.38','13/02/02',NULL);
INSERT INTO lost_ans VALUES (14,'L00005','เราจะแก้ปัญหารถหายกันได้อย่างไร<br>\nเพราะหายหลายต่อหลายคันแล้ว<br>\nรึทำเป็น  Projec เลย','DR.A','','161.246.51.61','17/02/02',NULL);
INSERT INTO lost_ans VALUES (15,'L00009','คำคมมาก บาดคอเลือดซิบๆเลยอ่ะ  <img src=\"pics/supergrin.gif\">','RedRibbon','','202.44.139.61','20/02/02',NULL);
INSERT INTO lost_ans VALUES (16,'L00003','รู้สึกเลี่ยนๆยังไงไม่รู้ เหอๆๆ <img src=\"pics/devil.gif\">','RedRibbon','','202.44.139.61','20/02/02',NULL);
INSERT INTO lost_ans VALUES (17,'L00003','ข้างใจนายMangMug ไม่ได้มีไว้ใครใครบ้างคนเหรอ<br>\n <img src=\"pics/lol.gif\">','Machine','','161.246.6.140','21/02/02',NULL);
INSERT INTO lost_ans VALUES (18,'L00005','โห โปรเจคนี้คงอหังกาแน่อะ แถมต้องพ่วงเรื่อง AI เข้าไปด้วย เพราะเกี่ยวกับพฤติกรรมมนุยษ์  <img src=\"pics/confused.gif\">','Machine','','161.246.6.140','21/02/02',NULL);
INSERT INTO lost_ans VALUES (19,'L00003','ขอบคุณนะค่ะที่ช่วยหาแต่ตอนนี้เจอแล้วว่าอยู่ที่ไหน <img src=\"pics/smile.gif\">','masaki','@kmitl.ac.th','203.148.146.188','21/02/02',NULL);
INSERT INTO lost_ans VALUES (20,'L00003','เชื่อได้เลย ว่าต้องมีการเสียสาวแน่นอน ครับ <img src=\"pics/sunglasses.gif\">','เด็ก อุบล','','203.146.0.134','22/02/02',NULL);
INSERT INTO lost_ans VALUES (21,'L00009','สอบเสร็จ อยากไปกินเหล้าวะ ','บ.บู๋','','161.246.5.227','23/02/02',NULL);
INSERT INTO lost_ans VALUES (22,'L00003','หมายความว่าไงค่ะ คุณ พุดให้ดี ๆหน่อยซิค่ะ','masaki','','161.246.51.139','23/02/02',NULL);
INSERT INTO lost_ans VALUES (25,'L00009','ก็กลับไปตามหาที่บ้านละกันนะเพื่อน <img src=\"pics/clown.gif\">','RA2','','161.246.14.74','25/02/02',NULL);
INSERT INTO lost_ans VALUES (26,'L00003','ไม่มีอะไรจะหายแล้วใช่มั้ยครับเนี่ย<br>\nมีอะไรมาคุยกันได้ที่maaail <img src=\"pics/tasty.gif\"> <img src=\"pics/supergrin.gif\"> <img src=\"pics/supergrin.gif\">','nn','nn_9@hotmail.com','161.246.12.13','02/03/02',NULL);
INSERT INTO lost_ans VALUES (27,'L00003','อ้าวก็มันหายไปจริงๆ นิค่ะ','masaki','','161.246.51.208','02/03/02',NULL);
INSERT INTO lost_ans VALUES (28,'L00009','หายด้วย <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\"> <img src=\"pics/biggrin.gif\">','นะจ้ะ','','161.246.45.75','06/03/02',NULL);
INSERT INTO lost_ans VALUES (29,'L00003','อย่าเสี่ยวได้ไม้.........หะ <img src=\"pics/lol.gif\">','alfa','','161.246.5.12','07/03/02',NULL);
INSERT INTO lost_ans VALUES (30,'L00009','Mangmug นี่เป็นใครเหรอ มาหาเวลากะพี่ก็ได้พี่ว่าง <img src=\"pics/lol.gif\">','กะเทยเฒ่า','kapolo@nongwa.com','161.246.5.229','11/03/02',0);
INSERT INTO lost_ans VALUES (31,'L00003','เดี๋ยวพี่ช่วยหาหั้ยมั้ยน้อง/พี่เปี๊ยกเกษตร <img src=\"pics/sunglasses.gif\">','เปี๊ยก','','203.153.139.183','19/03/02',1);
INSERT INTO lost_ans VALUES (32,'L00003','','','','203.153.139.183','19/03/02',0);
INSERT INTO lost_ans VALUES (33,'L00003','ไปหากินเหล้าร้านประจำดีกว่าคัยจะไปยกมือขึ้นเจอกันร้าน howdy น่ะโต๊แมนยู/พี่เปี๊ยกเกษตร <img src=\"pics/devil.gif\">','เปี๊ยก','','203.153.139.183','19/03/02',0);
INSERT INTO lost_ans VALUES (34,'L00015','เล่มเท่าไหร่ครับ จะได้ไปเอา <img src=\"pics/grazy.gif\">','บ.บู๋','','202.44.32.9','01/04/02',0);
INSERT INTO lost_ans VALUES (35,'L00016','หายไปก็ดีแล้วน้องไปตามหาเองเหอะพี่ก็ยังหาไม่ได้เลย ถ้าว่างมาเป็นแฟนกะพี่ก็ได้','กระเทยเฒ่า','gay@gaymail.com','161.246.5.215','02/04/02',0);

#
# Table structure for table 'lost_data'
#

CREATE TABLE lost_data (
  code varchar(6) NOT NULL default '',
  detail text,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'lost_data'
#

INSERT INTO lost_data VALUES ('L00000','หนังสือ friendship ของพี่แบงค์ ห้อง Olala หายครับใครเจอนำมาคืนจะมีรางวัลให้อย่างงามครับ หรือติดต่อที่ <a href=mailto:doctork@mweb.co.th>doctork@mweb.co.th</a>','29/04/02');
INSERT INTO lost_data VALUES ('L00002','ใครนำไปมีจิตสำนึกนำมาคืนด้วยนะครับ เจ้าของเดือดร้อนครับ หามาตั้งนานไม่เจอเลยครับ ถ้ามีติดต่อมาที่ Email ครับ','29/04/02');
INSERT INTO lost_data VALUES ('L00003','ใจหายค่ะไม่รู้หายไปไหนใครเจอก็ช่วยหากลับมาคืนด้วนนะค่ะ อิอิ','29/04/02');
INSERT INTO lost_data VALUES ('L00013','ใครเก็บกระเป๋าสตางค์ Flynow สีดำได้นำมาคืนด้วยที่ภาควัคคุม ชั้น 2 ห้องธุรการหรือโทร 027390211 ห้อง 247 ได้แค่บัตรในกระเป๋าก็ยังดี จะเป็นพระคุณอย่างสูง','24/05/02');
INSERT INTO lost_data VALUES ('L00005','จักรยานผมหาย หาใต้ภาคครับ ตั้งแต่เทอมที่แล้วใครเอาไปนำมาคืนด้วยครับ.. ','30/04/02');
INSERT INTO lost_data VALUES ('L00014','เจอแฟ้มสีฟ้าใสครับ หน้าห้องสอบตึก ME403 ของใครเอ่ยเจอเมื่อวันที่ 28 กพ. ครับ ตอนบ่ายมารับได้ที่ห้อง olala ตึก B นะ','28/05/02');
INSERT INTO lost_data VALUES ('L00015','สอดเเบ็ง1000ไว้ในการ์ตูนที่เช่ามา เเล้วเพื่อนเอาการ์ตูนไปคืน(jojo)','11/03/03');
INSERT INTO lost_data VALUES ('L00008','ขอความกรุณาช่วยนำส่งคืนที่สโมสร นศ.คณะวิศวกรรมศาสตร์ ด้วยเถอะนะคะ หรือติดต่อกลับมาอีกครั้งที่ 01-3298194 เพราะตอนนี้เดือดร้อนมากต้องติดต่อฝึกงาน&quot;กรุณาด้วยเถอะค่ะ ลูกหลานพระจอมเกล้า ด้วยกันทั้งนั้น&quot; ขอบคุณค่ะ ','08/05/02');
INSERT INTO lost_data VALUES ('L00009','เพื่อนเก่าๆ ความรู้สึกเก่าๆ คนที่รู้สึกดีเก่าๆ วันเวลาเก่า ที่เคยผันผ่าน ความทรงจำเก่าๆทั้งสุขและทุกข์ รู้ว่าใครเอาไปแต่ ตามไปเอาคืนมาไม่ได้.... แต่เราไม่เสียใจหรอก เพราะเรามีความทรงจำใหม่ๆเกิดขึ้นตลอดเวลา','12/05/02');
INSERT INTO lost_data VALUES ('L00012','ใครเห็นเครื่องคิดเลข 5500 บ้าง มีสติ๊กเกอร์ เซเว่นติดอยู่ ใครเห็นบอกด้วยเด้อ ... ','23/05/02');
INSERT INTO lost_data VALUES ('L00011','ใครเจอนำมาคืนด้วยนะครับ ห้อง olala เป็นของพี่ตั้มนะครับ มีรางวัลให้อย่างงามครับ','21/05/02');
INSERT INTO lost_data VALUES ('L00016','หายจ้อยเลยครับ เธอไปกับคนใหม่ ช่วยทวงคืนทีเต๊อะ','01/05/02');

#
# Table structure for table 'member'
#

CREATE TABLE member (
  username varchar(20) NOT NULL default '',
  password varchar(20) NOT NULL default '',
  fullname text,
  nickname varchar(20) default NULL,
  email varchar(40) NOT NULL default '',
  icq varchar(15) default NULL,
  tel varchar(20) default NULL,
  pager varchar(10) default NULL,
  addr text,
  homepage text,
  faculty varchar(40) default NULL,
  department varchar(40) default NULL,
  branch varchar(40) default NULL,
  year varchar(5) default NULL,
  class varchar(5) default NULL,
  id varchar(10) default NULL,
  date_mem varchar(20) default NULL,
  PRIMARY KEY  (username)
) TYPE=MyISAM;

#
# Dumping data for table 'member'
#

INSERT INTO member VALUES ('webmaster','123456','-','-','doctork@mweb.co.th','11349748','-','-','-','-','-','-','-','-','-','-','29/01/02');
INSERT INTO member VALUES ('doctork','123456','Chutitep','Chantramart','doctork@mweb.co.th','11349748','038874323','-','ระยอง','http://161.246.4.7/marketplace/index.php','Computer Engineering','Computer Engineering','Computer Engineering','3','p','42015299','29/01/02');
INSERT INTO member VALUES ('ตั้ม','แนทจภ','-','-','tumcom04@hotmail.com','7006596','-','-','-','-','-','-','-','-','-','-','29/01/02');
INSERT INTO member VALUES ('tum','com04','-','-','tumcom04@hotmail.com','7006596','-','-','-','-','-','-','-','-','-','42015326','29/01/02');
INSERT INTO member VALUES ('Adul','iydgTv,kdqq','-','-','Nai_Nung@Softhome.net','14655489','-','-','-','-','-','-','-','-','-','-','29/01/02');
INSERT INTO member VALUES ('บ.บู๋','beckham43','-','-','pimpim43@hotmail.com','69695571','-','-','-','-','-','-','-','-','-','-','29/01/02');
INSERT INTO member VALUES ('pokg','pokg','pok','pokg','soroj496@hotmail.com','-','-','-','-','-','engineer','computer','computer','4','d','-','29/01/02');
INSERT INTO member VALUES ('RedRibbon','7922','-','-','RedRibbon@mail.com','126563585','-','เคยมีแต่หา','-','-','วิศวะกรรมศาสตร์','วิศวะคอมฯ','วิศวะกรรมศาสตร์','2 ต่อ','P','43015368','29/01/02');
INSERT INTO member VALUES ('tummeng','7922','pathomchoke','meng','tummeng@mail.com','126563585','02-7380893','-','ยุคลรัตน์คอนโดมิเนียม อาคารเอ ชั้น 4 ห้อง 87','-','วิศวะกรรมศาสตร์','วิศวะคอมฯ','วิศวะกรรมศาสตร์','2 ต่อ','P','43015368','29/01/02');
INSERT INTO member VALUES ('angel','987654321','Algelical Zeak','Angel','angel-zeak@lemononline.com','94297244','-','-','-','-','-','-','-','-','-','-','29/01/02');
INSERT INTO member VALUES ('nutt220225','nutt220225','ภาณุ ปฐมเอกลักษณ์','นัท','nutt220225@catcha.com','111082177','02-6881479#1','-','ชุมนุม Computer  Club \r\nโทร 02-7390059','-','วิศวกรรมศาสตร์','อุตสาหการ','อุตสาหการ','2','9','43010729','29/01/02');
INSERT INTO member VALUES ('oranje','3267357','weena','oranje','masaki_girl@hotmail.com','82407614','-','-','masaki_girl@hotmail.com','-','id.ed','-','japanese','-','-','-','29/01/02');
INSERT INTO member VALUES ('oonz','Suan117','-','-','ornkung@hotmail.com','-','-','-','-','-','-','-','-','-','-','-','30/01/02');
INSERT INTO member VALUES ('Lucky_man','123456','-','-','luck_man@anfield.com','-','-','-','-','-','-','-','-','-','-','-','30/01/02');
INSERT INTO member VALUES ('joel','xitdkLb9','-','-','joel_biz@hotmail.com','35024435','-','-','-','-','-','-','-','-','-','-','30/01/02');
INSERT INTO member VALUES ('fowler','123456','-','-','doctork@mweb.co.th','-','-','-','-','-','-','-','-','-','-','-','30/01/02');
INSERT INTO member VALUES ('obtheair','computer','วรณิสร์ พวศ์จรรยานุกูล','ob the air','waranit@hotmail.com','62755835','-','-','-','-','วิศวกรรมศาสตร์','คอมพิวเตอร์','คอมพิวเตอร์','2','2D/2','43010365','30/01/02');
INSERT INTO member VALUES ('s2015312','MT870391','-','-','s2015312@kmitl.ac.th','-','-','-','-','-','-','-','-','-','-','-','30/01/02');
INSERT INTO member VALUES ('aid','khariton','Thapana Nampradit','Aid','aid_aid@hotmail.com','76541111','01-3759437','-','-','-','Engineering','Control Engineering','Control Engineering','-','B','38014133','30/01/02');
INSERT INTO member VALUES ('aya','por1016','...','อาย','aya_naruk@hotmail.com','135415525','...','...','เหอะๆๆ','-','วิดวะ','...','...','...','...','...','30/01/02');
INSERT INTO member VALUES ('s2015321','Jasper&','muiy','muiy','s2015321@ce.kmitl.ac.th','72383089','-','-','Olola','-','engineering','ce','ce','-','p','42015321','30/01/02');
INSERT INTO member VALUES ('Terry','kmitl234','-','-','thana@ce.kmitl.ac.th','-','-','-','-','-','-','-','-','-','-','-','31/01/02');
INSERT INTO member VALUES ('Yam','yuiyoyam','อิทธิพล แย้มบุญยิ่ง','แยม','smartest_yam@hotmail.com','54524590','028877471p3','-','36/57 แขวงบางระมาด เขตตลิ่งชัน กทม. 10170','-','วิศวกรรม','คอมพิวเตอร์','คอมพิวเตอร์','3','7','42010446','02/02/02');
INSERT INTO member VALUES ('joob','346313','นาย ศุภกร  ชะอุ่มดี','จุ๊บ','suppagorn@hotmail.com','-','02-3273784','-','205/1 ม.10  ถใฉลองกรุง แขวงลำปลาทิว เขตลาดกระบัง  กทม.  10520','-','วิศวกรรมศาสตร์','วิศวกรรมคอมพิวเตอร์','วิศวกรรมคอมพิวเตอร์','1(ต่อ','P','44015350','03/02/02');
INSERT INTO member VALUES ('vision','9125','vision','วิเองแหละ','few_12@hotmail.com','44448458','-','-','-','www.afew.f2s.com','-','-','-','-','-','-','03/02/02');
INSERT INTO member VALUES ('edd','eddiepok','อรรคพร  ผิวแดง','edd','edd@se-ed.net','-','018543459','-','-','-','Engineering','Computer Engineering','Computer Engineering','2','2P','43015399','11/02/02');
INSERT INTO member VALUES ('glay','glay','glay','glay','glay@hotmail.com','-','-','-','หอพักแถวนี้แหละ','-','วิดวะ','คอม','-','-','-','-','06/02/02');
INSERT INTO member VALUES ('test','1234','test test','tes','test@test.com','123456','015555555','142-877777','ที่นี่\r\nที่นั้น','www.test.com','วิศวะ','คอมฯ','คอมฯ','4','4','36014789','06/02/02');
INSERT INTO member VALUES ('Pop_Pcon','14240097','-','-','popbtc@yahoo.com','-','-','-','-','-','-','-','-','-','-','-','08/02/02');
INSERT INTO member VALUES ('phols','boss04ko','-','-','apholsak@yahoo.com','52808189','01-5197982','-','-','-','-','-','-','-','-','-','11/02/02');
INSERT INTO member VALUES ('MangMug','mangmug123','Erik M Sirikhum','MangMug','s2010159@ce.kmitl.ac.th','878963','-','-','@ISAG','http://isag38.ce.kmitl.ac.th/~sirikhum/','CE','Comp','-','3','3','42-010-159','12/02/02');
INSERT INTO member VALUES ('test01','0000','-','-','test@sex.com','-','-','-','-','-','-','-','-','-','-','-','13/02/02');
INSERT INTO member VALUES ('weekaroon','44015254','weerasak karoon','sak','weekaroon@chaiyo.com','-','02 7392657','-','82/71 ซ อ่อนนุชนิเวศน์ 1 แขวงลาดกระบัง เขตลาดกระบัง กรุงเทพ 10520','-','engineering','electronic','electronic','1','1r','44015254','13/02/02');
INSERT INTO member VALUES ('narumon','jeab2002','นฤมล  มงคลธนวัฒน์','เจี๊ยบ','narumonstar@hotmail.com','-','-','-','-','-','วิทยาศาสตร์','ชีววิทยาประยุกต์','เทคโนโลยีชีวภาพ','3','-','42065207','13/02/02');
INSERT INTO member VALUES ('auto17','auto17','ตั้ม','-','auto017@hotmail.com','-','09-5089910','-','-','-','-','-','-','-','-','-','13/02/02');
INSERT INTO member VALUES ('auto017','auto017','tum','-','auto017@hotmail.com','113747586','09-5089910','-','-','-','-','-','-','-','-','-','13/02/02');
INSERT INTO member VALUES ('kaipaoi','brokenheart','Hello','Hello','kaipaoi@yahoo.com','-','-','-','-','-','-','-','-','-','-','-','14/02/02');
INSERT INTO member VALUES ('m_nakarin','addy','นครินทร์ มาจันทร์','แอ๊ดดี้','nakarin_machan@yahoo.com','-','012591914','-','wireless laboratory, floor 10, ReCCIT\r\ncall 3327','-','วิศวกรรมศาสตร์','วิศวกรรมโทรคมนาคม','โทรคมนาคม','ป. โท','wirel','43061059','14/02/02');
INSERT INTO member VALUES ('phatpc','pc1294pc','phonlaphat thongsriphong','phat','pc_phat@hotmail.com','145149380','027381688','-','-','-','-','-','-','-','-','-','15/02/02');
INSERT INTO member VALUES ('surachet','6275','สุรเชษฐ์','-','kksurach@kmitl.ac.th','1925249','01-7634547','-','ICQ ,E-mail ,หรือมือถือก็ได้ครับ','-','-','-','-','-','-','-','15/02/02');
INSERT INTO member VALUES ('Tana','l3696','ธนวัฒน์','ดาม','s3015865@kmitl.ac.th','-','01-7729626','-','หอกมล','-','วิศวกรรมศาตร์','เทคนิคอุตสาหกรรม','เทคโนโลยีโทรคมนาคม','2','2ี๊ีี','43015865','16/02/02');
INSERT INTO member VALUES ('pongpunw','engine1652','นายพงพันธ์ วันสา','ธรณ์','pongpunw@lemononline.com.com','-','09-9953438','-','สถาบัน สจล.','-','วิศวกรรมศาสตร์','วิศวกรรมโทรคมนาคม','วิศวะโทรคมนาคม','1','1T1','440150147','18/02/02');
INSERT INTO member VALUES ('kevin','password','ทินพัฒน์ ชัยพานิช','Kevin','tinnapat@thaimail.com','11652491','-','-','-','-','วิศวกรรมศาสตร์','วิศวกรรมคอมพิวเตอร์','-','-','-','41014160','18/02/02');
INSERT INTO member VALUES ('aramo59','92093777','-','-','aramo59@hotmail.com','-','-','-','-','www.EarnMoneyCentral.com/jobalife','-','-','-','-','-','-','19/02/02');
INSERT INTO member VALUES ('cloudy','cloudy','เอกลักษณ์','หนึ่ง','s3010561@kmitl.ac.th','-','01 6935610','-','สโมสร วิศวะ 4 ปี','-','วิศวะ','คอม','คอม','2','7','43010561','21/02/02');
INSERT INTO member VALUES ('s2040451','golf00','อภิชล','golf','golfpla134@hotmail.com','-','012742549','-','-','-','เกษตร','บรหาร','เทคโนโลยีการจัดการ','3','2','42040451','21/02/02');
INSERT INTO member VALUES ('narid','281779','นริศ นะสะโต','เบิร์ด','narak_bird@hotmail.com','76565119','02-7392559','-','209/85 ถ.อ่อนนุช ลาดกระบัง  ม.3 แขวงลาดกระบัง เขตลาดกระบัง กทม. 10520','-','วิศวกรรมศาสตร์','วิศวกรรมการวัดคุม','วิสวกรรมการวัดคุม','2','i','43015468','22/02/02');
INSERT INTO member VALUES ('champ_1','superman','ปิติพงษ์  ประภามณฑล','แชมป์','champnarak@hotmail.com','-','0-2642-5810 กด 2','-','คณะวิศวฯลาดกระบัง  ,  สยามแสควร์  ,  เวิร์ลเทรด','-','วิศวฯ','วิศวกรรมโทรคมนาคม','วิศวกรรมไฟฟ้า','1(โท)','-','44061720','22/02/02');
INSERT INTO member VALUES ('PACHNONGCHUM','44035324','นายธีรวัฒน์  ณ นคร','แสน','PACHNONGCHUM@CHAIYO.COM','-','097680613','-','148/52 ม.1 ถ.อ่อนนุช-ลาดกระบัง แขวงประเวศ เขตประเวศ กรุงเทพฯ 10250','-','ครุศาสตร์อุตสาหกรรม','ครุศาสตร์วิศวกรรม','อิเล็กทรอนิกส์และคอมพิวเตอร์','1','1','44035324','22/02/02');
INSERT INTO member VALUES ('ืjeabstar','jeab2002','นฤมล  มงคลธนวัฒน์','เจี๊ยบ','narumonstar@hotmail.com','-','02-7390905 ห้อง 108','-','100 หมู่ 13 ต. นาเริก อ.พนัสนิคม ชลบุรี 20140','-','วิทยาศาสตร์','ชีววิทยาประยุกต์','เท๕โนโลยีชีวภาพ','3','-','42065207','22/02/02');
INSERT INTO member VALUES ('edd me03','15405','กฤษดา บุญเหลือ','เอส','edd_me03@yahoo.com','-','019191102','-','30/131 ม.ร่งอรุณ1 แขวง ลำปลาทิว เขตลาดกระบัง กรุงเทพ','-','วศ.','เครืองกล','เครื่องกล','-','2q','43015405','22/02/02');
INSERT INTO member VALUES ('สุกัญญา','12345','สุกัญญา  โสดาวัง','ปุ๊กกี้','pook74@hotmail.com','-','-','-','-','-','-','-','-','-','-','-','22/02/02');
INSERT INTO member VALUES ('instru','Bank','แบงค์','แบงค์','instru_eng@hotmail.com','-','025262466 กด 1','-','-','-','วิศวกรรมศาสตร์','วัดคุม','วัดคุม','2','S','43015579','22/02/02');
INSERT INTO member VALUES ('TonG','24012523tg','สุรศักดิ์ บุญจวง','โต้ง','b_surasuk@hotmail.com','-','02-3269757','-','-','-','วิศวกรรมศาสตร์','วิศวกรรมคอมพิวเตอร์','วิศวกรรมคอมพิวเตอร์','1','P','44015361','26/02/02');
INSERT INTO member VALUES ('M_YUTTHAPONG','NUMKMITL','YUTTHAPONG','YUT','m_yutthapong@hotmail.com','-','-','-','6135','-','graduate','it','it','1','-','44061825','28/02/02');
INSERT INTO member VALUES ('wachirasak','5991935','นายวชิรศักดิ์   ศรเรือง','เอก','wachirasak.son@chaiyo.com','-','09-9786192','-','วิทยาเขตชุมพร','-','เทคโนโลยีการเกษตร','พืชสวน','เทคโนโลยีการผลิตพืช','2  (ต','วิทยา','43540077','28/02/02');
INSERT INTO member VALUES ('jumja','rabbit','jj','jj','jumja_u2@yahoo.com','-','-','-','-','-','EN','IT','IT','-','-','-','28/02/02');
INSERT INTO member VALUES ('mataba','44040916','ธรากร  หงส์ทอง','เต้','mataba@chaiyo.com','-','02-7390255-8  ต่อ  1','-','70/1  ม.2  ต.ท่าแร้ง  อ.บ้านแหลม    เพชรบุรี   76110','-','อุตสาหกรรมเกษตร','อุตสาหกรรมเกษตร','อุตสาหกรรมเกษตร','2','2','44040916','06/03/02');
INSERT INTO member VALUES ('bank','bank','bank','bank','bank','bank','adsf','bank','asdf','bank','asdf','asdf','asdf','asdf','asdf','asdf','06/03/02');
INSERT INTO member VALUES ('L33T','l33t','อาทิตย์ ตันประเสริฐ','หนึ่ง','art_non@yahoo.com','36008537','01-5192511','-','-','-','วิศวกรรมศาสตร์','วิศวกรรมการวัดคุม','-','1','S1','44015503','07/03/02');
INSERT INTO member VALUES ('zero_ou','13256','วัฒนพงษ์ จุลกมนตรี','อุ๊','zero_ou@hotmail.com','2947079','01-9316005','-','-','http://www.geocities.com/zero_ou','-','-','-','-','-','-','08/03/02');
INSERT INTO member VALUES ('kantimabee','jamlala','กันทิมา','บี๋','kantimabee@hotmail.com','-','0-18292403','-','-','-','-','-','-','-','-','-','08/03/02');
INSERT INTO member VALUES ('wises24','24072523','-','-','wises24@hotmail.com','-','-','-','-','-','-','-','-','-','-','-','13/03/02');
INSERT INTO member VALUES ('newway','pankitti02','Siripan','pan','newway@yahoo.com','153286303','0-9768-2105','-','1029/55 moo 7 petchkasem 106  bangkok 10160','-','Science','Applied Statisitics','Applied Statisitics','2','-','43050348','14/03/02');
INSERT INTO member VALUES ('ooo','43015182','ศุภมิตร ลือรุ่งโรจน์วุฒิ','โอ๋','ooo@thaimail.com','-','028730214 กด 3','-','301/102  ม.รุ่งอรุณ 2','-','วิศวะ','ไฟฟ้า','ไฟฟ้า','2','2','43015182','14/03/02');
INSERT INTO member VALUES ('Mega','w,j[vds]vd','N','Mega','meg@anet.net.th','35519536','-','-','-','-','-','-','-','-','-','-','15/03/02');
INSERT INTO member VALUES ('pam','tang29','-','-','pemu29_b@hotmail.com','-','-','-','-','-','-','-','-','-','-','-','16/03/02');
INSERT INTO member VALUES ('kaset30','development','นายเลิศปัญญา  ดิษฐเนตร','เปี๊ยก','kaset30','-','014484462','-','-','-','เทคโนโลยีการเกษตร','เทคนิคเกษตร','พัฒนาการเกษตร','3  ต่','-','42045054','19/03/02');
INSERT INTO member VALUES ('NoT','note','Patrix','Pat','noxi@dr.com','-','-','-','KMITL','-','Eng.','-','-','-','-','-','25/03/02');
INSERT INTO member VALUES ('arom','arom','จารุวัส  ศรีภูธร','ปิ่น','aromhup@thaimail.com','-','0-1362-9292','-','-','-','เทคอุต','เทคอุต','สถาปัตยกรรม','4','-','4301229004','25/03/02');
INSERT INTO member VALUES ('job','2510','ธเนศ ฟัง','จ๊อบ','job_j@thaimail.com','-','01 3421067','-','-','-','เกษตร','บริหาร','การจัดการ','2','-','44040685','25/03/02');
INSERT INTO member VALUES ('wutthinai','231025231025','วุฒินัย กาญจนศร','&lt;(BoY)&gt;','wutthinai@thaimail.com','66985680','016839699','-','หอพักถาวรพฤกษ์ ห้อง 403','-','Engineer','Computer','-','3','6','43010414','25/03/02');
INSERT INTO member VALUES ('kpwichai','2510','-','-','kpwichai@kmitl.ac.th','-','-','-','-','-','-','-','-','-','-','-','26/03/02');
INSERT INTO member VALUES ('yonmail','11889111','dusit chaikham','yon','yonmail@chaiyo.com','-','-','-','-','-','วิศวกรรม','วิศวกรรมไฟฟ้า','วิศวกรรมไฟฟ้ากำลัง','1','-','-','01/04/02');
INSERT INTO member VALUES ('richman','richman','richman','richman','richman2002@thaimail.com','-','-','-','-','-','-','-','-','-','-','-','01/04/02');
INSERT INTO member VALUES ('kasma','3333','กัสมา วางลา','ลา','kato@maildozy.com','-','-','-','-','-','-','-','-','-','-','-','01/04/02');
INSERT INTO member VALUES ('kiatkiat','E20IKr','Kiat Inthuwannarat','NuNg','kiat@kibkae.com','5067998','-','-','-','-','Enginering','Telecommunication','-','-','-','41014045','01/04/02');
INSERT INTO member VALUES ('kim_plop','123456789','วิโรจน์ อินทนากรวิวัฒน์','KIM','kim_plop@yahoo.com','-','023272005-303','-','หอออมสิน ห้อง 303','-','วิศวะกรรมศาสตร์','computer','computer','3','D','43010402','02/04/02');

#
# Table structure for table 'news_ans'
#

CREATE TABLE news_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'news_ans'
#

INSERT INTO news_ans VALUES (1,'N00007','รักวงพรูอย่าลืมอุดหนุนเทปนะครับ <img src=\"pics/blue.gif\">','สิทธ์','','161.246.5.225','29/01/02',NULL);
INSERT INTO news_ans VALUES (2,'N00006','Note,toon มาด้วยเหรอครับ ดีจัง แต่ชอบ Groove Rider มากกว่าครับ <img src=\"pics/sleepy.gif\">','Bank','','161.246.5.215','29/01/02',NULL);
INSERT INTO news_ans VALUES (3,'N00006','วง asia นี่เป็นวงของที่ไหนครับ <img src=\"pics/grazy.gif\">','Mut','','161.246.5.215','29/01/02',NULL);
INSERT INTO news_ans VALUES (4,'N00005','สะใจครับ แต่ดันแพ้ Arsenal ซะนี่ตกรอบไปตามระเบียบ แต่ใบแดงเยอะเหลือเกิน <img src=\"pics/smile.gif\">','Robbie Fowler','','161.246.5.215','29/01/02',NULL);
INSERT INTO news_ans VALUES (5,'N00008','ชนะได้ก็แค่นั้นแหล่ะ ไม่เห็นมีอะไรเลย สู้ไม่ได้ก็ยอมรับความพ่ายแพ้ไป <img src=\"pics/devil.gif\">','ปีศาจแดงแห่ง Olala','','161.246.5.227','29/01/02',NULL);
INSERT INTO news_ans VALUES (6,'N00010','ใครจะมาบ้างกรุณาแจ้ง doctork ด้วยนะครับ เร่งด่วนครับ <img src=\"pics/sunglasses.gif\">','doctork','','161.246.5.215','29/01/02',NULL);
INSERT INTO news_ans VALUES (7,'N00006','Note,toon จะมาจริง ๆเหรอค่ะ ไม่อยากจะเชื่อ','oranje','','161.246.51.114','29/01/02',NULL);
INSERT INTO news_ans VALUES (8,'N00008',' <img src=\"pics/lol.gif\">สะใจจริงๆ','หงส์น้ำเงิน','','161.246.5.43','30/01/02',NULL);
INSERT INTO news_ans VALUES (9,'N00006','ถ้าไม่มาก็ดูวงอื่นได้นี่ครับคุณภาพพอกัน <img src=\"pics/redface.gif\"> <img src=\"pics/biggrin.gif\">','doctork','','161.246.5.215','30/01/02',NULL);
INSERT INTO news_ans VALUES (27,'N00027','ก็ลองไปดูสิครับ นี่ลดแล้วนะนี่ <img src=\"pics/smile.gif\">','แจ้นตัวปลอม','','161.246.5.215','06/03/02',NULL);
INSERT INTO news_ans VALUES (11,'N00010','มีเหล้าฟรีป่าวกับไม่ค่อยสนจัยเท่าไหร่ <img src=\"pics/lol.gif\"> <img src=\"pics/sunglasses.gif\">','kodomo ชายจัดเด็ก','','161.246.5.191','30/01/02',NULL);
INSERT INTO news_ans VALUES (12,'N00010','มีเหล้าให้โต๊ะละ 1 กลมครับ 2 โต๊ะ 2 กลมครับ ใครไม่มางานถือว่าไม่ได้เรียนที่ลาดกระบังครับ <img src=\"pics/confused.gif\">','doctork','','161.246.6.139','30/01/02',NULL);
INSERT INTO news_ans VALUES (26,'N00036','ไม่น่าเสียชีวิตเลยนะครับ มาเล่นที่ลาดกระบังบ่อยมาก คิดถึงครับ เพราะไปดูทุกครั้งและพี่เขาก็เป็นกันเองดี <img src=\"pics/blue.gif\">','K','','161.246.5.215','06/03/02',NULL);
INSERT INTO news_ans VALUES (14,'N00010','งานเริ่มประมาณ 6 โมงเย็นครับ มี Concert ให้ดูด้วยนะครับ ใครมาทีหลังอดรับประทานอาหารไม่รู้ด้วยนะครับ <img src=\"pics/biggrin.gif\">','doctork','','161.246.5.215','02/02/02',NULL);
INSERT INTO news_ans VALUES (15,'N00017','สุดยอด','arku_junk','','161.246.6.89','06/02/02',NULL);
INSERT INTO news_ans VALUES (25,'N00027','จริงเปล่าพี่แจ้น น้องภาคไปเล่นมีส่วนลดไหมครับ<br>\n','2T/2','','161.246.12.17','01/03/02',NULL);
INSERT INTO news_ans VALUES (31,'N00036','บทเพลงที่พี่ โจ้ ร้อง จะไม่มีวันตายไปจากความรู้สึกดี ๆ ของเรา ... พี่เขาน่ารักมาก <br>\n        ขอให้พี่เขาหลับให้สบาย &quot;.&quot;','bbmu','','203.149.37.130','15/03/02',0);
INSERT INTO news_ans VALUES (30,'N00057','Buffaro <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\"> <img src=\"pics/reallymad.gif\">','DDT','','161.246.10.22','15/03/02',0);
INSERT INTO news_ans VALUES (28,'N00050','ผมสนใจ <br>\n <img src=\"pics/smokin.gif\">','ต่อ','titor09@lemononline.com','161.246.12.38','06/03/02',NULL);
INSERT INTO news_ans VALUES (20,'N00045','ของหายน่าจะประกาศที่หมวดของหานนะครับ ไม่เห็นเหมือนกันเสียใจด้วยนะครับ <img src=\"pics/smile.gif\">','doctork','','161.246.6.139','23/02/02',NULL);
INSERT INTO news_ans VALUES (24,'N00000','thank','tum','s2015326@kmitl.ac.th','161.246.5.216','28/02/02',NULL);
INSERT INTO news_ans VALUES (22,'N00041','พร้อมเบอร์หรือเปล่าค่ะหรือว่าเครื่องเปล่า','masaki','','161.246.51.139','23/02/02',NULL);
INSERT INTO news_ans VALUES (23,'N00036','&quot;แล้วสักวัน จะไปหา&quot;<br>\nแล้วพี่ก็ไปจริงๆ นะพี่โจ้ <br>\nมีความสุขมากๆนะครับ .','sk','','161.246.51.149','26/02/02',NULL);
INSERT INTO news_ans VALUES (29,'N00054','ตู้เย็นประหยัดไฟเบอร์ 5 ไหมครับ แล้วราคาเท่าไหร่ครับ <img src=\"pics/frown.gif\">','K','','161.246.5.215','10/03/02',0);
INSERT INTO news_ans VALUES (32,'N00054','เบอร์ 5 ครับ ส่วนราคา อยู่ในช่วงประมาณ 3600 บาท  ต่อรองกันได้ ','ชิต','','161.246.51.218','02/04/02',0);

#
# Table structure for table 'news_data'
#

CREATE TABLE news_data (
  code varchar(6) NOT NULL default '',
  detail text,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'news_data'
#

INSERT INTO news_data VALUES ('N00000','ชมรมเปตองลาดกระบัง แข่ง Open วันที่ 30 มกราคม 2545 ครับ ค่าสมัคร 50 บาทครับ ประเภททีม 2 คนครับ หญิงก็แข่งได้นะครับ มีแต้มต่อให้ครับ เงินรางวัลมากมายมหาศาลครับ ติดต่อที่ชมรมเปตองได้ครับหน้าโรงยิมวิศวกรรมศาสตร์ หรือที่พี่แบงค์ห้อง Olala','29/07/02');
INSERT INTO news_data VALUES ('N00002','สมัครได้ฟรีครับ ไม่เสียเงินติดต่อที่หน้าโรงยิมวิศวะ ได้ครับ ถ้ามีคนเล่นอยู่ครับ ใจดีครับ ไม่กัดครับ','29/07/02');
INSERT INTO news_data VALUES ('N00005','คงได้ติดตามชมกันถ้วนหน้า บอลคู่หยุดโลก แมนยู - ลิเวอร์พูล <br>\n<br>\nผลที่ออกมา ก็หักปากกาเซียนพอสมควร เมื่อ &quot;แดนนี่ เมอร์ฟี่&quot; โชว์ทีเด็ดอีกแล้วครับท่าน! ซัดประตูชัย ให้หงส์ฟื้นคืนชีพ ฝังผีลงหลุมไปอีกครั้ง 1-0 เล่นกันได้ดุเด็ดเผ็กมันส์ตลอด 90 นาที <br>\n<br>\nใครมีข้อคิดเห็นหลังเกม นี้อย่างไร ก็ว่ากันไปครับ ... <br>\n<br>\nสถิติข้อมูลแมทช์นี้ ติดตามได้ที่ Soccernet.com <br>\n  <br>\n  <br>\n <br>\n','29/04/02');
INSERT INTO news_data VALUES ('N00006','อย่าลืมครับวันที่ 31 มกราคม 2545 5 โมงเย็นถึง 5 ทุ่มมี concert ที่หอประชุมใหญ่ของสถาบันครับ ใครเป็น guard  อย่าลืมมาในงานนะครับ ได้ข่าวว่า มี Note and Toon มาด้วยนะครับ มี grove rider  กับวง asia ','29/04/02');
INSERT INTO news_data VALUES ('N00007','PRU S.E. [SPECIAL EDITION]<br>\n03 เมษายน 2544 ก้าวแรกของความฝันบนถนนดนตรีของชายทั้ง 4 คน <br>\nน้อย-สุกี้-คณิณ และยอดเถาได้เริ่มขึ้น เวลาผ่านไปไม่กี่เดือนชื่อของ <br>\n&quot;พรู&quot; ก็เป็นอีกหน้าหนึ่งของกลุ่มดนตรีร็อคที่ได้พิสูจน์แล้วว่านอกจากบท<br>\nเพลงจะน่าฟังยังแสดงสดได้ดี ทุกๆที่มีความแปลกใหม่มานำเสนอจนยาก<br>\nจะคาดเดาว่าจะเป็นเช่นไร<br>\n30 ตุลาคม 2544 PRU S.E. งานเพลงฉลองความสำเร็จ พร้อมขอบ<br>\nคุณแฟนๆที่ให้การต้อนรับเกินคาดด้วยความตั้งใจจริง กับ 3เพลงใหม่<br>\n<br>\nนางฟ้า <br>\n&quot;เขาว่าเธอน่าเบื่อ โลกของเธอสีเทา เขาว่าเธองี่เง่า เขาว่าเธอนั้นแสบ และ <br>\nเธอเคยเหลวแหลก &quot; อีกร้อยพันหมื่นแสนคำบอกเล่า ไม่ว่าเธอจะเป็นใคร <br>\nเลวร้ายมาจากไหน แต่เธอก็คือ &quot;นางฟ้า&quot; อย่างน้อยก็สำหรับฉัน<br>\n<br>\nรักเธอจนจบชีวิต <br>\nบทเพลงแห่งความเศร้าเมื่อตึกเวิร์ลเทรดเซ็นเตอร์ถูกเครื่องบินที่ผู้ก่อการร้าย<br>\nจี้พุ่งชนระเบิดคร่าชีวิตผู้บริสุทธิ์นับพันทันที แต่อีกหลายความรู้สึกบนยอดตึก<br>\nต่างรอคอยความหวังแม้รู้ว่าตัวเองจะต้องจบชีวิตในอีกไม่กี่นาทีข้างหน้า แวว<br>\nตาบ่งบอกความคิดถึง ห่วงใยที่มีต่อคนรักเป็นแรงผลักดันให้น้อย-กฤษดาแต่ง<br>\nเพลงนี้ขึ้นมาจากก้นบึ้งของอารมณ์เป็นสื่อแทนความหวัง กำลังใจให้รู้ว่าจะ<br>\n&quot;รักเธอจนจบชีวิต&quot;<br>\n<br>\nกระทู้<br>\nเครื่องมื่อสื่อสารยุคไฮเทคไวเท่าความคิดบทวิจารณ์อิสระบนหน้าจอคอมพิว<br>\nเตอร์ที่เป็นดาบ 2 คม พร้อมสร้างสรรค์ และ ทำลายได้ในเวลาเดียวกัน <br>\nน้อย-กฤษดาเคยเล่าให้ฟังว่าหลายครั้งที่มีคนต่อว่าการแสดงออก Fake บ้าง <br>\nOver บ้างล่ะ สิ่งเหล่านี้หลายครั้งทำร้ายความรู้สึกใหม่ๆที่ได้อ่าน ทำลายความ<br>\nมั่นใจที่ได้ยินจากคำบอกเล่า แต่เขาถือว่าเป็นกระจกเงาสะท้อนความคิดแง่มุม<br>\n','29/04/02');
INSERT INTO news_data VALUES ('N00008','เอฟเอคัพรอบ4 เบิร์กแคมป์ฮีโร่ ปืนเฉือนหงส์ 1-0 เกมเดือดใบแดงว่อน!! <br>\n<br>\nฟุตบอลเอฟเอคัพรอบ 4 บิ๊กแมตช์ คู่ระหว่างอาร์เซน่อล พบกับ ลิเวอร์พูลที่สนามไฮบิวรี่ ผลปรากฏว่า อาร์เซน่อลเอาชนะลิเวอร์พูลไปได้เฉียดฉิว 1-0 โดยเกมนี้มีการแจกใบแดงกันว่อนถึง 3 ใบด้วยกัน <br>\n<br>\nเริ่มต้นการแข่งขัน ทั้งสองฝ่ายต่างยังคงไม่รีบเปิดเกมรุกเข้าใส่กันมากนักเนื่องจากฟุตบอลรายการนี้แพ้ต้องตกรอบทันที โดยอาร์เซน่อลเจ้าบ้านอาศัยการประสานงานกันของเดนนิส เบิร์กแคมป์ กับ เธียร์รี่ อองรีเป็นหลัก ส่วนทางด้านทีมเยือน ก็มีนิโกล่าส์ อเนลก้า กับ ไมเคิ่ล โอเว่น เป็นอาวุธร้ายในเกมโต้กลับเร็ว โดยในนาทีที่ 28 เดนนิส เบิร์กแคมป์ ได้บอลจากการเปิดบอลของ เธียร์รี่ อองรี ที่ทำชิ่งกับฟาน บรองฮอร์ส อย่างสวยงาม เข้ามาที่หน้าประตู หัวหอกดัตช์โแบเข้ามาโหม่ง ส่งบอลผานมือ เจอร์ซี่ ดูเด็คเข้าประตูไป ให้อาร์เซน่อล ขึ้นนำ ลิเวอร์พูลไป 1-0 หลังจากที่ได้ประตูขึ้นนำ อาร์เซน่อลก็ได้ใจ โหมบุกทีมเยือนอย่างหนัก แต่ก้ไม่สามารถทำประตูเพิ่มได้ หมดครึ่งเวลาแรก อาร์เซน่อลนำลิเวอร์พูลอยู่ 1-0 <br>\n<br>\nครึ่งหลัง เกมเริ่มทวีความรุนแรงมากขึ้น โดยลิเวอร์พูลได้โอกาสบุกมากขึ้นกว่าในครึ่งเวลาแรก นาทีที่ 49 เธียร์รี่ อองรีพยายยามโหม่งเคลียร์บอลจากลูกที่ลิเวอร์พูลได้เตะมุมแต่พลาดไปกระแทกไหล่ของฮูเปียอย่างจังทำให้แพทย์ต้องวิ่งมาดูอาการอองรีทันที เกมดำเนินมาถึงนาทีที่ 67 มาร์ติน คีโอว์น ต้องถูกใบแดงเป็นคนแรกของเกม จากจังหวะที่ทำฟลาวส์ไมเคิ่ล โอเว่นที่กำลังจะได้หลุดเข้าไปยิง คีโอว์นเถียงผู้ตัดสินมากไป ทำให้ผู้ตัดสินชูใบแดง ไล่ออกจากสนามไป <br>\n<br>\nอีก 2 นาทีถัดมา ผู้ตัดสินก็ทำการแจกใบแดงอีก 2 ใบ โดยเดนนิส เบิร์กแคมป์ ผู้ทำประตูแรกเข้าบอลใส่เจมี่ คาราเกอร์โดยเจตนาจะย่ำ คาราเกอร์ ผู้ตัดสินจึงไม่ลังเล ชูใบแดงไล่เบิร์กแคมป์ออกจากสนามเป็นคนที่สองของทางด้านอาร์เซน่อล ซึ่งยังไม่ทันจะเป่านกหวีดให้เริ่มเล่นบอลต่อ เจมี คาราเกอร์ ของทางลิเวอร์พูลก็มาโดนใบแดง ต้องออกจากสนามบ้าง จากจังหวะที่ผผู้ตัดสินหันไปเห็นคาราเกอร์ เขวี้ยงของใส่คนดูข้างสนาม ทำให้เกมรุนแรงมากขึ้นไปอีก โดยนักเตะทั้งสองฝ่ายตัดเกมกันอย่างหนัก ลิเวอร์พูลแม้ว่าจะมีผู้เล่นมากกว่าอาร์เซน่อล แต่ก็ยังไม่สามารถทำประตูตีเสมอเจ้าบ้านได้ หมดเวลาการแข่งขัน อาร์เซน่อล จึงล้างแค้นลิเวอร์พูลได้สำเร็จ เอาชนะไปได้ 1-0 ผ่านเข้าไปเล่นในรอบต่อไป ส่วนลิเวอร์พูลต้องตกรอบไปตามระเบียบ <br>\n<br>\n  <br>\n <br>\nLink ที่เกี่ยวข้อง   <a href=\"http://www.hotlinesoccer.com/th/readnews.asp?newsid=12731\" target=\"www.hotlinesoccer.com/th/readnews.asp?newsid=12731\">http://www.hotlinesoccer.com/th/readnews.asp?newsid=12731</a> <br>\n','29/04/02');
INSERT INTO news_data VALUES ('N00009',' หนูเยาวชน 20 ปีไทยคืนฟอร์มเปิดฉากรุมถลกหนังเสือ มาเลเซียไปอย่างท่วมท้น 8-1 เอกพันธ์ อินทเสนเหมาคนเดียว 4 ลูก ส่งผลให้ไทยเข้าสู่รอบรองชนะเลิศเป็นที่เรียบร้อยแล้ว ชนเวียดนามที่ถล่มบรูไน 4-0 ในวันที่ 1 ก.พ.นี้ อีกคู่สิงคโปร์เปิดฉากยำ อินโดนีเซีย 3-1 ในการแข่งขันฟุตบอลเยาวชน 20 ชิงแชมป์อาเซียน ที่สนามศูนย์กีฬาธรรมศาสตร์ รังสิต ท่ามกลางแฟนบอลหนาตา เมื่อวันที่ 28 ม.ค.ที่ผ่านมา <br>\n ','29/04/02');
INSERT INTO news_data VALUES ('N00010','มางานด้วยนะครับวัน เสาร์นี้วันที่ 2 กุมภาพันธ์ 2545 ห้อง 3p เท่านั้นนะครับ ถ้าจะเอาโต๊ะเพิ่ม โต๊ะละ 1200 บาทครับ มีปัญหาเรื่องโต๊ะติดต่อสโมสรต่อเนื่องนะครับ ข้างหอประชุมใหญ่สถาบันนะครับเวลา 18.00น เป็นต้นไป ขอย้ำงานนี้ฟรี 20 ท่านนะครับ','29/04/02');
INSERT INTO news_data VALUES ('N00050','ตู้เย็น + รถจักรยาน + โต๊ะเขียนหนังสือ จบแล้วเลยขาย ขนกลับบ้านลำบาก  เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ 01-5501047','28/05/02');
INSERT INTO news_data VALUES ('N00052','มีร้านอินเตอร์เน็ทเปิดใหม่ที่ ซ.เกกีงาม 3 ขอเชิญไปใช้บริการได้ ชม.ละ 18 บาท เท่านั้นเอง ใช้ทำงานหรือเล่นเกมส์ก็ได้นะครับ เครื่องใหม่หมด มีลิขสิทธิ์ถูกต้องทุกอย่างครับ ไม่ต้องกลัวตำรวจหรือ เจ้าหน้าที่Microsoft ครับ เปิดบริการทุกวันครับ ตั้งแต่ช่วงบ่ายจนถึงดึกดื่น<br>\n<br>\n','06/06/02');
INSERT INTO news_data VALUES ('N00017','&quot;หงส์แดง&quot; ลิเวอร์พูลฟอร์มกระฉูดบุกถล่ม &quot;ยูงทอง&quot; ลีดส์ ยูไนเต็ด คารัง 4-0 โดยหงส์แดงได้ประตูขึ้นนำจากการสกัดเข้าประตูตัวเองของริโอ เฟอร์ดินานด์ ในนาทีที่16 ส่วนอีกสามลูกได้ในครึ่งหลังจาก เอมิล เฮสกี้ ที่เหมาคนเดียว 2 ประตูในนาทีที่ 60,62 และมาได้ประตูย้ำชัยชนะจาก ไมเคิ่ล โอเว่น ในนาทีสุดท้าย ทำให้หงส์แดงตามหลังจ่าฝูง &quot;ปีศาจแดง&quot; แมนเชสเตอร์ ยูไนเต็ด2แต้ม ในศึกพรีเมียร์ชิพ เมื่อวันอาทิตย์ที่ 3 ก.พ. ที่ผ่านมา <br>\n<br>\n','04/03/02');
INSERT INTO news_data VALUES ('N00065','หลังจากที่ทางบริษัทซันไมโครซิสเต็มส์ (ประเทศไทย) จำกัด ทำการแจกรวมไปถึงการให้ดาวน์โหลดโปรแกรม &quot;ออฟฟิศ ปลาดาว&quot; ไปใช้ฟรี ปรากฏว่ามีผู้สนใจไปรับแจกและดาวน์โหลดไปเป็นจำนวนมาก จนก่อให้เกิดกระแส &quot;ปลาดาว ฟีเวอร์&quot; ไปทั่วบ้านทั่วเมือง แต่ก่อนหน้านั้นไม่นานทางเนคเทค(NECTEC) หรือศูนย์เทคโนโลยีอิเล็กทรอนิกส์และคอมพิวเตอร์แห่งชาติเพิ่งประกาศเปิดตัว Linux TLE 4.1 หรือที่เรียกกันคุ้นปากว่า ลีนุกซ์ ทะเล และ Linux SiS ทำให้กระแสวงการ Linux ตื่นขึ้นอีกครั้ง <br>\nจากการเปิดตัวโปรแกรมแจกฟรีของสองค่าย ทำให้ผู้คนอยากจะรู้ว่าถ้าจะเอาโปรแกรมโอเพนซอร์สทั้งคู่มาทำงานร่วมกันจะเป็นอย่างไร เพราะเมื่อโปรแกรม &quot;ออฟฟิศ ปลาดาว&quot; ออกมาแรกๆ คนสนใจที่จะนำโปรแกรมนี้ไปใช้กับวินโดว์ส เพื่อจะดูว่าสามารถทำงานทดแทนตัวไมโครซอฟท์ออฟฟิศได้อย่างที่คุยไว้หรือไม่ ซึ่งผลการทดสอบจากหลายๆ สำนักก็บอกออกมาว่า สามารถทำงานทดแทนกันได้เป็นอย่างดี แต่ก็ยังไม่มีใครนำเอา &quot;ออฟฟิศ ปลาดาว&quot; มาลง &quot;ลีนุกซ์ ทะเล&quot; ดูสักที ไหนๆ ก็เป็นเรื่องที่น่าสนใจสำหรับคนทั่วไปแล้ว ทาง &quot;ฐานเศรษฐกิจ&quot; ร่วมกับ นิตยสาร CHIP ก็เลยลองพิสูจน์นำ &quot;ออฟฟิศ ปลาดาว&quot; มาทำงานคู่กับ Linux TLE 4.1 ดูว่า จะทำได้ดีแค่ไหน จับปลาดาวลงทะเล <br>\n<br>\nในการทดสอบ เราได้ติดตั้ง Linux TLE 4.1 ลงบนเครื่อง Celeron 1GHz แรม 128 MB ฮาร์ดดิสก์ 40 GB แล้วทำการแบ่งพาร์ติชันออกเป็น 3 ส่วน คือ ส่วนของ Linux Ext สำหรับติดตั้งลีนุกซ์ทะเลจำนวน 3GB ส่วนของ Linux Swap สำหรับการติดตั้ง Swap File จำนวน 300 MB และส่วนที่เหลือติดตั้งเป็นพาร์ติชันสำหรับเก็บข้อมูลจำนวน 5GB <br>\n<br>\nซึ่ง Linux TLE 4.1 มีการใช้รากฐานในการพัฒนาจากตัว Linux Redhat (เปลี่ยนจากเดิมในเวอร์ชัน 4.0 ที่ใช้การพัฒนาจาก Redmond Linux ด้วยเหตุผลทางด้านความเสถียรในการทำงาน) และมีการพัฒนาอินเตอร์เฟสในหลายๆ อย่างให้ผู้ใช้สามารถเข้าใจและใช้งานได้ง่าย อาทิ การแสดงผลเป็นภาษาไทยทั้งหมด เป็นต้น <br>\n<br>\nในการติดตั้งเราเลือกการติดตั้งเป็นแบบเวิร์กสเตชัน เลือกการใช้งานทุกแพ็กเกจ รวมพื้นที่ที่ใช้ประมาณ 1 GB โดยใช้เวลาการติดตั้งประมาณ 30 นาที ในขั้นตอนการติดตั้งคุณสามารถเลือกได้ว่าจะติดตั้งเป็นแบบ Text Mode หรือ Graphic Mode ขอแนะนำว่าสำหรับมือใหม่ ควรใช้แบบ Graphic Mode จะดีกว่า ด้วยเคอร์เนล 2.4.9 ทำให้ Linux TLE 4.1 สามารถค้นหาและใช้งานอุปกรณ์ตัวใหม่ๆ ได้ หลังจากติดตั้งแล้วเริ่มทดลองใช้ พบว่าตัว Linux TLE 4.1 ใช้งานได้ดีกว่าเวอร์ชันเก่ามาก การเลือกใช้อินเตอร์เฟสที่เป็นภาษาไทย ทำให้การทำงานสำหรับชาวเพนกวินมือใหม่เป็นไปได้อย่างราบรื่น <br>\n<br>\nจากนั้นเราได้ทำการติดตั้งโปรแกรม &quot;ออฟฟิศ ปลาดาว 1.0&quot; จากแผ่นที่ทางบริษัทซัน ไมโครซิสเต็มส์ (ประเทศไทย) จำกัด แจกในงานวันเปิดตัว การติดตั้งเป็นไปอย่างสะดวกง่ายดาย ด้วยคำสั่ง Auto Run อีกทั้งคุณไม่ต้อง/mount/cdrom ก่อน เนื่องจากตัวโปรแกรม Linux TLE 4.1 หาไดร์ฟซีดีเจออยู่แล้ว ในการติดตั้งเราเลือกการติดตั้งชุดการติดตั้งแบบทั่วไป ใช้เวลาในการติดตั้งทั้งหมดประมาณ 45 นาที <br>\n<br>\nหลังการติดตั้งเราพบปัญหาเล็กน้อยในการเรียกโปรแกรม &quot;ออฟฟิศ ปลาดาว&quot; ขึ้นมาใช้ เนื่องจากโปรแกรมไม่ได้มีการติดตั้งลิงก์ของโปรแกรมต่างๆ ลงไปในเมนูเหมือนกับที่ใช้ในวินโดวส์ การใช้งานคุณจึงต้องไปเรียกจากไดเร็กตอรี /root/PladaoOffice1.0 แล้วเข้าไปเลือกในโฟลเดอร์ Program ส่วนการเรียกจากลิงก์ soffice จะเป็นการเรียกโปรแกรม Writer ขึ้นมาเพียงตัวเดียว <br>\n<br>\nเมื่อเข้าไปใน/root/PladaoOffice1.0/program ให้คุณหาชุดโปรแกรมทั้งห้าตัวของ &quot;ออฟฟิศ ปลาดาว&quot; คือ swriter, scalc, simpress, smath และ sdraw จากนั้นให้คุณทำการลิงก์โปรแกรมไปไว้บนเดสก์ท็อป เพื่อความสะดวกในการเรียกใช้งาน <br>\n<br>\nในการทดสอบการใช้งานโปรแกรมต่างๆ พบว่า Linux TLE 4.1 สามารถรันโปรแกรม &quot;ออฟฟิศ ปลาดาว&quot; ได้เป็นอย่างดี แต่ก็มีข้อติดขัดอยู่บ้างตรงที่การเรียกโปรแกรมแต่ละตัวขึ้นมาใช้งานนั้น ใช้เวลาในการโปรเซสค่อนข้างนาน โดยใช้เวลาประมาณ 8 วินาที ในขณะที่เมื่อเรียกใช้โปรแกรม &quot;ออฟฟิศ ปลาดาว&quot; บนวินโดว์ส การเรียกใช้งานโปรแกรมต่างๆ ใช้เวลาเพียง 1-2 วินาทีเท่านั้น <br>\n<br>\nในด้านการใช้งาน &quot;ออฟฟิศ ปลาดาว&quot; สามารถใช้งานได้เป็นปกติไม่มีปัญหาหรือข้อติดขัดอะไรอีกทั้งยังสามารถเรียก Help ขึ้นมาใช้งานได้ด้วย ซึ่งในส่วนของวินโดว์สไม่สามารถเรียกขึ้นมาได้ การเรียกไฟล์ในตระ<font color=red>***</font>ลไมโครซอฟท์ออฟฟิศมาใช้งานจากไดเร็กตอรี่อื่นบนเครือข่ายก็สามารถเรียกใช้ได้ไม่มีปัญหา แม้ว่าจะใช้เวลาเปิดค่อนข้างนาน แต่ก็ไม่ทำให้เสียอารมณ์เกินไปนัก ปลาดาวสวยที่สุด เมื่ออยู่ในทะเลจริงหรือ? <br>\n<br>\nมีคนเคยเอ่ยขึ้นมาเมื่องานเปิดตัว &quot;ออฟฟิศ ปลาดาว&quot; ในความรู้สึกของเราหลังจากที่ทดลอง &quot;ออฟฟิศ ปลาดาว&quot; ในโอเอสหลายๆ ตัว รวมทั้งลีนุกซ์เวอร์ชันต่างๆ ด้วย อาทิ Redhat, Man-drake, TLE 4.1 และ Kaiwal 4.0 พบว่า &quot;ออฟฟิศ ปลาดาว&quot; สามารถทำงานบนโอเอสต่างๆ ได้เป็นอย่างดี ไม่มีปัญหาอะไร จึงไม่จำเป็นว่า &quot;ออฟฟิศ ปลาดาว&quot; จะต้องใช้งานบนโอเอสตัวใดตัวหนึ่งแล้วจะดีที่สุดเท่านั้น ขึ้นอยู่กับว่าภักดีกับโอเอสตัวไหนมากกว่า <br>\n<br>\n','03/04/03');
INSERT INTO news_data VALUES ('N00014','หนังสือเรียน Computer Engineer ปี1 ถึง ปี 3 เทอม 1 <br>\nsheet เก่า สมุดจด ทุกอย่าง แนวข้อสอบ ทุกอย่าง <br>\nถ้างงตรงไหน หรืออ่านม่ายออก ถ้าเป็นสาวๆ จะรับติวให้ฟรี<br>\n...ด่วน  ถ้าซื้อตอนนี้ จะแถมของปี 3 แถม 2 ให้อีก ด่วนๆๆๆๆ','30/04/02');
INSERT INTO news_data VALUES ('N00015','บริษัท เอ.อาร์.อินฟอร์เมชัน แอนด์ พับลิเคชันจำกัด<br>\nผู้ผลิตสื่อสิ่งพิมพ์คอมพิวเตอร์ชั้นนำ ต้องการรับสมัครบรรณาธิการและผู้ช่วยบรรณาธฺการหนังสือคอมพิวเตอร์ คุณสมบัติดังนี้<br>\n- จบปริญญาตรีด้านคอมพิวเตอร์<br>\n- รักการอ่าน ขอบงานเขียน<br>\n- สามารถถ่ายทอดความรู้ออกมาเป็นตัวหนังสือได้<br>\n- มีความรับผิดชอบ และทำงานเป็นทีมได้','31/05/02');
INSERT INTO news_data VALUES ('N00018','วันอังคารที่ 5 กุมภาพันธ์ 2545 สถานที่ ร้านสมพงษ์ หมูกระทะ ตรงข้าม รพ.จุฬารัตน์ 7 นัดเจอที่ Plaza เวลา 19.45-20.15 โดยพร้อมเพรียงกัน(มาไม่ทันต้องตามไปเอง) ติดต่อสอบถาม 1) แม็ก 026682744 กด 1 2) โม่ 028777998 กด ','04/03/02');
INSERT INTO news_data VALUES ('N00056','งานด่วน &amp;Print งาน (รับปรึกษา AutoCAD)<br>\nTel 098901425(พี่หนิง)<br>\nซ.ฉลองชัย 1 ติดกับ ม.รุ่งอรุณ 1 บริการรับส่งต้นฉบับ รับรองคุณภาพ ตรงต่อเวลา','12/03/03');
INSERT INTO news_data VALUES ('N00053','บริษัทสปอร์ตทรอน <br>\nจำกัด เป็นผู้ดำเนินธุรกิจอาหารเสริมสุขภาพ เฟรน ไชส์<br>\nจากสหรัฐอเมริกา มีความประสงค์จะรับบุคลากรด้านคอมพิวเตอร์ ซึ่งมีคุณสมบัติดัง นี้<br>\nProgrammer <br>\n<br>\n-เพศชาย/หญิง<br>\n-วุฒิปริญญาตรี/โท<br>\n-มีความรู้ด้านการเขียนโปรแกรม Visual Basic<br>\n-มีความรู้ในการใช้งาน Windows NT, Windows 2000 และระบบเครือข่าย<br>\n-ไม่จำเป็นต้องมีประสบการณ์ผู้สนใจส่งจดหมายสมัครงาน, ประวัติการทำงาน, รูปถ่าย พร้อมระบุเงินเดือนที่ต้องการ<br>\nมาที่ ฝ่ายบุคคล บริษัทสปอร์ตทรอน <br>\nจำกัด เลขที่ 252/235 ชั้น 3 อาคาร<br>\nเมืองไทยภัทร คอมเพล็อกซ์ แขงห้วยขวาง เขตห้วยขวาง กรุงเทพมหานคร 10320 โทรศัพท์ <br>\n02-276-1234ผู้สนใจส่งจดหมายสมัครงาน, ประวัติการทำงาน, รูปถ่าย พร้อมระบุเงินเดือนที่ต้องการ มาที่ ฝ่ายบุคคล บริษัทสปอร์ตทรอน (ประเทศไทย) จำกัด เลขที่ 252/235 ชั้น 3 อาคาร เมืองไทยภัทร คอมเพล็อกซ์ แขงห้วยขวาง เขตห้วยขวาง กรุงเทพมหานคร 10320 โทรศัพท์ 02-276-1234<br>\n','08/09/02');
INSERT INTO news_data VALUES ('N00019','ไปดูเวป Orange มาครับ เลยเก็บมาฝากน้องๆ ที่กำลังหางานอยู่<br>\n<a href=\"http://www.orange.co.th/jobs/engineering.htm\" target=\"www.orange.co.th/jobs/engineering.htm\">http://www.orange.co.th/jobs/engineering.htm</a><br>\n','06/05/02');
INSERT INTO news_data VALUES ('N00054','ตู้เย็น + ตู้เสื้อผ้า จบแล้วเลยขาย ขนกลับบ้านลำบาก เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ 01-7324318','10/05/02');
INSERT INTO news_data VALUES ('N00055','รับถ่ายรูป Project เพื่อการนำเสนอ Project ด้วยกล้อง ดิจิตอล NIKON ความละเอียด 3.3 ล้าน Pixel ในราคา 30 รูป 10 บาทกรุณานำแผ่น Folppy disk มาด้วย 2 แผ่น มาเก็บข้อมูล)<br>\nติดต่อ KEN 015394008 ตลอด 24 ชม.','11/03/03');
INSERT INTO news_data VALUES ('N00057','ธุรกิจซอฟต์แวร์กับการแก้ไขกฎหมายลิขสิทธิ์ <br>\n13 มีนาคม 2545 <br>\n <br>\n สืบเนื่องจากความพยายามในการปรับปรุงกฎหมายลิขสิทธิ์ฉบับปี พ.ศ. 2537 เพื่อให้มีความทันสมัยต่อการเปลี่ยนแปลงของโลกในยุคปัจจุบัน ในการรวบรวมความคิดเห็นเพื่อประกอบแนวทางในการปรับปรุงกฏหมายครั้งนี้ ได้ให้ความสำคัญกับอุตสาหกรรมซอฟต์แวร์ในการรวมกันกำหนดแนวทางป้องกันการละเมิดทรัพย์สินทางปัญญา โดยตัวแทนของสมาคมได้เสนอแนวทางที่เป็นจุดยืน 7 ประเด็น ในการปรับปรุงกฎหมายลิขสิทธิ์ที่เกี่ยวข้องกับอุตสาหกรรมซอฟต์แวร์ของประเทศไทย ประกอบด้วย <br>\n<br>\nรูปแแบบของการละเมิดธุรกิจซอฟต์แวร์มีรูปแบบของการกระทำที่ละเมิดลิขสิทธิ์ ได้หลายรูปแบบเริ่มจากการทำสำเนาซอฟต์แวร์เพื่อจำหน่ายหรือที่รู้จักดีในชื่อ แผ่นก็อป&lt;font color=red&gt;***&lt;/font&gt; , การละเมิดด้วยการบันทึกลงในเครื่องคอมพิวเตอร์พร้อมจำหน่าย , การทำซ้ำภายในองค์กรทั้งภาครัฐและเอกชน กรณีนี้เป็นการละเมิดที่รุนแรงที่สุดคิดเป็นการละเมิดร้อยละ 50 ของความเสียหายในการละเมิดลิขสิทธิ์ซอฟต์แวร์ทั้งหมด และรูปแบบการละเมิดที่กำลังมาแรงที่สุดด้วยการดาวน์โหลดซอฟต์แวร์จากอินเทอร์เน็ต <br>\nบทลงโทษ เมื่อเปรียบเทียบทรัพย์สินทางปัญญาที่แลกมาด้วยความรู้ความคิดสร้างสรรค์ การปรับเพียง 8 แสนบาท สำหรับผู้ที่กระทำความผิดเป็นวงเงินที่น้อยเกินไปสำหรับการที่จะทำให้คนทำผิดเข็ดหลาบ ดังนั้นควรที่จะมีบทลงโทษที่มากขึ้น นอกจากนี้กฎหมายจะป้องกันงานที่ทำซ้ำในระยะเวลา 5 ปี เป็นเวลาที่นานเกินไป เนื่องจากการพัฒนาซอฟต์แวร์มีผลิตภัณฑ์ออกสู่ตลาดอย่างน้อยปีละ 2 ครั้งระยะเวลาที่คุ้มครองน่าจะสั้นกว่าเดิม การลงโทษก็ควรที่จะดำเนินการจริงจังให้ถึงตัวผู้ที่กระทำความผิดอย่างแท้จริง และประเด็นที่กำลังถกเถียงมากที่สุดคือ เจ้าของสถานที่ที่มีการจำหน่ายซอฟต์แวร์ละเมิดลิขสิทธิ์ควรมีส่วนรับผิดชอบด้วย โดยเฉพาะเจ้าของสถานที่ที่รู้ว่ามีการจำหน่าย และประเด็นสำคัญที่สุดที่ต้องพิจารณาในกฎหมายฉบับใหม่คือ การเอาผิดกับผู้ซื้อที่ทางสมาคมฯ เห็นว่า ถ้าผู้ซื้อรู้ว่าเป็นการละเมิดลิขสิทธิ์ผู้ซื้อน่าจะมีส่วนรับผิดชอบ <br>\nบทบาทของการคุ้มครองทรัพย์สินทางปัญญา มีการพบว่า การละเมิดลิขสิทธิ์ซอฟต์แวร์บางกรณีไม่ได้บันทึกซอฟต์แวร์ลงในหน่วยความจำหลักของเครื่องแต่นำมาเก็บไว้ในหน่วยความจำชั่วคราว เพื่อใช้ซอฟต์แวร์ทำงาน เมื่อทำเสร็จผู้ละเมิดจะลบซอฟต์แวร์ทิ้ง หรือบางกรณีมีการเก็บซอฟต์แวร์ไว้ในเครื่องแม่ข่ายกลาง และทำการดาวน์โหลด หรือเรียกออกมาเพื่อใช้งานพบมากในองค์กรธุรกิจที่มีจำนวนเครื่องลูกข่ายจำนวนมาก วิธีนี้หากไม่มีการควบคุมการขยายตัวของเครื่องแม่ข่ายจะทำให้การละเมิดรุนแรงมากขึ้น และหากในอนาคตอินเทอร์เน็ตมีความรวดเร็วในการบริการมากขึ้นจะให้การกระทำผิดมีมากขึ้นด้วย<br>\nเนื้อหาที่เป็นอิเล็กทรอนิกส์ ยังไม่มีความชัดเจนในแนวทางคุ้มครองลิขสิทธิ์สำหรับเนื้อหาที่อยู่ในเว็บไซต์ การเติบโตของการบริการข้อมูลผ่านเว็บไซต์ และอีเลิร์นนิ่ง เป็นประเด็นที่น่าเป็นห่วง หากไม่มีการปกป้องบริการเนื้อหาผ่านเว็บไซต์<br>\nเทคโนโลยีป้องกัน ปัจจุบันการเก็บหลักฐานในการละเมิดลิขสิทธิ์ซอฟต์แวร์จากเครือข่ายยังไม่สามารถทำได้ ทำให้มีกำเนิดของเทคโนโลยีป้องกันที่เรียกว่า Technology Rights Management และเทคโนโลยีป้องกันที่ฝังไว้กับเนื้อหา รวมถึงระบบการบันทึกการทำงานของหน่วยความจำชั่วคราว เพื่อเก็บหลักฐานว่า มีการใช้ซอฟต์แวร์ละเมิดลิขสิทธิ์หรือไม่อย่างไร<br>\nองค์กรจัดเก็บสำหรับอุตสาหกรรมซอฟต์แวร์คงไม่มีความจำเป็นต้องมีองค์กรจัดเก็บค่าลิขสิทธิ์เหมือนกับทรัพย์สินทางปัญญาประเภทอื่น เมื่อการจำหน่ายเกิดขึ้นแล้วจึงเป็นหน้าที่ขององค์กรเอกชนเจ้าของลิขสิทธิ์ที่จะหาทางพิทักษ์สิทธิ์ และเมื่อพบว่ามีการกระทำความผิดจะเป็นหน้าที่ของเจ้าหน้าที่ตำรวจดำเนินการ <br>\nบทบาทของผู้ให้บริการอินเทอร์เน็ต เป็นข้อถกเถียงที่ยังไม่ได้ข้อสรุปว่า ไอเอสพี หรือบริษัทผู้ให้บริการอินเทอร์เน็ต ควรมีส่วนรับผิดชอบต่อเนื้อหาที่มีการละเมิดบนอินเทอร์เน็ต ในฐานะผู้ให้เช่าพื้นที่สำหรับเว็บไซต์<br>\nทั้ง 7 ข้อเป็นปัญหาที่ตรงกับความต้องการของอุตสาหกรรมซอฟต์แวร์ไทย หากต้องการให้มีการพัฒนาต่อไปอย่างมีศักยภาพ จำเป็นต้องแก้ไขปัญหาการละเมิดให้หมดไป หรืออย่างน้อยให้เบาบางลงมากที่สุด หากได้รับการตอบสนองในข้อเสนอที่เสนอข้างต้น สมาคมอุตสาหกรรมซอฟต์แวร์ไทย เชื่อว่าจะประโยชน์โดยตรงกับผู้ประกอบการในธุรกิจซอฟต์แวร์ ประเด็นที่กังวลคือ การตอบรับข้อเสนอเหล่านี้ ยังไม่มีความชัดเจนในระดับนโยบายนัก ในทางปฎิบัติข้อเสนอบางข้อไม่สามารถกำหนดออกมาเป็นกฎหมายรวมกับปัญหาการละเมิดลิขสิทธิ์ได้ <br>\n<br>\nความเห็นของนักธุรกิจในวงการผู้ให้บริการอินเทอร์เน็ตท่านหนึ่ง แสดงความกังวลถึงการคุ้มครองเนื้อหาที่เป็นอิเล็กทรอนิกส์บนเว็บไซต์ที่ยังไม่มีความชัดเจน ในส่วนของกฎหมายยังไม่ได้ให้ความคุ้มครองเนื้อหาบนอินเทอร์เน็ต ขณะที่ในทางปฎิบัติไม่มีกำหนดว่า ใครจะเป็นผู้รับผิดชอบเนื้อหาในเว็บไซต์ มีการเกี่ยงกันระหว่างเจ้าของเว็บไซต์หรือเว็บมาสเตอร์ ที่น่าจะมีส่วนเกี่ยวข้องโดยตรง <br>\n<br>\nไอเอสพีผู้ให้บริการพื้นที่สำหรับเว็บไซต์ ที่เคยได้แสดงความเห็นในการประชุมกรรมการไอเอสพีว่า หากต้องมารับผิดชอบการกระทำหน่วยงานกำกับอย่างองค์การโทรศัพท์แห่งประเทศไทย (ทศท.) และการสื่อสารแห่งประเทศไทย (กสท.) ก็ควรจะมีส่วนรับผิดชอบด้วย ในที่สุดประเด็นนี้ยังไม่มีความชัดเจน<br>\n<br>\nสิ่งสำคัญอีกประการหนึ่งที่สมาคมอุตสาหกรรมซอฟต์แวร์ไม่ได้บรรจุเอาไว้ในข้อเสนอ 7 ข้อ คือ ปัญหาการละเมิดชื่อที่อยู่บนอินเทอร์เน็ต หรือโดเมนเนม ปัญหาการละเมิดโดเมนเนมกำลังเริ่มขยายวงแบบเงียบๆ แต่ไม่มีใครออกมาหาทางป้องกัน ถ้าเปรียบชื่อโดเมนเนมของเว็บไซต์ที่ทำธุรกิจบนอินเทอร์เน็ต มีความสำคัญเท่ากับชื่อยี่ห้อ หรือชื่อขององค์กรห้างร้าน โดเมนเนมย่อมจะมีความสำคัญไม่น้อยในการทำธุรกิจ และเมื่อโดเมนเนมเกี่ยวข้องกับการทำการค้า คนที่รับผิดชอบน่าจะเป็นกระทรวงพาณิชย์ หรือหน่วยงานใหม่ที่จะเกิดขึ้นหลังการปฏิรูประบบราชการคาดว่าชื่อกระทรวงการค้าต้องเป็นผู้รับผิดชอบ แต่ในทางปฎิบัติผู้บริหารและผู้เชี่ยวชาญทางกฎหมายของกระทรวงพาณิชย์ยังชี้ชัดไม่ได้ว่า หน่วยงานใดต้องเป็นผู้รับผิดชอบเรื่องของโดเมนเนม ถ้าเป็นเรื่องการค้าก็ควรเป็นหน่วยงานที่เกี่ยวข้องกับการค้า แต่ควรจะเป็นการค้าภายในประเทศหรือต่างประเทศ<br>\n<br>\nในเมื่ออินเทอร์เน็ตเป็นของไร้พรมแดนที่ขายได้ตั้งแต่เชียงใหม่ถึงชิคาโก้ ส่วนถ้าจะให้กรมทรัพย์สินทางปัญญาดูแล ก็ดูเหมือนโดเมนเมนจะไม่ค่อยเกี่ยวกับเรื่องลิขสิทธิ์เท่าไร ฟังดูแล้วเหมือนกันว่า กฏหมายไทยยังไม่ได้ตั้งรับการเติบโตของเทคโนโลยีที่มีอยู่ในทุกวันนี้ ในระหว่างความกังวลนี้เองได้มีผู้เกิดความคิดขึ้นมา เป็นไปได้หรือไม่ที่จะมีกฎหมายเฉพาะที่เข้ามากำกับดูแลและป้องกันการละเมิดการกระทำความผิดด้วยเทคโนโลยี ทั้งซอฟต์แวร์ อินเทอร์เน็ต หรือโดเมนเนม โดยกฎหมายนี้ไม่เกี่ยวกับกฎหมายไอทีที่กำลังทำอยู่ แต่เป็นกฎหมายที่ให้ความชัดเจนในการคุ้มครองทรัพย์สินทางปัญญาและสิทธิ์อันชอบธรรม ผ่านช่องทางเทคโนโลยีที่มีอยู่ <br>\n<br>\n<br>\n <br>\n','15/06/02');
INSERT INTO news_data VALUES ('N00025','สำหรับพี่ๆที่ตอ้งการกล้อง CCD หรือโครงงานเล็กๆลองไปดูที่ร้านที่ซีคอน ชั้นเฟอร์นิเจอร์ฝั่งโลตัสติดศึกษาภัณ ราคาแพงแต่มีประกันดีน่าคุ้มกับการลงทุน','15/04/02');
INSERT INTO news_data VALUES ('N00027','มีร้านอินเตอร์เน็ทเปิดใหม่ที่ ซ.เกกีงาม 3 ขอเชิญไปใช้บริการได้ ชม.ละ 18 บาท เท่านั้นเอง ใช้ทำงานหรือเล่นเกมส์ก็ได้นะครับ เครื่องใหม่หมด มีลิขสิทธิ์ถูกต้องทุกอย่างครับ ไม่ต้องกลัวตำรวจหรือ เจ้าหน้าที่Microsoft ครับ','15/05/02');
INSERT INTO news_data VALUES ('N00028','รับสมัครพนักงาน Floor Service &amp; Bartender ไม่จำเป็นต้องมีประสบการณ์เพราะมีการฝึกอบรมก่อนทำงาน รายได้ 14,000 บาทต่อเดือน วุฒิขั้นต่ำ ปวส. รับเฉพาะคนที่ชอบงานด้านบริการ ถ้ามีประสบการณ์ด้านโรงแรม หรือบาร์มาก่อนจะพิจารณาเป็นพิเศษ','17/04/02');
INSERT INTO news_data VALUES ('N00029','ค่ายอาสาพัฒนาชนบทชมรมชาวเหนือ โรงเรียนบ้านเสี้ยว อ.ท่าวังผา จ.น่าน 13-27 มี.ค. 45 ติดต่อชมรมชาวเหนือ ชั้น 5 ตึกกิจกรรม ห้อง 507 หรือ 015827903,099844892','18/05/02');
INSERT INTO news_data VALUES ('N00030','&quot;มนุษย์เราเอย เกิดมาทำไม&quot;<br>\nอุปสมบท ณ วัดราชาธิวาสวิหาร กรุงเทพ ฯ<br>\nปฏิบัติธรรม(เม.ย.-พ.ค.) ณ วัดป่านาคนิมิตยต์ อ.โคกสีสุพรรณ จ.สกลนคร <br>\nสมัครได้ที่ ชมรมพุทธฯ (อยู่ข้างหลังตึก A คณะวิศวะ)ไม่เสียค่าใช้จ่ายใด ๆ ทั้งสิ้น<br>\n','18/07/02');
INSERT INTO news_data VALUES ('N00031','ณ วัดพลมานีย์ แขวงทับยาว เขตลาดกระบัง กรุงเทพ ฯ <br>\nวันเสาร์ ที่ 23 กุมภาพันธ์ 2545<br>\nวันอาทิตย์ ที่ 24 กุมภาพันธ์ 2545<br>\nเบอร์ติดต่อทางวัด 015613980.014991792','19/05/02');
INSERT INTO news_data VALUES ('N00063','ตู้เย็น +ตู้เสื้อผ้า จบแล้วเลยขาย ขนกลับบ้านลำบาก เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ ราคาต่อรองกันได้ <br>\nตู้เย็นเบอร์ 5 ประมาณ 5.9 คิว <br>\n<br>\n <br>\n','26/06/02');
INSERT INTO news_data VALUES ('N00064','สวัสดี <br>\n&gt;เพื่อนๆที่อยากหารายได้ช่วยปิดเทอมไม่ต้องขอเงินพ่อแม่เชิญทางนี้ <br>\n&gt;แต่ถ้ามีเงินเหลือเฟืออยู่แล้วก็ไม่เป็นไร <br>\n&gt;เพียงแค่เพื่อนๆ เข้ามาที่ <br>\n&gt;http:/www.way2vin.com/default.asp?refId=2343581 คำว่า refId <br>\n&gt;ใช้ตัวไอใหญ่นะมีคนพิมพ์ผิดกันมาก หน้าแรกจะมีช่องให้เพื่อนๆกรอก <br>\n&gt;First name : กรอกชื่อจริงของเพื่อนๆ <br>\n&gt;Last name: กรอกนามสกุลของเพื่อนๆ <br>\n&gt;E-mail ;กรอกอีเมล์ของเพื่อนๆ <br>\n&gt;verify;กรอกอีเมล์ของเพื่อนๆอีกครั้งเพื่อเป็นการยืนยัน <br>\n&gt;จากนั่นก็คลิดที่ sign up แล้วมันก็จะขึ้นหน้าต่อไป <br>\n&gt;จะมี user name: ชื่อเพื่อนๆที่จะต้องใช้ login เมื่อเป็นสมาชิกแล้ว <br>\n&gt;pass word ; รหัสผ่าน <br>\n&gt;gender; เพศ <br>\n&gt;birth day ;วัน เดือน ปีเกิด <br>\n&gt;Street Address; บ้านเลขที่ ซอย แขวง/อำเภอ เป็นภาษาอังกฤษเท่านั้น <br>\n&gt;city; เขตของเพื่อนๆ <br>\n&gt;state/province; อันนี้ให้เว้นไว้เพราะเป็นของอเมริกา <br>\n&gt;zip; รหัสไปรษณีย์ <br>\n&gt;country ; เลือก thailand <br>\n&gt;phone; ถ้าไม่มีก็-ไว้ <br>\n&gt;friend\'s referal ; 2343581 เป็นหมายเลขของผู้แนะนำ เป็นของเราเอง <br>\n&gt;ถ้าไม่กรอกก็สมัครไม่ได้นะ <br>\n&gt;บรรทัดต่อมาจะมีช่องสี่เหลี่ยมให้คลิกว่าจะให้เค้าส่งอีเมล์มาบอกเราเวลามีคนมาสมัครต่อจากเรารึเปล่าให้เราคลิก <br>\n&gt;แล้วข่างล่างก็จะมีอีก 5ช่องให้เลือกตามสบาย <br>\n&gt;แล้วก็กด submit จากนั้นก็รอรับเมล์จากเว็บได้เลย <br>\n&gt;ในเมล์ที่เพื่อนได้รับจะมี username และ password ที่เพื่อนลงไว้ตอนแรก <br>\n&gt;แล้วก็เอา usernameกับ password <br>\n&gt;ที่ได้มาลงในเว็บเพื่อเป็นการยืนยันการเป็นสมาชิกที่หน้าต่างของลิงค์ <br>\n&gt;เมื่อกด login ทางเว็นก็จะแสดงความยินดีกับเพื่อนๆ แค่นี้ก็เสร็จ <br>\n&gt;ส่วนเรื่องการจ่ายเงินทางเว็บจ่าย เป็น $ <br>\n&gt;โดยจะส่งเช็คเงินสดมาที่ที่อยู่ที่ให้ไว้ <br>\n&gt;โดยจะเข็คยอดเงินของเพื่อนๆทุกสิ้นเดือน โดยจะส่งมาเมื่อยอดเงินเกิน <br>\n&gt;100$ ซึงมันเกินอยู่แล้ว แค่เพื่อนๆแนะนำเพื่อนต่ออีก 2คน(หัวละ <br>\n&gt;50$)เงินจะได้ประมาณวันที่ 7-9ของทุกเดือน <br>\n&gt;ได้แล้วก็เอามาขึ้นที่ธนาคารเสียค่าธรรมเนียมให้ธนาคารนิดหน่อย <br>\n&gt;ลองคิดดูว่าถ้าเพื่อนๆทำให้มีคนสมัครได้ 100คนต่อเดือนนั่นก็คือ 5000$ <br>\n&gt;เท่ากับเท่าไรก็ลองเอา 43คูณเองก็แล้วกัน จะได้มีค่าขนมกินกันเยอะๆ <br>\n&gt; <br>\n&gt;ไม่เชื่อแล้วจะเสียใจนะ คิดว่าดีกว่าไปทำMK ,seven sleven,mc,หรืออื่นๆ <br>\n&gt;ได้ชม.ละ 24บาท วันนึงทำ5ชมได้ 144บาท ','26/04/02');
INSERT INTO news_data VALUES ('N00034','ช่อง 7 สี เปิดรับสมัครสาวไทย อายุ 18-25 ปี<br>\nเข้าร่วมประกวด<br>\n&quot;มิสไทยแลนด์ยูนิเวิร์ส ประจำปี 2545&quot; <br>\n<br>\nสมัครก่อนใครได้ที่ www.ch7.com <br>\nระหว่างวันที่ 18 - 27 กุมภาพันธ์ 2545 <br>\n<br>\n <br>\n<br>\n<br>\nสอบถามรายละเอียดเพิ่มเติม <br>\nโทร. 0-2617-6180-9 ต่อ 128, 250, 251 <br>\nE - mail : <a href=mailto:mtu@ch7.com>mtu@ch7.com</a>  <br>\n','20/05/02');
INSERT INTO news_data VALUES ('N00061','บจก.ไทยซีอาร์ที Thai CRT CO.,LTD เกรดเฉลี่ย รับสมัคร 2.7 ขึ้น 87/9 หมู่ที่ 2 ถ.สุขาภิบาล 7 ต.ทุ่งศุขลา อ.ศรีราชา จ.ชลบุรี โทร 038490220-5,038493689-96<br>\nFax 038490226,038490240','20/06/02');
INSERT INTO news_data VALUES ('N00036','เมื่อเวลา 04.00 น. วันที่ 20 ก.พ. สน.พระโขนง รับแจ้งเหตุพบศพคนยิงตัวตายในลิฟต์ ชั้น 1 ซีวันแมนชั่น เลขที่ 414 ซอยสุขุมวิท 50 แขวงพระโขนง เขตคลองเตย กทม. จึงรุดไปที่เกิดเหตุอยู่ภายในลิฟต์บริเวณชั้นที่ 1 เจ้าหน้าที่พบศพนายอัมรินทร์ เหลืองบริบูรณ์ หรือ โจ้-วงพอส อายุ 31 ปี ที่อยู่ตามบัตรประชาชนเลขที่ 264 ถนนท่าช้าง ต.อุทัยใหม่ อ.เมือง จ.อุทัยธานี สภาพศพนั่งเหยียดขาคอตกอยู่ตรงมุมขวาในชุดเสื้อยืดสีขาวคอวี กางเกงขาสั้นสีน้ำเงิน สวมรองเท้า ผมสั้นเหมือนเพิ่งสึกออกมา มีบาดแผลถูกยิงด้วยกระสุนปืนขนาด 9 มม. เข้าที่ขมับขวาทะลุซ้าย 1 นัด ตรงปลายเท้าซ้ายของผู้ตายพบปืนพกยี่ห้อกล็อก ขนาด 9 มม. ทะเบียน กท4306708 ดีเอชแซด 574 มีชื่อของผู้ตายเป็นผู้ครอบครองตกอยู่ 1 กระบอก และปลอกกระสุนปืนขนาดเดียวกันตกอยู่ 1 ปลอก นอกจากนั้นยังพบพวงกุญแจห้องซึ่งเป็นของผู้ตายตกอยู่อีก 1 พวง <br>\n<br>\nสอบปากคำนายระพิน งอยแพง อายุ 29 ปี เจ้าหน้าที่รักษาความปลอดภัยของแมนชั่นที่เกิดเหตุ ทราบว่าผู้ตายพักอยู่ห้องเลขที่ 1714 บนชั้น 7 เมื่อตอน 03.15 น. เห็นผู้ตายเดินเข้ามากับเพื่อนผู้ชาย ตอนนั้นยังสวมกางเกงขายาวลูกฟูกสีเหลือง เสื้อยืดคอวี ส่วนเพื่อนที่มาด้วยไม่ทราบชื่อ สวมเสื้อเชิ้ตสีขาว กางเกงยีนสีน้ำเงินผิวดำแดง ผมสั้น จากนั้นทั้งคู่ก็ขึ้นลิฟต์ไป คาดว่าจะไปห้องผู้ตาย จากนั้นอีกประมาณ 20 นาที เพื่อนของโจ้ก็ลงลิฟต์มาคนเดียว แล้วขึ้นรถขับออกไป ช่วงเวลาไล่เลี่ยกันโจ้ก็นุ่งกางเกงขาสั้นลงลิฟต์ตามมา แต่ไม่เจอกับเพื่อนแล้ว จากนั้นผู้ตายก็ขึ้นลิฟต์ย้อนกลับขึ้นไป ส่วนตนออกตรวจตราดูแลความเรียบร้อยตามปกติ สักพักก็มีผู้หญิงคนหนึ่งซึ่งพักอยู่ในแมนชั่นเดินลงมาบอกว่า ลิฟต์ค้างอยู่ที่ชั้น 7 ตนกับเพื่อนจึงพยายามกดเรียก กระทั่งลิฟต์เลื่อนลงมา เมื่อประตูลิฟต์เปิดออกก็พบศพโจ้ตายคาอยู่ในลิฟต์ จึงแจ้งเหตุให้ตำรวจทราบ <br>\n<br>\nต่อมาตำรวจขึ้นไปค้นหาหลักฐานในห้องของ โจ้-วงพอส พบปืนขนาด .38 อีก 1 กระบอก กระสุนปืนขนาด 9 มม. 1 กล่อง คีย์บอร์ด กีตาร์ไฟฟ้าและโน้ตเพลง &quot;เพียงหนึ่งคำ&quot; อีก 1 แผ่น โดยระบุมอบให้ผู้หญิงชื่อป้อม นอกจากนั้นไม่พบร่องรอยหรือมูลเหตุจูงใจที่จะทำให้ผู้ตายตัดสินใจคิดสั้น อย่างไรก็ตามเตำรวจได้เก็บรวบรวมหลักฐานต่างๆอย่างไดอารี่และจดหมายของโจ้ นักร้องดังไปตรวจสอบ และจะติดตามเพื่อนของโจ้ที่อยู่กับผู้ตายเป็นคนสุดท้ายมาสอบปากคำ เพื่อหาสาเหตุการฆ่าตัวตายต่อไป <br>\n<br>\nขณะที่ วิยะดา โกมารกุล นักร้องดังอีกผู้หนึ่งเจ้าของร้านที 29 ในซอยสุขุมวิท 3 ที่ โจ้-วงพอส ไปร้องประจำอยู่ เปิดเผยว่า ระยะหลังโจ้ ค่อนข้างเครียดจัด เคยใช้ปืนยิงมือซ้ายของตัวเองจนทะลุ จากนั้นก็ไปบวชเพิ่งสึกออกมาเมื่อตอนปีใหม่ ต่อมาทราบว่าโจ้มักจะใช้ยากล่อมประสาทเป็นประจำ เรื่องที่เกิดขึ้นน่าจะเป็นเพราะความเครียดของผู้ตาย <br>\n<br>\nด้าน พล.ต.ต.อดุลย์ แสงสิงแก้ว เปิดเผยว่า ในชั้นนี้ตำรวจยังไม่เชื่อว่าโจ้จะฆ่าตัวตาย ต้องตรวจสอบรายละเอียดต่างๆ อย่างคราบเขม่าดินปืนที่มือของผู้ตาย นอกจากนั้นยังมีพยานระบุว่า มีผู้หญิงชื่อ &quot;โจ้&quot; มาหานายโจ้บ่อยครั้ง อาจมีเรื่องชู้สาวเข้ามาเกี่ยวข้องด้วยก็ได้ ดังนั้น จึงต้องตามหาเพื่อนคนที่อยู่กับผู้ตายเป็นคนสุดท้ายให้เจอ เพื่อสอบถามรายละเอียดใช้เป็นแนวทางคลี่คลายคดีต่อไป<br>\n<br>\nโจ้-วงพอส เรียนจบสาขาวิศวกรรมไฟฟ้าคณะวิศวกรรมศาสตร์ สถาบันเทคโนโลยีพระจอมเกล้าพระนครเหนือ เมื่อปี 2536 ชนะเลิศการประกวดดนตรีเยาวชนชิงถ้วยพระราชทาน (ประเภทขับร้องเดี่ยว) จากนั้นในปี 2539 ร่วมกับเพื่อนตั้งวงดนตรี &quot;PAUSE&quot; ออกอัลบั้มชุดแรกชื่อ &quot;PUSH ME AGAIN&quot; ภายใต้สังกัดของเบเกอรี่มิวสิค สร้างผลงานเพลงชื่อ &quot;ที่ว่าง&quot; จนดังกระหึ่ม <br>\n<br>\n','20/05/02');
INSERT INTO news_data VALUES ('N00037','เขตอุตสาหกรรมซอฟต์แวร์ประเทศไทย (ซอฟต์แวร์พาร์ค) โดยการสนับสนุนจากสมาคมอุตสาหกรรมซอฟต์แวร์ ไทย (ATSI) และ สมาคมอุตสาหกรรมคอมพิวเตอร์ไทย (ATCI) จัดทำการทดสอบความรู้พื้นฐานทางด้านการเขียนโปรแกรมภาษาจาวาเป็นครั้งแรก เพื่อวัดระดับและผลักดันขีดความสามารถของคนทำงาน นิสิตและนักศึกษา ตลอดจนผู้ที่สนใจด้านการเขียนโปรแกรมด้วยภาษาจาวา โดยจะดำเนินการสอบทั่วประเทศทั้งหมด 4 ภาค คือที่ กรุงเทพฯ เชียงใหม่ ขอนแก่น และหาดใหญ่ กำหนดการสอบในวันเสาร์ที่ 9 มีนาคมนี้ ผู้สนใจร่วมทดสอบดูรายละเอียดเพิ่มเติมได้ที่ www.swpark.or.th หรือสอบถามข้อมูลได้ที่ คุณวรกร โทร. 0-2583-9992 ต่อ 1420 <br>\n','20/04/02');
INSERT INTO news_data VALUES ('N00038','       ได้มีการแพร่ระบาดของไวรัส Myparty ซึ่งมีรูปแบบดังนี้<br>\nSubject: new photos from my party!<br>\nBody:<br>\nHello!<br>\nMy party...It was absolutely amazing! I have attached my web page with new photos! If you can please make color prints of my photos. Thanks!<br>\nAttachment: www.myparty.yahoo.com<br>\n<br>\nห้ามมิให้เปิดไฟล์ (double click) ที่แนบมาโดยเด็ดขาด อ่านรายละเอียดเพิ่มเติมได้ที่นี่ (<a href=\"http://thaicert.nectec.or.th/advisory/alert/myparty.php\" target=\"thaicert.nectec.or.th/advisory/alert/myparty.php\">http://thaicert.nectec.or.th/advisory/alert/myparty.php</a>) ','20/08/02');
INSERT INTO news_data VALUES ('N00039','เจ๊ากันไป! ซามี่ ฮูเปีย ของ หงส์แดงลิเวอร์พูล<br>\nขึ้นสกัดกันการโหม่งของคูมิต คูาราน กองหน้า<br>\nกาลาตาซารายในศึก ยูฟ่าแชมป์เปี่ยนส์ ลีก จบ<br>\n90 นาที ทำอะไรกันไม่ได้ เจ๊ากันไป 0-0<br>\n<br>\n','21/05/02');
INSERT INTO news_data VALUES ('N00041','ขาย โทร. มือถือ nokia 8250','22/05/02');
INSERT INTO news_data VALUES ('N00045','ใครเห็นเครื่องคิดเลขรุ่น 5500 บ้างมั้ยครับ  เอาไว้ที่ห้อง olala แล้วหายไปไหนไม่รู้  ถ้าเจอช่วยบอกมันด้วยว่าผมให้อภัยแล้ว กลับมาหาเจ้าของเถอะ  ถ้าใครเห้น post บอกหน่อยนะครับ  แล้วจะมีรางวัลเล็กๆน้อยๆ ให้ด้วย ','22/05/02');
INSERT INTO news_data VALUES ('N00044','สุขภาพร่างกายสำคัญกว่าทรัพย์สินใดๆ เพราะฉนั้นอย่าละเลยที่จะดูแล ไม่ว่าจะเป็นตัวคุณเอง หรือคนที่คุณรัก เรามีผลิตภัณฑ์ที่ผลิตจากสมุนไพรจีน พัฒนาโดยแพทย์อเมริกา เชื่อถือได้ ปลอดภัย ไม่มีผลข้างเคียง  สนใจติดต่อเจี๊ยบ ที่ 02-7390905 ห้อง 108 วันจันทร์-พฤหัส หลัง 17.00 น. หรือ e-mail :ื<a href=mailto:narumonstar@hotmail.com>narumonstar@hotmail.com</a>  ฝากเบอร์ดทรกลับหรือเมล์ มาคุยปรึกษากันได้เพื่อสุขภาพที่ดีของคุณและคนที่คุณรัก ','22/05/02');
INSERT INTO news_data VALUES ('N00046','บอลเยาวชน 17 ปีไทยเจอดีจนได้ &quot;เจ้าภาพ&quot; อินโดนีเซีย ใช้กลโกงเล่นงานหลังนักเตะอิเหนา แพ้ ลาว แบบล็อกถล่ม 0-1 ทำให้ต้องลุ้นเข้ารอบกับไทย เลยแอบดับไฟสนามขณะที่จบครึ่งแรกไทยนำฟิลิปปินส์ห่าง 3-0 ผู้ตัดสินยุติเกมประกาศแข่งใหม่เฉพาะครึ่งหลัง แต่สุดท้ายกลับคำหน้าตาเฉยให้เตะกันใหม่ 90 นาทีในวันที่ 24 ก.พ. สตาฟฟ์ไทยเซ็งสุด &quot;บังยี&quot; เตรียมร่อนหนังสือถึง เอเอฟเอฟ ให้จัดโปรแกรมนัดสุดท้ายรอบแรก ไทย- กัมพูชา และ อินโดนีเซีย-ฟิลิปปินส์ แข่งเวลาเดียวกันในวันที่ 25 ก.พ. เกรงพิษ &quot;เจ้าภาพ&quot; ล็อกสกอร์อีก <br>\n<br>\nวันกล้า ขวัญแก้ว ผู้สื่อข่าวสยามกีฬารายงานความเคลื่อนไหวทีมลูกหนังชาติไทยชุดเยาวชน 17 ปีชิงแชมป์อาเซียน โดยเมื่อวันที่ 23 ก.พ.ที่ผ่านมา ทีม<font color=red>***</font>หนูไทยลงเตะเป็นนัดที่สามพบกับทีมฟิลิปปินส์ ช่วงเช้าทางโค้ชได้ให้นักเตะออกมาวอร์มอัพยืดเส้นยืดสายจากนั้นพักผ่อนยาวจน กระทั่ง 13.00 น. มารับประทานอาหารเที่ยงและเวลา 16.00 น. ประชุมทีม โดยทีมไทยออกเดินทางไปสนามเวลา 17.00 น. โดยลงเตะเป็นคู่ที่สอง <br>\n<br>\n<br>\nสำหรับการวางเกมการเล่นทาง &quot;โค้ชเฮง&quot; ได้คุยกับนักเตะก่อนลงสนามว่า เกมนี้ให้เน้นรูปแบบไม่ต้องเร่งยิงให้มาก ให้ดูจากอินโดนีเซีย เป็นตัวอย่าง แม้ว่าเราจะต้องยิงประตูให้มากเพื่อนับลูกได้เสีย กองหน้าพยายามออกด้านข้างเพื่อดึงกองหลังเขาออกมา ขอให้ชนะในเกมนี้เพื่อเเก้ตัว<br>\n<br>\nผู้เล่น 11 คนแรกที่ลงสนามนั้น แดนกลางมีการเปลี่ยนโผเล็กน้อย โดยเอา ปิยะพงษ์ ปัตสุข กับ ประธาน เสนาลา ลงเเทน ชยุต จันทร มณฑล กับ วรุตม์ วงศ์ดี โดยโฉมหน้า 11 คนแรกประกอบไปด้วยผู้รักษาประตู ภานุพล ชมภูทัศน์, กองหลัง เกียรติประวุฒิ สายแวว, ธีรพันธ์ อินทรโชติ, เจษฎากร เหมแดง, อภิภู สุนทรพนาเวศน์, กองกลาง ประธาน เสนาลา, ภานุวัฒน์ จินตะ, เอกวิทย์ บุญพามา, ปิยะพงษ์ ปัตสุข ส่วน กองหน้า รุสดี อาแวสือแม, เอกภพ คลาพิมาย','24/04/02');
INSERT INTO news_data VALUES ('N00047','วิลเลี่ยม ฮิลล์ ร้านรับพนันถูกกฎหมายเมืองผู้ดี รีบหั่นราคาแชมป์พรีเมียร์ชิพในฤดูกาลนี้ ของ &quot;ปีศาจแดง&quot; แมนเชสเตอร์ ยูไนเต็ด ลงมาเหลือ 8-15 (แทง 15 จ่าย 8) หลังเฉือน แอสตัน วิลล่า 1-0 เมื่อวันเสาร์ที่ผ่านมา ขณะที่ &quot;ปืนใหญ่&quot; อาร์เซน่อล ที่ไล่ยำ ฟูแล่ม 4-1 ก็ถูกหั่นราคาจาก 3-1 (แทง 1 จ่าย 3) ลงมาเหลือ 11-4 (แทง 4 จ่าย 11) <br>\n<br>\n<br>\nวิลเลี่ยม ฮิลล์ บริษัทรับพนันถูกกฎหมายของอังกฤษ ได้ปรับอัตราต่อรองแชมป์พรีเมียร์ชิพในฤดูกาลนี้ทันที หลังจากที่ &quot;แชมป์เก่า&quot; แมนเชสเตอร์ ยูไนเต็ด เฉือนเอาชนะ &quot;สิงห์ผยอง&quot; แอสตัน วิลล่า 1-0 ในศึกพรีเมียร์ชิพ อังกฤษ เมื่อวันเสาร์ที่ผ่านมา โดย แมนฯ ยูไนเต็ด ยังคงถูกยกให้เป็นเต็ง 1 แต่มีราคาลดลงจาก 8-13 (แทง 13 จ่าย 8) มาเหลือ 8-15 (แทง 15 จ่าย 8) <br>\n<br>\nขณะที่ อาร์เซน่อล ที่ยำใหญ่ ฟูแล่ม เละเทะ 4-1 และขึ้นรั้งรองจ่าฝูง ก็ยังคงเป็นเต็ง 2 เช่นเดิม แต่ถูกหั่นราคาจาก 3-1 (แทง1 จ่าย 3) มาเหลือ 11-4 (แทง 4 จ่าย 11) ส่วน &quot;หงส์แดง&quot; ลิเวอร์พูล โดนเพิ่มราคาจาก 9-2 (แทง 2 จ่าย 9) เป็น 6-1 (แทง 1 จ่าย 6) หลังเปิดรังแอนฟิลด์ทำได้แค่เสมอกับ &quot;ทอฟฟี่สีน้ำเงิน&quot; เอฟเวอร์ตัน 1-1 ในศึกเมอร์ซี่ย์ไซด์ ดาร์บี้แมตช์ ทำให้หล่นลงมาอยู่ในอันดับ 3 ของตาราง โดยมีคะแนนตามหลังจ่าฝูงอยู่ 4 แต้ม <br>\n<br>\nสำหรับราคาของ &quot;สาลิกาดง&quot; นิวคาสเซิ่ล อยู่ที่ 9-1 (แทง 1 จ่าย 9), &quot;สิงโตน้ำเงินคราม&quot; เชลซี อยู่ที่ 50-1 (แทง 1 จ่าย 50) ส่วน &quot;ยูงทอง&quot; ลีดส์ ยูไนเต็ด โดนเพิ่มราคาจาก 50-1 (แทง 1 จ่าย 50) เป็น 66-1 (แทง 1 จ่าย 66) <br>\n','24/04/02');
INSERT INTO news_data VALUES ('N00062','ข่าว : ผู้จัดการออนไลน์<br>\nรางวัลอะคาเดมี อวอร์ดหรือออสการ์ครั้งที่ 74 สำหรับผลงานภาพยนตร์ปี 2001 ซึ่งประกาศผลในเช้าวันจันทร์ที่ 25 มีนาคมนี้ เดนเซล วอชิงตันและฮัล แบร์รี่ สองนักแสดงอเมริกันผิวดำ ได้สร้างประวัติศาสตร์ให้กับวงการหนังอเมริกันเมื่อทั้งคู่คว้ารางวัลดารานำชายและหญิงยอดเยี่ยมในปีเดียวกันเป็นครั้งแรกในรอบ 74 ปีของการแจกรางวัลอะคาเดมี อวอร์ดของสถาบันศิลปะและวิทยาศาสตร์การภาพยนตร์<br>\n<br>\nวอชิงตัน เฉือนรัสเซล โครว์ขึ้นรับออสการ์จากบทบาทนายตำรวจคอรัปชั่นใน Training Day ซึ่งเป็นการพลิกบทบาทครั้งสำคัญของเขา จากที่เคยรับบทพระเอกมาโดยตลอด เปลี่ยนมาเป็นบทผู้ร้ายก็ประสบความสำเร็จทันที เขาเป็นผู้เชิญรางวัลเกีรยรติยศที่ทางสถาบันฯมอบให้แก่ซิดนีย์ ปอยเตียร์ ดาราชายผิวดำคนแรกที่ได้รางวัลออสการ์และเป็นคนแรกที่ได้รางวัลดารานำชายยอดเยี่ยมตั้งแต่ปี 1964 จาก &quot;Lilies of the Field&quot; ก่อนที่วอชิงตันจะได้รับรางวัลดารานำชายเป็นนักแสดงผิวดำคนที่ 2 ในปีนี้เอง <br>\n<br>\nวอชิงตันได้กล่าวติดตลกในตอนรับรางวัลว่า &quot;ผมไล่ตามความสำเร็จของซิดนีย์มาถึง 40 ปี แล้วตอนนี้เป็นยังไง? พวกเขา(กรรมการออสการ์)มอบรางวัลให้ผมในวันเดียวกับที่มอบรางวัลให้กับเขา&quot; <br>\n<br>\nส่วนฮัล แบร์รี่ ดาราสาวที่ได้รับรางวัลออสการ์จากบทบาทหญิงม่ายสามีต้องโทษประหารใน Monster\'s Ball เป็นการสร้างประวัติศาสตร์ให้กับตัวเธอเองและให้กับนักแสดงหญิงผิวดำในอเมริกาด้วย เนื่องจากเธอเป็นนักแสดงผิวดำคนแรกที่ได้ออสการ์สาขาดารานำฝ่ายหญิง<br>\n<br>\nและเธอก็เป็นไฮไลท์ของงาน เมื่อรัสเซล โครว์ผู้เปิดซองประกาศชื่อผู้ชนะดารานำฝ่ายหญิง แบร์รี่ช็อคเขาอ่อนแทบลุกไม่ขึ้นด้วยความดีใจจนกระทั่งวินาทีที่เธอขึ้นไปรับรางวัลบนเวที เธอยืนร้องให้สะอึกสะอื้นพูดไม่ออกจนบรรดาผู้มาร่วมงานและเพื่อนนักแสดงที่เข้าชิงสาขาเดียวกับเธอน้ำตาซึมไปด้วย หลังจากรวบรวมสติได้ทีละนิดทีละน้อย ฮัลกล่าวขอบคุณยาวเหยียดและประกาศอย่างสะใจว่าวันนี้คือวันที่ประตูแห่งโอกาสได้เปิดต้อนรับคนดำในวงการหนังอเมริกันอย่างแท้จริงแล้ว <br>\n<br>\n&quot;วินาทีสำคัญมากมากกว่าสำหรับฉันคนเดียว&quot; <br>\n<br>\nฮัล แบร์รี่กล่าวทั้งน้ำตา และเธอประกาศอุทฺสออสกาณ์ตัวนี้ให้กับนักแสดงผิวดำในยุคอดีตอย่าง โดโรธี แดนดริดจ์ นักแสดงหญิงที่เธอเคยสวมบทบาทในหนังชีวประวัติของแดนดริดจ์ทางช่องเอชบีโอ ลีนา ฮอร์ฯ ไอานน์ คาร์โรลล์ และ &quot;นักแสดงหญิงผิวสีทุกคนที่ตอนนี้เริ่มมีโอกาส เพราะวันนี้ประตูได้เปิดอ้าแขนรับพวกเราแล้ว&quot; แบร์รี่ยังไม่ลืมขอบคุณสไปค์ ลี ผู้กำกับผิวดำคนดังที่ให้โอกาสเธอแสดงใน Jungle Fever หนังเรื่องแรกปี 1991<br>\n<br>\nคืนนี้ถือได้ว่าเป็นคืนสำคัญสำหรับนักแสดงผิวดำ เพราะนอกจากวอชิงตันและแบร์รี่คว้ารางวัลสำคัญแล้ว วู<font color=red>***</font> โกลด์เบิร์กยังเป็นพิธีกรประจำเวทีและซิดนีย์ ปอยเตียร์ พระเอกตลอดกาลของชาวอเมริกันแอฟริกัน ผู้ได้รับรางวัลออสการ์ดารานำชายเป็นคนแรกก็ได้รับรางวัลเกียรติยศจากทางสถาบันด้วย<br>\n<br>\nในส่วนของรางวัลใหญ่อย่างผู้กำกับยอดเยี่ยมและภาพยนตร์ยอดเยี่ยม A Beautiful Mind เต็งหนึ่งแบบตึงเปรี๊ยะรวบทั้งสองรางวัล โดย รอน ฮาเวิร์ด ผู้กำกับและผู้อำนวยการสร้างชื่นมื่นกันทั้งคู่ พร้อมด้วยรางวัลบทดัดแปลงยอดเยี่ยม สำหรับอาคิว่า โกลด์สแมน และรางวัลดาราสมทบหญิงยอดเยี่ยมของเจนนิเฟอร์ คอนเนลลี่<br>\n<br>\nรวมแล้ว A Beautiful Mind กวาดไป 4 รางวัล เทียบเท่ากับ The Lord of the Rings : Fellowship of the Ring ซึ่งได้รางวัลในสายเทคนิคเป็นส่วนใหญ่ ได้แก่ รางวัลถ่ายภาพยอดเยี่ยม เทคนิคพิเศษทางภาพยอดเยี่ยม แต่งหน้ายอดเยี่ยมและ ดนตรีประกอบยอดเยี่ยมโดย ฮาวเวิร์ด ชอว์ <br>\n<br>\nปีเตอร์ แจ็คสัน ผู้กำกับ ผู้อำนวยการสร้างและผู้ร่วมเขียนบทหนังแฟนตาซีผจญภัยเรื่องดังชวดรางวัลใหญ่ไปทั้งหนังยอดเยี่ยม ผู้กำกับยอดเยี่ยมและบทดัดแปลงยอดเยี่ยม ขณะที่เอียน แม็คเคลเลน ในบทพ่อมดแกนดอล์ฟ ที่เข้าชิงในสาขาดาราสมทบชายก็พ่ายรางวัลให้กับ จิม บรอดเบนท์นักแสดงอังกฤษจาก Iris <br>\n<br>\nMoulin Rouge พลาดรางวัลสำคัญภาพยนตร์ยอดเยี่ยมและดารานำหญิงยอดเยี่ยมโดยนิโคล คิดแมน ได้รางวัลปลอบใจกลับบ้าน 2 รางวัล ได้แก่เครื่องแต่งกายยอดเยี่ยมและกำกับศิลป์ยอดเยี่ยม จากการเข้าชิง 8 รางวัล ได้เท่ากับ Black Hawk Down หนังสงครามของริดลีย์ สก็อตต์ ผู้กำกับที่ Gladiator หนังของเขาคว้ารางวัลยอดเยี่ยมปีที่แล้ว ปีนี้ได้แค่รางวัลบันทึกเสียงยอดเยี่ยมและตัดต่อยอดเยี่ยม<br>\n<br>\nShrek และ Monster, Inc.การ์ตูนสองเรื่องดังที่เข้าชิงชัยในสาขาภาพยนตร์อนิเมชั่นยอดเยี่ยมรางวัลใหม่เปิดซิงในปีนี้แบ่งไปคนละรางวัล โดย Shrek คว้าภาพยนตร์อนิเมชั่นยอดเยี่ยม และ Monster,Inc. คว้ารางวัลเพลงยอดเยี่ยม โดยแรนดี้ นิวแมน เฉือนงานของสติงจาก Kate&amp;Leopold และ เอ็นย่า จาก The LOrd of the Rings<br>\n<br>\nGosford Park งานกำกับของโรเบิร์ต อัลต์แมน แม้พลาดรางวัลภาพยนตร์ยอดเยี่ยมและผู้กำกับยอดเยี่ยม แต่ยังคว้ารางวัลบทดั้งเดิมยอดเยี่ยมโดยจูเลียน เฟลโลว์ส <br>\n<br>\nรางวัลภาพยนตร์ภาษาต่างประเทศ No Man\'s Land จากประเทศบอสเนีย เจ้าเดิมจากเวทีลูกโลกทองคำคว้าไปครอง <br>\n<br>\nปิดท้ายกับผู้แพ้แห่งปี In the Bedroom หนังเล็กที่ทำท่าจะเป็นม้ามืดด้วยการเข้าชิงหลายรางวัล โดยเฉพาะในสาขาการแสดงซึ่งซิสซี่ สเปเซ็ก มีลุ้นกับรางวัลดารานำหญิงยอดเยี่ยมและทอม วิลกินสันในสาขาดารานำชาย รวมทั้งตัวหนังเข้าชิงรางวัลภาพยนตร์ยอดเยี่ยม และบทดั้งเดิมยอดเยี่ยม แต่ต้องเดินกลับบ้านมือเปล่า ก็ต้องยอมรับว่าปีนี้ไม่ใช่ปีของหนังอินดี้เอาเสียเลย <br>\n<br>\n','25/06/02');
INSERT INTO news_data VALUES ('N00049','แอนดี้ โคล ยิงลูกพิสดารเป็นประตูชัยให้แบล็กเบิร์นเฉือนเอาชนะสเปอร์ส 2-1หลังจาก เจนเซ่นยิงออกนำก่อน แต่ไก่เดือยทองมาตีคืน 1-1 จากเฟอร์ดินานด์ถวายพานให้ซีเก้ซัดเข้าไปง่ายๆ กุหลาบไฟคว้าแชมป์เวิร์ทธิงตัน ลีก คัพไปครอบครองขณะที่ แบร๊ด ฟรีเดล นายทวารหยิบแมน ออฟ เดอะ แมตช์ ส่วนศึกพรีเมียร์ชิพวันเดียวกัน ลีดส์เตะในรังเจ๊าชาร์ลตันฝืด 0-0 และ สาลิกาสยบแมวดำ 2-1 ขึ้นรองจ่าฝูงแล้ว เมื่อ 24 ก.พ. 45 <br>\n<br>\n','25/04/02');
INSERT INTO news_data VALUES ('N00058','และแล้ว ผลการประกาศรางวัล Season Awards ประจำปี 2544 ประกาศออกมาแล้ว ณ ห้องแกรนด์บอลล์รูม โรงแรมเมอร์แชนท์ คอร์ท รัชดา งานนี้ บรรดาค่ายเพลง เล็กใหญ่ ที่มีศิลปินในสังกัดตัวเอง ที่ติดเข้ารอบสุดท้าย บรรยากาศของงานเต็มไปด้วย เหล่าบรรดานักร้อง นักดนตรี โปรดิวเซอร์ ทั้งที่กำลังมีผลงานหรือ อยู่ในช่วงพักงาน ทำงานด้านอื่น ๆ มากหน้าหลายตา อาทิ โดม - ปกรณ์ ลัม, บิลลี่ โอแกน, ปาน ธนพร, โมเดิร์นด๊อก, จิระศักดิ์ ปานพุ่ม, ฟลาย, พี่ป้อม - อัสนี โชติกุล, สุกัญญา มิเกล, มาโนช พุฒตาล, โป้ - โยคีเพลย์บอย, Silly Fool, อิงค์ - อชิตะ, โลโซ, จอห์น รัตนเวโรจน์ ได้เวลาประมาณ 1 ทุ่ม เริ่มการประกาศผลรางวัลแรก ได้แก่... <br>\n<br>\n<br>\nรางวัล เพลงยอดเยี่ยม ได้แก่...เล่าสู่กันฟัง คำร้อง กมลศักดิ์ สุนทานนท์ ทำนอง จาตุรนต์ เอมบุตร จากอัลบั้ม Smile Club ศิลปิน เบิร์ด ธงไชย แมคอินไตย์ งานนี้พี่เบิร์ด ไม่ได้มาร่วมงาน ส่ง คุณ กมลศักดิ์ สุนทานนท์ ผู้แต่งคำร้องเพลงนี้ขึ้นรับรางวัลแทน ประโยคเด็ดที่ ..คุณกมลศักดิ์ ได้กล่าวถึง ความรู้สึกว่า เพลงนี้ ไม่ได้ยอดเยี่ยมกว่าเพลงอื่น ๆ ที่ได้รับการเสนอชื่อ หากเพียงค่ำ คืนนี้ เราโชคดีที่ได้รับรางวัลนี้เท่านั้น เล่นเอาเหล่าบรรดา ผู้ที่อยู่ในงานต่างปรบมือกันยกใหญ่ และงานในวันนั้นผู้ที่ดูเหมือนจะเดินขึ้นเวที รับรางวัลบ่อยที่สุด ก็คือ แมว จิระศักดิ์ ปานพุ่มเจ้าของ อัลบั้ม Awake ที่ได้ทั้ง รางวัล อัลบั้ม ร็อคยอดเยี่ยม , ศิลปินชายร็อคยอดเยี่ยม ซึ่ง พี่แมวก็ได้รับรางวัลประเภทนี้ติดกัน ถึง 3 ปีซ้อนแล้ว มาถึง รางวัลโปรดิวเซอร์ยอดเยี่ยม ปีนี้ ฟลาย จากอัลบั้ม Flyman ได้รับไป แม้งานนี้จะขาดนักร้องนำอย่างพี่อี๊ดไป ดูกร่อย ๆ บ้าง แต่ พี่ ๆ ท่านอื่นในวงนี้ก็พยายาม สร้างบรรยากาศให้เหมือนไม่มีอะไรเกิดขึ้น <br>\n<br>\n<br>\nมาถึง รางวัล เพลงบรรเลงยอดเยี่ยม ได้แก่ สองสีผสม ทำนอง/เรียบเรียง ฟรังซัวร์ ลินเดอร์แมน และ เทวัญ ทรัพย์แสนยากร จากอัลบั้ม 2 ขั้วแจ๊ซซ์ ศิลปิน เทวัญ และ ลินเดอร์แมน และ รางวัล เพลงร็อดยอดเยี่ยม ปีนี้ ศิลปินรุ่นเด็ก แต่ฝีมือจัดเข้าตา กรรมการ คือ ศิลปิน แคลชจากอัลบั้ม One ในเพลง- Love Scene คำร้อง สุชาติ จันทร์เอม ทำนอง แคลช งานนี้นายแบงค์ นักร้องนำ กล่าวอย่างดีใจ ว่า... ในนามแคลซ รางวัลนี้ มีค่ามาก เพราะพวกเค้าเป็นเพียงนักดนตรีเด็ก ๆ ที่ตั้งใจทำงาน และดีใจที่ผู้ใหญ่มองเห็นความตั้งใจเล็ก ๆ ของเรา และมอบรางวัลนี้ให้ มีค่ามากสำหรับนักดนตรีเด็ก ๆ อย่างพวกเรา รางวัลต่อไปคือ เพลงในการบันทึกเสียงยอดเยี่ยมบิลลี่ โอแกน ได้รับไป จากเพลง Stay Cool ที่ลงแรง แต่งทั้งคำร้อง -ทำนอง- เรียบเรียง เอง อัลบั้ม Pink ศิลปิน บิลิโอ ( บิลลี่ โอแกน ) <br>\n<br>\n<br>\nงานในครั้งนี้มีศิลปินบางท่านแม้เราจะไม่เคยเห็นหน้าคาดตา หรือฟังเพลงของเค้าเลย แต่งานของเค้าก็ถูกคัดเลือกให้รับรางวัลบนเวทีนี้ด้วยได้แก่ ศิลปิน รังสรรค์ ราศี - ดิบ ( เป็นศิลปินจากภาคเหนือ ขายงานของตัวเองในลักษณะ งานใต้ดิน วางขายทั่วไป ไม่มีการโปรโมตตามสื่อเลย) เจ้าของอัลบั้ม การเดินทางของตะกร้า ได้รับไปถึง 2 รางวัลใหญ่ ของงานไป ทั้ง อัลบั้มยอดเยี่ยม ,ศิลปินหน้าใหม่ยอดเยี่ยม และ PRU ดูเหมือน งาน ชุดนี้จะประสบความสำเร็จอย่างมาก ได้ทั้งเงินและกล่อง ทั้งรางวัล ศิลปินยอดเยี่ยมประเทศไทยจากงาน MTV Music Awards และมาถึงรางวัล ศิลปินกลุ่มยอดเยี่ยม ด้วย ล่าสุดแม้ไม่ได้มาร่วมรับรางวัลในงานนี้ เพราะติดไปแสดงคอนเสิร์ตที่ ออสเตเรีย พร้อมโชว์ และเจรจา ทำเพลงขายต่างประเทศ โดยส่ง บรูโน่ ลูกชายของ สุกี้ ผู้บริหารแห่งค่ายเบเกอรี่ มิวสิค (หนึ่งในสมาชิก PRU) ขึ้นเวทีรับรางวัล และ วีรวรรณ หุยนันท์ เจ้าของ อัลบั้ม คนไม่มีหัวใจ ก็ได้รับรางวัลศิลปินหญิงร็อดยอดเยี่ยม โดย พี่แมว จิระศักดิ์ ปานพุ่ม ขึ้นเวทีรับรางวัลแทนในฐานะผู้ดูแลงาน พร้อมกล่าวว่า วีรวรรณ ไปใช้ชีวิตกับสามีที่ปารีส และเชื่อว่าหากเธอรู้ว่าเธอได้รับรางวัลนี้ เธอต้องดีใจมาก รางวัลศิลปินคู่หรือกลุ่มยอดเยี่ยม ดูประกาศขึ้นอีกครั้ง โดย โมเดิร์น ด๊อก จาก อัลบั้ม Love Me Love My Life ได้รับรางวัลนี้ไปตามคาด และมาถึงสองรางวัล สุดท้ายของค่ำคืนนี้คือ ศิลปินหญิงเดี่ยวยอดเยี่ยม งานนี้ อุ๊ - หฤทัย ม่วงบุญศรี อัลบั้ม The Voice ได้ไป ท่ามกลางการยอมรับจากนักวิจารณ์ จริง ๆ ว่าเธอ เป็นนักร้องคุณภาพคนหนึ่งของวงการแล้ว เนื่องจากเธอได้รับรางวัลนี้ติดกัน 2 ปีซ้อน และรางวัลสุดท้ายของงานในครั้งนี้ คือ ศิลปินชายยอดเยี่ยม ซึ่ง โดม - ปกรณ์ ลัม ฝ่า ด่านต่าง ๆ ด้วยฝีมือการเป็นโปรดิวเซอร์ งานของตัวเองใน อัลบั้ม Dome Naked ได้รับรางวัลนี้ไปด้วยความภาคภูมิ พร้อมกล่าวขอบคุณ ทีมงาน ทุก ๆ คนที่เกี่ยวข้อง และเปิดโอกาสให้โดมได้คิดงานชุดนี้เองอย่างเต็มที่ <br>\n<br>\n<br>\nท้ายสุด ทีมงานคณะผู้จัดงานเปิดโอกาสให้ผู้รับรางวัลทุก ๆ ท่านขึ้นมาบนเวทีขึ้นมาถ่ายภาพร่วมกัน ซึ่งเป็นภาพที่หาดูได้ยากมาก หากไม่มีงานดี ๆ อย่างนี้คงไม่มีวันที่ศิลปิน ต่างค่ายเล็ก-ใหญ่ จะมาร่วมตัวกัน ได้มากขนาดนี้ <br>\n<br>\n<br>\n','15/05/02');
INSERT INTO news_data VALUES ('N00059','ทำงานด้านออกแบบและติดตั้ง Server, Network Equipment<br>\nติดต่อที่ 236-9930 ','19/06/02');
INSERT INTO news_data VALUES ('N00060','ทำหน้าที่ช่วยผู้บริหารและวิศวกร ประสานงานกับลูกค้า ทำเอกสาร ใบเสนอราคา ด้าน IT Infrastructure<br>\nมีความรู้ด้าน IT ดี, ภาษาอังกฤษดี, บุคคลิกดี, สร้างความสัมพันธ์เก่ง<br>\nตืดต่อที่ 236-9930','19/06/02');

#
# Table structure for table 'post'
#

CREATE TABLE post (
  code varchar(6) NOT NULL default '',
  status varchar(10) NOT NULL default '',
  topic varchar(150) NOT NULL default '',
  price int(10) default NULL,
  date varchar(15) NOT NULL default '',
  reply int(5) NOT NULL default '0',
  visit int(5) NOT NULL default '0',
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'post'
#

INSERT INTO post VALUES ('B00000','แจกฟรี','หนังสือพิมพ์ The asian wall street journal',0,'020129',1,95);
INSERT INTO post VALUES ('N00000','ประกาศ','ชมรมเปตองลาดกระบัง แข่ง Open วันที่ 30 มกราคมครับ',0,'020129',1,7);
INSERT INTO post VALUES ('A00022','ขาย','ตู้เย็น + ไมโครเวฟ สภาพดีมากใช้ไม่ถึงปี',5000,'020329',1,16);
INSERT INTO post VALUES ('L00000','แจ้งหาย','friendship หายครับใครเจอมีรางวัลให้',0,'020129',2,76);
INSERT INTO post VALUES ('H00000','ให้เช่า','หอพักนาคบำรุงศรี ยังว่างครับ',1500,'020129',11,197);
INSERT INTO post VALUES ('V00000','ขาย','รถจักรยานครับ',500,'020129',10,210);
INSERT INTO post VALUES ('F00000','-','หาเพื่อนครับ',0,'020129',12,236);
INSERT INTO post VALUES ('A00000','ซื้อ','CD robbie william ครับ ชุดใหม่ล่าสุด',100,'020129',2,60);
INSERT INTO post VALUES ('V00007','ขาย','ตู้เย็น + รถจักรยาน + โต๊ะเขียนหนังสือ จะจบแล้ว <font color=red>***</font>เกียจเอากลับ เหมาะเอาไว้ใช้ที่หอ',3000,'020228',3,80);
INSERT INTO post VALUES ('F00001','-','ชมรมเปตองลาดกระบังเปิดรับสมาชิกใหม่ครับ',0,'020129',1,83);
INSERT INTO post VALUES ('N00002','ประกาศ','ชมรมเปตองเปิดรับสมาชิกใหม่ครับ',0,'020129',0,8);
INSERT INTO post VALUES ('F00013','-','หาเพื่อนหน่อยครับ เขาไม่ยอมกลับบ้าน',0,'020307',2,31);
INSERT INTO post VALUES ('N00050','ประกาศ','ตู้เย็น + รถจักรยาน + โต๊ะเขียนหนังสือ จบแล้วเลยขาย ขนกลับบ้านลำบาก  เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ',0,'020228',1,28);
INSERT INTO post VALUES ('N00005','ประกาศ',' ศึกวันแดงเดือด ดุเด็ดเผ็กมันส์ตลอด 90 นาที &quot;เมอร์ฟี่&quot; ทีเด็ดอีกแล้วครับท่าน! ซัดประตูชัย ให้หงส์ฟื้นคืนชีพ ฝังผีลงหลุมไปอีกครั้ง',0,'020129',1,14);
INSERT INTO post VALUES ('N00006','ประกาศ','  1 ปีบริษัทจำลองปันกำไรสู่สังคม',0,'020129',4,33);
INSERT INTO post VALUES ('N00007','ประกาศ',' 30 ตุลาคม 2544 PRU S.E. งานเพลงฉลองความสำเร็จ',0,'020129',1,12);
INSERT INTO post VALUES ('A00001','เช่า','เกม tiberian sun : fire storm แผ่นเต็ม (มี movie)',0,'020129',0,18);
INSERT INTO post VALUES ('A00002','ขาย','กีต้าไฟฟ้าพร้อม Amp ของ Danelectro',10000,'020129',1,35);
INSERT INTO post VALUES ('B00001','ซื้อ','ใครมีหนังสือ MySql ที่เป็น Text หรือ ภาษาไทยก็ได้บ้างครับ',0,'020129',0,61);
INSERT INTO post VALUES ('N00008','ประกาศ','เกมเดือดใบแดงว่อน 3 ใบ!! เบิร์กแคมป์ฮีโร่ ปืนเฉือนหงส์ 1-0',0,'020129',2,12);
INSERT INTO post VALUES ('L00002','แจ้งหาย','หนังสือ visual  C++ หายครับ',0,'020129',2,41);
INSERT INTO post VALUES ('N00009','ประกาศ','  แข้ง20ปีไทยฟอร์มร้อน ถล่มเสือเหลืองเละ 8-1',0,'020129',0,50);
INSERT INTO post VALUES ('N00010','ประกาศ','  บัตรโต๊ะจีนงาน Bye Nior ต่อเนื่องห้อง 3P อยู่ที่ DoctorK นะครับ',0,'020129',4,41);
INSERT INTO post VALUES ('L00003','แจ้งหาย','ใจหายค่ะ',0,'020129',14,214);
INSERT INTO post VALUES ('B00014','ขาย','ขาย การ์ตูน ได...ตะลุยแดนเวทมนตร์1-37',1350,'020224',0,8);
INSERT INTO post VALUES ('B00013','ขาย','ขายการ์ตูนวิบูลย์กิจ,สยามอินเตอร์ ฯลฯ จำนวนมาก',0,'020224',0,8);
INSERT INTO post VALUES ('F00002','-','รูปเพื่อนใหม่จาก www.Mthai.com',0,'020130',2,260);
INSERT INTO post VALUES ('F00006','-','อยากมีเพื่อนชาย ภาคคอมน่ะ',0,'020130',10,240);
INSERT INTO post VALUES ('F00005','-','อยากมีเพื่อนชาย ภาคคอมน่ะ',0,'020130',4,78);
INSERT INTO post VALUES ('F00008','-','หาแฟนหนุ่ม',0,'020131',8,217);
INSERT INTO post VALUES ('H00001','แนะนำ','ตอนนี้มีหอพักกมล ซอย เกกีงาม 2 เปิดใหม่',2800,'020202',10,177);
INSERT INTO post VALUES ('A00023','ซื้อ','ต้องการซื้อ harddisk w/o bad sector ใช้กับคอมรุ่นเก่า ๆ (P100)',0,'020331',0,6);
INSERT INTO post VALUES ('N00015','ประกาศ','รับสมัครบรรณาธิการและผู้ช่วยบรรณาธฺการ',0,'020131',0,24);
INSERT INTO post VALUES ('F00009','-','หาเพื่อนชาย',0,'020131',8,427);
INSERT INTO post VALUES ('F00007','-','หาเพื่อน',0,'020130',0,34);
INSERT INTO post VALUES ('N00046','ประกาศ','แข้ง17ไทยเจอเล่ห์ชวา ยิง3-0ดับไฟให้เตะใหม่',0,'020224',0,12);
INSERT INTO post VALUES ('N00014','ประกาศ','ขายด่วน...',0,'020130',0,37);
INSERT INTO post VALUES ('F00004','-','หาเพื่อนหง่ะ',0,'020130',5,73);
INSERT INTO post VALUES ('L00005','แจ้งหาย','จักรยานหาย',0,'020130',4,64);
INSERT INTO post VALUES ('F00003','-','ชื่อ Robbie Fowler ครับ',0,'020130',2,117);
INSERT INTO post VALUES ('B00002','ซื้อ','หนังสือแบบเรียนภาษาไทยที่เป็นเรื่องมานะ-มานี',50,'020201',0,70);
INSERT INTO post VALUES ('N00017','ประกาศ','หงส์บุกจิกยูงทองยับ4-0 เฮสกี้ฮอตเหมาสองเม็ด',0,'020204',1,11);
INSERT INTO post VALUES ('N00018','ประกาศ','Goodbye Senior Computer Nonthaburi',0,'020204',0,10);
INSERT INTO post VALUES ('L00009','แจ้งหาย','วันเวลาเก่าๆ(หาย)',0,'020212',8,175);
INSERT INTO post VALUES ('N00049','ประกาศ','กุหลาบพิชิต2-1ซิวลีกคัพ ลีดส์ฝืด0-0สาลิกาเฮ1-0',0,'020225',0,5);
INSERT INTO post VALUES ('A00004','ขาย','เสื้อ Shop พระจอมเกล้าลาดกระบังใส่ไม่กี่ครั้งเอง',100,'020210',10,122);
INSERT INTO post VALUES ('F00014','-','ยินดีที่ได้รู้จัก',0,'020308',0,50);
INSERT INTO post VALUES ('N00053','ประกาศ','ประกาศรับสมัครงานในตำแหน่ง Programmer 3 ตำแหน่ง',0,'020308',0,40);
INSERT INTO post VALUES ('L00008','แจ้งหาย','ถึง..ท่านผู้ที่เก็บ PCT SHARP ได้',0,'020208',0,18);
INSERT INTO post VALUES ('E00003','แลก','ไม้บรรทัด',99,'020208',0,23);
INSERT INTO post VALUES ('E00004','แลก','ไม้บรรทัด',99,'020208',0,95);
INSERT INTO post VALUES ('F00010','-','หาเพื่อนด้วยคน',0,'020214',0,42);
INSERT INTO post VALUES ('V00003','ซื้อ','รถมอเตอร์ไซค์เก่า มือสอง Honda C-50 ขึ้นไป หรือจะเป็น Dream/Wave ก็ได้ครับ',0,'020215',0,97);
INSERT INTO post VALUES ('N00052','รับจ้าง','ร้านอินเตอร์เน็ทเปิดใหม่ครับ ที่ซ.เกกีงาม 3 มีน้อง ๆ น่ารักคอยบริการครับ',0,'020306',0,21);
INSERT INTO post VALUES ('N00019','แนะนำ','Engineering_Job@Orange.co.th',0,'020206',0,40);
INSERT INTO post VALUES ('A00005','ขาย','ขายคอม duron 700 MHz ขายครบชุด',0,'020210',0,41);
INSERT INTO post VALUES ('B00019','ขาย','ขาย text Math ของ Zill',400,'020310',0,21);
INSERT INTO post VALUES ('A00006','ขาย','Tamron 28-200 super II (Canon)',8,'020213',0,16);
INSERT INTO post VALUES ('N00031','ประกาศ','ขอเชิญร่วมพิธี รับ-ส่งบูชาพระราหู [ตำหรับหลวงพ่อน้อย วัดศรีษะทอง]',0,'020219',0,4);
INSERT INTO post VALUES ('H00010','เช่า','หาหอพักแบบอยู่คนเดียวสปลอดภัยและถูก',1500,'020314',2,81);
INSERT INTO post VALUES ('H00009','แนะนำ','ชมรม',0,'020313',0,36);
INSERT INTO post VALUES ('H00004','แนะนำ','วิธีในการหาหอพักใหม่',0,'020224',2,95);
INSERT INTO post VALUES ('A00008','ขาย','ขาย โมเด็ม internal D-Link PCI 56K',400,'020214',0,15);
INSERT INTO post VALUES ('F00015','-','I want to find a friends',0,'020314',1,26);
INSERT INTO post VALUES ('A00007','ขาย','เรื่องราวของเสื้อ ThaiSecondhand.com',165,'020214',0,59);
INSERT INTO post VALUES ('','ซื้อ','ต้องการซื้อการ์ตูนครบชุดสภาพดี ให้ราคา 50 %',0,'',2,13);
INSERT INTO post VALUES ('A00009','ซื้อ','ต้องการ amp guitar มือ2ราคาถูก',0,'020214',2,25);
INSERT INTO post VALUES ('A00010','ขาย','ขาย Cd-Rw : LitE On รุ่น12101B -12x10x32x มี BurnProof,Buffer2Mbขายถูกๆๆๆยังมีประกันของ D-com -',2500,'020214',0,56);
INSERT INTO post VALUES ('N00025','แนะนำ','CCD CAMERA สำหรับ PROJECT ที่มีประกันน่าเชื่อถือ 1 ปี',0,'020215',0,19);
INSERT INTO post VALUES ('N00058','ประกาศ','งานประกาศผล สีสัน ปีนี้ สร้างสีสันจริง ๆ',0,'020315',0,24);
INSERT INTO post VALUES ('B00018','ขาย','หนังสือการ์ตูนเรื่อง hikaru เซียนโกะ ออกแล้วนะ',35,'020307',0,10);
INSERT INTO post VALUES ('B00005','ซื้อ','ต้องการซื้อหนังสือการ์ตูนมังกรอหังการ',0,'020219',0,16);
INSERT INTO post VALUES ('N00027','แนะนำ','มีร้านอินเตอร์เน็ทเปิดใหม่ที่ ซ.เกกีงาม 3 ขอเชิญไปใช้บริการได้',0,'020215',2,11);
INSERT INTO post VALUES ('N00028','จ้าง','URGENT!! Personnel Wanted.',0,'020217',0,25);
INSERT INTO post VALUES ('V00004','ขาย','ขาย เก๊ตบอดครับ สภาพ 90 % ถูกมากๆๆ ซื้อ มา 4000 กว่าๆ ขาย 1500 เอง ของ gullwing คับ ซื้อมาแต่เล่นไม่เป็น จำใจขาย',1500,'020217',4,42);
INSERT INTO post VALUES ('F00011','-','หาเธอคนั้น สาววิทยา ใครอ่านแล้วรู้จักช่วยบอกเธอหน่อยนะ',0,'020217',6,169);
INSERT INTO post VALUES ('N00029','ประกาศ','เชิญมาสัมผัสความแปลกใหม่กับเรา',0,'020218',0,14);
INSERT INTO post VALUES ('H00002','ให้เช่า','หอพักสตรีดวงระวี เปิดจองห้องพัก',0,'020218',0,51);
INSERT INTO post VALUES ('N00030','ประกาศ','อุปสมบทหมู่ภาคฤดูร้อน 2545',0,'020218',0,9);
INSERT INTO post VALUES ('A00011','ขาย','ตู้ปลาขนาด 10 X 10 cm.',500,'020219',0,63);
INSERT INTO post VALUES ('H00007','แนะนำ','ช่วยกันแนะนำหน่อยว่ามีหอพักที่ไหนดีและถูกบ้าง',0,'020305',3,74);
INSERT INTO post VALUES ('A00017','ขาย','ตู้เย็น + รถจักรยาน + โต๊ะเขียนหนังสือ',3000,'020228',2,40);
INSERT INTO post VALUES ('A00012','ขาย','ตู้ปลาขนาด 15 X 10 cm.',600,'020219',0,24);
INSERT INTO post VALUES ('A00013','ขาย','ตู้ปลาขนาด 15 X 10 cm.&lt;รุ่นพิเศษ&gt;',700,'020219',0,44);
INSERT INTO post VALUES ('A00014','ขาย','ตู้ปลาขนาด 20 X 10 cm.',800,'020219',4,55);
INSERT INTO post VALUES ('A00015','ขาย','ตู้ปลาขนาด 20 X 20 cm.',1000,'020219',2,93);
INSERT INTO post VALUES ('B00006','ขาย','มีการ์ตูนลิขสิทธิ์สภาพดีมากขาย มีประมาณ 700 กว่าเล่ม',21000,'020219',2,26);
INSERT INTO post VALUES ('B00007','ซื้อ','หนังสือปกแข็ง The Lord of The Rings เล่ม 1',0,'020219',0,15);
INSERT INTO post VALUES ('B00008','ขาย','ขาย kc.weekly ตั้งแต่ปี 2000,1999,1998,1997,1996',3,'020219',0,7);
INSERT INTO post VALUES ('B00009','ขาย','ขายหนังสือแปล 6เรื่อง',50,'020220',0,19);
INSERT INTO post VALUES ('B00010','ขาย','ขายการ์ตูน ลิขสิทธิ์ จำนวนมากลองเข้ามาเสนอก่อน',15,'020220',1,16);
INSERT INTO post VALUES ('A00018','ขาย','โน๊ตบุครุ่นใหม่ราคาถูกกว่าท้องตลาด',0,'020320',3,46);
INSERT INTO post VALUES ('V00005','ให้เช่า','ร้านซ่อมจักรยานซอยเกกี 3 รับซ่อมจักรยานทุกประเภท',0,'020220',0,14);
INSERT INTO post VALUES ('B00011','ขาย','ทาร์จัง จ้าวป่า เล่ม 1-17',0,'020220',0,6);
INSERT INTO post VALUES ('E00005','แจกฟรี','ใครยืมเครื่องคิดเลขสถาบันไปนำไปคืนด้วย',0,'020220',0,32);
INSERT INTO post VALUES ('N00034','ประกาศ','ช่อง 7 สี เปิดรับสมัครสาวไทย อายุ 18-25 ปี',0,'020220',0,3);
INSERT INTO post VALUES ('N00061','จ้าง','บจก.ไทยซีอาร์ที Thai CRT CO.,LTD เกรด รับสมัคร 2.7 ขึ้น',0,'020320',0,23);
INSERT INTO post VALUES ('N00036','ประกาศ','ยิงตัวตายปริศนาโจ้ วงพอส หัวทะลุคาลิฟต์',0,'020220',3,49);
INSERT INTO post VALUES ('N00037','ประกาศ','ซอฟต์แวร์พาร์คจัดสอบวัดระดับความรู้จาวา',0,'020220',0,15);
INSERT INTO post VALUES ('N00038','ประกาศ','ประกาศเตือนไวรัส Myparty!!!',0,'020220',0,7);
INSERT INTO post VALUES ('N00039','ประกาศ',' Liverpool เสมอ Galatasalai 0-0',0,'020221',0,9);
INSERT INTO post VALUES ('L00011','แจ้งหาย','เป้ outdoors หายหน้าห้อง A-402',0,'020221',0,12);
INSERT INTO post VALUES ('L00016','แจ้งหาย','แฟนหายครับ',0,'020331',1,15);
INSERT INTO post VALUES ('E00006','ขาย','ใครต้องการ ram ของ notebook บ้างครับ',500,'020221',0,39);
INSERT INTO post VALUES ('B00012','ขาย','ขาย Text เรื่อง Modern Control Engineering',500,'020222',3,30);
INSERT INTO post VALUES ('N00041','ประกาศ','ขาย โทร. มือถือ nokia 8250   11,000 ฿',0,'020222',1,32);
INSERT INTO post VALUES ('B00017','เสนอราคา','เข้าเล่มปริญญานิพนธ์ 120 บาท ไม่รวมถ่ายเอกสาร ที่ร้านแตงกวา',120,'020228',2,22);
INSERT INTO post VALUES ('H00006','เช่า','ต้องการหาหอพัก',0,'020228',9,100);
INSERT INTO post VALUES ('N00045','ประกาศ','ใครเห็นเครื่องคิดเลขรุ่น 5500 บ้างมั้ยครับ',0,'020222',1,19);
INSERT INTO post VALUES ('F00012','-','ใครพอจะรู้บ้างจ้ะ',0,'020222',1,104);
INSERT INTO post VALUES ('H00003','ขาย','บ้านเดี่ยวสองชั้น ม. ชัยพฤกษ์',0,'020222',1,67);
INSERT INTO post VALUES ('N00044','แนะนำ','การไม่มีโรคเป็นลาภอันประเสิรฐ คุณจะทำอย่างไรร่างกายถึงแข็งแรง',0,'020222',0,10);
INSERT INTO post VALUES ('L00012','แจ้งหาย','ใครเห็นเครื่องคิดเลข 5500 บ้าง มีสติ๊กเกอร์ เซเว่นติดอยู่ ใครเห็นบอกด้วยเด้อ ...',0,'020223',0,8);
INSERT INTO post VALUES ('B00015','ขาย','เบอร์เซิร์ก เล่ม 1-20',0,'020224',1,11);
INSERT INTO post VALUES ('L00013','แจ้งหาย','ใครเก็บกระเป๋าสตางค์ Flynow สีดำได้นำมาคืนด้วย',0,'020224',0,9);
INSERT INTO post VALUES ('A00016','ขาย','ขาย Nokia 3310 4700 บาท',4700,'020224',0,36);
INSERT INTO post VALUES ('B00016','ขาย','แนวข้อสอบเก่าวิศวกรรมศาสร์, ครุศาสตร์ ย้อนหลัง 20 ปี (ปวส.ต่อ ป.ตรี) KMIT-T, KMIT-L, KMIT-NB',390,'020224',0,33);
INSERT INTO post VALUES ('N00047','ประกาศ','ฮิลล์ผวาแข้งปีศาจแดง หั่นราคาแชมป์ลง 8-15',0,'020224',0,6);
INSERT INTO post VALUES ('H00012','ให้เช่า','บ้านเดี่ยว 2 ชั้น 3 ห้องนอน 4 ห้องน้ำ',6000,'020324',0,41);
INSERT INTO post VALUES ('H00005','แนะนำ','ใครต้องการหอพักที่มี UBC เชิญที่หอถาวรพฤกษ์ ซ.เกกีงาม 3',2800,'020227',7,71);
INSERT INTO post VALUES ('V00006','เสนอราคา','วินรถตู้หน้าคณะวิทยาศาสตร์ใต้สะพานลอย',30,'020227',1,68);
INSERT INTO post VALUES ('H00014','แนะนำ','น้องใหม่อยากให้บอกรายละเอียดมากกว่านี้',0,'020401',5,28);
INSERT INTO post VALUES ('L00014','แจ้งหาย','เจอแฟ้มสีฟ้าใสครับ หน้าห้องสอบตึก ME403 ของใครเอ่ย',0,'020228',0,12);
INSERT INTO post VALUES ('E00007','ขาย','เฟรมผ้าใบสำหรับวาดภาพสีน้ำมัน',30,'020308',0,10);
INSERT INTO post VALUES ('H00008','เช่า','กำลังหาหอพักด่วน',0,'020310',2,49);
INSERT INTO post VALUES ('N00054','ประกาศ','ตู้เย็น + ตู้เสื้อผ้า จบแล้วเลยขาย ขนกลับบ้านลำบาก เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ',0,'020310',2,17);
INSERT INTO post VALUES ('L00015','แจ้งหาย','สอดเเบ็ง1000ไว้ในการ์ตูนที่เช่ามา เเล้วเพื่อนเอาการ์ตูนไปคืน(jojo)',0,'020311',1,23);
INSERT INTO post VALUES ('N00055','รับจ้าง','รับถ่ายรูป Project',0,'020311',0,16);
INSERT INTO post VALUES ('N00056','รับจ้าง','รับพิมพ์รายงานวิทยานิพนธ์',0,'020312',0,14);
INSERT INTO post VALUES ('N00057','ประกาศ',' ธุรกิจซอฟต์แวร์กับการแก้ไขกฎหมายลิขสิทธิ์',0,'020314',1,26);
INSERT INTO post VALUES ('N00059','จ้าง','Multimedia Technology  รับสมัคร Systems Engineer',0,'020319',0,31);
INSERT INTO post VALUES ('F00017','-','เหงาจังเลย อยากรู้จักเด็กวิดวะบ้างจัง',0,'020315',5,112);
INSERT INTO post VALUES ('F00018','-','คุยไม่เก่ง  อยากให้รู้ด้วยแววตา ... มาเป็นเพื่อนกันนะ',0,'020315',4,75);
INSERT INTO post VALUES ('B00020','ขาย','ขาย text circuit ของprenticehal ใช้เรียนปี1สำหรับวิศวะไฟฟ้า(รวม) เเละปี2สำหรับภาคelec',500,'020318',2,27);
INSERT INTO post VALUES ('H00011','แนะนำ','ช่วงนี้หอพักกำลังว่าง ใครอยากย้ายรีบด่วน',0,'020315',0,49);
INSERT INTO post VALUES ('N00060','จ้าง','Multimedia Technology  รับสมัคร Project Co-Ordinator',0,'020319',0,23);
INSERT INTO post VALUES ('N00062','ประกาศ','ออสการ์ครั้งที่ 74 นักแสดงผิวดำยึดเวที',0,'020325',0,9);
INSERT INTO post VALUES ('A00019','ขาย','ตู้เย็น + ตู้เสื้อผ้า เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ',4700,'020326',0,15);
INSERT INTO post VALUES ('N00063','ประกาศ','ตู้เย็น + ตู้เสื้อผ้า เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ',0,'020326',0,7);
INSERT INTO post VALUES ('N00064','แนะนำ','If u want to earn money',0,'020326',0,34);
INSERT INTO post VALUES ('H00013','ให้เช่า','หอออมสิน ข้างแตงกวา ว่างครับ ให้เช่าอยู่ต่อได้ทันที ติดต่อ 016930247 เอ็ด',2800,'020326',2,26);
INSERT INTO post VALUES ('A00020','ซื้อ','ต้องการซื้อ Harddisk 1.2 G &amp; 1.7 G ราคาเสนอมา',0,'020327',7,25);
INSERT INTO post VALUES ('A00021','ขาย','ขาย Sim GSM รายเดือน เบอร์สวยครับ (01) 7-536-536',2000,'020327',0,9);
INSERT INTO post VALUES ('F00019','-','ญ.  ก็ได้  ช. ก็ดีที่มีภาษาอังกฤษในหัวใจ',0,'020401',2,22);
INSERT INTO post VALUES ('A00024','แนะนำ','เรียนรู้วิธีการหารายได้ 10 ล้านบาทจากเว็บอีคอมเมิร์ซของคนไทย',0,'020401',1,13);
INSERT INTO post VALUES ('B00021','ขาย','Digital Signal Procesing ของ อ.อรรถสิทธ์ หล่าสกุล',50,'020401',0,5);
INSERT INTO post VALUES ('B00022','ขาย','ซีรอก หนังสือImage Processing',100,'020401',0,3);
INSERT INTO post VALUES ('A00025','ขาย','ผลิตภัณฑ์โภชนาการสำหรับลดน้ำหนักและรักษาสุขภาพ',0,'020401',0,3);
INSERT INTO post VALUES ('N00065','ประกาศ','จับปลาดาวลงทะเล ทดสอบฟรีซอฟต์แวร์ยอดฮิต',0,'020403',0,1);

#
# Table structure for table 'poster'
#

CREATE TABLE poster (
  code varchar(6) NOT NULL default '',
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  member tinyint(1) default NULL,
  picture varchar(40) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'poster'
#

INSERT INTO poster VALUES ('B00000','webmaster','doctork@mweb.co.th','161.246.5.225',1,'pic/B00000.jpg',0);
INSERT INTO poster VALUES ('N00000','webmaster','doctork@mweb.co.th','161.246.5.215',1,'',0);
INSERT INTO poster VALUES ('A00022','คุณต่อ','nineforce@hotmail.com','161.246.6.84',0,'',0);
INSERT INTO poster VALUES ('L00000','doctork','doctork@mweb.co.th','161.246.5.215',1,'',0);
INSERT INTO poster VALUES ('H00000','จงดี','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('V00000','doctork','doctork@mweb.co.th','161.246.5.215',1,'',0);
INSERT INTO poster VALUES ('F00000','บ.บู๋','pimpim43@hotmail.com','161.246.5.227',0,'',0);
INSERT INTO poster VALUES ('A00000','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/A00000.jpg',0);
INSERT INTO poster VALUES ('V00007','max','m_million@hotmail.com','203.148.170.6',0,'',0);
INSERT INTO poster VALUES ('F00001','doctork','doctork@mweb.co.th','161.246.5.225',1,'pic/F00001.jpg',0);
INSERT INTO poster VALUES ('N00002','doctork','doctork@mweb.co.th','161.246.5.225',1,'pic/N00002.jpg',0);
INSERT INTO poster VALUES ('A00017','max','m_million@hotmail.com','203.148.170.6',0,'',0);
INSERT INTO poster VALUES ('B00018','บี','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00005','doctork','doctork@mweb.co.th','161.246.5.225',1,'pic/N00005.jpg',0);
INSERT INTO poster VALUES ('N00006','webmaster','doctork@mweb.co.th','161.246.5.225',1,'pic/N00006.gif',0);
INSERT INTO poster VALUES ('N00007','webmaster','doctork@mweb.co.th','161.246.5.225',1,'pic/N00007.gif',0);
INSERT INTO poster VALUES ('A00001','pokg','','161.246.5.171',0,'',0);
INSERT INTO poster VALUES ('A00002','อนันต์','darkness@djuice.co.th','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00001','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/B00001.gif',0);
INSERT INTO poster VALUES ('N00008','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00008.jpg',0);
INSERT INTO poster VALUES ('B00014','papods','papods@thaimail.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('L00002','george','pimpim43@hotmail.com','161.246.5.227',0,'',0);
INSERT INTO poster VALUES ('N00009','doctork','doctork@mweb.co.th','161.246.5.227',1,'pic/N00009.jpg',0);
INSERT INTO poster VALUES ('N00010','doctork','doctork@mweb.co.th','161.246.5.215',1,'',0);
INSERT INTO poster VALUES ('L00003','masaki','','161.246.51.114',0,'',0);
INSERT INTO poster VALUES ('B00013','โจ','jobook2001@yahoo.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00050','max','m_million@hotmail.com','203.148.170.6',0,'',0);
INSERT INTO poster VALUES ('F00002','Lucky_man','pimpim43@hotmail.com','161.246.5.215',1,'pic/F00002.gif',0);
INSERT INTO poster VALUES ('H00007','เค','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00031','เด็กวัด','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00049','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00049.jpg',0);
INSERT INTO poster VALUES ('L00009','MangMug','s2010159@kmitl.ac.th','161.246.5.38',1,'pic/L00009.gif',0);
INSERT INTO poster VALUES ('F00004','อาย','aya_naruk@hotmail.com','203.146.65.164',0,'',0);
INSERT INTO poster VALUES ('L00005','บ.บู๋','pimpim43@hotmail.com','161.246.5.227',0,'',0);
INSERT INTO poster VALUES ('F00005','news','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('F00006','news','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('F00007','newsss','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('F00008','pp','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('F00009','s2015321','s2015321@ce.kmitl.ac.th','161.246.5.215',1,'pic/F00009.jpg',0);
INSERT INTO poster VALUES ('N00015','ธนิต','thanitk@hotmail.com','203.148.174.67',0,'',0);
INSERT INTO poster VALUES ('A00023','zaffer','bscy@hotmail.com','161.246.51.227',0,'',0);
INSERT INTO poster VALUES ('N00018','แบงค์','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00017','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00017.gif',0);
INSERT INTO poster VALUES ('H00001','เจษฎา','saokhum@yahoo.com','161.246.5.230',0,'',0);
INSERT INTO poster VALUES ('N00014','บ.บู๋','pimpim43@hotmail.com','161.246.5.227',0,'',0);
INSERT INTO poster VALUES ('N00046','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00046.gif',0);
INSERT INTO poster VALUES ('F00003','fowler','doctork@mweb.co.th','161.246.5.215',1,'pic/F00003.jpg',0);
INSERT INTO poster VALUES ('B00002','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/B00002.jpg',0);
INSERT INTO poster VALUES ('A00006','Tik','','161.246.6.139',0,'',0);
INSERT INTO poster VALUES ('B00019','อุ้ม','a_zphinx@hotmail.com','161.246.7.47',0,'',0);
INSERT INTO poster VALUES ('H00008','jojo','','161.246.51.214',0,'',0);
INSERT INTO poster VALUES ('A00005','027195404','','161.246.6.139',0,'',0);
INSERT INTO poster VALUES ('F00014','zero_ou','zero_ou@hotmail.com','203.150.192.17',1,'',0);
INSERT INTO poster VALUES ('L00008','013298194','','161.246.5.12',0,'',0);
INSERT INTO poster VALUES ('E00003','vision','','203.152.18.4',0,'',0);
INSERT INTO poster VALUES ('E00004','vision','few_12@hotmail.com','203.152.18.4',1,'pic/E00004.jpg',1);
INSERT INTO poster VALUES ('F00010','RedRibbon','','161.246.51.211',0,'',0);
INSERT INTO poster VALUES ('A00004','doctork','doctork@mweb.co.th','161.246.6.139',1,'',0);
INSERT INTO poster VALUES ('N00027','พี่แจ้น','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00052','แจ้นตัวปลอม','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('F00013','เพื่อน G','','161.246.5.223',0,'',0);
INSERT INTO poster VALUES ('N00019','ธนัญชัย','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('H00009','aeje','','161.246.5.42',0,'',0);
INSERT INTO poster VALUES ('H00004','คนหวังดี','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('A00009','โม','suraket@hotmail.com','161.246.6.130',0,'',0);
INSERT INTO poster VALUES ('A00008','แดน','-','161.246.6.73',0,'',0);
INSERT INTO poster VALUES ('F00015','toon','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('A00007','doctork','doctork@mweb.co.th','161.246.6.73',1,'pic/A00007.jpg',0);
INSERT INTO poster VALUES ('',' kyz2074','kyz2074@yahoo.com','161.246.6.73',0,'',0);
INSERT INTO poster VALUES ('A00010','เล็ก','www.rungrotelek@mail.com','161.246.6.73',0,'',0);
INSERT INTO poster VALUES ('N00025','phat','pc_phat@hotmail.com','203.146.213.216',0,'',0);
INSERT INTO poster VALUES ('F00018','กิก','','203.149.37.130',0,'',0);
INSERT INTO poster VALUES ('V00003','surachet','kksurach@kmitl.ac.th','161.246.45.222',1,'pic/V00003.jpg',1);
INSERT INTO poster VALUES ('N00028','รุ่งรัตน์','oxygenbkk@hotmail.com','203.146.131.167',0,'',0);
INSERT INTO poster VALUES ('V00004','เน่าคับ','mcdornao@yahoo.com','203.113.34.7',0,'',0);
INSERT INTO poster VALUES ('F00011','โอ','soljar@thaimail.com','202.183.254.133',0,'',0);
INSERT INTO poster VALUES ('N00029','ชมรมชาวเหนือ','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('H00002','ดวงระวี','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00030','ชมรมพุทธฯ','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('A00011','surachet','kksurach@kmitl.ac.th','161.246.45.222',1,'pic/A00011.gif',1);
INSERT INTO poster VALUES ('H00006','น้องใหม่','1@2.3','203.152.53.201',0,'',0);
INSERT INTO poster VALUES ('A00012','surachet','kksurach@kmitl.ac.th','161.246.45.222',1,'pic/A00012.gif',1);
INSERT INTO poster VALUES ('A00013','surachet','kksurach@kmitl.ac.th','161.246.45.222',1,'pic/A00013.gif',1);
INSERT INTO poster VALUES ('A00014','surachet','kksurach@kmitl.ac.th','161.246.45.222',1,'pic/A00014.gif',1);
INSERT INTO poster VALUES ('A00015','surachet','kksurach@kmitl.ac.th','161.246.45.222',1,'pic/A00015.gif',1);
INSERT INTO poster VALUES ('B00005','doctork','doctork@mweb.co.th','161.246.5.215',1,'',0);
INSERT INTO poster VALUES ('B00006','wutinon','wutinon@ksc.th.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00007','CHEW74','chew74@hotmail.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00008','dusit','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00009','danai','da_nai@hotmail.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00010','ten','ten_ee@hotmail.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00061','webmaster','doctork@mweb.co.th','161.246.5.215',1,'',0);
INSERT INTO poster VALUES ('V00005','เจ้าของร้าน','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00011','penpen','lillycat@chaiyo.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('E00005','รุ่นน้อง','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00034','mtu@ch7.com','mtu@ch7.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('A00018','wan','pe_wan@hotmail.com','203.149.37.225',0,'',0);
INSERT INTO poster VALUES ('N00036','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00036.gif',0);
INSERT INTO poster VALUES ('N00037','swpark','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00038','nectec','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00039','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00039.jpg',0);
INSERT INTO poster VALUES ('L00011','พี่ตั้ม','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00062','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00062.jpg',0);
INSERT INTO poster VALUES ('E00006','cloudy','s3010561@kmitl.ac.th','161.246.7.55',1,'',1);
INSERT INTO poster VALUES ('B00012','ปิติพงษ์  ประภามณฑล','','161.246.51.130',0,'',0);
INSERT INTO poster VALUES ('N00041','mobile','mobile@kmitl.ac.th','161.246.62.201',0,'',0);
INSERT INTO poster VALUES ('B00017','แตงกวา','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('F00012','โดเรมี','luvlyz@hotmail.com','203.121.146.72',0,'',0);
INSERT INTO poster VALUES ('H00003','รักษ์','','161.246.5.12',0,'',0);
INSERT INTO poster VALUES ('N00044','เจี๊ยบ','ืnarumonstar@hotmail.com','161.246.42.132',0,'',0);
INSERT INTO poster VALUES ('N00045','darkness','','161.246.5.222',0,'',0);
INSERT INTO poster VALUES ('L00012','จอร์จ','gnj43@hotmail.com','161.246.5.227',0,'',0);
INSERT INTO poster VALUES ('B00015','penpen','lillycat@chaiyo.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('L00013','เจ้าของกระเป๋า','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('A00016','ไอซ์','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('B00016','Verawat_k','verawat_k@hotmail.com','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00047','doctork','doctork@mweb.co.th','161.246.5.215',1,'pic/N00047.jpg',0);
INSERT INTO poster VALUES ('H00012','ยุทธ','s.yutthana@thaimail.com','161.246.5.222',0,'',0);
INSERT INTO poster VALUES ('H00005','K','-','161.246.5.12',0,'',0);
INSERT INTO poster VALUES ('V00006','K','-','161.246.5.12',0,'',0);
INSERT INTO poster VALUES ('L00014','doctork','','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('N00053','Taop','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('E00007','กันทิมา','kantimabee@hotmail.com','202.29.26.8',0,'',0);
INSERT INTO poster VALUES ('N00054','ชิต','','161.246.51.214',0,'',0);
INSERT INTO poster VALUES ('L00015','wer','nasjang@lemononline.com','203.146.235.213',0,'',0);
INSERT INTO poster VALUES ('N00055','KEN','-','161.246.5.223',0,'',0);
INSERT INTO poster VALUES ('N00056','พี่หนิง','-','161.246.5.215',0,'',0);
INSERT INTO poster VALUES ('H00010','newway','newway@yahoo.com','161.246.42.84',1,'',1);
INSERT INTO poster VALUES ('N00057','webmaster','doctork@mweb.co.th','161.246.5.229',1,'pic/N00057.jpg',0);
INSERT INTO poster VALUES ('N00060','Cherdsak Thawornsate','cherdsak@multimedia.co.th','203.152.50.226',0,'',0);
INSERT INTO poster VALUES ('F00017','sarah','','161.246.45.75',0,'',0);
INSERT INTO poster VALUES ('N00059','Cherdsak Thawornsate','cherdsak@multimedia.co.th','203.152.50.226',0,'',0);
INSERT INTO poster VALUES ('B00020','yelly','nasjang@lemononline.com','161.246.5.12',0,'',0);
INSERT INTO poster VALUES ('N00058','doctork','doctork@mweb.co.th','161.246.5.223',1,'pic/N00058.jpg',0);
INSERT INTO poster VALUES ('H00011','webmaster','doctork@mweb.co.th','161.246.5.229',1,'',0);
INSERT INTO poster VALUES ('A00019','ชิต','jojo_turbo@hotmail.com','203.113.36.7',0,'',0);
INSERT INTO poster VALUES ('N00063','ชิต','jojo_turbo@hotmail.com','203.113.36.7',0,'',0);
INSERT INTO poster VALUES ('N00064','noina','','161.246.51.188',0,'',0);
INSERT INTO poster VALUES ('H00013','ต่อ','nineforce@hotmail.com','161.246.6.166',0,'',0);
INSERT INTO poster VALUES ('A00020','tum','tumcom04@hotmail.com','161.246.5.215',1,'',1);
INSERT INTO poster VALUES ('A00021','เชาว์','chawdee@thai.com','161.246.5.223',0,'',0);
INSERT INTO poster VALUES ('L00016','smart','mart@grlmail.com','161.246.51.63',0,'',0);
INSERT INTO poster VALUES ('H00014','น้องใหม่','','203.155.48.3',0,'',0);
INSERT INTO poster VALUES ('F00019','Tom','s4015193@kmitl.ac.th','203.155.70.253',0,'',0);
INSERT INTO poster VALUES ('A00024','richman','richman2002@thaimail.com','203.101.151.124',1,'',0);
INSERT INTO poster VALUES ('B00021','NuNg','','203.149.40.239',0,'',0);
INSERT INTO poster VALUES ('B00022','NuNg','','203.149.40.239',0,'',0);
INSERT INTO poster VALUES ('A00025','ปริญ','aor_21@yahoo.com','203.107.247.151',0,'',0);
INSERT INTO poster VALUES ('N00065','webmaster','doctork@mweb.co.th','161.246.5.215',1,'pic/N00065.jpg',0);

#
# Table structure for table 'toadmin'
#

CREATE TABLE toadmin (
  no int(11) NOT NULL auto_increment,
  detail text,
  sender varchar(20) default NULL,
  email varchar(40) default NULL,
  date varchar(20) default NULL,
  topic varchar(150) NOT NULL default '',
  ans tinyint(2) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'toadmin'
#

INSERT INTO toadmin VALUES (1,'ให้ใส่ Credit โดยบอกว่าใครทำ ใครเป็นที่ปรึกษา ภาคไหนฯ','อ. ธนา','thana@ce.kmitl.ac.th','30/01/02','เพิ่มเติม Credit',NULL);
INSERT INTO toadmin VALUES (2,'ในแต่ละหน้า ให้ใส่ความหมายของ icon ต่าง ๆ ไว้ด้านล่างด้วย ','อ. ธนา','thana@ce.kmitl.ac.th','30/01/02','เพิ่มเติม',NULL);
INSERT INTO toadmin VALUES (3,'ให้แก้ code เป็นรหัส เพราะไหน ๆ ที่อื่นก็เป็นไทยแล้ว ก็น่าจะเป็นไทยให้หมด\r\n','อ. ธนา','thana@ce.kmitl.ac.th','30/01/02','เพิ่มเติม',NULL);
INSERT INTO toadmin VALUES (4,'สนใจทำ Cookie เพิ่มเติมใหม่ โดยเพิ่ม login อัตโนมัติ กับ การแสดงผลว่ามีหัวข้ออะไรใหม่บ้าง','อ. ธนา','thana@ce.kmitl.ac.th','30/01/02','ทำ Cookie ดีไหม',NULL);
INSERT INTO toadmin VALUES (5,'ก่อนถึงหมวดหมู่สินค้า อยากให้เพิ่มข้อความบอกจุดประสงค์ ที่ไปที่มาของ Web นี้สักหน่อย เพราะดูมันห้วน ๆ ไปสักหน่อยนะ ว่ามั้ย\r\n','อ. ธนา','thana@ce.kmitl.ac.th','31/01/02','เพิ่มเติม',NULL);
INSERT INTO toadmin VALUES (6,'อยากให้เปลี่ยน 2002 เป็น พศ. จะดีกว่านะ\r\n','อ. ธนา','thana@ce.kmitl.ac.th','31/01/02','เพิ่มเติม',NULL);
INSERT INTO toadmin VALUES (18,'-http://161.246.4.7/marketplace/ladkrabangmarket/showveh.php?Code=V00001\r\n-http://161.246.4.7/marketplace/ladkrabangmarket/showveh.php?Code=V00002','ตั้ม','auto017@hotmail.com','18/02/02','ฝากลบประกาศ(ซ้ำ)',NULL);
INSERT INTO toadmin VALUES (9,'ได้รับข้อความป่าวเอ่ย.... ตอนนี้ผม config sapphire เรื่อยๆ มีรัยก็ บอกนะครับ จะแก้ไขให้.... แล้วก็ระวัง เรื่อง security ของ mysql ด้วยล่ะ','MangMug','sirikhum@sapphire.ce.kmitl.ac.th','12/02/02','ทดสอบจาก root@sapphire',NULL);
INSERT INTO toadmin VALUES (10,'น่าจะมีหัวข้อวิชาการด้วยเพราะเป็นสถาบันการศึกษา','แนะนำ','แนะนำ','13/02/02','น่าจะมีหัวข้อวิชาการด้วยเพราะเป็นสถาบันการศึกษา',NULL);
INSERT INTO toadmin VALUES (11,'ส่งรูปไม่ได้ครับ','ตั้ม','auto017@hotmail.com','14/02/02','ส่งรูปไม่ได้ครับ',NULL);
INSERT INTO toadmin VALUES (21,'เรียนอาจารย์ธนา หงษ์สุวรรณ\r\n    ผมขอตัด Link ระบบสื่อกลางการซื้อขายผ่านอินเตอร์เน็ต http://161.246.4.7/marketplace/index.php \r\nเนื่องจากเข้าข่าย ลักษณะเพื่อการค้า\r\n \r\nตามประกาศ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง \r\nเรื่อง กฎระเบียบการใช้งานเครื่องคอมพิวเตอร์และเครือข่าย และระเบียบการเชื่อมต่อเครื่องคอมพิวเตอร์และเครือข่าย \r\nหมวดที่ 2 กฎระเบียบการใช้งานเครื่องคอมพิวเตอร์และเครือข่าย \r\n\r\n\r\nข้อ 2. สถาบันฯ ไม่อนุญาตให้ผู้ใช้งานทำการใด ๆ ที่เข้าข่ายลักษณะเพื่อการค้าหรือการแสวงหาผลกำไรผ่านเครื่องคอมพิวเตอร์และเครือข่าย เช่น การประกาศแจ้งความ การซื้อหรือการจำหน่ายสินค้า การนำข้อมูลไปซื้อขาย การรับบริการค้นหาข้อมูลโดยคิดค่าบริการ การให้บริการโฆษณาสินค้าหรือการเปิดบริการอินเทอร์เน็ตแก่บุคคลทั่วไปเพื่อแสวงหากำไร \r\n  \r\nโดยจะขอตัด Link ดังกล่าวในวันที่ 27 ก.พ. 2545 เป็นต้นไป \r\nจึงเรียนมาเพื่อทราบ \r\nWebmaster@kmitl.ac.th\r\n\r\n','แบงค์','doctork@mweb.co.th','26/02/02','มี mail มาจะทำการปิดระบบครับ',NULL);
INSERT INTO toadmin VALUES (14,'ลงประกาศสิ่งพิมพ์ไม่ได้ถ้าไม่เป็นสมาชิก\r\nแต่ถ้าเป็นสมาชิกลงประกาศได้ ','แบงค์','doctork@mweb.co.th','15/02/02','ลงประกาศสิ่งพิมพ์ไม่ได้ถ้าไม่เป็นสมาชิก',1);
INSERT INTO toadmin VALUES (19,'ผมเสนอว่าควรจะมีการติดต่อกลับที่ง่ายกว่านี้ เช่น แสดงเบอร์ติดต่อกลับเลย เพราะคนที่ไม่รู้ก็ไม่ click ตรง profile หรือใครที่ไม่ได้เป็นสมาชิกก็จะไม่ทราบได้เลย','surachet','kksurach@kmitl.ac.th','21/02/02','การติดต่อกลับลำบาก',NULL);
INSERT INTO toadmin VALUES (20,'กรุณาส่ง Password และวิธีเข้าหน้า Admin มาด้วย','อ. ธนา','thana@ce.kmitl.ac.th','23/02/02','ผมอยากลองเป็น Admin',1);
INSERT INTO toadmin VALUES (22,'Link หาเพื่อนมีจุดประสงค์คืออะไรครับ.. ประกาศหาเพื่อน หรือซื้อขายของกันแน่...','ธนัญชัย','nobody@hotmail.com','02/03/02','Link หาเพื่อน',1);
INSERT INTO toadmin VALUES (23,'อยากได้โปรแกรมนี้\r\nเพื่อไปใช้ที่วิทยาลัยเทคนิคเพชรบูรณ์  ','ครูดูแลระบบที่เทคนิค','thongchai18@hotmail.com','13/03/02','อยากได้โปรแกรมนี้',1);

#
# Table structure for table 'vehicle_ans'
#

CREATE TABLE vehicle_ans (
  no tinyint(4) NOT NULL auto_increment,
  code varchar(6) NOT NULL default '',
  detail text,
  username varchar(20) default NULL,
  email varchar(40) default NULL,
  ip text,
  date varchar(15) default NULL,
  sendmail tinyint(1) default NULL,
  PRIMARY KEY  (no)
) TYPE=MyISAM;

#
# Dumping data for table 'vehicle_ans'
#

INSERT INTO vehicle_ans VALUES (1,'V00000','500 แพงไปหรือเปล่าค่ะลดอีกหน่อยไม่ได้เหรอ <img src=\"pics/lol.gif\">',' oranje','','161.246.51.114','29/01/02',NULL);
INSERT INTO vehicle_ans VALUES (2,'V00000','ก็ได้นะ แต่ถ้าเรียนจบแล้วอาจยกให้ฟรี ๆ เลยก็ได้ถ้าติดต่อมาก่อน <img src=\"pics/smile.gif\">','doctork','','161.246.5.215','30/01/02',NULL);
INSERT INTO vehicle_ans VALUES (3,'V00000','ฟรีจริงเหรอค่ะท่าทางมันจะอยู่ในสภาพใช้ได้อะเปล่าเนี่ย','oranje','','203.148.151.254','01/02/02',NULL);
INSERT INTO vehicle_ans VALUES (4,'V00000','ใช้ได้แน่นอนครับ แต่มันเก่าแล้วนะครับ ขอให้ผมใกล้จบก่อนแล้วกันนะครับ แล้วจะยกให้เลยครับ <img src=\"pics/crying.gif\">','doctork','','161.246.5.215','02/02/02',NULL);
INSERT INTO vehicle_ans VALUES (5,'V00000','<br>\n <img src=\"pics/devil.gif\">เป็นหญิงไม่ได้จะยกให้เลยนะ','NorthBoy','','161.246.6.90','10/02/02',NULL);
INSERT INTO vehicle_ans VALUES (15,'V00004','ขอดูสภาพก่อนนะครับผมจะหัดเล่นคุณขายไปยังถ้ายังไม่ขายขอผมซื้อ แต่ขอดูสภาพก่อนนะครับผม<br>\nชื่อกาน 09-9963695<br>\nราคาพอจะลดได้อีกไหมครับ <img src=\"pics/devil.gif\">','..ตะกาน','kennoby2000@hotmail.com','161.246.60.103','01/03/02',NULL);
INSERT INTO vehicle_ans VALUES (14,'V00000','อ้าวไหนมาขอตัดหน้ากันอย่านี้ล่ะค่ะ ก็พพี่เค้าบอกยกให้แล้วไงว่าไงล่ะค่ะสรุปแล้วให้ใครเนี่ย','oranje','','203.148.151.254','27/02/02',NULL);
INSERT INTO vehicle_ans VALUES (8,'V00004','น้องเอ๋ย อยากได้แต่ไม่มีตังไม่ถึงน่ะครับ <img src=\"pics/reallymad.gif\">','บี','','161.246.5.215','18/02/02',NULL);
INSERT INTO vehicle_ans VALUES (13,'V00000','คุณ doctork ครับ ไหนๆจะยกให้แล้ว ก็ยกให้น้องภาคคอม ด้วยกันเถอะ ครับ ','1P ผู้น่าสงสาร','','161.246.51.149','26/02/02',NULL);
INSERT INTO vehicle_ans VALUES (12,'V00004','1300 แล้วกันนะ ลดให้ เอาป่าวว<br>\n<br>\nต่อรองกันได้ <img src=\"pics/smile.gif\">','อยากขาย','','203.113.34.237','21/02/02',NULL);
INSERT INTO vehicle_ans VALUES (16,'V00007','สนใจครับ','นเรศ','','203.146.166.193','01/03/02',NULL);
INSERT INTO vehicle_ans VALUES (17,'V00007','พี่มีเบอร์ไหมครับ <img src=\"pics/sarcblink.gif\"> <img src=\"pics/frown.gif\"> <img src=\"pics/sunglasses.gif\"> <img src=\"pics/dead.gif\">','นเรศ','','203.146.166.193','01/03/02',NULL);
INSERT INTO vehicle_ans VALUES (18,'V00004','อยากเห็นสภาพของก่อนอ่ะคับ <img src=\"pics/sunglasses.gif\">','01-5192511','','161.246.2.100','07/03/02',NULL);
INSERT INTO vehicle_ans VALUES (19,'V00006','อ้าวมีจิงเหรอ  โกหกอ๊ะป่าว  รถไปสายใต้นะเค้าเลิกวิ่งไปแล้ว<br>\n <img src=\"pics/sunglasses.gif\"> รึว่ามีมาใหม่หา  มั่วป่าว','alfa','','161.246.5.12','07/03/02',NULL);
INSERT INTO vehicle_ans VALUES (20,'V00007','01-5501047','max','','161.246.51.174','11/03/02',0);
INSERT INTO vehicle_ans VALUES (21,'V00000','สนใจคับขายไหม ขอดูร๔หน่อยได้ป่ะ  ถ้าจะขายติดต่อ 01-9191102 นะคับ','เอส','edd_me03@yahoo.com','161.246.12.38','19/03/02',0);
INSERT INTO vehicle_ans VALUES (22,'V00000',' <img src=\"pics/redface.gif\">อูย..........!แย่งกันอยู่นั่นแหละ คนหนึ่งก็อยากได้ของฟรี อีกคนก็อิจฉา คนสุดท้ายก็เอาเงินมาตัดหน้า แล้วคุณ doctork จะเลือกใครครับ ตัดสินใจให้เป็นกลางหน่อยนะครับเพราะเป็นผู้ใหญ่และก็ใกล้จะจบแล้วด้วย <img src=\"pics/smokin.gif\"> <img src=\"pics/smokin.gif\"> <img src=\"pics/sleepy.gif\">','ช่างมันเถอะ','','202.183.196.197','21/03/02',0);
INSERT INTO vehicle_ans VALUES (23,'V00000','แล้วสรุปว่ายังไงกันล่ะค่ะก็ตอนแรกจะซื้อจริง ๆนะแล้วพี่เค้าบอกจะให้ฟรีอะ แล้วมันยังไงกันแน่ล่ะค่ะ','oranje','','203.148.159.180','25/03/02',0);

#
# Table structure for table 'vehicle_data'
#

CREATE TABLE vehicle_data (
  code varchar(6) NOT NULL default '',
  brand varchar(40) default NULL,
  model varchar(40) default NULL,
  color varchar(30) default NULL,
  license varchar(20) default NULL,
  condition varchar(40) default NULL,
  percent tinyint(3) default NULL,
  usedyear tinyint(2) default NULL,
  usedmonth tinyint(2) default NULL,
  detail text,
  howsend varchar(40) default NULL,
  duration varchar(15) default NULL,
  PRIMARY KEY  (code)
) TYPE=MyISAM;

#
# Dumping data for table 'vehicle_data'
#

INSERT INTO vehicle_data VALUES ('V00000','ไม่ระบุ','ไม่ระบุ','สีน้ำเงิน','ไม่ระบุ','ของมือสอง',50,2,6,'ต่อรองได้นิดหน่อยนะติดต่อที่แบงค์ห้อง Olala ตึก B หรือที่ <a href=mailto:doctork@mweb.co.th>doctork@mweb.co.th</a>','นัดเจอเพื่อมารับสินค้า','29/05/02');
INSERT INTO vehicle_data VALUES ('V00006','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'มีรถตู้บริการครับ ไปอนุสาวรีย์ชัย 30 บาท กับไปสายใต้ใหม่ครับ 35-40 บาทสนใจไปได้ครับ วิ่งทั้งวัน','ไปเอง','27/08/02');
INSERT INTO vehicle_data VALUES ('V00003','Honda','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ต้องการซื้อรถมอเตอร์ไซค์เก่า มือสอง Honda C-50 ขึ้นไป หรือจะเป็นรุ่นใหม่ ๆ ขึ้นมาเป็น Dream หรือ Wave ก็ได้ครับ อยากซื้อไว้ใช้เองครับ','นัดเจอเพื่อมารับสินค้า','19/05/02');
INSERT INTO vehicle_data VALUES ('V00004','gullwing มั๊ง','ไม่ระบุ','บอดสี ฟ้า ลาย กราฟฟิก','ไม่ระบุ','ของมือสอง',90,2,1,'สภาพเนียน เก่าเก็บ ไม่เก่าใช้<br>\n<br>\nทิ้งเมล หรือ เบอร์ไว้นะ จะติดต่อเองคับ','นัดเจอเพื่อมารับสินค้า','17/02/03');
INSERT INTO vehicle_data VALUES ('V00005','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',0,0,0,'ร้านซ่อมจักรยานซอยเกกี 3 รับซ่อมจักรยานทุกประเภท ลองมาซ่อมสิครับ ราคาไม่แพงอย่างที่คิดคนซ่อมใจดีครับ ไม่คิดราคาแพงเข้าทางซอยเกกี 3 ครับ เกือบสุดซอยอยู่ซ้ายมือ ซ่อม Motorcycle ก็ได้นะครับ','ไปเองนะครับ','20/02/03');
INSERT INTO vehicle_data VALUES ('V00007','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ไม่ระบุ','ของมือสอง',80,0,0,'ตู้เย็น + รถจักรยาน + โต๊ะเขียนหนังสือ จะจบแล้ว <font color=red>***</font>เกียจเอากลับ เหมาะเอาไว้ใช้ที่หอ ใครสนใจก็ติดต่อมานะ','ไม่ระบุ','28/05/02');

