<html>
<head>
<title>:: Cross-Site Script SandBox ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body >
<?php
//เมื่อลบกระทู้เสร็จ
//กำหนดตัวแปรเพื่อนำไปใช้งาน
	$hostname = "localhost";   // ชื่อโฮสต์
	$username = "root";         // ชื่อผู้ใช้
	$password = "12345678";         // รหัสผ่าน
	$dbname = "xssprotect";	 // ชื่อฐานข้อมูล
	
// เริ่มติดต่อฐานข้อมูล
mysql_connect($hostname, $username, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

// เลือกฐานข้อมูล
mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

		// คำสั่ง SQL และสั่งให้ทำงาน
		$sql = "delete from question where q_id='$q_id'";	// กำหนดคำสั่ง SQL เพื่อลบข้อมูล
		$sql2 = "delete  from answer where a_qid='$q_id'";	// กำหนดคำสั่ง SQL เพื่อลบข้อมูล
		$dbquery = mysql_db_query($dbname, $sql);
		$dbquery = mysql_db_query($dbname, $sql2);

		header("Location:delete.php?inputpass=admin");                                  
?>
</body>
</html>