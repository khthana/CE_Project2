<?
		include("function.php");
		require_once("check_data.php");
		require_once("headeradmin.php");
		require_once("connect_db.php");
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
			header_admin("ลบรายชื่อบุคลากร");
		if (1)
		{ 
		$con=connect_db("hospital");
		if(!$con)
			{
				echo "<br>";
				message_box("เเจ้งข้อผิดพลาด","ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง","javascript:history.back()");
				echo "<br>";
				require_once("footer.php");
			}
			if(empty($checkbox))
			{
				echo "<br>";
				message_box("เเจ้งข้อผิดพลาด","กรุณาเลือกรายชื่อบุคลากร","javascript:history.back()");
				echo "<br>";
				require_once("footer.php");
		}
		$i=0;
		while($i<count($checkbox))
		{
			$DoctorID = $checkbox[$i];
			$sql = "delete from tbldoctor where DoctorID='$DoctorID'";
			$result = mysql_query($sql);
			if(!$result)
			return "กรุณาตรวจคิวรี อีกครั้ง <br>";
				$i++;
		}
			if($result)
			{
				echo "<br>";
				message_box("เเจ้งผลการทำงาน","การลบรายชื่อบุคลากรเรียบร้อยแล้ว","javascript:history.back()");
				echo "<br>";
			}
		}	
			else
			echo "<br>";
			require_once("footer.php");
?>