<?php
//กำหนดตัวแปรเพื่อนำไปใช้งาน
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

// เริ่มติดต่อฐานข้อมูล
mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	mysql_query("SET NAMES 'tis620'");

// เลือกฐานข้อมูล
mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

		// คำสั่ง SQL และสั่งให้ทำงาน
		$sql = "delete from book  where id='$id'";	// กำหนดคำสั่ง SQL เพื่อลบข้อมูล
		$dbquery = mysql_db_query($dbname, $sql);

		echo "<font size=3><B>ลบหนังสือที่  <Font color=red> id =  ".$id. " </Font>เรียบร้อยแล้ว</B><Br>";
	
?>