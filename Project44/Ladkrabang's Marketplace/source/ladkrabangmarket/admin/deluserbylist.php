<?
session_start();

if($administrator[0]=='1')
{

echo "<table width='100%'border='0' cellspacing='0' cellpadding='0' height='50'>";
echo "<tr> ";
echo   "<td height='51' width='20%'>&nbsp;</td>";
echo   "<td height='51' width='53%'><img src='../images/logo_big.gif' width='467' height='54'></td>";
echo    "<td height='51' width='12%' align ='left' valign='bottom'><font face='MS Sans Serif, Microsoft Sans Serif' size='2'><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>";
echo "</tr>";
echo "</table>";
echo"<hr color=1E90FF>";

include("../config.inc.php");

mysql_connect($host,$user,$passwd);
$result = mysql_db_query($dbname, "select username from member   ");
//$NRow = mysql_num_rows($result);
while ($row = mysql_fetch_array($result)) 
{
  if($$row[0]=='on')
  { 
     //echo"$row[0]<br>";
    
	 $sql1="delete from member where username='$row[0]'";
	 $result1 = mysql_db_query($dbname,$sql1);

if($result1!=0  )
{

echo"<table width=50% border=0 cellspacing=0 cellpadding=0>";
echo"  <tr>";
echo"    <td>&nbsp;</td>";
echo"  </tr>";
echo"</table>";
echo"<table width=50% border=1 cellspacing=0 cellpadding=0 align=center height=100 bgcolor=#FFFFFF bordercolor=#CC00FF>";
echo"  <tr>";
echo"    <td>";
echo"      <p align=center><b><font face=MS Sans Serif size=3 color=#6600FF>ลบสมาชิกชื่อ  $row[0] เรียบร้อยแล้ว        </font></b></p>";
echo"  <p align=center><font face=MS Sans Serif size=3 color=#330000><b> กรุณารอสักครู่จะกลับสู่หน้าแสดงรายชื่อสมาชิก</b></font></p>";
echo"    </td>";
echo"  </tr>";
echo"</table>";
}else{
echo"<table width=50% border=0 cellspacing=0 cellpadding=0>";
echo"  <tr>";
echo"    <td>&nbsp;</td>";
echo"  </tr>";
echo"</table>";
echo"<table width=50% border=1 cellspacing=0 cellpadding=0 align=center height=100 bgcolor=#FFCCFF bordercolor=#FF0000>";
echo"  <tr>";
echo"    <td>";
 echo"  <p align=center><b><font face=MS Sans Serif size=3 color=#66CCFF>ไม่สามารถลบสมาชิก $row[0] ได้ กรุณาตรวจสอบ</font></b></p>";
echo"      <p align=center><b><font face=MS Sans Serif size=3 color=#66CCFF>กรุณารอสักครู่จะกลับสู่หน้าแสดงรายชื่อสมาชิก</font></b></p>";
echo"      </td>";
echo"  </tr>";
echo"</table> ";
}//else
}//if
}//whicth
mysql_close();
echo" <hr color=1E90FF>";
echo"  <table width=100% border=0 height=53>";
echo"    <tr> ";
echo"      <td height=36 valign=top> ";
echo"        <div align=center><font color=#0000FF>Department of Computer Engineering   Faculty of Engineering King Mongkut's Institute of Technology<br> Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>  </div>";
echo"   </td>    </tr>  </table>";
}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}
?>
	<html>
	<head>
	<title>ลบสมาชิก</title>
	<meta name="Generator" content="EditPlus">
	<META HTTP-EQUIV="Content-Type" content="text/html; charset=windows-874">
	<META HTTP-EQUIV="REFRESH" CONTENT="3; URL=listmember.php ">
	</head>
	<style type="text/css">
	<!-- 
	BODY {font-family:;font-size="10"}
	A:link {text-decoration: none; color: blue }
	A:visited {text-decoration: none; color: blue }
	A:hover {text-decoration: none; color: darkorange }
	A:active {text-decoration: none; color: blue }
	p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
	-->
	</style>
	<body>
	
	</body>
	</html> 