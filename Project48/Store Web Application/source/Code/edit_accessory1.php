<HTML>
<HEAD>
<TITLE> บันทึกค่าการแก้ไขสมาชิกในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY  background='bg_table2.jpg' tppabs='bg_table2.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td  background='bg_table.jpg' tppabs='bg_table.jpg'>

<?php
$ID_acces = $HTTP_POST_VARS["ID_acces"];
$Name_acces = $HTTP_POST_VARS["Name_acces"];
$Amount_acces = $HTTP_POST_VARS["Amount_acces"];
$Remain_acces = $HTTP_POST_VARS["remain_acces"];

if (($ID_acces=="") or ($Name_acces=="") or ($Amount_acces==""))
{
	echo "<br><div align='center'> โปรดกรอกรายละเอียดให้ครบทุกช่อง</div>";
} else {
	mysql_query("SET NAMES tis620");
	$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	$ordersresult = "UPDATE  accessory SET Acces_ID='$ID_acces',Acces_Name='$Name_acces',Acces_Amount='$Amount_acces',Acces_Remain='$Remain_acces' WHERE Acces_ID = '$ID_acces'";
	$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery)
	mysql_close();
echo "<div align='center'> <h2> แก้ไขอุปกรณ์เรียบร้อย </h2></div> ";
echo "<br>&nbsp; &nbsp; <b> รหัสอุปกรณ์ </b> $ID_acces";
echo "<br>&nbsp; &nbsp; <b> ชื่ออุปกรณ์ </b> $Name_acces";
echo "<br>&nbsp; &nbsp; <b> จำนวนทั้งหมด </b> $Amount_acces ตัว ";
echo "<br>&nbsp; &nbsp; <b> จำนวนคงเหลือ </b> $Remain_acces ตัว ";


}
?>
<form action="dataaccessory.php" method="POST">
 <div align='center' ><input type="submit" value="เรียบร้อย"></div>
</form>
</td>
</tr></table>
</BODY>
</HTML>
