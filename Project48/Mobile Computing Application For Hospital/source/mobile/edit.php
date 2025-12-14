<?
		include("database.php");
		include("function.php");
		require_once("check_data.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		check_permit();
?>
<?
		if(!filled_out($HTTP_POST_VARS))
		{
			echo "<br>";
			message_box("เเจ้งข้อผิดพลาด","เกิดความผิดพลาดในการป้อนรายละเอียด กรุณาตรวจอีกครั้ง","javascript:history.back()");
			echo "<br>";
			header_admin("การป้อนข้อมูลเกิดความผิดพลาด");
			require_once("footer.php");
			exit;
		}
				header_admin("แก้ไขบุคลากร");

		if (1)
		{ 
			if(empty($OldDoctorID)||empty($DoctorID)||empty($DoctorName)||empty($Address)||empty($CatID)||empty($Picture)
			||empty($MobilePhone)||empty($Phone)||empty($Email))
		{
			echo "<br>";
			message_box("เเจ้งข้อผิดพลาด","คุณยังป้อนข้อมูลไม่ครบ","javascript:history.back()");
			echo "<br>";
			require_once("footer.php");
			exit;
		}

		if (edit_person($OldDoctorID,$DoctorID,$DoctorName,$Address,$CatID,$Picture,$MobilePhone,$Phone,$Email))
		{
				echo "<br>";
				message_box("เเจ้งผลการทำงาน","แก้ไขบุคลากรชื่อ $DoctorName  ในฐานข้อมูลเสร็จเรียบร้อยแล้ว","javascript:history.back()");
				echo "<br>";
			}
				else
					echo "<center> บุคลากรชื่อ '$DoctorName' ไม่สามารถแก้ไขในฐานข้อมูลได้</center>";
			}
			else
			echo "<br><br>";
			require_once("footer.php");
?>
