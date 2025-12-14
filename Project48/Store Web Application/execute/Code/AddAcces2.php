<HTML>
<HEAD>
<TITLE> เพิ่มอุปกรณ์อิเล็กทรอนิกส์  </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>
<BODY bgcolor="#6633FF"  background="bg_table.jpg" tppabs="bg_table.jpg">
<br><table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php

$BillID_acces = $HTTP_POST_VARS["BillID_acces"];
$Comp_ID = $HTTP_POST_VARS["Comp_ID"];
$ID_acces = $HTTP_POST_VARS["ID_acces"];
$Name_acces = $HTTP_POST_VARS["Name_acces"];
$SaleIN_acces= $HTTP_POST_VARS["SaleIN_acces"];
$Amount_acces = $HTTP_POST_VARS["Amount_acces"];
$Price_acces = $HTTP_POST_VARS["Price_acces"];

if (($ID_acces=="") or ($Name_acces=="") or ($Amount_acces=="") or ($BillID_acces=="") or ($Comp_ID=="") or ($Price_acces=="") or ($SaleIN_acces==""))
{
echo "<br><div align='center'> โปรดกรอกรายละเอียดให้ครบทุกช่อง</div>";
} else {
	mysql_query("SET NAMES tis620");
	$link = mysql_connect("localhost","root","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	$ordersresult = "insert into accessory (Acces_ID,Acces_Name,Acces_Amount,Acces_Remain,Bill_ID,Price_Acces) values ('$ID_acces','$Name_acces','$Amount_acces','$Amount_acces','$BillID_acces','$Price_acces')";
	$dbquery = mysql_db_query("store",$ordersresult);
	
	mysql_query("SET NAMES tis620");
	$link = mysql_connect("localhost","root","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	$ordersresult1 = "Insert into bill(Bill_ID,Comp_ID,Bill_Date,Budget) values ('$BillID_acces','$Comp_ID','$SaleIN_acces','$Price_acces')";
	$dbquery1 = mysql_db_query("store",$ordersresult1);


if($dbquery)
	mysql_close();

echo "<div align='center'> <h2> เพิ่มอุปกรณ์เรียบร้อย </h2></div> ";
echo "<br>&nbsp; &nbsp; <b> เลขที่บิล</b> $BillID_acces";
echo "<br>&nbsp; &nbsp; <b> รหัสบริษัท</b> $Comp_ID";
echo "<br>&nbsp; &nbsp; <b> รหัสอุปกรณ์ </b> $ID_acces";
echo "<br>&nbsp; &nbsp; <b> ชื่ออุปกรณ์ </b> $Name_acces";
echo "<br>&nbsp; &nbsp; <b> วันที่ซื้ออุปกรณ์ </b> $SaleIN_acces";
echo "<br>&nbsp; &nbsp; <b> จำนวน </b> $Amount_acces <b>ตัว</b> ";
echo "<br>&nbsp; &nbsp; <b> ราคา</b> $Price_acces &nbsp; <b>บาท</b>";
}
?>
<form action="FormInsert.php" method="POST">
 <div align='center' ><input type="submit" value="กลับไปกรอกข้อมูลใหม่"></div>
</form>
</td>
</tr></table>
</BODY>
</HTML>
