<HTML>
<HEAD>
<TITLE> บันทึกค่าการเพิ่มสมาชิกในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY bgcolor="#6633FF"  background='bg_table.jpg' tppabs='bg_table.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php
$ID = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];
$Sname = $HTTP_POST_VARS["Sname"];
$Address = $HTTP_POST_VARS["Address"];
$Tel = $HTTP_POST_VARS["Tel"];
$Email = $HTTP_POST_VARS["Email"];
$Class = $HTTP_POST_VARS["Class"];
$level_regis = $HTTP_POST_VARS["level_regis"];
$User = $HTTP_POST_VARS["User"];
$Password = $HTTP_POST_VARS["Password"];
$Repwd = $HTTP_POST_VARS["Repwd"];
$md5pass=md5($Password);

if (($ID=="") or ($Name=="") or ($Sname=="")   or ($level_regis=="") or ( $User=="") or ($Password=="") or ($Repwd==""))
{
echo " <br><br><div align='center'> โปรดกรอกข้อมูลให้ครบตามเครื่องหมาย <font color='red'><b>ดอกจัน</b></font> </div>";
}

Elseif  ($Password<>$Repwd)

{
echo " <br><br> <div align='center' > Password และ Re - Password ไม่ตรงกัน <font color=#FF3333><b>โปรดกรอกข้อมูลให้ตรงกัน</b></font></div>";
}

Else
{

	$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	$md5Password=$Password ;
	$Today=date("Ymd");
	mysql_query("SET NAMES tis620");
	$ordersresult = "Insert into userprofile(User_ID,Name,Sname,Address,Tel,Email,Level,Status,User_Name,Password,Reg_date,class,Blacklist) values ($ID,'$Name','$Sname','$Address','$Tel','$Email','$level_regis','','$User','$md5pass','$Today','$Class','')";
	mysql_query("SET NAMES tis620");
	$dbquery = mysql_db_query("store",$ordersresult);


if($dbquery)
mysql_close();

echo "<div align='center'><h2> :: เพิ่มผู้เข้าใช้งานเรียบร้อย:: </h2> </div> ";
echo "<br>&nbsp; &nbsp; <b>รหัสนักศึกษา</b> $ID";
echo "<br>&nbsp; &nbsp; <b>ชื่อ</b> $Name  $Sname";
echo "<br>&nbsp; &nbsp; <b>ที่อยู่</b> $Address ";
echo "<br>&nbsp; &nbsp; <b>เบอร์โทรศัพท์</b> $Tel";
echo "<br>&nbsp; &nbsp; <b>E-Mail</b> $Email ";
echo "<br>&nbsp; &nbsp; <b>Class</b> $Class ";
echo "<br>&nbsp; &nbsp; <b>ระดับผู้ใช้งาน</b> $level_regis ";
echo "<br>&nbsp; &nbsp; <b>ชื่อเข้าใช้</b> $User ";
echo "<br>&nbsp; &nbsp;<b> รหัสผ่าน</b> $Password ";

}
?>
<form action="FormInsert.php" method="POST">
 <div align='center' ><input type="submit" value="กลับไปกรอกข้อมูลใหม่"></div>
</form>
</td>
</tr></table>

</BODY>
</HTML>
