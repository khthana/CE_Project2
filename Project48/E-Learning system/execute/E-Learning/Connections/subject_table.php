<?php
if (mysql_query("CREATE TABLE subject("."subject_ID int not null auto_increment primary key"."
																		,subject_name varchar(40)"."
																		,short_description text"."
																		,description text"."
																		,subject_point int)"))
																		{print ("สร้างตาราง subject สำเร็จ<br>");}
$subject_ID ="01072111";
$subject_name ="Digital circuit and logic design";
$short_description ="เรียนรู้และออกแบบวงจรดิจิตอล";
$description ="การออกแบบวงจรดิจิตอลและวงจรตรรก ทฤษฎีเบื้องต้นของวงจรสวิทชิ่ง คณิตศาสตร์แบบบูลเลี่ยน รหัสคอมพิวเตอร์ การตรวจสอบความผิดพลาด คะนอแมบ วงจรเกท แบบแอนออร์ และนอท วงจรพลิปพลอป วงจรนับ วงจรชีพรีจิสเตอร์ ระบบดิจิตอล แบบต่างๆและความรู้เบื้องต้นของไมโครโปรเซสเซอร์";
$subject_point = "3";
mysql_query("INSERT INTO subject SET "." subject_ID ='$subject_ID' ".",subject_name='$subject_name'".",short_description='$short_description'".",description='$description'"."
						,subject_point='$subject_point'") ;

$subject_ID ="01072127";
$subject_name ="Database system";
$short_description ="เรียนรู้ระบบฐานข้อมูลและการออกแบบ";
$description ="แนวคิดระบบฐานข้อมูล แฟ้มข้อมูลและฐานข้อมูล สถาปัตยกรรมฐานข้อมูล ระบบการจัดการฐานข้อมูล ฐานข้อมูลเชิงสัมพันธ์ การออกแบบฐานข้อมูลด้วยวิธีอีอาร์ การออกแบบฐานข้อมูลด้วยวิธีนอร์มัลไลเซชัน ภาษาฐานข้อมูล";
$subject_point = "3";
mysql_query("INSERT INTO subject SET "." subject_ID ='$subject_ID' ".",subject_name='$subject_name'".",short_description='$short_description'".",description='$description'"."
						,subject_point='$subject_point'") ;

$subject_ID ="01074305";
$subject_name="Computer security";
$short_description ="การรักษาความปลอดภัยในระบบคอมพิวเตอร์";
$description ="ศึกษาเทคนิคของการรักษาความปลอดภัยในระบบคอมพิวเตอร์ การตรวจสอบสิทธิในการใช้งานในระบบเครือข่าย การเข้ารหัสข้อมูล ระบบการตรวจสอบและป้องกันผู้บุกรุก ไวรัสคอมพิวเตอร์ การวิเคราะห์ความเสี่ยง การรักษาความปลอดภัยทั่วไปและ การรักษาความปลอดภัยในระบบเครือข่ายคอมพิวเตอร์ ระบบการป้องกันขั้นสูงโดยอาศัยข้อมูลอ้างอิงทางสถิติ"; 
$subject_point = "3";
mysql_query("INSERT INTO subject SET "." subject_ID ='$subject_ID' ".",subject_name='$subject_name'".",short_description='$short_description'".",description='$description'"."
						,subject_point='$subject_point'") ;

$subject_ID ="01072125";
$subject_name="Computer network";
$short_description ="เรียนรู้เครือข่ายทางคอมพิวเตอร์";
$description ="ระบบเปิดและแบบจำลอง OSI ลักษณะทางกายภาพของระบบเครือข่าย การสื่อสารข้อมูลโดยใช้สัญญาณอนาล็อก และดิจิตอล การส่งข้อมูลชนิดซิงโครนัส และ อะซิงโครนัส เทคนิคการผสมสัญญาณ เทคนิคการบีบอัดข้อมูล ซีอาร์ซี (CRC) รหัสของฮัมมิง มาตรฐานการเชื่อมต่อระดับที่ 1 การควบคุมการไหลของข้อมูลโดยใช้เทคนิคหน้าต่างเลื่อน ประสิทธิภาพของโปรโตคอล โปรโตคอลการเชื่อมต่อระดับที่ 2 เครือข่ายแบบ HDLC BSC เครือข่ายท้องถิ่นแบบ IEEE 802.3 Ethernet และแบบ IEEE 802.5 Token Ring การเชื่อมต่อเครือข่ายท้องถิ่นหลายวง การหาเส้นทางของเครือข่าย โปรโตคอลชุด X โปรโตคอลอินเตอร์เน็ต โปรโตคอลทรานสพอร์ท เครือข่ายแบบ ISDN และ BISDN เครือข่ายแบบ Frame Relay และเครือข่ายแบบ ATM การประยุกต์ใช้งานเครือข่ายคอมพิวเตอร์";
$subject_point = "3";
mysql_query("INSERT INTO subject SET "." subject_ID ='$subject_ID' ".",subject_name='$subject_name'".",short_description='$short_description'".",description='$description'"."
						,subject_point='$subject_point'") ;

$subject_ID ="01072008";
$subject_name="Microprofessor interfacing";
$short_description ="เรียนรู้การทำงานของไมโครโพรเฟสเซอร์และการออกแบบ";
$description ="โครงสร้างของระบบไมโครคอมพิวเตอร์ ระบบบัสต่าง ๆ การเขียนโปรแกรมภาษาแอสเซมบลี และการเขียนโปรแกรมระดับสูงในการควบคุมระบบ การประยุกต์ใช้งานระบบไมโครคอมพิวเตอร์ เพื่อติดต่อกับอุปกรณ์ภายนอกทางพอร์ตขนาน พอร์ตอนุกรม และบัสภายใน วิธีที่ใช้ในการควบคุมอุปกรณ์ภายนอกแบบอินเทอรัปต์ โพลลิ่ง การอ้างตำแหน่งแบบเทียบหน่วยความจำ และเทียบอินพุตเอาท์พุต";
$subject_point = "4";
mysql_query("INSERT INTO subject SET "." subject_ID ='$subject_ID' ".",subject_name='$subject_name'".",short_description='$short_description'".",description='$description'"."
						,subject_point='$subject_point'") ;
if (mysql_query("CREATE TABLE course("."course_ID int not null auto_increment primary key"."
																		,subject_ID int"."
																		,course_NO int"."
																		,learn_start varchar(100)"."
																		,learn_time varchar(100)"."
																		,last_day varchar(30)"."
																		,teacher_ID int
																		,IP varchar(255))"))
																		{print ("สร้างตาราง course สำเร็จ<br>");}
//example course
//Computer network course1
$subject_ID="01072125";
$course_NO="1";
$learn_start="20/03/2006";
$learn_time="1100000/09.00-12.00";
$last_day="09/05/2006";
$teacher_ID="11";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Computer network course2
$course_NO="2";
$learn_start="22/03/2006";
$learn_time="0011000/13.00-16.00";
$last_day="11/05/2006";
$teacher_ID="7";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Computer network course3
$course_NO="3";
$learn_start="23/03/2006";
$learn_time="0001100/09.00-12.00";
$last_day="12/05/2006";
$teacher_ID="10";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Computer security course1
$subject_ID="01074305";
$course_NO="1";
$learn_start="20/03/2006";
$learn_time="1100000/13.00-16.00";
$last_day="09/05/2006";
$teacher_ID="12";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Computer security course2
$course_NO="2";
$learn_start="23/03/2006";
$learn_time="0001100/17.00-20.00";
$last_day="12/05/2006";
$teacher_ID="8";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Database system course1
$subject_ID="01072127";
$course_NO="1";
$learn_start="15/03/2006";
$learn_time="0011000/09.00-12.00";
$last_day="25/05/2006";
$teacher_ID="4";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Database system course2
$course_NO="2";
$learn_start="18/03/2006";
$learn_time="0000011/13.00-16.00";
$last_day="28/05/2006";
$teacher_ID="4";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Digital circuit and logic design course1
$subject_ID="01072111";
$course_NO="1";
$learn_start="13/03/2006";
$learn_time="1010100/09.00-12.00";
$last_day="28/04/2006";
$teacher_ID="1";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Digital circuit and logic design course2
$course_NO="2";
$learn_start="14/03/2006";
$learn_time="0111000/13.00-16.00";
$last_day="27/04/2006";
$teacher_ID="6";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Digital circuit and logic design course3
$course_NO="3";
$learn_start="18/03/2006";
$learn_time="0000011/13.00-16.00";
$last_day="27/05/2006";
$teacher_ID="2";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Microprofessor interfacing course1
$subject_ID="01072008";
$course_NO="1";
$learn_start="13/03/2006";
$learn_time="1100000/09.00-12.00";
$last_day="16/05/2006";
$teacher_ID="5";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
//Microprofessor interfacing course2
$course_NO="2";
$learn_start="15/03/2006";
$learn_time="0011000/09.00-12.00";
$last_day="18/05/2006";
$teacher_ID="9";
$sql="INSERT INTO course SET "."subject_ID='$subject_ID' ".",course_NO='$course_NO' ".",learn_start ='$learn_start' ".",learn_time ='$learn_time' ".",last_day ='$last_day' ".",teacher_ID ='$teacher_ID' ";
mysql_query($sql,$conn);
?>