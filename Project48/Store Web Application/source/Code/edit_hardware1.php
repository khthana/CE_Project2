<HTML>
<HEAD>
<TITLE> บันทึกค่าการแก้ไขเครื่องมือในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY   background='bg_table2.jpg' tppabs='bg_table2.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td   background='bg_table.jpg' tppabs='bg_table.jpg'>

<?php
$ID_hw = $HTTP_POST_VARS["ID_hw"];
$Name_hw = $HTTP_POST_VARS["Name_hw"];
$SaleIN_hw = $HTTP_POST_VARS["SaleIN_hw"];
$Price_hw = $HTTP_POST_VARS["Price_hw"];
$BillID_hw = $HTTP_POST_VARS["BillID_hw"];
$BorrowAbleDate_hw= $HTTP_POST_VARS["BorrowAbleDate_hw"];
$status_hw= $HTTP_POST_VARS["status_hw"];

if (($ID_hw=="") or ($Name_hw=="") or ($SaleIN_hw=="") or ($Price_hw=="") or ($BillID_hw=="") or ($BorrowAbleDate_hw==""))
{
	echo "<br><div align='center'> โปรดกรอกรายละเอียดให้ครบทุกช่อง</div>";
} else {
		mysql_query("SET NAMES tis620"); 
		$link = mysql_pconnect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
		mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
		mysql_query("SET NAMES tis620"); 
		$ordersresult = "UPDATE  hardware SET HW_ID='$ID_hw',HW_Name='$Name_hw',Sale_IN='$SaleIN_hw',HW_Price='$Price_hw',Bill_ID='$BillID_hw',Borrow_Day='$BorrowAbleDate_hw',HW_Status='$status_hw' WHERE HW_ID = '$ID_hw'";
		$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery)
		mysql_close();
		echo "<div align='center'> <h2> แก้ไขเครื่องมือเรียบร้อย </h2></div> ";
		echo "<b><br>&nbsp; &nbsp; รหัสเครื่องมือ</b> $ID_hw";
		echo "<b><br>&nbsp; &nbsp; ชื่อเครื่องมือ</b> $Name_hw";
		echo "<b><br>&nbsp; &nbsp; วันที่ซื้อเข้า</b> $SaleIN_hw ";
		echo "<b><br>&nbsp; &nbsp; เลขที่บิล</b> $BillID_hw";
		echo "<b><br>&nbsp; &nbsp; ราคา</b> $Price_hw บาท";
		echo "<b><br>&nbsp; &nbsp; สถานะ</b> $status_hw ";
		echo "<b><br>&nbsp; &nbsp; จำนวนวันที่สามารถยืมได้</b> $BorrowAbleDate_hw วัน ";
}
?>
<form action="datahardware.php" method="POST">
 <div align='center' ><input type="submit" value="เรียบร้อย"></div>
</form>
</td>
</tr></table>
</BODY>
</HTML>
