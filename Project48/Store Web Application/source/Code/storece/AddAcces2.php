<?php
include "chksession.php";
include "chkadmin.php";
?>

<HTML>
<HEAD>
<TITLE> เพิ่มอุปกรณ์อิเล็กทรอนิกส์  </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</HEAD>
<BODY bgcolor="#6633FF">
<br><table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php

if (($ID_acces=="") or ($Name_acces=="") or ($Amount_acces==""))

{
echo "<br><div align='center'> โปรดกรอกรายละเอียดให้ครบทุกช่อง <a href=AddAcces.html> กลับไปกรอกรายละเอียดใหม่ </a></div>";
} else {

$link = mysql_connect("localhost","root","") or die ("ไม่สามารถติดต่อฐานข้อมูล");
mysql_select_db("store") or die ("เลือกฐานข้อมูลไม่ได้"); 
$ordersresult = "insert into acces (ID,Name,Amount,Remain) values ('$ID_acces','$Name_acces','$Amount_acces','$Remain_acces')";
$dbquery = mysql_db_query("store",$ordersresult);

if($dbquery)

mysql_close();
echo "<div align='center'> <h2> เพิ่มอุปกรณ์เรียบร้อย </h2></div> ";
echo "<br>&nbsp; &nbsp; <b> รหัสอุปกรณ์ </b> $ID_acces";
echo "<br>&nbsp; &nbsp; <b> ชื่ออุปกรณ์ </b> $Name_acces";
echo "<br>&nbsp; &nbsp; <b> จำนวน </b> $Amount_acces <b>ตัว</b> ";

}
?>

</td>
</tr></table>
</BODY>
</HTML>
