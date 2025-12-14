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

	if(!$No)
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=webboard.php?Category=$Category&page=1\">";
		exit();
	}	
	if(!($Msg && $MsgBy))
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

	include("config.inc.php");
	$IP = getenv("REMOTE_ADDR");
	$Member = 0;

	// ป้องกันการแทรก html กับ ละเครื่องหมาย ' "
	$MsgBy = htmlspecialchars($MsgBy);
	$Email = htmlspecialchars($Email);
	$Msg = htmlspecialchars($Msg);


	// ป้องกันคำหยาบ
	$word = array("ashole","a s h o l e","a.s.h.o.l.e","bitch","b i t c h","b.i.t.c.h","shit","s h i t","s.h.i.t","fuck","dick","f u c k","d i c k","f.u.c.k","d.i.c.k","มึง","มึ ง","กู","ควย","ค ว ย","ค.ว.ย","ปี้","เหี้ย","เฮี้ย","ชาติหมา","ชาดหมา","ช า ด ห ม า","ช.า.ด.ห.ม.า","ช า ติ ห ม า","ช.า.ติ.ห.ม.า","ไอ้","สัดหมา","สัด","เย็ด","หี");
	$ban = "<font color=red>***</font>";
	for ($i=0 ; $i<sizeof($word) ; $i++) {
		$MsgBy = eregi_replace($word[$i],$ban,$MsgBy);
		$Email = eregi_replace($word[$i],$ban,$Email);
		$Msg = eregi_replace($word[$i],$ban,$Msg);
	}

	// ตรวจสอบการแทรกรูปภาพ
	$txt = array(":smile:", ":sad:",":red:", ":big:", ":ent:", ":shy:", ":sleepy:", ":sun:", ":sg:", ":embarass:", ":dead:", ":cool:", ":clown:", ":pukey:", ":eek:", ":roll:", ":smoke:", ":angry:", ":confused:", ":cry:", ":lol:", ":yawn:", ":devil:", ":tongue:", ":alien:", ":tasty:", ":crazy:");
	$pic = array("smile.gif","frown.gif","redface.gif","biggrin.gif","blue.gif","shy.gif","sleepy.gif","sunglasses.gif","supergrin.gif","embarass.gif","dead.gif","cool.gif","clown.gif","pukey.gif","eek.gif","sarcblink.gif","smokin.gif","reallymad.gif","confused.gif","crying.gif","lol.gif","yawn.gif","devil.gif","tongue.gif","aysmile.gif","tasty.gif","grazy.gif");
	for ($a=0 ; $a<sizeof($txt) ; $a++) {
		$Msg = eregi_replace($txt[$a],"<img src=\"pic/$pic[$a]\">",$Msg);
	}

    // ตรวจสอบว่า มีการป้อน url หรือ email มาหรือไม่ ถ้ามีให้ทำ link
	$Msg = eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$Msg);
	$Msg = eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$Msg); 

	// ให้ขึ้นบันทัดใหม่ กรณีที่มีการเคาะ Enter
	$Msg = eregi_replace(chr(13),"<br>",$Msg);
/*
	// ตรวจสอบว่าเป็นสมาชิกหรือไม่ 
	mysql_connect($host,$iduser,$passwd);
	$sql = "select User,Password,Email from webboard_member where User='$MsgBy'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	$row = mysql_fetch_array($result);

	// ตรวจสอบว่า Password ถูกหรือไม่	
	if($MsgBy==$row["User"] && $QPass==$row["Password"]) { 
		$Member = 1;
		if(!$Email) {
			$Email = $row["Email"];
		}
	}
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
//			print $picname;
			$picname = "picboard/".$picname;
			copy($QPic,$picname);
			// copy(stripslashes($QPic),$QPic_name); // For Windows
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

	// บันทึกข้อมูลลง database
	mysql_connect($host,$iduser,$passwd);
	$sql1 = "INSERT INTO webboard_ans (QuestionNo, Name, IP, Email, Msg, Date, Image) VALUES ('$No', '$MsgBy', '$IP', '$Email', '$Msg', '$mdate', '$PData')";
	$sql2 = "UPDATE webboard_data SET Reply=Reply+1, ReplyDate='$mdate' WHERE No='$No'";

	$result1 = mysql_db_query($dbname,$sql1);
	$result2 = mysql_db_query($dbname,$sql2);

	if(!$result1) { echo "Error : Can not save to database"; exit(); } 
	if(!$result2) { echo "Error : Can not update to database"; exit(); } 

	$ShowNo = sprintf("%05d",$No);

	if($Member && $QPic_name) {
		unlink($QPic_name);
	}

	mysql_close();
?>

	<html>
	<head>
	<title>ได้รับข้อมูลแล้วครับ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
	<META HTTP-EQUIV="REFRESH" CONTENT="2; URL=show.php?Category=<? echo $Category; ?>&No=<? echo $No; ?>">
	</head>
	<link rel='stylesheet' type='text/css' href='style.css' />

	<body>
	<center>
	
  <table width=60% border=1 bordercolor=#FF9900 bgcolor=#FFEECC cellpadding=2 cellspacing=0>
    <tr><td align=center>
	<p class="warning"><font size="4"><strong>ได้รับข้อมูลแล้วครับ</strong></font></p>
        <p class="defaultfont"> หากคำตอบของคุณไม่ขึ้นให้กดปุ่ม Refresh/Reload ครับ </p></td></tr></table>
	
  <p class="defaultfont"><br>
    เราจะพาคุณกลับไปสู่ <font color="#FF0000">Webboard</font> คำถามที่ <font color=blue><b><? echo $ShowNo; ?></b></font> 
    โดยไม่ต้องกดปุ่มใดๆ </p>
  </center>
	</body>
	</html>