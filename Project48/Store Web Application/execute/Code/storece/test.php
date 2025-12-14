<?php

$user_login=$_POST[user_login];
$pass_login=$_POST[pass_login];
$md5pass=md5($pass_login);

if ($user_login=="" or $pass_login=="") { 
	echo "<h3> ERROR : กรุณากรอกข้อมูลให้ครบ </h3>";
	header ("location:FormLogin.html"); exit(); 
}

$count=0;
include "connect.php";
$sql="select Level,User,Password from userprofile where User='$user_login' and Password='$md5pass' ";
$result=mysql_db_query($dbname,$sql);
$record=mysql_fetch_array($result);

if ($record[Level]=='student')
{
echo "<div align='center'> นักศึกษา </div>";
}

if ($record[Level]=='admin')
{
echo "<div align='center'> คุณคือ ผู้ดูแลระบบ </div>";
}

if ($record[Level]=='guest')
{
echo "<div align='center'> คุณคือ ผู้เยี่ยมชม </div>";
}
mysql_close();
?>