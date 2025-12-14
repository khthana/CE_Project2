<?php
include "chksession.php";
include "chkadmin.php";
include "connect.php";
include "function.php";
?>

<HTML>
<HEAD>
<TITLE> เพิ่มเครื่องมือลงในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>
<body bgcolor="#99FFFF">
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php

if (($ID_hw=="") or ($Name_hw=="") or ($SaleIN_hw=="") or ($Price_hw=="") or ($BillID_hw=="") or ($BorrowAbleDate_hw==""))
{
echo " <br><br><div align='center'>! ! ! โปรดกรอกรายละเอียดให้ครบทุกช่อง <a href=AddHW.html> กลับไปกรอกรายละเอียดใหม่ </a></div>";
}

else
{
mysql_query("SET NAMES tis620"); //ให้เป็นภาษาไทย
$link = mysql_connect("localhost","administrator","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
mysql_select_db("storece") or die ("เลือกฐานข้อมูลไม่ได้"); 
$ordersresult = "Insert into hardware(ID,Name,SaleIN,Price,BillID,BorrowAbleDate,Status) values ('$ID_hw','$Name_hw','$SaleIN_hw','$Price_hw','$BillID_hw','$BorrowAbleDate_hw','Remain_hw')";
$dbquery = mysql_db_query("store",$ordersresult);
if($dbquery)
mysql_close();
echo "<div align='center'> <h3>:: เพิ่มเครื่องมือเรียบร้อย ::</h3></div> ";
echo "&nbsp; &nbsp; <b>รหัสเครื่องมือ</b> $ID_hw";
echo "<br>&nbsp; &nbsp; <b>ชื่อเครื่องมือ</b> $Name_hw";
echo "<br>&nbsp; &nbsp; <b>วันที่ซื้อเข้า</b> $SaleIN_hw ";
echo "<br>&nbsp; &nbsp; <b>เลขที่บิล</b> $BillID_hw";
echo "<br>&nbsp; &nbsp; <b>จำนวนวันที่ยืมได้</b> $BorrowAbleDate_hw วัน ";
}
?>

</td>
</tr></table>
</BODY>
</HTML>
