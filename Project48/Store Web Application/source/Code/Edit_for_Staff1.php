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

$User_name = $HTTP_POST_VARS["Username"];
$Address = $HTTP_POST_VARS["Address"];
$Tel = $HTTP_POST_VARS["Tel"];
$Email = $HTTP_POST_VARS["Email"];

$oldpass=$_POST[oldpass];
$newpass=$_POST[newpass];
$newpass2=$_POST[newpass2];

$md5oldpass=md5($oldpass);
$md5newpass=md5($newpass);
$md5newpass2=md5($newpass2);

if (($Address=="") or ($Email=="") or ($Tel==""))
	{
	echo " <br><br><div align='center'> โปรดใส่ให้ครบถ้วนส่วนตัว </div>";
	}

Elseif ($newpass<>$newpass2) 
// ถ้าช่องใส่รหัสใหม่ไม่ตรงกับรหัสที่ยืนยัน *** ถ้าไม่ใส่ทั้ง 2 ช่องก็ให้ถือว่าไม่ต้องการแก้ไข
		{
		echo " <br><br> <div align='center' > Password และ Re - Password ไม่ตรงกัน <font color=#FF3333><b>โปรดกรอกข้อมูลให้ตรงกัน</b></font></div><br>";
		echo "<div align=center> [ <a href=Edit_for_staff.php> กลับหน้าแก้ไขข้อมูลเจ้าหน้าที่  </a>] </div>";
		}

Elseif ($newpass==$newpass2) //แก้ไข Password และที่อยู่,เบอร์โทร,E-mail
// รหัส  newpass ตรงกันกับ newpass 2 หรือไม่ 
		{ 
			if (($newpass<>"") or ($newpass2<>"")) // เมื่อมีการเปลี่ยนรหัสผ่าน ป้องกันการใส่ค่าว่างลงในฐานข้อมูล
					{

			include "connect.php";
			mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
			// ถ้าตรงตามเงื่อนไข ให้เปลี่ยน Password ใหม่ ผ่านตัวแปร $md5newpass
			$sql="update userprofile set Address = '$Address',Tel ='$Tel',Email='$Email',password='$md5newpass' where User_name ='$User_name' ";
			$result=mysql_db_query($dbname,$sql);

							if  ($result) {
								echo "<div align='center'><font color=blue>";
								echo  "<br><h3> :: เปลี่ยนรหัสผ่านเรียบร้อยแล้ว ::</h3></div>";
								echo "<b>&nbsp; &nbsp; รหัส</b> $ID";
								echo "<b>&nbsp; &nbsp; Username </b> $User_name";
								echo "<br><b>&nbsp; &nbsp; ชื่อ</b> $Name  $Sname";
								echo "<br><b>&nbsp; &nbsp; ที่อยู่</b> $Address ";
								echo "<br><b>&nbsp; &nbsp; เบอร์โทรศัพท์</b> $Tel";
								echo "<br><b>&nbsp; &nbsp; E-Mail</b> $Email ";
								echo "<br><b>&nbsp; &nbsp; ระดับผู้ใช้งาน</b> $level_regis ";
								echo "	<br><b>&nbsp; &nbsp;  รหัสใหม่ </b> $newpass <br><br></font>";
								echo "<center>	[ <a href=Edit_for_staff.php> กลับแก้ไขข้อมูลเจ้าหน้าที่ </a> ] </center>";
								} 
							mysql_close();
					}		
						elseif (($newpass=="") or ($newpass2=="")) // กรณีที่ Update ค่าของ ที่อยู่,เบอร์โทร,Email เท่านั้น
					{

	mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
	$ordersresult = "UPDATE  userprofile SET Address = '$Address',Tel ='$Tel',Email='$Email' where User_name ='$User_name' ";
	$dbquery = mysql_db_query("store",$ordersresult);

		if($dbquery)
				
				echo "<div align='center'><h2> <font color='blue'>:: แก้ไขข้อมูลเรียบร้อย :: </h2></div> ";
				echo "<br><b>&nbsp; &nbsp; รหัส</b> $ID";
				echo "<br><b>&nbsp; &nbsp; ชื่อ</b> $Name  $Sname";
				echo "<br><b>&nbsp; &nbsp; ที่อยู่</b> $Address ";
				echo "<br><b>&nbsp; &nbsp; เบอร์โทรศัพท์</b> $Tel";
				echo "<br><b>&nbsp; &nbsp; E-Mail</b> $Email ";
				echo "<br><b>&nbsp; &nbsp; ระดับผู้ใช้งาน</b> $level_regis ";
				echo "<br><br><center> [ <a href=Edit_for_staff.php> กลับหน้าแก้ไขข้อมูลเจ้าหน้าที่  </a> ] </center></font>";
				mysql_close();
				}
		}
?>
</td>
</tr></table>
</BODY>
</HTML>