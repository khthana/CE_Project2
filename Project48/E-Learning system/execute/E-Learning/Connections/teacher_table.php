<?php
//สร้างตาราง teacher
if (mysql_query("CREATE TABLE teacher("."teacher_ID int not null auto_increment primary key"."
																		,user_ID int not null "."
																		,title varchar(40) not null "."
																		,name varchar(80) not null "."
																		,surname varchar(80) not null "."
																		,position varchar(200) not null "."
																		,email varchar(100) not null "."
																		,telnum varchar(100) not null "."
																		,teach_degree varchar(15) not null "."
																		,personal_link varchar(40)"."
																		,education text not null "."
																		,research1 varchar(100)"."
																		,research2 varchar(100)"."
																		,research3 varchar(100)"."
																		,research4 varchar(100)"."
																		,research5 varchar(100)"."
																		,book1 varchar(100)"."
																		,book2 varchar(100)"."
																		,book3 varchar(100)"."
																		,book4 varchar(100)"."
																		,book5 varchar(100)"."
																		,teacher_pic varchar(30))"))
																		{print ("สร้างตาราง teacher สำเร็จ<br>");}
//อาจารย์คนที่1																		
$user_ID =2;
$username ="teacher01";
$password  = "teacher01";
$status		= "teacher";
$title ="รศ.";
$name ="ประทีป";
$surname  = "บัญญัตินพรัตน์";
$position ="รองศาสตราจารย์, รักษาการหัวหน้าภาควิชา";
$email ="kbprathe@ce.kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 113";
$teach_degree="110";
$personal_link="www.b_pratheep@yahoo.com"; 
$education="ตรี  วศ.บ. สจล.
โท  M.Eng. Tokai University, Japan";                    
$research1="Computer Applications";
$research2="Microcomputer Systems";
$research3="Computer Communications";
$research4="";
$research5="";
$book1="ทฤษฎีและการใช้งานวงจรดิจิตอล";
$book2="การสื่อสารข้อมูล";
$book3="โฟล์วชาร์ตเบื้องต้น";
$book4="";
$book5="";
$teacher_pic="prateep01.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่2																		
$user_ID =3;
$username ="teacher02";
$password  = "teacher02";
$status		= "teacher";
$title ="ดร.";
$name ="สมศักดิ์";
$surname  = "วลัยรัชต์";
$position ="อาจารย์";
$email ="kwsomsak@kmitl.ac.th";
$telnum ="0-2739-2400~2 ต่อ 123";
$teach_degree="111";
$personal_link=""; 
$education="ตรี  วท.บ. (คณิตศาสตร์) มหาวิทยาลัยรามคำแหง
โท  วศ.ม. (วิศวกรรมไฟฟ้า) สจล.
เอก  Ph.D (Computational Intelligence and Systems Science) Tokyo Institute of Technology, Japan";                    
$research1="Virtual Reality";
$research2="Computer Graphics";
$research3="Robotics";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="Somsak02.jpg";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่3																		
$user_ID =4;
$username ="teacher03";
$password  = "teacher03";
$status		= "teacher";
$title ="รศ. ดร.";
$name ="เอื้อน";
$surname  = "ปิ่นเงิน";
$position ="รองศาสตราจารย์";
$email ="kpouen@kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 111";
$teach_degree="111";
$personal_link=""; 
$education="ตรี กศ.บ. มหาวิทยาลัยศรีนครินทร์วิโรฒบางเขน
โท วท.ม. จุฬาลงกรณ์มหาวิทยาลัย
เอก Ph.D University of Nebraska, USA";                    
$research1="Artificial Intelligence";
$research2="Expert Systems";
$research3="Software Engineer";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="Ouen_new01.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่4																		
$user_ID =5;
$username ="teacher04";
$password  = "teacher04";
$status		= "teacher";
$title ="รศ. ดร.";
$name ="ศุภมิตร";
$surname  = "จิตตะยโศธร";
$position ="รองศาสตราจารย์";
$email ="suphamit@kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 114";
$teach_degree="111";
$personal_link="www.kmitl.ac.th/~suphamit"; 
$education="ตรี วศ.บ. สจล.
โท M.Eng. Asian Institute of Technology, Thailand
เอก Ph.D University of Queensland, Australia";                    
$research1="Database Systems";
$research2=" Information Systems";
$research3="Object Oriented Database";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="image001.jpg";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่5																		
$user_ID =6;
$username ="teacher05";
$password  = "teacher05";
$status		= "teacher";
$title ="รศ. ดร.";
$name ="บุญธีร์";
$surname  = "เครือตราชู";
$position ="รองศาสตราจารย์";
$email ="kkboonte@kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 125";
$teach_degree="111";
$personal_link=""; 
$education="ตรี วศ.บ. มหาวิทยาลัยเกษตรศาสตร์
โท M.S. Oregon State University, USA
เอก Ph.D Oregon State University, USA";                    
$research1="Machine Learning";
$research2="Data mining";
$research3="Pattern Recognition";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="picture17.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่6																		
$user_ID =7;
$username ="teacher06";
$password  = "teacher06";
$status		= "teacher";
$title ="รศ.";
$name ="สมศักดิ์";
$surname  = "มิตะถา";
$position ="รองศาสตราจารย์";
$email ="kmsomsak@kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 110";
$teach_degree="110";
$personal_link=""; 
$education="อส.บ. (สจล)
วศ.ม. (สจล)";                    
$research1="Computer System Design";
$research2="Microcontroller Application";
$research3="VLSI";
$research4="";
$research5="";
$book1="การออกแบบวงจรดิจิตอลและวงจรตรรก";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="somsak03.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่7																		
$user_ID =8;
$username ="teacher07";
$password  = "teacher07";
$status		= "teacher";
$title ="ผศ. ดร.";
$name ="ศักดิ์ชัย";
$surname  = "ทิพย์จักษุรัตน์";
$position ="ผู้ช่วยศาสตราจารย์";
$email ="ktsakcha@kmitl.ac.th";
$telnum ="0-2739-2400~2 ต่อ 108";
$teach_degree="111";
$personal_link=""; 
$education="ตรี   วท.บ. (สถิติ) มหาวิทยาลัยศรีนครินทรวิโรฒประสานมิตร
โท   วศ.ม. (วิศวกรรมไฟฟ้า) สจล.
เอก  Ph.D (Computer Science) Gunma University, Japan";                    
$research1="Performance Evaluation on Communication Networks";
$research2=" Mobile and Wireless Communications";
$research3="";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="sakchai.jpg";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่8																		
$user_ID =9;
$username ="teacher08";
$password  = "teacher08";
$status		= "teacher";
$title ="ผศ. ดร.";
$name ="วิศิษฎ์";
$surname  = "หิรัญกิตติ";
$position ="ผู้ช่วยศาสตราจารย์";
$email ="visit@ce.kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 119";
$teach_degree="111";
$personal_link="personal.ce.kmitl.ac.th/~visit/"; 
$education="ตรี  วศ.บ. สจล.
เอก  Ph.D London, DIC";                    
$research1="Artificial Intelligence";
$research2="Computational Logic";
$research3="Logic Programming";
$research4="Software Engineering";
$research5="Internet Technology";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="visit03.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่9																		
$user_ID =10;
$username ="teacher09";
$password  = "teacher09";
$status		= "teacher";
$title ="ผศ. ดร.";
$name ="อรฉัตร";
$surname  = "จิตต์โสภักตร์";
$position ="ผู้ช่วยศาสตราจารย์";
$email ="orachat@ce.kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 129";
$teach_degree="111";
$personal_link=""; 
$education="วศ.บ. (อิเล็กทรอนิกส์) สจล.
M.S. (Computer Engineering) Arizona State University, USA
Ph.D (Electrical Engineering) University of Texas, Arlington, USA";                    
$research1="";
$research2="";
$research3="";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="Orachat.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่10																		
$user_ID =11;
$username ="teacher10";
$password  = "teacher10";
$status		= "teacher";
$title ="ผศ.";
$name ="เกียรติกูล";
$surname  = "เจียรนัยธนะกิจ";
$position ="อาจารย์";
$email ="kietikul@ce.kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 118";
$teach_degree="100";
$personal_link="personal.ce.kmitl.ac.th/~lee/"; 
$education="ตรี  วศ.บ. สจล.
โท  M.S. Oregon State University, USA";                    
$research1="Artificial Intelligence";
$research2="Technology for the Disable";
$research3="";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="lee2.jpg";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่11																		
$user_ID =12;
$username ="teacher11";
$password  = "teacher11";
$status		= "teacher";
$title ="อ.";
$name ="อัครเดช";
$surname  = "วัชระภูพงษ์";
$position ="อาจารย์";
$email ="adek [at] ce.kmitl.ac.th";
$telnum ="02-737-3000 ต่อ 3899";
$teach_degree="100";
$personal_link="personal.ce.kmitl.ac.th/~adek/"; 
$education="ตรี  วศ.บ. (สจล.)";                    
$research1="Computer Security";
$research2="Computer Network";
$research3="";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="picture01.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
//อาจารย์คนที่12																		
$user_ID =13;
$username ="teacher12";
$password  = "teacher12";
$status		= "teacher";
$title ="อ.";
$name ="สมเกียรติ";
$surname  = "วังศิริพิทักษ์";
$position ="อาจารย์";
$email ="kwsomkia@ce.kmitl.ac.th";
$telnum ="02-7392400~2 ต่อ 122";
$teach_degree="100";
$personal_link=""; 
$education="B.Eng (Waseda University)
M. Eng (Waseda University)";                    
$research1="Image Processing";
$research2="Pattern Recognition";
$research3="Text to Speech";
$research4="";
$research5="";
$book1="";
$book2="";
$book3="";
$book4="";
$book5="";
$teacher_pic="somkia01.gif";
mysql_query("INSERT INTO users SET "."username='$username' ".",password='$password' ".",status ='$status' ") ;
mysql_query("INSERT INTO teacher SET "."user_ID='$user_ID' ".",title='$title' ".",name='$name' ".",surname='$surname' "."
,position='$position' ".",email='$email' ".",telnum='$telnum' ".",teach_degree='$teach_degree' ".",personal_link='$personal_link' "."
,education='$education' ".",research1='$research1' ".",research2='$research2' ".",research3='$research3' ".",research4='$research4' ".",research5='$research5' "."
,book1='$book1' ".",book2='$book2' ".",book3='$book3' ".",book4='$book4' ".",book5='$book5' "."
,teacher_pic='$teacher_pic' ") ;
?>


