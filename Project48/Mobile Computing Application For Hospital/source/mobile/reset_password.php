<?
include("function.php");
require_once("connect_db.php");
	if($Password1!=$Password2)
		message_box("เเจ้งข้อผิดพลาด","ไม่สามารถเปลี่ยนรหัสผ่านได้รหัสผ่าน ทั้ง 2 ไม่ตรงกัน","forgetpassword_form.php");
	else if(strlen($Password1)<6 || strlen($Password1)>16)
		message_box("เเจ้งข้อผิดพลาด","รหัสผ่านไม่มีความยาวอยู่ในช่วง 6 ถึง 16","forgetpassword_form.php");
	else
	{
		if(!($conn=connect_db($databasename)))
			return false;
			$sql="update $tablename set PASSWORD = '$Password1' where USER_NAME = '$user_name'" ;
			$result = mysql_query($sql);
			if(!$result)
				message_box("เเจ้งข้อผิดพลาด","ไม่สามารถเปลี่ยนรหัสผ่านได้","forgetpassword_form.php");
			else
				message_box("เเจ้งผลการทำงาน","การเปลี่ยนรหัสผ่านเสร็จเรียบร้อยแล้ว","index.php");
	}
?>