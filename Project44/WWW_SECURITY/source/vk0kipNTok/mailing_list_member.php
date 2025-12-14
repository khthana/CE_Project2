<?
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Information Security Advisory Group (ISAG)");
curve_open();
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

$PHP_SELF = $HTTP_SERVER_VARS["PHP_SELF"];	//   ใช้เมื่อกำหนดให้ตัวแปร register_global ในไฟล์ php.ini ให้เป็น off

if ($HTTP_POST_VARS["submit"] == "delete email") {			//  มีการกดปุ่ม delete email
		$array = $HTTP_POST_VARS["array"];
		if (count($array)==0)		//  เช็คว่าได้ทำการ check อีเมล์ที่จะลบหรือไม่
			echo "<br><center><font  color=red>กรุณาเลือก email address ที่ต้องการจะลบ</font></center><br> ";
		else //ถ้ามีการเช็ค
		{	
			foreach($array as $key => $val) {
				$sql2 = "DELETE  FROM  subscribers  WHERE  id='$val'";
				mysql_query($sql2) or die("ไม่สามารถเอ็กซิคิวต์คำสั่ง DELETE ได้");
			}

			echo "ลบ email address เสร็จเรียบร้อยแล้ว<br>";
?>			<form  method=post  action="<?  echo $PHP_SELF;  ?>" >
				<input  type="submit"  name="submit"  value="ดู email ที่เหลืออยู่"></input>
			</form>
<?
		}	// end else  ของ if (count($array)==0)

}	//  end if ($HTTP_POST_VARS["submit"] == "delete email")

if ( ($HTTP_POST_VARS["submit"] == "") || ($HTTP_POST_VARS["submit"] == "ดู email ที่เหลืออยู่") ) {
	$sql = "SELECT id, email_addr, date_added, confirm FROM subscribers";
	$sql_result = mysql_query($sql) or die ("ไม่สามารถเอ็กซิคิวต์คำสั่ง SELECT ได้");
	$num_row = mysql_num_rows($sql_result);

	if ($num_row != 0) { 
?>		<form  method=post  action="<?echo $PHP_SELF;  ?>" >
			<table  border=0  cellpadding=1  cellspacing=1  width=400  height=100  align=center>
				<tr> <td  id=table3  colspan=3  align=center>ผู้ที่สมัคร Mailing List</td> </tr>
				<tr  id=table1  align=center> <td><b>Email Address</b></td>
					<td><b>วันที่สมัคร</b></td>
					<td><b>ยืนยันว่าสมัคร</b></td>
				</tr>
<?				while ($arr = mysql_fetch_array($sql_result)) {
					$id = $arr["id"];
					$email_addr = $arr["email_addr"];
					$date_added = $arr["date_added"];
					$confirm = $arr["confirm"];
?>			
					<tr  id=table1> <td><input  type="checkbox"  name="array[]"  value="<? echo "$id"; ?>">
							<?  echo "$email_addr";  ?>
						</td>
						<td  align=center><?  echo "$date_added";  ?></td>
						<td  align=center><?  echo "$confirm";  ?></td>
					</tr>

<?
				}    //  end while loop
?>
				<br><tr> <td  colspan=3><br><center><input  type="submit"  name="submit"  value="delete email"></input></center></td> </tr>
			</table>
		</form>
<?
	}	//  end if ($num_row != 0)


}      //  end if ( ($HTTP_POST_VARS["submit"] != "delete email") || ($HTTP_POST_VARS["ดู email ที่เหลืออยู่"]) )

curve_close();
empty_4();
?>