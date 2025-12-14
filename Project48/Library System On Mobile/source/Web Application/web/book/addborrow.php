<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

$code_new=$code;
$catalog_new=$catalog;



	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	


	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		@$name_book = htmlspecialchars($name_book);
		@$writer = htmlspecialchars($writer);
		@$company = htmlspecialchars($company);
		
		

	//# EMOTION ICON
		@$detail=str_replace (":D", "<img src=\"webboard/icon_biggrin.gif\">", $detail);
		@$detail=str_replace (":)", "<img src=\"webboard/icon_smile.gif\">", $detail);
		@$detail=str_replace (":(", "<img src=\"webboard/icon_sad.gif\">", $detail);
		@$detail=str_replace (":o:", "<img src=\"webboard/icon_surprised.gif\">", $detail);

		@$detail=str_replace (":shock:", "<img src=\"webboard/icon_eek.gif\">", $detail);
		@$detail=str_replace (":~", "<img src=\"webboard/icon_confused.gif\">", $detail);
		@$detail=str_replace ("8)", "<img src=\"webboard/icon_cool.gif\">", $detail);
		@$detail=str_replace (":lol:", "<img src=\"webboard/icon_lol.gif\">", $detail);

		@$detail=str_replace (":x", "<img src=\"webboard/icon_mad.gif\">", $detail);
		@$detail=str_replace (":P", "<img src=\"webboard/icon_razz.gif\">", $detail);
		@$detail=str_replace (":oops:", "<img src=\"webboard/icon_redface.gif\">", $detail);
		@$detail=str_replace (":cry:", "<img src=\"webboard/icon_cry.gif\">", $detail);

		@$detail=str_replace (":evil:", "<img src=\"webboard/icon_evil.gif\">", $detail);
		@$detail=str_replace (":twisted:", "<img src=\"webboard/icon_twisted.gif\">", $detail);
		@$detail=str_replace (":roll:", "<img src=\"webboard/icon_rolleyes.gif\">", $detail);
		@$detail=str_replace (":wink:", "<img src=\"webboard/icon_wink.gif\">", $detail);

		@$detail=str_replace (":!:", "<img src=\"webboard/icon_exclaim.gif\">", $detail);
		@$detail=str_replace (":?:", "<img src=\"webboard/icon_question.gif\">", $detail);
		@$detail=str_replace (":idea:", "<img src=\"webboard/icon_idea.gif\">", $detail);
		@$detail=str_replace (":arrow:", "<img src=\"webboard/icon_arrow.gif\">", $detail);
		//#detail=eregi_replace ("\[img\]([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]])\[/img\]", "<img src=\"\\1://\\2\\3\">",detail ) ;
		@$detail=eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$detail);
		@$detail=eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$detail); 
		
		

	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$detail = nl2br($detail);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$detail = addslashes($detail);
		$name_book= addslashes($name_book);
		$writer = addslashes($writer);
		$company = addslashes($company);

@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	

	$datetime= "$a $b $c เมื่อเวลา: $d";

@$ip=getenv ("REMOTE_ADDR"); 

	# Include upload_pic
	
$write_new="0";// Comment 0
include("upload_pic.inc");
	

	@$sql = "update book  set name_borrow = '$name_borrow',return_book='$day $mount $year',total_borrow =total_borrow+1 where code='$code'&&catalog='$catalog'";

	$result = mysql_db_query($dbname, $sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	
else{
print <<< EOT
<TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ได้ทำการบันทึกข้อมูลเรียบร้อยแล้ว .............</b> </center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

EOT;
			//print "<meta http-equiv=\"refresh\" content=\"0;URL=list_addmin.php\">\n";
}		
						
?>