<?
include "interface.inc.php"; 
include "outputlib.php"; 
include "db.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

	$PHP_SELF=$HTTP_SERVER_VARS["PHP_SELF"];		//  ใช้เมื่อได้กำหนดให้ตัวแปรโกลบอลในไฟล์ php.ini เป็น off

	$check = "true";

if ($submit = $HTTP_POST_VARS["submit"] )			// กดปุ่ม submit
{			// กดปุ่ม submit
			//   ต้องใช้ trim() ก่อนแล้วค่อยใช้nl2br()  ถึงจะตัดช่องว่างที่หัวและท้ายข้อความของได้
			$name = nl2br(trim(htmlspecialchars(stripslashes($HTTP_POST_VARS["name"]))));		// ต้องใช้ trim() ก่อนแล้วค่อยใช้ nl2br()  ถึงจะตัดช่องว่างที่หัวและท้ายข้อความของได้
    		$email_addr = nl2br(trim(htmlspecialchars(stripslashes($HTTP_POST_VARS["email_addr"]))));
			$suggest = nl2br(trim(htmlspecialchars(stripslashes($HTTP_POST_VARS["suggest"]))));
			if ($name == "") {
				echo "<FONT COLOR=red>โปรดกรอกชื่อของคุณด้วย</FONT><br>";
				$check = "false";
			}			
			if ($email_addr == "") {
				echo "<FONT COLOR=red>ยังไม่ได้กรอกอีเมลล์</FONT><br>";
				$check = "false";
			}
			else if ( !ereg("^.+\@.+\..+$", $email_addr) ) {
				echo "<FONT COLOR=red>กรอกอีเมลล์ไม่ถูกต้อง</FONT><br>";
				$check = "false";
			}
			if ($suggest == "") {
				echo "<FONT COLOR=red>ยังไม่ได้กรอกข้อเสนอแนะ</FONT><br>";
				$check = "false";
			}			
			if ($check == "true") {
					$sql = "INSERT INTO guestbook (name, email_addr, suggest, date) 
								VALUES (\"$name\", \"$email_addr\", \"$suggest\", now())";
					mysql_query($sql) or die ("เอ็กซิคิวต์คำสั่ง INSERT ไม่ได้");
					echo "ข้อเสนอแนะได้ถูกเก็บไว้ในฐานข้อมูลเรียบร้อยแล้ว";
					echo "<h2><a href=\"view.php\">View Guestbook</a></h2>";			
			}	// end if ($check == "true")
}		
if ( ($HTTP_POST_VARS["submit"] == "") || ($check == "false") ) {
?>
		
		<form method="post"  action="<? echo $PHP_SELF; ?>" >
				<table>
						<tr><td colspan=2 id=w2><font size=3><B><CENTER>Sign Guestbook</CENTER></B></font></td></tr>
						<tr><td colspan=2>&nbsp;</td></tr>
						<tr><td>ชื่อ :</td>
								<td><input  type="text"  name="name"  size=30  value="<?php  echo "$name"; ?>" ></td>
						</tr>
						<tr><td>อีเมลล์ :</td>
								<td><input  type="text"  name="email_addr"  size=30  value="<?php  echo "$email_addr"; ?>" ></td>  
						</tr>
						<tr><td  valign="top">ข้อเสนอแนะ :</td>  
						        <td><textarea  name="suggest"  rows=5  cols=60><?php echo "$suggest"; ?></textarea></td>  
						</tr>
						<tr><td  colspan=2><CENTER><input  type="submit"  name="submit"  value="submit">
								<input  type="reset"  name="reset"  value="reset"></CENTER></td>  
						</tr>		
				</table>
		</form>
		<font size=3><b><a href="view.php">View Guestbook</a></b></font>
<?php	
}	// end if ( ($HTTP_POST_VARS["submit"] == "") || ($check == "false") ) 
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close("</center>");
empty_4();
?>
