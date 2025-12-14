<?
session_start();
if($SESSION[membername])
{
if($SESSION[membername]=='$membername')
$membername=$SESSION[membername];
}


?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> </TITLE>
<link rel="stylesheet" type="text/css" href="style.css">	
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<?

include("config.inc.php");
include("function.php");

	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
	$sql = "select * from introduce  where username='$membername'  order by  no  DESC ";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
$num=$NRow+1;
	if($NRow==0) { 
							echo "<font size=2 face='MS Sans Serif'>ยังไม่มีคำแนะนำติชม</font><br><br>\n";
								}
	else {
    		//
echo"	<table width=70% border=1 cellspacing=0 cellpadding=0 align=center  bordercolor=#1E90FF>";
echo"  <tr bordercolor=#1E90FF bgcolor=#99FF99><td height=25 ><div align=center><font face=MS Sans Serif size=3  color=#FF0033><b>คำแนะนำติชมของ $membername</b></font></div></td> </tr> </table><br>";
//
				// วนลูปแสดงข้อมูลที่อ่านได้
while ($row = mysql_fetch_array($result)) 
{
			// กำหนดค่าตัวแปร
		    $Date=$row["date"];
			$Detail=$row["detail"];
			$Sender=$row["sender"];
			$Email=$row["email"];


echo"	<table width=70% border=1 cellspacing=0 cellpadding=0 align=center  bordercolor=#1E90FF>";
echo"  <tr bordercolor=#1E90FF> ";
echo" <td height=20 bgcolor=#E0FFFF valign=top> ";
echo"  <table width=100% border=0 cellspacing=2 cellpadding=0>";
echo"        <tr> ";
$No=$No+1;
$No_num=$num-$No;
echo"          <td width=50% height=20><div align=left><font face=MS Sans Serif size=1>คำแนะนำติชมที่ $No_num</font></div></td>";
echo"          <td width=50% height=20><div align=right><font face=MS Sans Serif size=1>$Date</font></div></td>";
echo"        </tr>";
echo"      </table>";
echo"    </td>";
echo"  </tr>";
echo"  <tr bgcolor='#FFFFCC' valign=top> ";
echo"<td height=15> ";
echo"   <table width=100% border=0 cellspacing=5 cellpadding=0 height=40>";
echo"    <tr  valign=top> ";
echo" \t <td >$Detail</td>";
echo"</tr>";
echo"</table>";
echo"</td>";
echo"  </tr>";
echo"  <tr bgcolor=#99EE99>";
echo"    <td height=30> ";
//รายละเอียดผู้ส่ง
 echo"  <table width=100% border=0 cellspacing=0 cellpadding=2>";
echo"  <tr> ";
//
echo"  <td width=20% height=25> ";
echo"  <div align=center><font face=MS Sans Serif size=1> โดยคุณ</font></div>";
echo"          </td>";
echo"   <td width=20% height=25><div align=left><font face=MS Sans Serif size=1>$Sender</font>";

echo"    <td width=60% height=25>";
if($Email){
sendmail($Sender,$Email);
}
echo"      </td>  </tr>";
echo"      </table>";
echo"    </td>";
 echo" </tr>";
echo"</table>	";

echo "<br><hr color=FF1493 width='80%'><br>\n\n";
	
}	

}

?> 
</BODY>
</HTML>
