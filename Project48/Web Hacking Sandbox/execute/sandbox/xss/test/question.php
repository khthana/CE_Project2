<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: Cross-Site Script SandBox ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<body >
<?php
//เมื่อตั้งกระทู้แล้ว---มาจากหน้า formpost
	$hostname = "localhost";   // ชื่อโฮสต์
	$user = "player";         // ชื่อผู้ใช้
	$password = "player";         // รหัสผ่าน
	$dbname = "xss";	 // ชื่อฐานข้อมูล
	
	// เริ่มติดต่อฐานข้อมูล
	@mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	// เลือกฐานข้อมูล
	@mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
if ($q_topic == "" or $q_message =="" or $q_name=="")
		{
			echo ("<center><font color=\"red\">กรุณากรอกข้อมูลให้ครบในช่องที่มีเครื่องหมาย *  ด้วยครับ </font><br><a href=\"formpost.html\">BACK</a></center> ");
			exit;
		}
		$lenq_topic=strlen($q_topic);
		$lenq_message=strlen($q_message);
		$lenq_name=strlen($q_name);
		$lenq_email=strlen($q_email);
		$lenq_icq=strlen($q_icq);
if(!(isValidEmail($q_email))){
	echo ("<center><font color=\"red\">กรุณา กรอก email ให้ถูกต้องด้วยครับ </font><br><a href=\"formpost.html\">BACK</a></center> ");
	}
else if(($lenq_topic<=35)&&($lenq_message<=250)&&($lenq_name<=35)&&($lenq_email<=45)&&($lenq_icq<=35)){
	$q_ip = getenv(remote_addr);

	/*// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		$q_message = htmlspecialchars($q_message);
		$q_name = htmlspecialchars($q_name);
		$q_email = htmlspecialchars($q_email);
		$q_icq = htmlspecialchars($q_icq);
*/
		$q_topic = htmlspecialchars($q_topic);
	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$q_message = nl2br($q_message);
/*
	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$q_message = addslashes($q_message);
		$q_name = addslashes($q_name);
		$q_email = addslashes($q_email);
		$q_icq = addslashes($q_icq);
*/
setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย 
	$a = date("j");	 // วันที่
	$b = strftime("%b");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$q_date = "$a $b $c - $d";

	$sql = "insert into question (q_id, q_topic, q_message, q_name, q_email, q_icq, q_ip, q_datetime) values  ('0','$q_topic','$q_message','$q_name','$q_email','$q_icq','$q_ip','$q_date')";

	$result = @mysql_db_query($dbname, $sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . @mysql_error() ); 
			exit;
		}
	else
		{  
			header("Location:webboard.php");
		}
}
 
else{
	echo ("<center><font color=\"red\">คุณกรอกข้อมูลเกินกำหนด </font><br><a href=\"formpost.html\">BACK</a></center> ");
}

//check email
function isValidEmail($email_address) {
$regex = '/^[A-z0-9][\w.-]*@[A-z0-9][\w\-\.]+\.[A-z0-9]{2,6}$/';
return (preg_match($regex, $email_address));
}
?>
</body>
</html>