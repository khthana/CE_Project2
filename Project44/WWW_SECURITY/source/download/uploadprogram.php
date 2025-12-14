<?php 
include "interface.inc.php"; 
include "accesscontrol.php";  
include "outputlib.php";
include "logfile.inc.php";  
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();

$uid=$HTTP_SESSION_VARS["uid"];

$PHP_SELF = $HTTP_SERVER_VARS["PHP_SELF"];
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
<html>
<head><title>upload program</title></head>
<body>
<center><h3>UPLOAD PROGRAM</h3></center>
<?

function randomString($len) {		//  generate random string
   srand(date("s")); 
   $possible="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"; 
   $str=""; 
   while(strlen($str)<$len) { 
      $str.=substr($possible,(rand()%(strlen($possible))),1); 
   } 
   return $str;
}  

$pass = true;			//  ตัวแปรที่ใช้เช็คว่าผู้ใช้กรอกแบบฟอร์มถูกต้องไหม  ถ้าไม่ถูกก็จะให้แก้จนกว่าจะถูกถึงจะ upload ได้


//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["upload"]) {				//  มีการกดปุ่ม upload
		$name = htmlspecialchars( trim( $HTTP_POST_VARS["name"] ) );
		$subject = htmlspecialchars( trim( $HTTP_POST_VARS["subject"] ) );
		$detail = htmlspecialchars( trim( $HTTP_POST_VARS["detail"] ) );
		$uploadedFile = $HTTP_POST_FILES["uploadedFile"]["tmp_name"];
		$uploadedFile_name = $HTTP_POST_FILES["uploadedFile"]["name"];
		$uploadedFile_size = $HTTP_POST_FILES["uploadedFile"]["size"];
		$uploadedFile_type = $HTTP_POST_FILES["uploadedFile"]["type"];
		$flag = $HTTP_POST_VARS["flag"];
		if ( !$name ) {
			$pass = false;
			echo "<font color=\"red\">คุณไม่ได้กรอกชื่อโปรแกรม</font><br>";
		}

		if ( !$subject ) { 
			$pass = false;
			echo "<font color=\"red\">คุณยังไม่ได้เลือกหมวดหมู่ของโปรแกรม โปรดคลิกเลือกจากช่องหมวดหมู่ของโปรแกรม</font><br>";
		}
		if ( !$detail ) {
			$pass = false;
			echo "<font color=\"red\">คุณไม่ได้กรอกรายละเอียด</font><br>";
		}

		if ($uploadedFile_name=="") {
			$pass = false;
			echo "<font color=\"red\">คุณไม่ได้กรอกที่อยู่ของไฟล์</font><br>";
		}

		if ($uploadedFile_name != "none" && $uploadedFile_size == 0 ) {  // กรอกที่อยู่ของไฟล์มาแต่ว่าไม่มีไฟล์นั้นจริง อาจกรอกที่อยู่ผิดก็ได้
			$foundfile = false;			// ไม่พบไฟล์
			$pass = false;
			echo "<font color=\"red\">ไม่พบไฟล์ที่คุณได้กรอกมา</font><br>";
		}

		if ( !$flag ) {
			$pass = false;
			echo "<font color=\"red\">คุณยังไม่ได้คลิกเลือกผู้ที่สามารถดาวน์โหลดไฟล์นี้ได้</font><br>";
		}

}   // end if ($HTTP_POST_VARS["upload"])


//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$pass2 = true;
if ($HTTP_POST_VARS["add_subj"]) {   // ถ้ากดปุ่ม add subject
		$new_subj = $HTTP_POST_VARS["new_subj"];
		if ( !$new_subj ) {
				$pass2 = false;
				echo "<font color=\"red\">คุณยังไม่ได้กรอกชื่อหมวดหมู่ที่ต้องการสร้างเพิ่ม</font><br>";
		}

}   // end if ($HTTP_POST_VARS["add_subj"])


//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ( $HTTP_POST_VARS["upload"] && $pass == true) {  // กดปุ่ม upload โดยที่กรอกแบบฟอร์มถูกต้องแล้ว
		$gen_string = randomString(30);

		$surname = substr($uploadedFile_name, -4, 4);	// เก็บนามสกุลของไฟล์ เช่น  .pdf
		$filename = $gen_string . $surname;					// สร้างชื่อไฟล์โดยเอาสตริงที่ generate ขึ้นมา มาต่อเข้ากับนามสกุลของไฟล์
		echo "This is filename : $filename<br>";
		echo "Size : $uploadedFile_size  bytes<br>";
		echo "Type : $uploadedFile_type <br>";
		echo "<hr>";

		$path1 = "../file/filedownload/gteiopojpmr";   // directory ที่ใช้เก็บไฟล์ที่ upload โดยให้คนทั่วไป download ได้
		$path2 = "../file/filedownload/lwepfdeiowj";	 // directory ที่ใช้เก็บไฟล์ที่ upload โดยให้เฉพาะสต๊าฟ download ได้
		
		if ($flag == 'G') {
				$path = $path1;
		} 
		elseif ($flag == 'L' ){
				$path = $path2;
		}
		
		if ( copy($uploadedFile, "$path/$filename") ) {
			print "$filename has been copy to $path/$filename<br>";

/*		else {
			print "Error ... can't upload<br>";
		}
		unlink($uploadedFile);
*/
			$query = "select subj_id from program_subject where subj_name = '$subject'";

			$data_query = mysql_query($query) or die ("ไม่สามารถเอ็กซิคิวต์คำสั่ง select ได้");

			$arr = mysql_fetch_array($data_query);			//  เอาข้อมูลที่ query มาใส่ array

			$subj_id = $arr[subj_id];
				      //  ตอนนี้ใช้ $uid ซึ่งเป็น username ของสต๊าฟที่ล็อกอินเข้ามา ซึ่งจะเก็บในฟิลด์ user_add ของตาราง download_program

						// ถ้า user เป็น G คือให้ผู้ใช้ทั่วไปดาวน์โหลดได้   ถ้าเป็น L คือ ให้เฉพาะสต๊าฟเท่านั้น
			$query2 = "insert into download_program (name, subj_id, detail, filename, size, user_add, date_add, user)
						values ( \"$name\",  \"$subj_id\", \"$detail\", \"$filename\", \"$uploadedFile_size\", \"$uid\", now(), \"$flag\" )"; 
									
			$data_query2 = mysql_query($query2) or die ("เอ็กซิคิวต์คำสั่ง INSERT ไม่ได้");

			if ($data_query2) 
					echo "<center><h3>Upload เสร็จเรียบร้อย</h3></center><br>";
		}
		else {
				print "Error ... can't upload<br>";
		}

		unlink($uploadedFile);

}      //  end if ( $HTTP_POST_VARS["upload"] && $pass == true)


//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (!$HTTP_POST_VARS["upload"] || ($HTTP_POST_VARS["upload"] && $pass == false) ) {    // ยังไม่กดปุ่ม upload หรือกดแล้วแต่ว่ากรอกแบบฟอร์มไม่ถูกต้อง

?>
		<table  border=1  width=100%  height=300  cellpadding=5  cellspacing=0>
			<form  method="post"  enctype="multipart/form-data"  action="uploadprogram.php">
				<tr>  <td>
						ชื่อ : <input  type="text"  name="name" value="<? print $name; ?>"><br>
        	  				รายละเอียด : <br>
						<textarea  rows=5  cols=40  name="detail"><? print $detail; ?></textarea><br>
						ไฟล์ : <input  type="file"  name="uploadedFile"><br>
						ผู้ที่สามารถดาวน์โหลดได้ : <br>
						<input  type="radio"  name="flag"  value="G"  <? if ($flag == "G") { echo "checked"; } ?>>ผู้ใช้ทั่วไป
						<input  type="radio"  name="flag"  value="L"  <? if ($flag == "L") { echo "checked"; } ?>>สต๊าฟเท่านั้น<br>
						<input  type="submit"  name="upload"  value="upload"><br>
						<hr>						
						เพิ่มหมวด  (ถ้าไม่มีหมวดที่เหมาะสมในด้านขวา)<br>
						<input  type="text"  name="new_subj"  value="<? echo $new_subj; ?>"><br>
						<input  type="submit"  name="add_subj"  value="add subject"><br>
				<?

						$repeat = false;
						if ($HTTP_POST_VARS["add_subj"] && $pass2 == true) {		// ถ้ากดปุ่ม add subject โดยเพิ่มหมวดหมู่เข้ามา และได้เลือกประเภทของหมวดหมู่แล้ว
								$query3 = "select subj_name from program_subject";    // select ชื่อหมวดหมู่เก่า
								$data_query3 = mysql_query($query3) or die ("เอ็กซิคิวต์คำสั่ง select ไม่ได้");
								while ( $arr3 = mysql_fetch_array($data_query3) ) {
										$old_subj = $arr3[subj_name];
										if ($old_subj == $new_subj) {
												$repeat = true;			// หมวดหมู่ที่ผู้ใช้ต้องการเพิ่มนั้นซ้ำกับหมวดหมู่ที่มีอยู่
										}
								}
								if ($repeat == true) {
										echo "<font color=\"red\">หมวดหมู่ที่คุณกรอกซ้ำกับหมวดหมู่เดิมที่มีอยู่<br>  โปรดสังเกตุหมวดหมู่ที่มีอยู่ทางด้านขวามือ</font>";
								}
								else {		// $repeat มีค่าเป็น false
										$query4 = "insert into program_subject (subj_name) values (\"$new_subj\")";
										mysql_query($query4) or die("เอ็กซิคิวต์คำสั่ง insert ไม่ได้");
								}
						}   // end if ( $add_subj && $pass2 == true )
				?>
						</td>

    					<td  align="right"  valign="top">
				<?
							$query5 = "select subj_name from program_subject";		
							$data_query5 = mysql_query($query5) or die("เอ็กซิคิวต์คำสั่ง select ไม่ได้");
				
				?>
							<h3>หมวดหมู่ของโปรแกรม</h3>
							<select  name="subject"  size=10>
										<? 
											while($arr5 = mysql_fetch_array($data_query5) ) {
										?>
														<option  value="<? echo $arr5[subj_name]; ?>"  <? if ($subject==$arr5[subj_name]) { echo "selected"; } ?> >
															<? echo $arr5[subj_name];
											 }

										?>
							</select>

						</td>  
				</tr>

			</form>
		</table>
<? 
}		// end if (!$HTTP_POST_VARS["upload"] || ($HTTP_POST_VARS["upload"] && $pass == false) )

curve_close();
staffmenu_5();
?>

</body>
</html>
