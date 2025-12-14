<?
/* 
 * **********************************************
 * **	   PHP - WebBoard : Post Question      **
 * **********************************************
 * *                                            *
 * * Developed By : Sansak Chairattanatrai      *
 * * E-mail :  sansak@engineer.com              *
 * * UIN : 5590582                              *
 * * License : SamChai Public Soft Group(tm).   *
 * *                                            *
 * **********************************************
 */ 
 ?>

	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
	<title>PHP - Ultimate Webboard 2.00</title>
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
	</head>
	
	<body>

 <?
	include("config.inc.php");
	$IP = getenv("REMOTE_ADDR");
	$Member = 0;

	//ทำอักขระพิเศษให้เป็นรหัส Html
	$QTitle = htmlspecialchars($QTitle);
	$QNote = htmlspecialchars($QNote);
	$QName = htmlspecialchars($QName);
	$QEmail = htmlspecialchars($QEmail);
	
	// เปลี่ยนคำหยาบเป็น *** (สีแดง)
	$word = array("ashole","a s h o l e","a.s.h.o.l.e","bitch","b i t c h","b.i.t.c.h","shit","s h i t","s.h.i.t","fuck","dick","f u c k","d i c k","f.u.c.k","d.i.c.k");
	$ban = "<font color=red>***</font>";
	for ($i=0 ; $i<sizeof($word) ; $i++) {
		$QTitle = eregi_replace($word[$i],$ban,$QTitle);
		$QNote = eregi_replace($word[$i],$ban,$QNote);
		$QName = eregi_replace($word[$i],$ban,$QName);
		$QEmail = eregi_replace($word[$i],$ban,$QEmail);
	}
    	
	// ทำให้อักษรแสดงรูปกลายเป็นรูป emotion
	$txt = array(":smile:", ":sad:",":red:", ":big:", ":ent:", ":shy:", ":sleepy:", ":sun:", ":sg:", ":embarass:", ":dead:", ":cool:", ":clown:", ":pukey:", ":eek:", ":roll:", ":smoke:", ":angry:", ":confused:", ":cry:", ":lol:", ":yawn:", ":devil:", ":tongue:", ":alien:", ":tasty:", ":crazy:");
	$pic = array("smile.gif","frown.gif","redface.gif","biggrin.gif","blue.gif","shy.gif","sleepy.gif","sunglasses.gif","supergrin.gif","embarass.gif","dead.gif","cool.gif","clown.gif","pukey.gif","eek.gif","sarcblink.gif","smokin.gif","reallymad.gif","confused.gif","crying.gif","lol.gif","yawn.gif","devil.gif","tongue.gif","aysmile.gif","tasty.gif","grazy.gif");
	for ($a=0 ; $a<sizeof($txt) ; $a++) {
		$QNote = eregi_replace($txt[$a],"<img src=\"pic/$pic[$a]\">",$QNote);
	}

	// ทำให้เป็น Link URL หรือ email
	$QNote = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$QNote);
	$QNote = eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$QNote); 

	// เปลี่ยน Enter เป็น <br>
	$QNote = eregi_replace(chr(13),"<br>",$QNote);

	// ดึงข้อมูลสมาชิก
	mysql_connect($host,$user,$passwd);
	$sql = "select User,Password,Email from webboard_member where User='$QName'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	$row = mysql_fetch_array($result);

	// ตรวจสอบ Password 
	if($QName==$row["User"] && $QPass==$row["Password"]) { 
		$Member = 1;
		if(!$QEmail) {
			$QEmail = $row["Email"];
		}
	}
	mysql_close();
$member=1;//debug
	//บันทึกรูปภาพ
	if($Member) {
		if($QPic!="none") {
			if($QPic_size>$Image_size) {
				echo "ขนาดรูปใหญ่เกิน $Image_size bytes<br>";
				exit();
			}
			$path="C:/Inetpub/wwwroot/E-Learning/Images/webboard_pic/Q_pic/";		
			$QPic_Temp_Name = $HTTP_POST_FILES['QPic']['tmp_name'];
  			$QPic_Name=$HTTP_POST_FILES['QPic']['name'];
			//copy($QPic,$QPic_name);
			copy(stripslashes($QPic,$QPic_name)); // For Windows///*****มาทำต่อตรงนี้ ล่าสุดถึงทำรูป
			$Psize = filesize($QPic_name);
			$PData = addslashes(fread(fopen($QPic_name,"r"),$Psize));
		}
	}

	//ดึงเวลาของ server ออกมา
	$mdate = date("j M Y H:i",mktime( date("H")+$p_hour, date("i")+$p_min ));

	// เก็บลงdatabase
	mysql_connect($host,$user,$passwd);
	$sql = "insert into webboard_data (Category,Question,Note,Name,Member,IP,Email,Date,Image) values ('$Category','$QTitle','$QNote','$QName','$Member','$IP','$QEmail','$mdate','$PData')";
	if(mysql_db_query($dbname,$sql)) {
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "<font size=3 color=red><b>คำถามของคุณได้โพสแล้วครับ</b></font><br><br>";
		echo "<meta http-equiv='refresh' content='10 URL =webboard.php?Category=$Category'>";
		echo "โปรดรอ 10 วินาทีจะกลับไปยังหน้า Webboard ครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr color=FF1493 width=600>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[ <a href='../webboard/postq.php?Category=$Category&page=$page'>ตั้งคำถาม</a> | ";
		echo "<a href='../webboard/webboard.php?Category=$Category'>กลับหน้า Webboard</a> ]";
		echo "<font>";
		echo "</center>";
		if($Member && $QPic_name) {
			unlink($QPic_name);
		}
	}
	else {
		echo "Error <br>";
	}
	mysql_close();
?>

</body>
</html>