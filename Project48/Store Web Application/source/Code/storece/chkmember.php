<HTML>
<HEAD>
<TITLE> ตรวจสอบสถานะสมาชิก  </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>

<body bgcolor="#99FFFF">

<?php

$user_login=$_POST[user_login];
$pass_login=$_POST[pass_login];
$md5pass=md5($pass_login);

 if ($user_login=="" or $pass_login=="") { 
	echo "<h3> ERROR : กรุณากรอกข้อมูลให้ครบ </h3>";

	header ("location:index.html"); exit(); 
} 

include "connect.php";

mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="select Username,Password from userprofile where Username='$user_login' and Password='$md5pass' ";
$result=mysql_db_query($dbname,$sql);
$num=mysql_num_rows($result);
$record=mysql_fetch_array ($result);
mysql_close();

if ($num<=0) { 
echo "<center> <br> <br> <br> <br><h3> ERROR :: Username หรือ Password ไม่ถูกต้อง </h3> <br>
<a href ='index.html'>กลับไปกรอกข้อมูลใหม่ </a></center>";
} else {

session_start();

$_SESSION[sess_userid]=session_id();
$_SESSION[sess_username]=$user_login;
$_SESSION[sess_level]=$user_level;

header ("location:profile.php");
}

?>
</BODY>
</HTML>