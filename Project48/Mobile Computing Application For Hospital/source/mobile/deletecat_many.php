<?
		include("database.php");
		include("function.php");
		require_once("check_data.php");
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
			header_admin("ลบรายการหมวดหมู่");
		if (1)
		{ 
		require_once("connect_db.php");
		$con=connect_db("hospital");
		if(!$con)
			{
				echo "<br>";
				message_box("เเจ้งข้อผิดพลาด","ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง","javascript:history.back()");
				echo "<br>";
				require_once("footer.php");
				exit;
			}
			if(empty($checkbox))
			{
				echo "<br>";
				message_box("เเจ้งข้อผิดพลาด","กรุณาเลือกหมวดหมู่ที่ต้องการลบ","javascript:history.back()");
				echo "<br>";
				require_once("footer.php");
				exit;
		}
		$i=0;
		while($i<count($checkbox))
		{
			$CatID = $checkbox[$i];
			$sql = "delete from categories where CatID='$CatID'";
			$result = mysql_query($sql);
			if(!$result)
			return "กรุณาตรวจคิวรี อีกครั้ง <br>";
				$i++;
		}
			if($result)
			{
				echo "<br>";
				message_box("เเจ้งผลการทำงาน","การลบรายการหมวดหมู่เรียบร้อยแล้ว","javascript:history.back()");
				echo "<br>";
			}
		}	
			else
			echo "<br>";
			require_once("footer.php");
?>