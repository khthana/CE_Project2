<?php
session_start();

include("app_header.php");




if (isset($_SESSION["valid_user"])) { 
/********************ตรวจสอบ session ว่ามี user** แล้วจึงทำต่อ*******************/




	
	echo "<table width='580' border='0' cellspacing='10' cellpadding='0'>
	<tr><td align='center'>";
	
	//=============== ส่วนนี้จัดการเรื่อง remove subject and child node in xxx_link.xml =====================//
	
	$data = $_POST['datafromjs'];	
	$file = $_POST['creatfile'];
	
	if (!($fp = fopen($file, "w"))) { die("could not open XML file");}

	fwrite($fp, $data);
	fclose($fp);
	
	//=============== ส่วนนี้จัดการเรื่อง delete file xml =====================//
	
	$delfile = $_POST['unlinkfile'];
	
	if (!unlink($delfile))
  	{
 		 echo "Error deleting $delfile";
 	 }
	else
  	{
		echo '<p>&nbsp;</p>';
		echo "<p>Delete file complete !!!!</p>";
  	}

	//=============== ส่วนนี้จัดการเรื่อง delete รูปที่เป็นรูปประจำ XML document ที่ลบ ต้องลบรูปด้วย =====================//

	$picname = chop($delfile,".xml");
		
	//ทดสอบว่ามีรูปนามสกุล jpg หรือ gif อยู่ในโฟลเดอร์ images หรือไม่ ถ้ามีให้ลบด้วย
	$jpgpic = "images/".$picname.".jpg";
	$gifpic = "images/".$picname.".gif";
	$jpegpic = "images/".$picname.".jpeg";
	
	////////////////////////////////////
	function delPic($pic)
	{
		if (!unlink($pic))
  		{
 		 	echo "Error deleting $jpgpic";
 	 	}
		else
  		{
			echo "<p>Delete file picture complete !!!!</p>";
  		}
	}
	///////////////////////////////////
	
	if (file_exists($jpgpic))
	{
		echo "<p>delete picture name : $jpgpic</p>";
		delPic("$jpgpic");
	}
	else if (file_exists($gifpic))
	{
		echo "<p>delete picture name : $gifpic</p>";
		delPic("$gifpic");
	}
	else if(file_exists($jpegpic))
	{
		echo "<p>delete picture name : $jpegpic</p>";
		delPic("$jpegpic");
	}
	else {echo "<p>no picture file to delete</p>";}
	
	////////////////////////////////////////////////	
		
	echo "</td></tr></table>";




}
else ///////ไม่มี session จะไม่ทำงาน //////// 
{echo "<a href='app_index.php' target='_top'>คุณยังไม่ได้ login กรุณา login ก่อน</a>";}




echo "</body></html>";

?>

