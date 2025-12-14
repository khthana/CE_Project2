<?php
include "interface.inc.php"; 
include "outputlib.php"; 
include "db.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

// ให้คนทั่วไปมาสมัครสมาชิกเพื่อรับจดหมายแจ้งข่าวสาร  และคนที่สมัครแล้ว ก็จะได้รับ mail ถามเพื่อให้ยืนยันว่าจะสมัครจริงไหม

$PHP_SELF = $HTTP_SEVER_VARS["PHP_SELF"];

// generate เลขให้ผู้ใช้
$num_gen = time();

// กำหนดค่าวันที่ในรูปแบบ ปี-เดือน-วัน
$date_added = date("y-m-d");

// กำหนดค่าว่ายังไม่ตอบรับการสมัครเพื่อรับข่าวสาร
$confirm = 'N';

if ( ($HTTP_POST_VARS["op"] != "ds") || ($HTTP_POST_VARS["op"] == "ds" && 
	   $HTTP_POST_VARS["email_addr"] == "") ) {
	
	//แสดงแบบฟอร์มที่ใช้ในการลงทะเบียนแจ้งข่าว
	$form = "<form name=\"form\" method=post action=\"$PHP_SELF\">
					  <input type=hidden name=op value=ds>
					  <p><strong>กรุณาใส่ E-mail address ของท่าน :</strong><br>
				   	  <input type=text name=\"email_addr\" size=45><br>
		
					  <input type=radio name=\"action\" value=\"sub\" checked> ยอมรับ 
	
					  <input type=radio name=\"action\" value=\"unsub\"> ยกเลิก</p>
			
					  <p><input type=submit name=\"submit\" value=\"ยืนยัน\"></p>
				  </form>";

	echo $form;

} else if ( ($HTTP_POST_VARS["op"] == "ds") && ($HTTP_POST_VARS["action"] == "sub") && 				
				($HTTP_POST_VARS["email_addr"] != "") ) {
		
		// ตรวจสอบว่ามีการส่งค่ามาจากฟอร์มหรือไม่
		// และมีการเลือก Option ยอมรับ เข้ามาหรือปล่าว
		
		$email_addr = $HTTP_POST_VARS["email_addr"];
		if ( !ereg( "^.+@.+\..+$", $email_addr) ) {
			echo "<font color='red'>คุณกรอกอีเมล์แอดเดรสไม่ถูกต้อง</font><br>";
		}
		else {
			$check = "SELECT email_addr FROM subscribers WHERE email_addr = \"$email_addr\"";
		  
			$check_result = mysql_query($check); 
		
			$check_num = mysql_num_rows($check_result);

			if ($check_num == 0) {
	
				// ถ้าตัวแปร $check_num มีค่าเท่ากับ 0 แสดงว่าไม่พบระเบียน
				// ให้ทำการเพิ่มลงตาราง subscribers ด้วยคำสั่ง SQL
		
				$sql = "INSERT INTO subscribers (email_addr, num_gen, date_added, confirm)
		                VALUES ( \"$email_addr\", \"$num_gen\", \"$date_added\", \"$confirm\")";
		
				@mysql_query($sql);
		
				$text_block = "
				<p>ขอขอบคุณสำหรับการลงทะเบียน</p><br>
				ทางเราจะส่งอีเมล์ไปให้ท่าน  เพื่อให้ท่านยืนยันการลงทะเบียน";
		
				echo $text_block;

				$sender = "webmaster <top_newcastle@hotmail.com>";		//  ผู้ส่ง
				$subject = "โปรดยืนยันการสมัครรับเมล์แจ้งข่าวสาร";

				$body = "คุณต้องการที่จะสมัครสมาชิกรับ malling list  แจ้งข่าวสารจาก
						   <a href = 'http://isag02.ce.kmitl.ac.th/index.html'  target=_BLANK>Web ISAG</a>
						   หรือไม่กรุณาคลิกข้างล่างนี้เพื่อยืนยัน
		     			          <p><a href='http://isag33/top/sendmail/confirm.php?ng=".$num_gen."&v=1'  target=_BLANK >ต้องการสมัคร</a><br><br>

					       <a href='http://isag33/top/sendmail/confirm.php?ng=".$num_gen."&v=0'  target=_BLANK >ไม่ต้องการสมัคร</a><br>";
//	old				       <a href='http://isag33/top/sendmail/confirm.php?ng=".$num_gen."'  target=_BLANK >ต้องการสมัคร</a><br><br>
//	old				       <a href='http://isag33/top/sendmail/confirm.php?ng=".$num_gen."'  target=_BLANK >ไม่ต้องการสมัคร</a><br>";
		
				$headers = "From: $sender\n";
				$headers .= "Content-Type: text/html;  charset=windows-874\n";		//  กำหนดรูปแบบเมล์ให้เป็นแบบ html และอ่านภาษาไทยได้

				mail("$email_addr", "$subject", "$body", "$headers");

			} else {		//  ส่วน else ของ  if ($check_num == 0)
		
				// แต่ถ้าตัวแปร $check_num ไม่เท่ากับ 0
				// แสดงว่ามีข้อมูลนั้นอยู่แล้ว ทำการแจ้งให้ผู้ใช้ทราบ
		
				$text_block = "<p>คุณเคยสมัครแล้ว<br></p>";

				echo $text_block;

			}	
		
		}	 //  end else ของ if ( !ereg ("^.+@.+\..+$", $email_addr) )

} else if ( ($HTTP_POST_VARS["op"] == "ds") && ($HTTP_POST_VARS["action"] == "unsub") && 
				($HTTP_POST_VARS["email_addr"] != "") ) {

			// ตรวจสอบว่ามีการส่งค่ามาจากฟอร์มหรือไม่
			// และมีการเลือก Option ยกเลิก เข้ามาหรือไม่
	
			$email_addr = $HTTP_POST_VARS["email_addr"];

			$check = "SELECT email_addr FROM subscribers 
								WHERE email_addr = \"$email_addr\"";
		  
			$check_result = mysql_query($check);
		
			$check_num = mysql_num_rows($check_result);

			if ($check_num == 0) {
	
				// ถ้าตัวแปร $check_num เท่ากับ 0 ***** แสดงว่าไม่มีข้อมูลอยู่
				// ทำการแจ้งให้ผู้ใช้ทราบ
		
				$text_block = "<p>ไม่มี E-Mail อยู่ในรายการของระบบ</p> <p>คุณไม่สามารถทำการยกเลิกได้ ";

				echo $text_block;
			
			} else {
		
				// แต่ถ้าตัวแปร $check_num  ไม่เท่ากับ 0
				// ก็ให้ลบ E-Mail ของผู้ใช้รายนี้ออกไปจากระบบ
		
				$sql = "DELETE FROM subscribers 
							   WHERE email_addr = \"$email_addr\"";
		
				@mysql_query($sql);
		
				$text_block = "<p>ระบบได้ทำการยกเลิกเรียบร้อยแล้ว</p>";

				echo $text_block;
			}	
			
}

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close("</center>");
empty_4();
?>
