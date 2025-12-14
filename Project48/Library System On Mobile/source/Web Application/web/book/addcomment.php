<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	if ($a_name == "" or $a_message=="")
		{
			echo ("<center><font color=\"red\">กรุณากรอก ชื่อ และข้อความของคุณด้วยครับ </font></center> ");
			exit;
		}

	$a_ip = getenv("remote_addr");

	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		$a_name = htmlspecialchars($a_name);
		$a_email = htmlspecialchars($a_email);
		$a_icq = htmlspecialchars($a_icq);

		
		//# EMOTION ICON
		$a_message=str_replace (":D", "<img src=\"webboard/icon_biggrin.gif\">", $a_message);
		$a_message=str_replace (":)", "<img src=\"webboard/icon_smile.gif\">", $a_message);
		$a_message=str_replace (":(", "<img src=\"webboard/icon_sad.gif\">", $a_message);
		$a_message=str_replace (":o:", "<img src=\"webboard/icon_surprised.gif\">", $a_message);

		$a_message=str_replace (":shock:", "<img src=\"webboard/icon_eek.gif\">", $a_message);
		$a_message=str_replace (":~", "<img src=\"webboard/icon_confused.gif\">", $a_message);
		$a_message=str_replace ("8)", "<img src=\"webboard/icon_cool.gif\">", $a_message);
		$a_message=str_replace (":lol:", "<img src=\"webboard/icon_lol.gif\">", $a_message);

		$a_message=str_replace (":x", "<img src=\"webboard/icon_mad.gif\">", $a_message);
		$a_message=str_replace (":P", "<img src=\"webboard/icon_razz.gif\">", $a_message);
		$a_message=str_replace (":oops:", "<img src=\"webboard/icon_redface.gif\">", $a_message);
		$a_message=str_replace (":cry:", "<img src=\"webboard/icon_cry.gif\">", $a_message);

		$a_message=str_replace (":evil:", "<img src=\"webboard/icon_evil.gif\">", $a_message);
		$a_message=str_replace (":twisted:", "<img src=\"webboard/icon_twisted.gif\">", $a_message);
		$a_message=str_replace (":roll:", "<img src=\"webboard/icon_rolleyes.gif\">", $a_message);
		$a_message=str_replace (":wink:", "<img src=\"webboard/icon_wink.gif\">", $a_message);

		$a_message=str_replace (":!:", "<img src=\"webboard/icon_exclaim.gif\">", $a_message);
		$a_message=str_replace (":?:", "<img src=\"webboard/icon_question.gif\">", $a_message);
		$a_message=str_replace (":idea:", "<img src=\"webboard/icon_idea.gif\">", $a_message);
		$a_message=str_replace (":arrow:", "<img src=\"webboard/icon_arrow.gif\">", $a_message);
		//#q_message=eregi_replace ("\[img\]([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]])\[/img\]", "<img src=\"\\1://\\2\\3\">",q_message ) ;
		$a_message=eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$a_message);
		$a_message=eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$a_message); 
		
	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$a_message = nl2br($a_message);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$a_message = addslashes($a_message);
		$a_name = addslashes($a_name);
		$a_email = addslashes($a_email);
		$a_icq = addslashes($a_icq);

	setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c - $d";
# Include upload_pic
	
$write_new="0";// Comment 0
include("upload_pic.inc");

	$sql = "insert into answer1 (a_id, a_qid, a_message, a_name, a_email, a_icq, a_ip, a_datetime, a_tell) values ('0','$q_id','$picture$a_message','$a_name','$a_email','$a_icq','$a_ip','$a_date','$a_tell')";

	$result = mysql_db_query($dbname,$sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	else	 
		{
			echo "<Font Size=3>บันทึกเรียบร้อยแล้ว <br>";
			echo "<a href=\"view.php?q_id=$q_id\">คลิ๊กที่นี่เพื่อดูกระทู้ของคุณ</a></Font>";
		}
?>