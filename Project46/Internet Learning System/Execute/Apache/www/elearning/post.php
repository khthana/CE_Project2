<?php
	session_start();
	
	if(!$Category)
	{
		$Category="";
	}
	else
	{
		include "connectdb.php";
		mysql_query("use elearning;");
		$sql = "select * from subject where subid='$Category';";
		$result=mysql_query($sql);
		if($result)
		{
			$Category="";
			print "<meta http-equiv=\"refresh\" content=\"0;URL=webboard.php?Category=$Category&page=1\">";
			exit();
		}
	}

	if(!$page)
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=webboard.php?Category=$Category&page=1\">";
		exit();
	}
	if(!($QTitle && $QNote &&$QName))
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
		exit();
	}

	if (isset($_SESSION['user']))
	{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$ruid=mysql_result($result,0,"uid");
	$rstatus=mysql_result($result,0,"status");
	if($rstatus==2)
	{
		$sql = "select * from userskill where uid='$ruid';";
		$result=mysql_query($sql);
		$count=mysql_num_rows($result);
		$within=0;
		for($i=0;$i<$count;$i++)
		{
			if($Category=="")
			{
				$within=1;
			}
			$rsubid=mysql_result($result,$i,"subid");
			if($rsubid==$Category)
			{
				$within=1;
				$i=$count;
			}
		}
	}
	mysql_close($db);
	}

if (!((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1)))))
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
	<html>
	<head>
	<title>ได้รับข้อมูลแล้วครับ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
	</head>
	<link rel='stylesheet' type='text/css' href='style.css' />
	
	<body>

 <?
	include("config.inc.php");
	$IP = getenv("REMOTE_ADDR");
	$Member = 0;

	// ป้องกันการแทรก html กับ ละเครื่องหมาย ' "
	$QTitle = htmlspecialchars($QTitle);
	$QNote = htmlspecialchars($QNote);
	$QName = htmlspecialchars($QName);
	$QEmail = htmlspecialchars($QEmail);
	
	// ป้องกันคำหยาบ
	$word = array("ashole","a s h o l e","a.s.h.o.l.e","bitch","b i t c h","b.i.t.c.h","shit","s h i t","s.h.i.t","fuck","dick","f u c k","d i c k","f.u.c.k","d.i.c.k","มึง","มึ ง","กู","ควย","ค ว ย","ค.ว.ย","ปี้","เหี้ย","เฮี้ย","ชาติหมา","ชาดหมา","ช า ด ห ม า","ช.า.ด.ห.ม.า","ช า ติ ห ม า","ช.า.ติ.ห.ม.า","ไอ้","สัดหมา","สัด","เย็ด","หี");
	$ban = "<font color=red>***</font>";
	for ($i=0 ; $i<sizeof($word) ; $i++) {
		$QTitle = eregi_replace($word[$i],$ban,$QTitle);
		$QNote = eregi_replace($word[$i],$ban,$QNote);
		$QName = eregi_replace($word[$i],$ban,$QName);
		$QEmail = eregi_replace($word[$i],$ban,$QEmail);
	}
    	
	// ตรวจสอบการแทรกรูปภาพ
	$txt = array(":smile:", ":sad:",":red:", ":big:", ":ent:", ":shy:", ":sleepy:", ":sun:", ":sg:", ":embarass:", ":dead:", ":cool:", ":clown:", ":pukey:", ":eek:", ":roll:", ":smoke:", ":angry:", ":confused:", ":cry:", ":lol:", ":yawn:", ":devil:", ":tongue:", ":alien:", ":tasty:", ":crazy:");
	$pic = array("smile.gif","frown.gif","redface.gif","biggrin.gif","blue.gif","shy.gif","sleepy.gif","sunglasses.gif","supergrin.gif","embarass.gif","dead.gif","cool.gif","clown.gif","pukey.gif","eek.gif","sarcblink.gif","smokin.gif","reallymad.gif","confused.gif","crying.gif","lol.gif","yawn.gif","devil.gif","tongue.gif","aysmile.gif","tasty.gif","grazy.gif");
	for ($a=0 ; $a<sizeof($txt) ; $a++) {
		$QNote = eregi_replace($txt[$a],"<img src=\"pic/$pic[$a]\">",$QNote);
	}

	// ตรวจสอบว่า มีการป้อน url หรือ email มาหรือไม่ ถ้ามีให้ทำ link
	$QNote = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$QNote);
	$QNote = eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$QNote); 

	// ให้ขึ้นบันทัดใหม่ กรณีที่มีการเคาะ Enter
	$QNote = eregi_replace(chr(13),"<br>",$QNote);
/*
	// ตรวจสอบว่าเป็นสมาชิกหรือไม่ 
	mysql_connect($host,$iduser,$passwd);
	$sql = "select User,Password,Email from webboard_member where User='$QName'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	$row = mysql_fetch_array($result);

	// ตรวจสอบว่า Password ถูกหรือไม่	
	if($QName==$row["User"] && $QPass==$row["Password"]) { 
		$Member = 1;
		if(!$QEmail) {
			$QEmail = $row["Email"];
		}
	}
	mysql_close();
*/
	// บันทึกรูปภาพ
//	if($Member) {
		if($QPic) {
			if(($QPic_type!="image/gif")&&($QPic_type!="image/bmp")
			&&($QPic_type!="image/jpg")&&($QPic_type!="image/jpeg")&&($QPic_type!="image/pjpeg")) { 
				echo "ไม่ใช่ไฟล์รูปภาพ<br>";
				exit();
			}
			if($QPic_size>$Image_size) {
				echo "ขนาดของภาพเกิน $Image_size bytes<br>";
				exit();
			}
			$time = time();
//			print $time;
			$picname = $Category.$time.$QPic_name;
			print $picname;
			$picname = "picboard/".$picname;
			copy($QPic,$picname);
			//copy(stripslashes($QPic,$QPic_name)); // For Windows
//			$Psize = filesize($QPic_name);
//			$PData = addslashes(fread(fopen($QPic_name,"r"),$Psize));
			$PData = $picname;
		}
//	}
	else
	{
		$PData = "";
	}

	// ปรับเวลาให้ตรงกับเวลาเมืองไทย กรณีที่ server อยู่ที่เมืองนอก
	$mdate = date("j M Y H:i",mktime( date("H")+$p_hour, date("i")+$p_min ));

	// เขียนข้อมูลลง database
	mysql_connect($host,$iduser,$passwd);
	$sql = "insert into webboard_data (Category,Question,Note,Name,IP,Email,Date,Image) values ('$Category','$QTitle','$QNote','$QName','$IP','$QEmail','$mdate','$PData')";
	if(mysql_db_query($dbname,$sql)) {
	?>
		<center>
		<table width=60% border=1 bordercolor=#FF9900 bgcolor=#FFEECC cellpadding=2 cellspacing=0>
		<tr><td align=center>
		<p class="warning"><strong><font size="4">ได้รับข้อมูลแล้วครับ </font></strong></p>
        <p class="defaultfont">หากคำถามของคุณไม่ขึ้นให้กดปุ่ม Refresh/Reload ครับ </p></td></tr></table>
		<br>
  [ 
  <?
if ((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1))))
{
?>
  <a href='postq.php?Category=<? print $Category; ?>&page=<? print $page; ?>'>ตั้งคำถามใหม่</a> 
  | 
  <?
  }
  ?>
  <a href='webboard.php?Category=<? print $Category; ?>&page=<? print $page; ?>'>แสดงคำถาม</a> ]
</center>
	<?
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