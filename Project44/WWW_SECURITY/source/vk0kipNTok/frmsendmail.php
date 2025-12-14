<?php
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Information Security Advisory Group (ISAG)");
curve_open();
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

// แบบฟอร์มเพื่อให้สต๊าฟห้อง ISAG ส่งประกาศข่าวสารไปหาสมาชิกที่มาสมัครรับข่าวสารไว้ 
// โดยส่งเพียงครั้งเดียว สามารถส่งไปหาสมาชิกทุกคนที่ได้เก็บ email address ไว้ใน database

$error = 0;
$PHP_SELF = $HTTP_SERVER_VARS["PHP_SELF"];

if ( $HTTP_POST_VARS["preview"] && ( !$HTTP_POST_VARS["submit"]) ) {        // ถ้ากดปุ่มตรวจสอบ (preview)
	$newsletter = trim( stripslashes($HTTP_POST_VARS["newsletter"]) );
	$subject = trim( stripslashes($HTTP_POST_VARS["subject"]) );
	echo "$newsletter<br>";
				if ($subject == "") {
					$error = 1;			         // มี error
					echo "You must enter title of mail<br>";
				}
				if ($newsletter == "") {
					$error = 1;
					echo "You must enter content of mail<br>";
				}
				if ($error == 0) {
					echo "You fill complete<br>";
				}

}               //  end if ( $HTTP_POST_VARS["preview"] && ( !$HTTP_POST_VARS["submit"]) ) 
	
	else if ( ($error == 0) && $HTTP_POST_VARS["submit"] ) {         // ถ้ากดปุ่มส่งจดหมาย  (submit)
					$newsletter = trim( stripslashes($HTTP_POST_VARS["newsletter"]) );
					$subject = trim( stripslashes($HTTP_POST_VARS["subject"]) ) ;

					if ($subject =="" || $newsletter == "") {
							echo "You fill uncomplete";
					}
					elseif ($subject != "" && $newsletter != "") {
						$sql = "SELECT email_addr FROM subscribers where confirm='Y'";		//  ดึง email address ของผู้รับเมล์จากฐานข้อมูล
												// ผู้สมัครรับ mailing list ต้องตอบยืนยันแล้วเท่านั้น เราถึงจะส่งข่าวสารไปให้
						$sql_result = mysql_query($sql);

						$sql2 = "SELECT email FROM accesslist";		//  ดึง email address ของสต๊าฟทุกคนจากฐานข้อมูล
						$sql2_result = mysql_query($sql2);
						
		    				$sender = "top<top_newcastle@hotmail.com>";		//  ผู้ส่ง

						// กำหนด header
						$headers = "From: $sender\n";
						$headers .= "Content-Type: text/html;  charset=windows-874\n";		//  กำหนดรูปแบบเมล์ให้เป็นแบบ html และอ่านภาษาไทยได้
						
						if ($HTTP_POST_VARS["to_staff"] == "checked"  && $HTTP_POST_VARS["to_other"] == "") {
							while ($arr2 = mysql_fetch_array($sql2_result)) {
								$email_addr = $arr2[0];
								//mail("$email_addr", "$subject", "$newsletter", "$headers");
								echo "email_addr = $email_addr<br>";
							}

							echo "ระบบทำการส่งจดหมายให้เรียบร้อยแล้ว";		
						}
						elseif ($HTTP_POST_VARS["to_staff"] == ""  && $HTTP_POST_VARS["to_other"] == "checked") {
							while ($arr = mysql_fetch_array($sql_result)) {
								$email_addr = $arr[0];
								mail("$email_addr", "$subject", "$newsletter", "$headers");
							}

							echo "ระบบทำการส่งจดหมายให้เรียบร้อยแล้ว";							
						}
						elseif ($HTTP_POST_VARS["to_staff"] == "checked"  && $HTTP_POST_VARS["to_other"] == "checked") {
							while ($arr2 = mysql_fetch_array($sql2_result)) {
								$email_addr = $arr2[0];
								//mail("$email_addr", "$subject", "$newsletter", "$headers");
								echo "email_addr = $email_addr<br>";
							}
							while ($arr = mysql_fetch_array($sql_result)) {
								$email_addr = $arr[0];
								mail("$email_addr", "$subject", "$newsletter", "$headers");
							}

							echo "ระบบทำการส่งจดหมายให้เรียบร้อยแล้ว";
						}
						elseif ($HTTP_POST_VARS["to_staff"] == ""  && $HTTP_POST_VARS["to_other"] == "") {
							echo "ยังไม่ได้เลือกว่าจะส่งถึงใคร<br>";
						}

					}	              //   end else
	
	}           // end else if ( ($error == 0) && $HTTP_POST_VARS["submit"] )

if ( !$HTTP_POST_VARS["submit"]) {		// ถ้ายังไม่ได้กดปุ่มส่งจดหมาย (submit)
?>
	
	<form action="<?php echo $PHP_SELF; ?>" method="post">
		<center><p><strong>หัวจดหมาย :</strong><br></center>
		<center><input type="text" name="subject" size=30 value="<?php echo $subject; ?>"></center>

		<center><p><strong>เนื้อความจดหมาย :</strong><br></center>   <!--  style="FONT-SIZE: 10pt"  ใช้กำหนดให้ตัวหนังสือใน textarea มีขนาด 10pt   -->
		<center><textarea name="newsletter"  style="font-family:MS Sans Serif;font-size:14px; background-color:#ffffff;"  cols=80 rows=10 wrap=virtual value=$newsletter><?php echo $newsletter; ?></textarea></center>

		<center><p><input  type="checkbox"  name="to_staff"  value="checked">ส่งให้สต๊าฟ</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input  type="checkbox"  name="to_other"  value="checked">ส่งให้คนภายนอก</input></center>

		<center><p><input type="submit" name="preview" value="ตรวจสอบ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="submit" value="ส่งจดหมาย"></center>
	</form>

<?php
}              // end if ( !$HTTP_POST_VARS["submit"])

curve_close();
empty_4();
?>
