<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Show Topic </TITLE>
<link rel="stylesheet" type="text/css" href="style.css">	
</HEAD>
<BODY BGCOLOR="#FFFFFF">

<?

	include("config.inc.php");
	include("function.php");
// ติดต่อ database เพื่ออ่านข้อมูล
//เลือกตารางและกำหนดตัวแปรเพื่อนำไปแสดง
mysql_connect($host,$user,$passwd);
$sql="select * from post ,friends_data,poster  where post.code=friends_data.code and post.code=poster.code and post.code='$Code'";
$result1=mysql_db_query($dbname,$sql);
$row= mysql_fetch_array($result1);
			$Code = $row["code"];
			$Status = $row["status"];
			$Topic = $row["topic"];
			$Price = $row["price"];
			$Date =trim($row["date"]);
		//	$Reply = $row["reply"];
		//	$Visit = $row["visit"];
			$Fullname = $row["fullname"];
			$Nickname = $row["nickname"];
			$Faculty = $row["faculty"];
			$department = $row["department"];
			$E_mail=$row["e_mail"];
			$Icq=$row["icq"];
			$Tel = $row["tel"];
			$Year=$row["year"];
			$Pager=$row["pager"];
			$Detail=$row["detail"];
			$Duration=$row["duration"];
			$Member=$row["member"];
			$Picture = $row["picture"];
    		$Username = $row["username"];
			$Email=$row["email"];
//			$IP = $row["ip"];
			$Ocode=$Code;		
	// ตรวจสอบรูปแบบการแสดง IP Address 
	switch ($showIP) {
		case "ALL" : $IP = $row["ip"]; break;
		case "BAN" : $IP =substr($row["ip"],0,strrpos($row["ip"],".")).".*"; break;
		case "NONE": $IP = ""; break;
		default : $IP = $row["ip"];
	}

$Date=showdate($Date);
// เพิ่มค่า visit
if ($Flag!=1){
$sql2 = "UPDATE post SET visit=visit+1  WHERE code='$Code' ";
$result2 = mysql_db_query($dbname,$sql2);
}

//icq
$sql3="select icq from member where username='$Username'";
$result3=mysql_db_query($dbname,$sql3);
$row3= mysql_fetch_array($result3);
$ICQ=$row3[0];

// แสดงข้อมูล 
echo"<table width=70% border=1 align=center cellspacing=2 cellpadding=0 height=33 bordercolor=#0000FF>\n";
echo"  <tr bgcolor=#9DE6FD> \n";
 echo"  <td> ";
echo" <div align=center><font face=MS Sans Serif size=3><b>$Topic</b></font></div>";
echo"    </td>";
echo"  </tr>";
echo"</table>";
echo"<table width=70% border=1 cellspacing=2 cellpadding=2 align=center bordercolor=#0000FF>";
echo"  <tr> ";
echo"    <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>ชื่อ-นามสกุล</font></td>";
echo"   <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD> $Fullname </td>";
echo"  </tr>";
echo"  <tr> ";
echo" <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>ชื่อเล่น</font></td>";
echo" <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$Nickname</td>";
echo"  </tr>";
echo"  <tr> ";
echo"  <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>Email</font></td>";
echo"<td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$E_mail</td>";
echo"  </tr>";
echo"  <tr> ";
echo"    <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>ICQ</font></td>";
echo"    <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$Icq</td>";
echo"  </tr>";
echo"  <tr> ";
echo"    <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>โทรศัพท์</font></td>";
echo"    <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$Tel</td>";
echo"  </tr>";
echo"  <tr> ";
echo"    <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>เพจเจอร์</font></td>";
  echo"  <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$Pager</td>";
echo"  </tr>";
echo"  <tr>"; 
    echo"<td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>คณะ</font></td>";
echo"    <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$Faculty</td>";
echo"  </tr>";
echo"  <tr>"; 
    echo"<td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>ภาควิชา</font></td>";
echo"    <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$department</td>";
echo"  </tr>";
echo"  <tr>"; 
    echo"<td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>ปี</font></td>";
echo"    <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD>$Year</td>";
echo"  </tr>";

echo"  <tr> ";
echo"   <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>รายละเอียด</font></td>";
echo"    <td width=81% bordercolor=#0000FF bgcolor=#EAF9FD> ";
echo"      <p>$Detail</p>";
echo"      <p>&nbsp;</p>";
echo"    </td>";
echo"  </tr>";
echo"</table>";
echo"<table width=70% border=1 cellspacing=2 cellpadding=2 align=center bordercolor=#0000FF>";
echo"  <tr> ";
echo"    <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>วันที่ลงประกาศ</font></td>";
echo"    <td width=27% bgcolor=#EAF9FD>$Date</td>";
echo"    <td width=23% bgcolor=#9DE6FD> <font face=MS Sans Serif size=1>วันที่สิ้นสุดของประกาศ</font></td>";
echo"    <td width=31% bgcolor=#EAF9FD>$Duration</td>";
echo"  </tr>";
echo"</table>";
echo"<table width=70% border=1 cellspacing=2 cellpadding=2 align=center bordercolor=#0000FF>";
echo"  <tr>";
echo"    <td width=19% bgcolor=#9DE6FD><font face=MS Sans Serif size=1>รูปภาพ</font></td>";

	// ตรวจสอบว่ามีรูปหรือไม่
		if($Picture) {
			echo "<td width=81% bgcolor=#EAF9FD>";
     		echo"\t\t<img src='$Picture'<br>\n";
			echo"</td>";
		}
  echo"</tr>";
echo"</table>";

echo"<table width=70% border=0 cellspacing=0 cellpadding=0 align=center>";
echo"  <tr>";
echo"    <td>&nbsp;</td>";
echo"  </tr>";
echo"</table>";

//ส่วนของผู้ประกาศ
echo"<table width=70% border=1 cellspacing=0 cellpadding=0 align=center bordercolor=#0000FF>";
echo"  <tr valign=top> ";
echo"    <td width=12% height=25>"; 
////
echo"      <table width=100% border=0 cellspacing=2 cellpadding=2>";
echo"        <tr>";
echo"          <td width=19% bgcolor=#9DE6FD>";
echo"   <div align=center ><font face=MS Sans Serif size=1>ประกาศโดย</font></div>";
echo"          </td>";
echo"          <td width=20% height=20 bgcolor=#EAF9FD>$Username";
if($Member==1){   echo "\t<img src='./images/member.gif' alt=สมาชิก>\n"; }
echo"</td>";
echo"          <td width=45% bgcolor=#EAF9FD>";
if($Email)
{
sendmail($Username,$Email);
}
//echo"<img src=./images/email.gif width=14height=10>";}
//echo "\t<img src='./images/tc.gif' >$Email
echo"</td>";
echo"          <td width=16% bgcolor=#EAF9FD><div align=center><font face=MS Sans Serif size=1>$IP</font></div></td>";
echo"        </tr>";
echo"      </table>";
echo"    </td>";
echo"  </tr>";
if($Member==1){
echo"  <tr valign=top> ";
echo"    <td width=12% height=25 bgcolor=#EAF9FD> ";
echo"      <table width=100% border=0 cellspacing=0 cellpadding=0>";
echo"        <tr>";
echo"          <td width=20% bgcolor=#EAF9FD>";
echo"            <div align=center>";
echo "\t\t<a href=\"profile.php?Username=$Username\" target=\"$Username\"><img src=\"images/profile.gif\" border=0 alt=\"$Username's Profile\"></a>\n";
echo"</div>";
echo"          </td>";
echo"          <td width=26% height=25 bgcolor=#EAF9FD><div align=center>";
			if($ICQ) {checkicq($ICQ);
			
			}
echo"</td>";
  echo"          <td width=27% height=25 bgcolor=#EAF9FD><div align=center><font face=MS Sans Serif size=1> <a href='fromintro.php?name=$Username' target='_blank'>คำแนะนำติชม</font></td></a>";    
 
echo"          <td width=27% height=25 bgcolor=#EAF9FD><div align=center><font face=MS Sans Serif size=1> <a href='loginedit.php?code=$Code&namecode=$Username&PHPSESSID=$PHPSESSID' target='_blank'>แก้ไขประกาศ</font></a></td>";
echo"  </tr>";
echo"      </table>";
}
echo"    </td>";
echo"  </tr>";
echo"</table>";
?>
<br><br>
<hr color=FF1493 width=600>
<br>

<?
	// ส่วนแสดงคำตอบ
	$sql = "select * from friends_ans where code='$Code'  order by no ";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($result==0){	echo "<b>Error</b>"; 
		exit();
			} 
	// วนลูปแสดงข้อมูลที่อ่านได้
	while ($row = mysql_fetch_array($result)) {
		// กำหนดค่าตัวแปร เพื่อนำไปแสดง
		$No = $row["no"];
		$Code=$row["code"];
		$Name = $row["username"];
		$Email1 = $row["email"];
		$Msg = $row["detail"];
		$Date = $row["date"];
		
	//	$IP=$row["ip"];
	//	$Member=$row["member"];
	// ตรวจสอบรูปแบบการแสดง IP Address 
	switch ($showIP) {
		case "ALL" : $IP = $row["ip"]; break;
		case "BAN" : $IP =substr($row["ip"],0,strrpos($row["ip"],".")).".*"; break;
		case "NONE": $IP = ""; break;
		default : $IP = $row["ip"];
	}
//icq
//$sql4="select icq from member where username='$Name'";
//$result4=mysql_db_query($dbname,$sql4);
//$row4= mysql_fetch_array($result4);
//$ICQ=$row4[0];

echo"	<table width=70% border=1 cellspacing=0 cellpadding=0 align=center  bordercolor=#1E90FF>";
echo"  <tr bordercolor=#1E90FF> ";
echo" <td height=20 bgcolor=#E0FFFF valign=top> ";
echo"  <table width=100% border=0 cellspacing=2 cellpadding=0>";
echo"        <tr> ";
$num=$num+1;
echo"          <td width=50% height=20><div align=left><font face=MS Sans Serif size=1>ANS#$num</font></div></td>";
echo"          <td width=50% height=20><div align=right><font face=MS Sans Serif size=1>$Date</font></div></td>";
echo"        </tr>";
echo"      </table>";
echo"    </td>";
echo"  </tr>";
echo"  <tr bgcolor=#F7f7f7 valign=top> ";
echo"<td height=15> ";
echo"   <table width=100% border=0 cellspacing=5 cellpadding=0 height=40>";
echo"    <tr  valign=top> ";
echo" \t <td >$Msg</td>";
echo"</tr>";
echo"</table>";
echo"</td>";
echo"  </tr>";
echo"  <tr bgcolor=#D2F8FD>";
echo"    <td height=30> ";
//รายละเอียดผู้ตอบ
 echo"  <table width=100% border=0 cellspacing=0 cellpadding=2>";
echo"  <tr> ";
//
echo"  <td width=10% height=25> ";
echo"  <div align=center><font face=MS Sans Serif size=1> โดยคุณ</font></div>";
echo"          </td>";
//
echo"   <td width=15% height=25><div align=left><font face=MS Sans Serif size=1>$Name</font>";
echo"</div></td>";
//
echo" <td width=35% height=25>";
if($Email1){
sendmail($Name,$Email1);
}
echo"</td>";
//
echo"     <td width=16% height=25><div align=center><font face=MS Sans Serif size=1>";
echo"</font></div></td>";
echo"          <td width=12% height=25><div align=center><font face=MS Sans Serif size=1>$IP</font></div></td>";
echo"        </tr>";
echo"      </table>";
echo"    </td>";
 echo" </tr>";
echo"</table>	";
				echo "<br><hr color=FF1493 width=600><br>\n\n";
}
mysql_close();
?>

<!-- // ฟอร์มรับข้อมูลของคำตอบ -->
<form method=post action="reply.php?Table=F&Code=<?echo $Code?>&dfile=showfriend.php  " name="webForm" ENCTYPE="multipart/form-data" onsubmit="return check()"> 
<!------------>
  <table border=1 bordercolor=#FF8C00 bgcolor=#FFDEAD cellpadding=2 cellspacing=0 align="center">
    <tr bgcolor=000000><td align=center>
  <font size=3 color=FFCC33 bgcolor=000000><b>เชิญตอบประกาศครับ</font></b>
</td></tr>
<tr><td>
        <table border=0>
          <tr> 
            <td align=right valign=top>ข้อความ</td>
            <td>
              <textarea name="detail" cols=45 rows= 5></textarea>
            </td>
          </tr>
          <tr> 
            <td align=right>โดย</td>
            <td>
              <input size=40 type=text name="username" maxlength=50>
            </td>
          </tr>
          <tr> 
            <td align=right>Email</td>
            <td>
              <input size=35 type=text name="email" maxlength=50>
            </td>
          </tr>
          <tr>
            <td align=right>&nbsp;</td>
            <td>
              <input type="checkbox" name="boxmail" value="1">
              <font face="MS Sans Serif, Microsoft Sans Serif" size="1">ต้องการให้ส่งเมล์แจ้งเมื่อมีการเปลี่ยนแปลงในประกาศ 
              </font></td>
          </tr>
        </table>
</td></tr>
<tr>


  <td align=center>
  <a href="javascript:setsmile(':smile:')"><img src="pics/smile.gif" border=0></a>
	<a href="javascript:setsmile(':sad:')"><img src="pics/frown.gif" border=0></a>
	<a href="javascript:setsmile(':red:')"><img src="pics/redface.gif" border=0></a>
	<a href="javascript:setsmile(':big:')"><img src="pics/biggrin.gif" border=0></a>
	<a href="javascript:setsmile(':ent:')"><img src="pics/blue.gif" border=0></a>
	<a href="javascript:setsmile(':shy:')"><img src="pics/shy.gif" border=0></a>
	<a href="javascript:setsmile(':sleepy:')"><img src="pics/sleepy.gif" border=0></a>
	<a href="javascript:setsmile(':sun:')"><img src="pics/sunglasses.gif" border=0></a>
	<a href="javascript:setsmile(':sg:')"><img src="pics/supergrin.gif" border=0></a>
	<a href="javascript:setsmile(':embarass:')"><img src="pics/embarass.gif" 	border=0></a>
	<a href="javascript:setsmile(':dead:')"><img src="pics/dead.gif" border=0></a>
	<a href="javascript:setsmile(':cool:')"><img src="pics/cool.gif" border=0></a>
	<a href="javascript:setsmile(':clown:')"><img src="pics/clown.gif" border=0></a>
	<a href="javascript:setsmile(':pukey:')"><img src="pics/pukey.gif" border=0></a><br>
	<a href="javascript:setsmile(':eek:')"><img src="pics/eek.gif" border=0></a>
	<a href="javascript:setsmile(':roll:')"><img src="pics/sarcblink.gif" border=0></a>
	<a href="javascript:setsmile(':smoke:')"><img src="pics/smokin.gif" border=0></a>
	<a href="javascript:setsmile(':angry:')"><img src="pics/reallymad.gif" border=0></a>
	<a href="javascript:setsmile(':confused:')"><img src="pics/confused.gif" 	border=0></a>
	<a href="javascript:setsmile(':cry:')"><img src="pics/crying.gif" border=0></a>
	<a href="javascript:setsmile(':lol:')"><img src="pics/lol.gif" border=0></a>
	<a href="javascript:setsmile(':yawn:')"><img src="pics/yawn.gif" border=0></a>
	<a href="javascript:setsmile(':devil:')"><img src="pics/devil.gif" border=0></a>
	<a href="javascript:setsmile(':tongue:')"><img src="pics/tongue.gif" border=0></a>
	<a href="javascript:setsmile(':alien:')"><img src="pics/aysmile.gif" border=0></a>
	<a href="javascript:setsmile(':tasty:')"><img src="pics/tasty.gif" border=0></a>
	<a href="javascript:setsmile(':crazy:')"><img src="pics/grazy.gif" border=0></a><br>
	<font color=blue>คลิกที่รูป เพื่อแทรกรูปลงในข้อความ</font>
  </td>
</tr>

</table>
  <div align="center"><br>
     <input type=submit value="ส่งข้อความ" name="submit">
	<input type="hidden" name=member value=<? echo $Member ?>>
	<input type="hidden" name=ocode  value=<? echo $Ocode ?>>
    <input type=reset value="ยกเลิก" name="reset">
  </div>
</form>
<script language="JavaScript">
<!--
function check()
{
      var v1 = document.webForm.detail.value;
      var v2 = document.webForm.username.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.webForm.detail.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อนชื่อ");
           document.webForm.username.focus();           
		   return false;
           }
        else
           return true;
}

function setsmile(what)
{
	document.webForm.detail.value = document.webForm.elements.detail.value+" "+what;
	document.webForm.detail.focus();
}
//-->
</script>

<!------------------------->
</BODY>
</HTML>