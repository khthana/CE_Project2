<HTML>
<HEAD>
<TITLE> บันทึกค่าการแก้ไขบริษัทในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY  background='bg_table2.jpg' tppabs='bg_table2.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF"  >
  <tr><td  background='bg_table.jpg' tppabs='bg_table.jpg'>

<?php
$ID = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];
$Address = $HTTP_POST_VARS["Address"];
$Tel = $HTTP_POST_VARS["Tel"];

if (($ID=="") or ($Name==""))
{
	echo " <br><br><div align='center'> โปรดกรอกข้อมูลให้ครบ</b></font> </div>";
}
Else
{
	mysql_query("SET NAMES tis620"); 
	$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	$ordersresult = "UPDATE  company SET Comp_ID='$ID',Comp_Name='$Name',Comp_Address = '$Address',Comp_Tel = '$Tel' WHERE Comp_ID = '$ID'";
	$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery)
	mysql_close();

	echo "<div align='center'><h2> แก้ไขข้อมูลเรียบร้อย </h2><br> </div> ";
	echo "<br><b>&nbsp; &nbsp; รหัส</b> $ID";
	echo "<br><b>&nbsp; &nbsp; ชื่อบริษัท</b> $Name  ";
	echo "<br><b>&nbsp; &nbsp; ที่อยู่</b> $Address ";
	echo "<br><b>&nbsp; &nbsp; เบอร์โทรศัพท์</b> $Tel";

}
?>
<form action="datacompany.php" method="POST">
 <div align='center' ><input type="submit" value="เรียบร้อย"></div>
</form>
</td>
</tr></table>

</BODY>
</HTML>
