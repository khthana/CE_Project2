<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: Cross-Site Script SandBox ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body >
<?php
	//เมื่อโฟสข้อความในเว็บบอร์แล้วจะทำการบันทึกในหน้านี้
	// สำหรับข้อมูลในตาราง Answer
	$hostname = "localhost";   // ชื่อโฮสต์
	$user = "player";         // ชื่อผู้ใช้
	$password = "player";         // รหัสผ่าน
	$dbname = "xssprotect";	 // ชื่อฐานข้อมูล

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	if ($a_name == "" or $a_message =="")
		{
			echo ("<center><font color=\"red\">กรุณากรอก ชื่อ และข้อความของคุณด้วยครับ </font></center> ");
			exit;
		}

	$a_ip = getenv(remote_addr);

	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		$a_message = htmlspecialchars($a_message);
		$a_name = htmlspecialchars($a_name);
		$a_email = htmlspecialchars($a_email);
		$a_icq = htmlspecialchars($a_icq);

	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$a_message = nl2br($a_message);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$a_message = addslashes($a_message);
		$a_name = addslashes($a_name);
		$a_email = addslashes($a_email);
		$a_icq = addslashes($a_icq);

//	setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%b");	 // เดือนเต็ม strftime("%B");
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c : $d";

	$sql = "insert into answer (a_id, a_qid, a_message, a_name, a_email, a_icq, a_ip, a_datetime) values ('0','$q_id','$a_message','$a_name','$a_email','$a_icq','$a_ip','$a_date')";

	$result = mysql_db_query($dbname,$sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	else	 
		{
                       header("Location:detial.php?q_id=$q_id");
		}
?>
</body>
</html>