

<?
	include("config.inc.php");
	include("censor.php");

	// ป้องกันการแทรก html กับ ละเครื่องหมาย ' "
	$detail = htmlspecialchars($detail);
	$sender =htmlspecialchars($sender);
	$email = htmlspecialchars($email);
   $date=date("d/m/y");

   	// ป้องกันคำหยาบ

		$sender =censor($sender);
		$detail = censor($detail);
		$email = censor($email);
	
// ตรวจสอบการแทรกรูปภาพ
	$txt = array(":smile:", ":sad:",":red:", ":big:", ":ent:", ":shy:", ":sleepy:", ":sun:", ":sg:", ":embarass:", ":dead:", ":cool:", ":clown:", ":pukey:", ":eek:", ":roll:", ":smoke:", ":angry:", ":confused:", ":cry:", ":lol:", ":yawn:", ":devil:", ":tongue:", ":alien:", ":tasty:", ":crazy:");
	$pic = array("smile.gif","frown.gif","redface.gif","biggrin.gif","blue.gif","shy.gif","sleepy.gif","sunglasses.gif","supergrin.gif","embarass.gif","dead.gif","cool.gif","clown.gif","pukey.gif","eek.gif","sarcblink.gif","smokin.gif","reallymad.gif","confused.gif","crying.gif","lol.gif","yawn.gif","devil.gif","tongue.gif","aysmile.gif","tasty.gif","grazy.gif");
	for ($a=0 ; $a<sizeof($txt) ; $a++) {
		$detail = eregi_replace($txt[$a],"<img src=\"pics/$pic[$a]\">",$detail);
	}
	// ตรวจสอบว่า มีการป้อน url หรือ email มาหรือไม่ ถ้ามีให้ทำ link
	$detail = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$detail);
	$detail = eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$detail); 

	// ให้ขึ้นบันทัดใหม่ กรณีที่มีการเคาะ Enter
	$detail = eregi_replace(chr(13),"<br>",$detail);


// บันทึกข้อมูลลงฐานข้อมูล
	mysql_connect($host,$user,$passwd);
	
	$sql = "insert into introduce(no,detail,sender,email,date,username) values ('$no','$detail','$sender','$email','$date','$username')";
	$result = mysql_db_query($dbname,$sql);

if($result==0) {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>มีข้อผิดพลาดที่ระบบ</b></font><br><br>";
		echo "กรุณาแจ้ง admin ให้ตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	} 
	mysql_close(); 
		
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "<font size=3 color=red><b>บันทึกข้อมูลเรียบร้อย</b></font><br><br>";
		echo"<font size=3 color=#3300FF>ได้ส่งคำแนะนำถึง $username เรียบร้อยแล้ว<br>รอสักครู่เพื่อดูคำแนะนำติชม </font>";
		echo "</font></td></tr></table>";

echo "<font size=2 face='MS Sans Serif'>";
echo"  <hr color=1E90FF>";
echo"  <table width=100% border=0 height=53>";
echo"    <tr>  ";
echo"      <td height=36  valign=top> ";
echo"        <div align=center><font color=#0000FF>Department of Computer Engineering   Faculty of Engineering King Mongkut's Institute of Technology<br>   Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br> ";
echo"        </div>";
echo"      </td>";
echo"    </tr>";
echo"  </table>";
?>

<HTML>
<HEAD>
<TITLE> ให้คำแนะนำติชม</TITLE>
<META HTTP-EQUIV="Content-Type" content="text/html; charset=windows-874">
<META HTTP-EQUIV="REFRESH" CONTENT="2; URL=fromintro.php?name=<?echo $username ?> ">

<link rel="stylesheet" type="text/css" href="style.css">	
</HEAD>

<BODY BGCOLOR="#FFFFFF">
</BODY>
</HTML>
