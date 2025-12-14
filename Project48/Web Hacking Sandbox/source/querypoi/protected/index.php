<?php
session_start();
$DBName="querypoi";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);
if($type=="")$type="1 OR 2";
// mysql_query("UPDATE `product` SET `PName` = 'เจาะหลัก-ฎีกา เฉพาะกิจ' WHERE `ID` = '8' LIMIT 1") ;
 //mysql_query("UPDATE `profile` SET `credit_card_no` = '254853126942' WHERE `ID` = '2' LIMIT 1");
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Web Hacking Sandbox... Solution  for protected the Web...</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../test/smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#006699;
					   scrollbar-face-color: #0099FF;
					   scrollbar-highlight-color: #006699; 
					   scrollbar-shadow-color: #006699; 
					   scrollbar-arrow-color: #FFFFFF;
					   scrollbar-track-color: #FFFFFF; 
					   scrollbar-darkshadow-color: #009900;
        }
		a:link {
	color: #F58227;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #006699;
}
a:hover {
	text-decoration: none;
	background-color: #7DD6E8;
	color: #F58227; 
	width:100%
}-->
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 class="style0" >
<!-- ImageReady Slices (scr.jpg) -->
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="2%">&nbsp;</td>
          <td colspan="2" valign="top" class="style0"><table width="52%" border="1" bordercolor="#006699" bgcolor="#CFE8F3">
              <tr> 
                <td width='34%' class="style0"><div align="center" class="style0"><a href="index.php?type=1">Computer</a></div></td>
                <td width='34%' class="style0"><div align="center" class="style0"><a href="index.php?type=2">Law</a></div></td>
                <td width='32%' class="style0"><div align="center"><a href="index.php?type=1%20OR%202">All</a></div></td>
              </tr>
            </table>
            <div align="center"> 
              <?php
$type=intval($type);
$result=@mysql_query("SELECT PName,Price,Image FROM product  WHERE Type=$type " );
//if($type==1||$type==2)$result=@mysql_query("SELECT PName,Price,Image FROM product WHERE Type=$type ");

 print" <table bgcolor='#CFE8F3' width='100%' height='50%'border='1' cellspacing='0' bordercolor='#006699' align='center'>";
 
$count=0;
print "<tr>";
while ($data=@mysql_fetch_array($result)) {
 	$count++;
	 			print"<td  class=\"style0\"  width='50%'><div align='center'><br>
					  <font color=0000ff>$data[0]</font><br><br> ราคา <font color=ff0000>$data[1]</font> บาท<br><br><img src=$data[2] width='100' height='135' align='center'></div></td>";
			   if($count==2){	print"</tr>";$count=0; }
}
	 print "</tr>";
print "</table>";
 ?>
            </div>
            <br>
          </td>
          <td width="37%" valign="top" class="style0"><br> <font color="#FF0000">การป้องกัน</font><br> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สามารถทำการป้องกันได้โดยการกรอง Input 
            ที่รับมา<br>
            จาก Query string โดยการใส่ Function intval()<br>
            ก่อนที่จะมีการนำตัวแปรไปใช้ query ในคำสั่ง sql เช่น<br> <font color="#FF0000">$type=intval($type);</font>( 
            ใน PHP )<br> <font color="#FF9966">SELECT Name,Price FROM product<br>
            WHERE Type=</font><font color="#FF0000">$type</font> <font color="#FF9966">;</font> 
            เป็นต้น <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;และควรมีการกรองตัวอักขระพิเศษต่างๆเช่น 
            ' หรือ " <br>
            เพื่อกันไม่ให้สามารถทำ SQL Injection แบบอื่นๆได้<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จากตัวอย่างการทดลองร้านขายหนังสือเราสามารถใช้<br>
            คำสั่ง SQL ในการเรียนดูส่วนที่สงวนไว้ได้ซึ่งส่วนนี้อยู่ใน<br>
            data base เดียวกันกับข้อมูลหนังสือ ซึ่งหลังจากทำการ<br>
            ป้องกันโดยเพิ่ม <font color="#FF0000">intval(); </font>แล้วจะเห็นว่าไม่สามารถใส่คำสั่ง<br>
            SQL ใน Query string ได้อีก แต่อย่างไรก็ตาม แฮ้กเกอร์<br>
            อาจใช้วิธีการอื่นๆในการเจาะระบบเว็บอีกได้ </td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		<TD COLSPAN=3>
			<IMG SRC="../../images/scr_03.gif" WIDTH=641 HEIGHT=41 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_04.gif" WIDTH=109 HEIGHT=41 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=2>
			<IMG SRC="../../images/scr_05.gif" WIDTH=473 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_06.gif" WIDTH=168 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_07.gif" WIDTH=109 HEIGHT=46 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="../../images/scr_08.gif" WIDTH=36 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_09.gif" WIDTH=437 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_10.gif" WIDTH=168 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_11.gif" WIDTH=109 HEIGHT=42 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_12.gif" WIDTH=750 HEIGHT=87 ALT=""></TD>
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
<map name="Map">
  <area shape="rect" coords="-19,3,417,111" href="../../index1.html">
</map>
</BODY>
</HTML>