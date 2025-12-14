<?
		include("database.php");
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("check_data.php");
		check_permit();
		header_admin("ลบรายการหมวดหมู่ความเชี่ยวชาญ");

		if(!filled_out($HTTP_POST_VARS))
		{
			message_box("เเจ้งข้อผิดพลาด","เกิดความผิดพลาดในการป้อนรายละเอียด กรุณาตรวจอีกครั้ง","cate_form.php");
			header_admin("การป้อนข้อมูลเกิดความผิดพลาด");
			require_once("footer.php");
			exit;
		}

		if (1)
		{ 
			   if(delete_cat($CatID)){
				echo "<br>";
				message_box("เเจ้งการทำงาน","ลบหมวดหมู่ '$CatID' ในฐานข้อมูลเสร็จเรียบร้อยแล้ว","cate_form.php");
				echo "<br>";
			   }
			else{
				echo "<br>";
				message_box("เเจ้งข้อผิดพลาด","หมวดหมู่ '$CatID' ไม่สามารถลบในฐานข้อมูลได้","cate_form.php");
				echo "<br>";
		}
		}
		require_once("footer.php");
?>