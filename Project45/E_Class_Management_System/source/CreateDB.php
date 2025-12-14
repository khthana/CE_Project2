<html>
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ต</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="./style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
include('./connectDB.php');
	/*@$db=mysql_connect("localhost","learnig","abc123456789");
									if(!$db)
										{			echo"<center>";
													echo"ไม่สามารถติดต่อฐานข้อมูลได้";
													echo"</center>";
													exit;
										}
									if(mysql_create_db("e_learning",$db))
									{
										print("สร้างฐานข้อมูล  e_learning เสร็จเรียบร้อยแล้ว<br>");
										mysql_select_db("e_learning");*/
										connect_db();
										//Create courses Table
										$sql="CREATE TABLE courses(ID VARCHAR (7)  NOT NULL , Faculty VARCHAR (30) NOT NULL, Department VARCHAR (30) NOT NULL,Name VARCHAR (30) NOT NULL,Target TEXT, Description TEXT,CourseConID CHAR(7),CourseConName VARCHAR(30),TextBook VARCHAR(128),GradeDetail TEXT,Refer TEXT,TID INT(4) UNSIGNED DEFAULT '0' NOT NULL,PRIMARY KEY(ID))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง courses เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง coursesได้<br>".mysql_error());
										
										//Create chapters Table
										$sql="CREATE TABLE chapters(ID INT(7) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , CID VARCHAR(10) NOT NULL,Chapter VARCHAR(30) NOT NULL,TF INT(10) UNSIGNED DEFAULT '0', CH INT(10) UNSIGNED DEFAULT '0', Pass INT(10) UNSIGNED DEFAULT '0',Link VARCHAR(255), PRIMARY KEY(ID),INDEX(CID,Chapter))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง chapters เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง chaptersได้<br>".mysql_error());
										
										//Create Document Table
										$sql="CREATE TABLE documents(ID INT(7) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , CID VARCHAR(10) NOT NULL,Chapter VARCHAR(30) NOT NULL,Subject VARCHAR(30) NOT NULL, Html INT(1) UNSIGNED DEFAULT '0' NOT NULL, Document TEXT, PRIMARY KEY(ID),INDEX(CID,Chapter))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง documents เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง documentsได้<br>".mysql_error());
										
										//Create fileupload Table
										$sql="CREATE TABLE fileuploads(ID INT(7) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , CID VARCHAR(10) NOT NULL,Chapter VARCHAR(30) NOT NULL, Word VARCHAR(80), Powerpoint VARCHAR(80), PDF VARCHAR(80), Flash VARCHAR(80),  Video VARCHAR(80), PRIMARY KEY(ID),INDEX(CID,Chapter))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง  fileuploads เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง fileuploadsได้<br>".mysql_error());
										
										//Create date Table
										$sql="CREATE TABLE date(ID INT(4) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , TID INT(4) UNSIGNED DEFAULT '0' NOT NULL, Day Date DEFAULT '0000-00-00' NOT NULL, Detail VARCHAR(128) NOT NULL, PRIMARY KEY(ID),INDEX(TID))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง date เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง dateได้<br>".mysql_error());
										
										//Create homework Table
										$sql="CREATE TABLE homework(ID INT(5) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , CID INT(6) UNSIGNED DEFAULT '0' NOT NULL, Number INT(3) UNSIGNED DEFAULT '0' NOT NULL, Description TEXT NOT NULL, Date VARCHAR(150) NOT NULL, PRIMARY KEY(ID),INDEX(CID))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง homework เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง homeworkได้<br>".mysql_error());
										
										//Create learn Table
										$sql="CREATE TABLE learn(ID INT(4) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , SID INT(4) UNSIGNED DEFAULT '0' NOT NULL, CID INT(4) UNSIGNED DEFAULT '0' NOT NULL, CH VARCHAR(40) NOT NULL, Start DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL, LastIN DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL, Pass INT(1) UNSIGNED DEFAULT '0' NOT NULL, PRIMARY KEY(ID),INDEX(SID,CID,CH))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง learn เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง learn ได้<br>".mysql_error());
										
										//Create member Table
										$sql="CREATE TABLE member(ID INT(11) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT , STATUS VARCHAR(10) NOT NULL, FULLNAME VARCHAR(20) NOT NULL, LASTNAME VARCHAR(20) NOT NULL, SEX VARCHAR(10) NOT NULL, BIRTHDAY DATE DEFAULT '0000-00-00' NOT NULL, EDUCATE VARCHAR(20) NOT NULL, BRANCH VARCHAR(20) NOT NULL, PICTURE VARCHAR(50),ICQ INT(15), TEACHING VARCHAR(50), TRAINING VARCHAR(50), WORKING VARCHAR(50), WORKSHOP VARCHAR(50), ADDRESS VARCHAR(50) NOT NULL, EMAIL VARCHAR(30) NOT NULL, PHONE VARCHAR(20), USERNAME VARCHAR(20) NOT NULL, PASSWORD VARCHAR(20) NOT NULL, QUESTION VARCHAR(30) NOT NULL, ANSWER VARCHAR(30) NOT NULL, LEVEL INT(10) UNSIGNED DEFAULT '0' NOT NULL, PRIMARY KEY(USERNAME),INDEX(ID),UNIQUE USERNAME (USERNAME))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง member เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง member ได้<br>".mysql_error());
										
										//Create news Table
										$sql="CREATE TABLE news(ID INT(10) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT ,  writer VARCHAR(16) NOT NULL, headline TEXT NOT NULL, detail TEXT NOT NULL, date VARCHAR(20) DEFAULT '0000-00-00' NOT NULL,PRIMARY KEY(ID))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง news เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง news ได้<br>".mysql_error());
										
										//Create regist Table
										$sql="CREATE TABLE regist(CID INT(4) UNSIGNED DEFAULT '0' NOT NULL, SID INT(8) UNSIGNED DEFAULT '0' NOT NULL, SNAME VARCHAR(50) NOT NULL, PRIMARY KEY(CID))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง regist เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง regist ได้<br>".mysql_error());
										
										//Create wanswer Table
										$sql="CREATE TABLE wanswer(ansid INT(5) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT, postid INT(5) UNSIGNED DEFAULT '0' NOT NULL, sender VARCHAR(15) NOT NULL, email VARCHAR(30), date VARCHAR(20) NOT NULL, ansmesg TEXT, PRIMARY KEY(ansid))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง wanswer เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง wanswer ได้<br>".mysql_error());
										
										//Create wquestion Table
										$sql="CREATE TABLE wquestion(postid INT(5) UNSIGNED DEFAULT '0' NOT NULL AUTO_INCREMENT, CID INT(5) UNSIGNED DEFAULT '0' NOT NULL, title VARCHAR(50) NOT NULL, poster VARCHAR(15) NOT NULL, email VARCHAR(30), date VARCHAR(20) NOT NULL, mesg TEXT, PRIMARY KEY(postid))";
										$result=mysql_query($sql);
										if($result)
										print("สร้างตาราง wquestion เรียบร้อยแล้ว<br>");
										else
										print("ไม่สามารถสร้างตาราง wquestion ได้<br>".mysql_error());
										mysql_close();
						/*
									else
									{	
										print("เกิดข้อผิดพลาดในการสร้างฐานข้อมูล :%s\n".mysql_error());
										mysql_close();
									}	*/
									
?>
</body>
</html>
