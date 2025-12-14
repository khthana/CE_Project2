<HTML>
<HEAD>
<TITLE> UserLogin </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>

<body bgcolor="#99FFFF">

<?php

$user_login = $_POST["user_login"];
$pass_login = $_POST["pass_login"];

If ($user_login=="" or $pass_login=="")
{
echo " <br><br><div align='center'> กรุณาใส่ User และ Password <a href="FormLogin.html" target="MainFrame"> กลับไปกรอกข้อมูลใหม่ </a></div> "; *
} else {
$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");

mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 

$md5pass=md5($pass_login) ; // นำค่า Password ที่รับเข้ามาเป็น MD5
$ordersresult = mysql_query ("SELECT ID,Name,Sname,Address,Tel,Email,Level,Status FROM userprofile where User='$User' and Password='$md5pass' ");

if($ordersresult) {
	$numfield = mysql_num_fields($ordersresult);
	
	print "<center><table border='1' bordercolor='#3333FF'>";
	print "<tr>";
	for ($i=0;$i<$numfield;$i++) {
	  print "<th><font size='2'>".mysql_field_name($ordersresult,$i)."</font>";
	}
	while ($ordersrow=mysql_fetch_array($ordersresult)) {
	  print "<tr>";
	  for ($i=0;$i<$numfield;$i++) {
		print "<td><font size='2'>".$ordersrow[$i]."</font>";
			  }
	}

	print "</table></center>";

	} 
}
?>
</form>

</BODY>
</HTML>