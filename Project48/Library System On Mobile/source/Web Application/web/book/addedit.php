<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	
@$sql_id = "select * from book where id='$id'";
	$db_query_id = mysql_db_query ($dbname, $sql_id);
	
			$result_id = mysql_fetch_array($db_query_id);
							@$detail_old = $result_id[detail];
							

	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		$name_book = htmlspecialchars($name_book);
		$writer = htmlspecialchars($writer);
		$company = htmlspecialchars($company);
		
		

	//# EMOTION ICON
		$detail=str_replace (":D", "<img src=\"webboard/icon_biggrin.gif\">", $detail);
		$detail=str_replace (":)", "<img src=\"webboard/icon_smile.gif\">", $detail);
		$detail=str_replace (":(", "<img src=\"webboard/icon_sad.gif\">", $detail);
		$detail=str_replace (":o:", "<img src=\"webboard/icon_surprised.gif\">", $detail);

		$detail=str_replace (":shock:", "<img src=\"webboard/icon_eek.gif\">", $detail);
		$detail=str_replace (":~", "<img src=\"webboard/icon_confused.gif\">", $detail);
		$detail=str_replace ("8)", "<img src=\"webboard/icon_cool.gif\">", $detail);
		$detail=str_replace (":lol:", "<img src=\"webboard/icon_lol.gif\">", $detail);

		$detail=str_replace (":x", "<img src=\"webboard/icon_mad.gif\">", $detail);
		$detail=str_replace (":P", "<img src=\"webboard/icon_razz.gif\">", $detail);
		$detail=str_replace (":oops:", "<img src=\"webboard/icon_redface.gif\">", $detail);
		$detail=str_replace (":cry:", "<img src=\"webboard/icon_cry.gif\">", $detail);

		$detail=str_replace (":evil:", "<img src=\"webboard/icon_evil.gif\">", $detail);
		$detail=str_replace (":twisted:", "<img src=\"webboard/icon_twisted.gif\">", $detail);
		$detail=str_replace (":roll:", "<img src=\"webboard/icon_rolleyes.gif\">", $detail);
		$detail=str_replace (":wink:", "<img src=\"webboard/icon_wink.gif\">", $detail);

		$detail=str_replace (":!:", "<img src=\"webboard/icon_exclaim.gif\">", $detail);
		$detail=str_replace (":?:", "<img src=\"webboard/icon_question.gif\">", $detail);
		$detail=str_replace (":idea:", "<img src=\"webboard/icon_idea.gif\">", $detail);
		$detail=str_replace (":arrow:", "<img src=\"webboard/icon_arrow.gif\">", $detail);
		//#detail=eregi_replace ("\[img\]([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]])\[/img\]", "<img src=\"\\1://\\2\\3\">",detail ) ;
		$detail=eregi_replace("([[:alnum:]]+)://([^[:space:]]*)([[:alnum:]#?/&=])","<a href=\"\\1://\\2\\3\" target=\"\\2\\3\">\\1://\\2\\3</a>",$detail);
		$detail=eregi_replace("([[:alnum:]]+)@([^[:space:]]*)([[:alnum:]])","<a href=mailto:\\1@\\2\\3>\\1@\\2\\3</a>",$detail); 
		
		

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

	

	@$datetime= "$a $b $c เมื่อเวลา: $d";

@$ip=getenv ("REMOTE_ADDR"); 

	# Include upload_pic
	
$write_new="0";// Comment 0
include("upload_pic.inc");
echo "<font size=3>ทำการแก้ไข้ข้อมูล</font> <br>";	
if($catalog!="")
{
			$sql_cat="update book set catalog='$catalog' where id='$id'";
			$result_cat = mysql_db_query($dbname, $sql_cat);
			echo "<font size=3>หมู่</font> <br>";
}
if(($unitOne!="")or($unitTwo!=="")or($unitThree!==""))
{
			$sql_code="update book set code='$unitOne$unitTwo$unitThree' where id='$id'";
			$result_code = mysql_db_query($dbname, $sql_code);
			echo "<font size=3>รหัส</font> <br>";
}
if($name_book!="")
{
			$sql_name="update book set name_book='$name_book' where id='$id'";
			$result_name = mysql_db_query($dbname, $sql_name);
			echo "<font size=3>ชื่อหนังสือ</font> <br>";
}
if($company!="")
{
			$sql_company="update book set company='$company' where id='$id'";
			$result_company = mysql_db_query($dbname, $sql_company);
			echo "<font size=3>สำนักพิมพ์</font> <br>";
}
if($writer!="")
{
			$sql_writer="update book set writer='$writer' where id='$id'";
			$result_writer = mysql_db_query($dbname, $sql_writer);
			echo "<font size=3>ชื่อผู้แต่ง</font> <br>";
}
if($year_print!="")
{
			$sql_year_print="update book set year_print='$year_print' where id='$id'";
			$result_year_print = mysql_db_query($dbname, $sql_year_print);
			echo "<font size=3>ปีที่พิมพ์</font> <br>";
}
if($isbn!="")
{
			$sql_isbn="update book set isbn='$isbn' where id='$id'";
			$result_isbn = mysql_db_query($dbname, $sql_isbn);
			echo "<font size=3>ISBN</font> <br>";
}
if(($priceOne!="")or($priceTwo!=="")or($priceThree!=="")or($priceFour!==""))
{
			$sql_price="update book set price='$priceOne$priceTwo$priceThree$priceFour' where id='$id'";
			$result_price= mysql_db_query($dbname, $sql_price);
}
if($detail!="")
{
			$sql_detail="update book set detail='$detail' where id='$id'";
			$result_detail= mysql_db_query($dbname, $sql_detail);
			echo "<font size=3>รายละเอียด</font> <br>";
}
if($name_borrow!="")
{
			$sql_name_borrow="update book set name_borrow='$name_borrow' where id='$id'";
			$result_name_borrow= mysql_db_query($dbname, $sql_name_borrow);
			echo "<font size=3>ชื่อผู้ยืม</font> <br>";
}
if(($day!="")or($mount!=="")or($year!==""))
{
			$sql_return_book="update book set return_book='$day$mount$year' where id='$id'";
			$result_return_book= mysql_db_query($dbname, $sql_return_book);
			echo "<font size=3>กำหนดวันส่งคืน</font> <br>";
}
if($picture!="")
{
			$sql_pic="update book set pic='$picture',filetype='$picture_type',filesize='$picture_size',filename='$picture_name' where id='$id'";
			$result_pic= mysql_db_query($dbname, $sql_pic);
			echo "<font size=3>กำหนดวันส่งคืน</font> <br>";
}
	//$sql = "update book set catalog='$catalog', code='$code', name_book='$name_book', company='$company', writer='$writer', year_print='$year_print', isbn='$isbn', //price='$price', detail='$picture$detail',name_borrow='$name_borrow',return_book='$return_book' where id='$id'"; 

	//$result = mysql_db_query($dbname, $sql);

	//if (!$result)
		//{ 
		//	echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
		//	exit;
		//}
	//else
		//{
			echo "<font size=3>แก้ไขข้อมูลเรียบร้อยแล้ว <br>";
			print "<meta http-equiv=\"refresh\" content=\"0;URL=view_addmin.php?id=$id\">\n";
		//}
						
?>