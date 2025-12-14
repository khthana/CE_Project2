<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	
	if(isset($Session[@login_name]))
	@$login_name=$Session[login_name];	
			
							

	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		@$name_book = htmlspecialchars($name_book);
		@$writer = htmlspecialchars($writer);
		@$company = htmlspecialchars($company);
		
		

	

	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		@$address = nl2br($address);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		
		$name= addslashes($name);
		$surname = addslashes($surname);
		

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
echo "<font size=3>ทำการแก้ไข้ข้อมูล</font> <br>";	
if($name!="")
{
			$sql_name="update member set name='$name' where login_name='$login_name'";
			$result_name = mysql_db_query($dbname, $sql_name);
			echo "<font size=3>ชื่อ</font> <br>";
}
if($surname!="")
{
			$sql_surname="update member set surname='$surname' where login_name='$login_name'";
			$result_surname = mysql_db_query($dbname, $sql_surname);
			echo "<font size=3>นามสกุล</font> <br>";
}
if($sex!="")
{
			$sql_sex="update member set sex='$sex' where login_name='$login_name'";
			$result_sex = mysql_db_query($dbname, $sql_sex);
			echo "<font size=3>เพศ</font> <br>";
}
if($age!="")
{
			$sql_age="update member set age='$age' where login_name='$login_name'";
			$result_age = mysql_db_query($dbname, $sql_age);
			echo "<font size=3>อายุ</font> <br>";
}
if($address!="")
{
			$sql_address="update member set address='$address' where login_name='$login_name'";
			$result_address = mysql_db_query($dbname, $sql_address);
			echo "<font size=3>ที่อยู่</font> <br>";
}
if($tell!="")
{
			$sql_tell="update member set tell='$tell' where login_name='$login_name'";
			$result_tell = mysql_db_query($dbname, $sql_tell);
			echo "<font size=3>เบอร์โทรศัพท์</font> <br>";
}
if($login_name2!="")
{
			$sql_login_name="update member set login_name='$login_name2' where login_name='$login_name'";
			$result_login_name = mysql_db_query($dbname, $sql_login_name);
			echo "<font size=3>user</font> <br>";
}
if($login_password!="")
{
			$sql_login_password="update member set login_password='$login_password' where login_name='$login_name'";
			$result_login_password= mysql_db_query($dbname, $sql_login_password);
			echo "<font size=3>password</font> <br>";
}
if($email!="")
{
			$sql_email="update member set email='$email'  where login_name='$login_name'";
			$result_email= mysql_db_query($dbname, $sql_email);
			echo "<font size=3>email</font> <br>";
}
if($picture!="")
{
			$sql_picture="update member set pic ='$picture',filetype='$picture_type',filesize='$picture_size',filename='$picture_name' where login_name='$login_name'";
			$result_picture= mysql_db_query($dbname, $sql_picture);
			echo "<font size=3>รูปประกอบ</font> <br>";
}

	//$sql = "update member set catalog='$catalog', code='$code', name_book='$name_book', company='$company', writer='$writer', year_print='$year_print', isbn='$isbn', //price='$price', address='$picture$address',name_borrow='$name_borrow',return_book='$return_book' where id='$id'"; 

	//$result = mysql_db_query($dbname, $sql);

	//if (!$result)
		//{ 
		//	echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
		//	exit;
		//}
	//else
		//{
			echo "<font size=3>แก้ไขข้อมูลเรียบร้อยแล้ว <br>";
			print "<meta http-equiv=\"refresh\" content=\"0;URL=edit_complet.php?\">\n";
		//}
						
?>