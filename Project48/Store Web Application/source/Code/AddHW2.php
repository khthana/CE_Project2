
<HTML>
<HEAD>
<TITLE> เพิ่มเครื่องมือลงในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY bgcolor="#6633FF"  background='bg_table.jpg' tppabs='bg_table.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php

$ID_hw = $HTTP_POST_VARS["ID_hw"];
$Name_hw = $HTTP_POST_VARS["Name_hw"];
$SaleIN_hw = $HTTP_POST_VARS["SaleIN_hw"];
$Price_hw = $HTTP_POST_VARS["Price_hw"];
$BillID_hw = $HTTP_POST_VARS["BillID_hw"];
$Comp_ID = $HTTP_POST_VARS["Comp_ID"];
$BorrowAbleDate_hw = $HTTP_POST_VARS["BorrowAbleDate_hw"];
$Type = $HTTP_POST_VARS["Type"];


if (($ID_hw=="") or ($Name_hw=="") or ($SaleIN_hw=="") or ($Price_hw=="") or ($BillID_hw=="") or ($Comp_ID=="") or ($BorrowAbleDate_hw=="") or ($Type==""))
{
	echo " <br><br><div align='center'> โปรดกรอกรายละเอียดให้ครบทุกช่อง </div>";
}

else
{
	mysql_query("SET NAMES tis620");
	$link = mysql_pconnect("localhost","root","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	mysql_query("SET NAMES tis620");
	$ordersresult = "Insert into hardware(HW_ID,HW_Name,Sale_IN,HW_Price,Bill_ID,Borrow_Day,HW_Status,Type) values ('$ID_hw','$Name_hw','$SaleIN_hw','$Price_hw','$BillID_hw','$BorrowAbleDate_hw','yes','$Type')";
	$dbquery = mysql_db_query("store",$ordersresult);

	mysql_query("SET NAMES tis620");
	$link1 = mysql_pconnect("localhost","root","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
	mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
	$ordersresult1 = "Insert into bill(Bill_ID,Comp_ID,Bill_Date,Budget) values ('$BillID_hw','$Comp_ID','$SaleIN_hw','$Price_hw')";
	mysql_query("SET NAMES tis620");
	$dbquery1 = mysql_db_query("store",$ordersresult1);

if($dbquery)
	mysql_close();

echo "<div align='center'> <h2>เพิ่มเครื่องมือเรียบร้อย  </h2></div> ";
echo "<br>&nbsp; &nbsp;<b>รหัสเครื่องมือ</b> $ID_hw";
echo "<br>&nbsp; &nbsp; <b>ชื่อเครื่องมือ</b> $Name_hw";
echo "<br>&nbsp; &nbsp; <b>วันที่ซื้อเข้า</b> $SaleIN_hw ";
echo "<br>&nbsp; &nbsp; <b>เลขที่บิล</b> $BillID_hw";
echo "<br>&nbsp; &nbsp; <b>รหัสบริษัท</b> $Comp_ID";
echo "<br>&nbsp; &nbsp; <b>จำนวนวันที่สามารถยืมได้</b> $BorrowAbleDate_hw วัน ";
echo "<br>&nbsp; &nbsp; <b>ชนิดของอุปกรณ์</b> $Type";
}
?>
<form action="FormInsert.php" method="POST">
 <div align='center' ><input type="submit" value="กลับไปกรอกข้อมูลใหม่"></div>
</form>
</td>
</tr></table>
</BODY>
</HTML>
