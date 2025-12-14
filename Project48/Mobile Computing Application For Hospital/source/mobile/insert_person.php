<?
include("database.php");
require_once("check_data.php");
require_once("connect_db.php");
include("function.php");
require_once("headeradmin.php");
check_permit();
?>
<?
if(!filled_out($HTTP_POST_VARS))
{
	echo "<center><font face = \"MS Sans Serif\" color=\"#FF0000\" size=\"2\">เกิดความผิดพลาดในการป้อนรายละเอียด กรุณาตรวจอีกครั้ง</font></center>";
	header_admin("การป้อนข้อมูลเกิดความผิดพลาด");
	require_once("footer.php");
	exit;
}
		header_admin("เพิ่มบุคลากรใหม่");
if (1)
{ 
	if(empty($DoctorID)||empty($DoctorName)||empty($Address)||empty($CatID)||empty($Picture)||empty($MobilePhone)||empty($Phone)||empty($Email))
{
	echo "<br>";
	message_box("เเจ้งข้อผิดพลาด","คุณยังป้อนข้อมูลไม่ครบ","insertperson_form.php");
	echo "<br>";
	require_once("footer.php");
	exit;
}
if(insert_person($DoctorID,$DoctorName,$Address,$CatID,$Picture,$MobilePhone,$Phone,$Email))
	{
		echo "<br>";
		message_box("เเจ้งผลการทำงาน","เพิ่มบุคลากรชื่อ $DoctorName  ในฐานข้อมูลเสร็จเรียบร้อยแล้ว","modify_form.php");
		echo "<br>";
	}
		else
			echo " <center><font face = \"MS Sans Serif\" color=\"#FF0000\" size=\"2\">บุคลากรชื่อ '$DoctorName' ไม่สามารถเพิ่มในฐานข้อมูลได้</font></center><br><br>";
	}
	else
	echo "<br><br>";
	require_once("footer.php");
?>