<?php
//กำหนดตัวแปรเพื่อนำไปใช้งาน
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

// เริ่มติดต่อฐานข้อมูล
$connection = mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

mysql_query("SET NAMES 'tis620'");

// เลือกฐานข้อมูล
$db = mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

// สั่งให้ทำคำสั่ง SQL
$sql = "create table member (
	id int(5) default '0' not null auto_increment, 
	name varchar(30) not null, 
	surname varchar(30) not null, 
	sex varchar(5), 
	age int(2), 
	address mediumtext not null,  
	tell int(10), 
	login_name varchar(10) not null, 
	login_password varchar(10) not null, 
	email varchar(30), 
	pic mediumtext not null,  
	status int(5) not null,
	status1 int(5) not null,
	status2 int(5) not null,
	status3 int(5) not null,
	primary key (id)
	)";
$sql_result = mysql_query($sql,$connection); 

if (!$sql_result) 
	{     
		echo "<P>สร้างตารางไม่ได้";
	} 
else 
	{
		echo "<P>สร้างตาราง <font color=red> member </font>ลงในฐานข้อมูล ".$dbname. " เรียบร้อยแล้ว";
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

// กำหนด SQL เพื่อเขียนข้อมูล 1 เรกคอร์ดที่ชื่อ guest และรหัสผ่านเป็น test เพื่อใช้ในการทดสอบการใช้งาน
$sql_insert = "insert into member(id, login_name, login_password) values ('', 'guest', 'test')";
mysql_query($sql_insert,$connection);
echo "<br>เพิ่มข้อมูลเรียบร้อยแล้ว 1 เรกคอร์ด";
?>