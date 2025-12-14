<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");


	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	if ($q_name == "" or $q_topic == "" or $q_message=="")
		{
			echo ("<center><font color=\"red\">กรุณากรอก ชื่อ , หัวข้อ, ข้อความของคุณด้วยครับ</font></center> ");
			exit;
		}


	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		$q_name = htmlspecialchars($q_name);
		$q_email = htmlspecialchars($q_email);
		$q_icq = htmlspecialchars($q_icq);

	//# EMOTION ICON
		$q_message=str_replace (":D", "<img src=\"webboard/icon_biggrin.gif\">", $q_message);
		$q_message=str_replace (":)", "<img src=\"webboard/icon_smile.gif\">", $q_message);
		$q_message=str_replace (":(", "<img src=\"webboard/icon_sad.gif\">", $q_message);
		$q_message=str_replace (":o:", "<img src=\"webboard/icon_surprised.gif\">", $q_message);

		$q_message=str_replace (":shock:", "<img src=\"webboard/icon_eek.gif\">", $q_message);
		$q_message=str_replace (":~", "<img src=\"webboard/icon_confused.gif\">", $q_message);
		$q_message=str_replace ("8)", "<img src=\"webboard/icon_cool.gif\">", $q_message);
		$q_message=str_replace (":lol:", "<img src=\"webboard/icon_lol.gif\">", $q_message);

		$q_message=str_replace (":x", "<img src=\"webboard/icon_mad.gif\">", $q_message);
		$q_message=str_replace (":P", "<img src=\"webboard/icon_razz.gif\">", $q_message);
		$q_message=str_replace (":oops:", "<img src=\"webboard/icon_redface.gif\">", $q_message);
		$q_message=str_replace (":cry:", "<img src=\"webboard/icon_cry.gif\">", $q_message);

		$q_message=str_replace (":evil:", "<img src=\"webboard/icon_evil.gif\">", $q_message);
		$q_message=str_replace (":twisted:", "<img src=\"webboard/icon_twisted.gif\">", $q_message);
		$q_message=str_replace (":roll:", "<img src=\"webboard/icon_rolleyes.gif\">", $q_message);
		$q_message=str_replace (":wink:", "<img src=\"webboard/icon_wink.gif\">", $q_message);

		$q_message=str_replace (":!:", "<img src=\"webboard/icon_exclaim.gif\">", $q_message);
		$q_message=str_replace (":?:", "<img src=\"webboard/icon_question.gif\">", $q_message);
		$q_message=str_replace (":idea:", "<img src=\"webboard/icon_idea.gif\">", $q_message);
		$q_message=str_replace (":arrow:", "<img src=\"webboard/icon_arrow.gif\">", $q_message);
		//#q_message=eregi_replace ("\[img\]([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]])\[/img\]", "<img src=\"\\1://\\2\\3\">",q_message ) ;
		$q_message=eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$q_message);
		$q_message=eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$q_message); 
		
		

	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$q_message = nl2br($q_message);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$q_message = addslashes($q_message);
		$q_name = addslashes($q_name);
		$q_email = addslashes($q_email);
		$q_icq = addslashes($q_icq);

@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	

	$q_date = "$a $b $c เมื่อเวลา: $d";

@$q_ip=getenv ("REMOTE_ADDR"); 

	# Include upload_pic
	
$write_new="0";// Comment 0
include("upload_pic.inc");
	

	@$sql = "insert into question1 (q_id, q_topic, q_message, q_name, q_email, q_icq, q_ip, q_datetime, q_pic, q_tell) values  ('0','$q_topic','$picture$q_message','$q_name','$q_email','$q_icq','$q_ip','$q_date','$statuspic','$q_tell')";

	$result = mysql_db_query($dbname, $sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	else
		{
			echo "<font size=3>บันทึกข้อมูลเรียบร้อยแล้ว <br>";
			
			print "<meta http-equiv=\"refresh\" content=\"0;URL=list_addmin2.php?menu=20\">\n";
		}
						
?>