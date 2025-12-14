<?php
include "chksession.php";
include "function.php";
include "connect.php";
include "chksadmin.php";

mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$sql="select * from userprofile where Username='$sess_username' ";
$result = mysql_db_query($dbname,$sql);
$record = mysql_fetch_array($result);
$Level=$record[Level];
mysql_close();
?>
<HTML>
<HEAD>
<TITLE> บันทึกค่าการเพิ่มสมาชิกในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<body bgcolor="#99FFFF">

<p>&nbsp;</p>
<table width="50%" height="70%" align="center" bordercolor="#66CCFF">
  <tr><td height="299" bgcolor="#66CCFF">

<?php

if (($ID=="") or ($Name=="") or ($Sname=="") or ($Address=="") or ($Tel=="") or ($Email=="") or ($level_regis=="") or ( $User=="") or ($Password=="") or ($Repwd==""))
{
echo "<br><div align='center'>โปรดกรอกข้อมูลให้ครบทุกช่อง<br><br>[<a href=FormAddUser.php>กลับไปกรอกข้อมูลใหม่</a>]</div>";
}

Elseif  ($Password<>$Repwd)

{
echo "<br><div align='center' >Password และ Re - Password ไม่ตรงกัน<br><br>[<a href=FormAddUser.php>กลับไปกรอกข้อมูลใหม่</a>]</div>";
}

Elseif ($Level<>'administrator') 
{

echo "<br><center> ระดับการใช้งานของคุณ คือ $Level ไม่สามารถเพิ่มผู้ใช้งานได้ </center><br>";
echo "<center> [<a href=profile.php> กลับหน้าแรก </a>] [<a href=logout.php> ออกจากระบบ </a>] </center>";

}

Else

{
$link = mysql_connect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
mysql_select_db("storece") or die ("เลือกฐานข้อมูลไม่ได้"); 
$md5Password=md5($Password);

mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$ordersresult = "Insert into userprofile (ID,Username,Name,Sname,Address,Tel,Email,Level,Password) values ($ID,'$User','$Name','$Sname','$Address','$Tel','$Email','$level_regis','$md5Password')";
$dbquery = mysql_db_query("storece",$ordersresult);


if($dbquery)

mysql_close();
echo "<div align='center'>_________________________________________________________________</div> ";
echo "<div align='center'></div> ";
echo "<div align='center'> <br> <h3> เพิ่มผู้เข้าใช้งานเรียบร้อย </h3></div> ";
echo "<div align='center'>_________________________________________________________________</div> ";
echo "<br>&nbsp; &nbsp; <b> รหัสสมาชิก</b> 		&nbsp;  $ID";
echo "<br>&nbsp; &nbsp; <b> ชื่อ </b>   &nbsp;  &nbsp; $Name  $Sname";
echo "<br>&nbsp; &nbsp; <b> ที่อยู่ </b> &nbsp; $Address ";
echo "<br>&nbsp; &nbsp; <b> เบอร์โทรศัพท์</b>    &nbsp;  &nbsp; $Tel";
echo "<br>&nbsp; &nbsp; <b> Email</b> &nbsp; &nbsp; $Email ";
echo "<br>&nbsp; &nbsp; <b> ระดับผู้ใช้งาน </b>	   &nbsp;  &nbsp; $level_regis ";
echo "<br>&nbsp; &nbsp; <b> ชื่อเข้าใช้";
echo "</b>	&nbsp;$User ";
echo "<br>&nbsp; &nbsp; <b> รหัสผ่าน </b> &nbsp;  $Password ";
echo "<br>&nbsp; &nbsp; <b> รหัสที่เข้ารหัสด้วย  MD5 </b> คือ &nbsp; $md5Password<br><br>";
echo "<center> [<a href=profile.php> กลับหน้าแรก </a>] [<a href=formadduser.php> เพิ่มสมาชิก </a>] [<a href=logout.php> ออกจากระบบ </a>] </center>";
}

?>
</BODY>
</HTML> 
