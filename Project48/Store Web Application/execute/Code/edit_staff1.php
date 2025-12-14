<HTML>
<HEAD>
<TITLE> :: บันทึกค่าการแก้ไขสมาชิกในตาราง :: </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY background='bg_table2.jpg' tppabs='bg_table2.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td  background='bg_table.jpg' tppabs='bg_table.jpg'>

<?php

$ID = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];
$Sname = $HTTP_POST_VARS["Sname"];
$Address = $HTTP_POST_VARS["Address"];
$Tel = $HTTP_POST_VARS["Tel"];
$Email = $HTTP_POST_VARS["Email"];
$Status = $HTTP_POST_VARS["Status"];
$level_regis = $HTTP_POST_VARS["level_regis"];
$User = $HTTP_POST_VARS["User"];
$Password = $HTTP_POST_VARS["Password"];
$Repwd = $HTTP_POST_VARS["Repwd"];

$md5Password=md5($Password);

if (($ID=="") or ($Name=="") or ($Sname=="") or ($Address=="") or ($Tel=="") or ($Email=="") or ( $User==""))

{
echo " <br><br><div align='center'> โปรดกรอกข้อมูลให้ครบตามเครื่องหมาย <font color='red'><b>ดอกจัน *</b></font> </div>";
}

Elseif  ($Password<>$Repwd)
{
echo " <br><br> <div align='center' > Password และ Re - Password ไม่ตรงกัน <font color=#FF3333><b>โปรดกรอกข้อมูลให้ตรงกัน</b></font></div>";
}

if ($Password==$Repwd) //แก้ไข Password และที่อยู่,เบอร์โทร,E-mail
// รหัส  newpass ตรงกันกับ newpass 2 หรือไม่ 
		{ 
			if (($Password<>"") or ($Repwd<>"")) // เมื่อมีการเปลี่ยนรหัสผ่าน ป้องกันการใส่ค่าว่างลงในฐานข้อมูล
					{

			include "connect.php";
			mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
			// ถ้าตรงตามเงื่อนไข ให้เปลี่ยน Password ใหม่ ผ่านตัวแปร $md5newpass
$ordersresult = "UPDATE  userprofile SET Name='$Name',Sname='$Sname',Address = '$Address',Tel = '$Tel',Email='$Email',Level='$level_regis',Status='$Status',User_Name='$User',Password = '$md5Password' where User_name ='$User' ";
$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery) {
								echo "<div align='center'><font color=blue>";
								echo  "<br><h3> :: แก้ไขข้อมูลร้อยแล้ว ::</h3></div>";
								echo "<b>&nbsp; &nbsp; รหัส</b> $ID";
								echo "<br><b>&nbsp; &nbsp; Username </b> $User";
								echo "<br><b>&nbsp; &nbsp; ชื่อ</b> $Name  $Sname";
								echo "<br><b>&nbsp; &nbsp; ที่อยู่</b> $Address ";
								echo "<br><b>&nbsp; &nbsp; เบอร์โทรศัพท์</b> $Tel";
								echo "<br><b>&nbsp; &nbsp; E-Mail</b> $Email ";
								echo "<br><b>&nbsp; &nbsp; ระดับผู้ใช้งาน</b> $level_regis ";
								echo "	<br><b>&nbsp; &nbsp; รหัสใหม่ </b>$Password <br><br></font>";
														} 
							mysql_close();
					}		
						elseif (($newpass=="") or ($newpass2=="")) // กรณีที่ Update ค่าของ ที่อยู่,เบอร์โทร,Email เท่านั้น
					{

include "connect.php";
mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$ordersresult = "UPDATE  userprofile SET Name='$Name',Sname='$Sname',Address = '$Address',Tel = '$Tel',Email='$Email',Level='$level_regis',Status='$Status',User_Name='$User' where User_name ='$User' ";
$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery)
mysql_close();
echo "<div align='center'><font color='blue'><h2>:: แก้ไขข้อมูลเรียบร้อย :: </h2><br></div> ";
echo "<br><b>&nbsp; &nbsp; รหัส</b> $ID";
echo "<br><b>&nbsp; &nbsp; ชื่อ</b>  $Name  $Sname";
echo "<br><b>&nbsp; &nbsp; ที่อยู่</b>  $Address ";
echo "<br><b>&nbsp; &nbsp; เบอร์โทรศัพท์</b>  $Tel";
echo "<br><b>&nbsp; &nbsp; E-Mail</b>  $Email ";
echo "<br><b>&nbsp; &nbsp; ระดับผู้ใช้งาน</b>  $level_regis ";
echo "<br><b>&nbsp; &nbsp; ชื่อเข้าใช้</b> $User </font>";

}
		}
?>
<form action="datastaff.php" method="POST">
 <div align='center' ><input type="submit" value="เรียบร้อย"></div>
</form>
</td>
</tr></table>
</BODY>
</HTML>