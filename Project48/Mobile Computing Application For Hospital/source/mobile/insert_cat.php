<?
include("function.php");
include("database.php");
require_once("check_data.php");
require_once("connect_db.php");
require_once("function.php");
require_once("headeradmin.php");
check_permit();

if(!filled_out($HTTP_POST_VARS))
{
	message_box("เเจ้งข้อผิดพลาด","เกิดความผิดพลาดในการป้อนรายละเอียด<br> กรุณาตรวจอีกครั้ง","insertcat_form.php");
	header_admin("การป้อนข้อมูลเกิดความผิดพลาด");
	require_once("footer.php");
	exit;
}
		header_admin("เพิ่มหมวดหมู่ความเชี่ยวชาญ");

if (1)
{ 

if(insert_cat($CatName)){
			echo "<br>";
			message_box("เเจ้งข้อผิดพลาด","เพิ่มหมวดหมู่ชื่อ  '$CatName'  ในฐานข้อมูลเสร็จเรียบร้อยแล้ว","cate_form.php");
			echo "<br>";
}
		else
			message_box("เเจ้งข้อผิดพลาด","หมวดหมู่ชื่อ '$CatName'  ไม่สามารถเพิ่มในฐานข้อมูลได","cate_form.php");
	}
	else
			message_box("เเจ้งข้อผิดพลาด","คุณไม่มีสิทธิเข้ามาในส่วนนี้","cate_form.php");
			require_once("footer.php");
?>