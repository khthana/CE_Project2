<HTML>
<HEAD>
<TITLE> เพิ่มบริษัทสั่งซื้ออุปกรณ์ </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>
<BODY bgcolor="#6633FF"  background="bg_table.jpg" tppabs="bg_table.jpg">
<br><table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php

$ID = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];
$Address = $HTTP_POST_VARS["Address"];
$Tel = $HTTP_POST_VARS["Tel"];

if (($ID=="") or ($Name=="") or ($Address=="") or ($Tel== ""))
{
	echo "<br><div align='center'> โปรดกรอกรายละเอียดให้ครบทุกช่อง</div>";
} else {
	mysql_query("SET NAMES tis620");
	$link = mysql_connect("localhost","root","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	mysql_query("SET NAMES tis620");
	$ordersresult = "insert into company (Comp_ID,Comp_Name,Comp_Address,Comp_Tel) values ('$ID','$Name','$Address','$Tel')";
	mysql_query("SET NAMES tis620");
	$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery)
	mysql_close();

echo "<div align='center'> <h2> เพิ่มบริษัทที่สั่งซื้ออุปกรณ์เรียบร้อย </h2></div> ";
echo "<br>&nbsp; &nbsp; <b> รหัส</b> $ID";
echo "<br>&nbsp; &nbsp; <b> ชื่อบริษัท</b> $Name";
echo "<br>&nbsp; &nbsp; <b> ที่อยู่ </b> $Address ";
echo "<br>&nbsp; &nbsp; <b> เบอร์โทรศัพท์ </b> $Tel ";

}
?>
<form action="FormInsert.php" method="POST">
 <div align='center' ><input type="submit" value="กลับไปกรอกข้อมูลใหม่"></div>
</form>
</td>
</tr></table>
</BODY>
</HTML>
