<?
		include("database.php");
		require_once("function.php");
		require_once("check_data.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		check_permit();

if(!filled_out($HTTP_POST_VARS))
{
		echo "<br>";
		message_box("เเจ้งความผิดพลาด","เกิดความผิดพลาดในการป้อนรายละเอียด กรุณาตรวจอีกครั้ง","javascript:history.back()");
		echo "<br>";
		header_admin("การป้อนข้อมูลเกิดความผิดพลาด");
		require_once("footer.php");
		exit;
}
		header_admin("เเก้ไขหมวดหมู่ความเชี่ยวชาญ");
if (1)
{ 
if (edit_cat($CatID,$CatName))
	{
		echo "<br>";
		message_box("เเจ้งผลการทำงาน","แก้ไขหมวดหมู่  $CatName  ในฐานข้อมูลเสร็จเรียบร้อยแล้ว","cate_form.php");
		echo "<br>";
	}
		else
		{
			echo "<br>";
			message_box("เเจ้งความผิดพลาด"," หนังสือชื่อ   $CatName   ไม่สามารถแก้ไขในฐานข้อมูลได้","javascript:history.back()");
			echo "<br>";
		}
}
	else
	echo "<br>";
	require_once("footer.php");
?>