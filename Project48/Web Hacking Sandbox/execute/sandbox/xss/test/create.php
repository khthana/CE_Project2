<?php
//สร้างฐานข้อมูลเพื่อใช้งาน--------
//กำหนดตัวแปรเพื่อนำไปใช้งาน
	$hostname = "localhost";  // ชื่อโฮสต์
	$username = "root";         // ชื่อผู้ใช้
	$password = "";         // รหัสผ่าน
	$dbname = "xss";	 // ชื่อฐานข้อมูล

// เริ่มติดต่อฐานข้อมูล
$connection = mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

// เลือกฐานข้อมูล
$db = mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

// สั่งให้ทำคำสั่ง SQL เพื่อสร้างตาราง question
$sql = "create table question (
	q_id int(5) default '0' not null auto_increment, 
	q_topic varchar(150) not null, 
	q_message mediumtext not null,
	q_name varchar(50) not null, 
	q_email varchar(50),   
	q_icq varchar(10),   
	q_ip varchar(20) not null,   
	q_datetime varchar(50),
	primary key (q_id)
	)";

$sql_result = mysql_query($sql,$connection); 

if (!$sql_result) 
	{     
		echo "<P>สร้างตาราง Question ไม่ได้";
	} 
else 
	{
		echo "<P>สร้างตาราง <font color=red> question </font>ลงในฐานข้อมูล ".$dbname. " เรียบร้อยแล้ว";
	}

// สั่งให้ทำคำสั่ง SQL เพื่อสร้างตาราง answer
$sql2 = "create table answer (
	a_id int(5) default '0' not null auto_increment, 
	a_qid int(5) default '0' not null, 
	a_message mediumtext not null,
	a_name varchar(50) not null, 
	a_email varchar(50),   
	a_icq varchar(10),   
	a_ip varchar(20) not null,   
	a_datetime varchar(50),
	primary key (a_id)
	)";

$sql_result2 = mysql_query($sql2,$connection); 

if (!$sql_result2) 
	{     
		echo "<P>สร้างตาราง Answer ไม่ได้";
	} 
else 
	{
		echo "<P>สร้างตาราง <font color=red> answer </font>ลงในฐานข้อมูล ".$dbname. " เรียบร้อยแล้ว";
	}

// คำสั่งให้แสดงชื่อตาราง
$dbquery = mysql_list_tables($dbname);

// หาจำนวนเรกคอร์ดข้อมูลในตาราง
$num_rows = mysql_numrows($dbquery);

// เริ่มวนรอบแสดงชื่อตารางในฐานข้อมูล
echo "<P>ขณะนี้ฐานข้อมูล <Font color=red>".$dbname." </Font>มีตารางดังนี้ <Br>";
$i=0;
while ($i < $num_rows)
	{
		$tblname[$i] = mysql_tablename($dbquery, $i);
		echo "- $tblname[$i]<Br>";
		$i++;
		}

?>