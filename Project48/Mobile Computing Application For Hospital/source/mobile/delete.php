<?
		include("database.php");
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("check_data.php");
		check_permit();
		header_admin("ลบรายการบุคลากร");
?>

<?

		if(!filled_out($HTTP_POST_VARS))
		{
			echo "<br>";
			message_box("เเจ้งข้อผิดพลาด","เกิดความผิดพลาดในการป้อนรายละเอียด กรุณาตรวจอีกครั้ง","javascript:history.back()");
			echo "<br>";
			header_html("การป้อนข้อมูลเกิดความผิดพลาด");
			require_once("footer.php");
			exit;
		}

		if (1)
		{ 
			   if(delete_person($DoctorID))
			{
				echo "<br>";
				message_box("เเจ้งการทำงาน","ลบบุคลากร ชื่อ $DoctorName  ในฐานข้อมูลเสร็จเรียบร้อยแล้ว","modify_form.php");
				echo "<br>";
			}
			else
			{
				echo "<br>";
				message_box("เเจ้งข้อผิดพลาด","บุคลากรชื่อ $DoctorName  ไม่สามารถลบในฐานข้อมูลได้","javascript:history.back()");
				echo "<br>";
			}
		}
		else 
		echo "<br><br>"; 
		require_once("footer.php");
?>