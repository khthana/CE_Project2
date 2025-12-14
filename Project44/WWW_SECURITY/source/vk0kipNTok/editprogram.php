<?
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Information Security Advisory Group (ISAG)");
curve_open();
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$PHP_SELF=$HTTP_SERVER_VARS["PHP_SELF"];		//  ใช้เมื่อได้กำหนดให้ตัวแปรโกลบอลในไฟล์ php.ini เป็น off

$group = $HTTP_GET_VARS["group"];

function randomString($len) {		//  generate random string
   srand(date("s"));
   $possible="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"; 
   $str="";
   while(strlen($str)<$len) { 
      $str.=substr($possible,(rand()%(strlen($possible))),1); 
   } 
   return $str;
}  

?>
<table  border=0  cellpadding=1  cellspacing=1  width=100%>
		<tr>
<?
//*********************************************************

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"] == "edit subject") {			//  มีการกดปุ่ม edit subject
		$array2 = $HTTP_POST_VARS["array2"];
		if (count($array2)!=1)  //เช็คว่าได้ทำการ check subject ที่จะเปลี่ยน 1 ช่องหรือไม่
			echo "<center><font size=3><b>เลือกหมวดหมู่ที่ต้องการจะเปลี่ยนชื่อ 1 หมวดหมู่</b></font></center><br> ";
		else //ถ้ามีการเช็ค 1 ช่อง
		{
			foreach($array2 as $key => $val) {
					$query9 = "select subj_id, subj_name from program_subject where subj_id = '$val'";
					$data_query9 = mysql_query($query9) or die("select ชื่อหมวดหมู่เพื่อจะ update ไม่ได้");
					$arr9 = mysql_fetch_array($data_query9);
					$subj_id = $arr9[subj_id];
					$subj_name = $arr9[subj_name];
?>
<td>
					<center><h3>พิมพ์ชื่อกลุ่มใหม่ที่ต้องการแก้ไข</h3><center>
					<form  method="post"  action="<? echo $PHP_SELF; ?>">
							<input  type="hidden"  name="subj_id"  value="<? echo $subj_id; ?>">	
							<input  type="text"  name="subj_name"  value="<? echo $subj_name; ?>"  size="40"><br><br>
							<input  type="submit"  name="submit"  value="update subject">
					</form>
</td>
<?
			}  // end foreach($array2 as $key => $val)
		}
}   //end if ($HTTP_POST_VARS["submit"] == "edit subject")

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"] == "delete subject") {			//  มีการกดปุ่ม delete subject
?>
<td>
<?
		$array2 = $HTTP_POST_VARS["array2"];
		if (count($array2)==0)  //เช็คว่าได้ทำการ check หมวดหมู่ที่จะลบหรือไม่
			echo "<br><center><h3>กรุณาเลือกหมวดหมู่ที่ต้องการจะลบ</h3></center><br> ";
		else //ถ้ามีการเช็ค
		{	
			foreach($array2 as $key => $val) {
				$query14 = "select name from download_program where subj_id='$val'";
				$data_query14 = mysql_query($query14) or die("ไม่สามารถแสดงชื่อโปรแกรมในหมวดหมู่ที่จะลบได้");
				if ($data_query14  and  mysql_num_rows($data_query14) != 0) {
						echo "<font size=4>ในหมวดหมู่ที่คุณจะลบนี้มีโปรแกรมอยู่ดังนี้  โปรแกรมเหล่านี้จะถูกลบไปด้วย</font><p>";
						while ($arr14 = mysql_fetch_array($data_query14)) {
								$name = $arr14[name];
								echo "<b>$name</b><br>";
						}
						echo "<br>โปรดคลิกเพื่อยืนยันว่ายังต้องการที่จะลบหมวดหมู่นี้หรือไม่<p>";
?>
				<form  method="post"  action="<? echo $PHP_SELF; ?>">
						<input  type="hidden"  name="subj_id"  value="<? echo "$val"; ?>">
						<input  type="radio"  name="delete"  value="Y">ต้องการลบ
						<input  type="radio"  name="delete"  value="N">ไม่ต้องการลบ<p>
						<input  type="submit"  name="submit"  value="confirm value">
				</form>
<?
				}
				else {
						echo "<h3>ไม่มีโปรแกรมอยู่ในหมวดที่คุณเลือก</h3><br>";
				}
			}
		}
?>
</td>
<?
}	// end if ($HTTP_POST_VARS["submit"] == "delete subject")

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"] == "confirm value") {
?>
<td>
<?
		if ($HTTP_POST_VARS["delete"] == "Y") {
				$query10 = "delete from program_subject where subj_id='$sub_id'";
				$data_query10 = mysql_query($query10) or die("ไม่สามารถลบหมวดหมู่ในตาราง program_subject ได้");
				if ($data_query10) {
					echo "<br><center><h3>ลบหมวดหมู่เสร็จแล้ว</h3></center><br>";
				}
		}
		elseif ($HTTP_POST_VARS["delete"] == "N") {
				echo "<center>คุณได้ยกเลิกที่จะลบหมวดหมู่นี้</center><br>";
		}
		else {
				echo "<center>คุณยังไม่ได้คลิกเพื่อยืนยังว่ายันต้องการลบหรือไม่</center><br>";
		}
?>
</td>
<?
}	// end if ($HTTP_POST_VARS["submit"] == "confirm_value"  && $HTTP_POST_VARS["delete"] == "Y")

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$pass2 = true;			//  ตัวแปรที่ใช้เช็คว่าผู้ใช้กรอกแบบฟอร์มถูกต้องไหม  ถ้าไม่ถูกก็จะให้แก้จนกว่าจะถูกถึงจะเปลี่ยนชื่อหมวดหมู่ ได้

if ($HTTP_POST_VARS["submit"] == "update subject") {	//  มีการกดปุ่ม update เพื่อบันทึกสิ่งที่แก้ไขลงฐานข้อมูล
?>
<td>	
<?
		$subj_id = htmlspecialchars( trim( $HTTP_POST_VARS["subj_id"] ) );
		$subj_name = htmlspecialchars( trim( $HTTP_POST_VARS["subj_name"] ) );
		if ( !$subj_name ) {
			$pass2 = false;
			echo "<font color=\"red\">คุณไม่ได้กรอกชื่อหมวดหมู่ของโปรแกรม</font><br>";
		}

					// กดปุ่ม update subject โดยที่กรอกแบบฟอร์มถูกต้องแล้ว
		if ($pass2 == true) {
				$query11 = "update program_subject set subj_name = '$subj_name'  where subj_id = '$subj_id'";
				$data_query11 = mysql_query($query11) or die("เปลี่ยนชื่อหมวดหมู่ไม่ได้");
				if ($data_query11) {
						echo "<br><center><h3>update เสร็จเรียบร้อยแล้ว</h3></center><br>";
				}
		}				// end if ($pass2 == true)
?>
</td>
<?
		
}	// end if ($HTTP_POST_VARS["submit"] == "update subject")


//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"] == "edit program") {			//  มีการกดปุ่ม edit program
?>
<td>	
<?
		$array = $HTTP_POST_VARS["array"];
		if (count($array)!=1)  //เช็คว่าได้ทำการ check โปรแกรมที่จะเปลี่ยนหรือไม่  1 อัน
			echo "<center><font size=3><b>เลือกโปรแกรม 1 โปรแกรมที่ต้องการจะแก้ไขข้อมูล</b></font></center><br> ";
		else //ถ้ามีการเช็ค 1 อัน
		{
			foreach($array as $key => $val) {
				$query3 = "select id, name, user, detail from download_program where id='$val'";
				$data_query3 = mysql_query($query3) or die("ไม่สามารถ select ตาราง download_program เพื่อแก้ไขข้อมูลโปรแกรมได้");
				$arr3 = mysql_fetch_array($data_query3);
				$id = $arr3[id];
				$name = $arr3[name];
				$user = $arr3[user];
				$detail = $arr3[detail];
?>

			  <table  border=0  width=400  height=280  cellpadding=1  cellspacing=1>
					<form  method="post"  enctype="multipart/form-data"  action="<? echo "$PHP_SELF"; ?>"  >
						<tr>  <td>
								<input  type="hidden"  name="id"  value="<? echo "$id"; ?>">
								ชื่อ : <input  type="text"  name="name" value="<? echo $name; ?>"><br>
	        		  				รายละเอียด : <br>
								<textarea  rows=5  cols=40  name="detail"><? echo $detail; ?></textarea><br>
								ถ้าจะใช้ไฟล์เดิมก็ไม่ต้องใส่ไฟล์ใหม่<br>
								ใส่ไฟล์ใหม่ : <input  type="file"  name="uploadedFile"  size="35"><br>
								ผู้ที่สามารถดาวน์โหลดได้ : <br>
								<input  type="radio"  name="flag"  value="G"  <? if ($user == "G") { echo "checked"; } ?>>ผู้ใช้ทั่วไป
								<input  type="radio"  name="flag"  value="L"  <? if ($user == "L") { echo "checked"; } ?>>สต๊าฟเท่านั้น<br>
								<input  type="submit"  name="submit"  value="update program"><br>
						</td>  </tr>
					</form>
				</table>
		</td>
<?
			}		// end foreach()
		}	// end else
?>
</td>	
<?
}		// end if ($HTTP_POST_VARS["submit"] == "edit program")

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"] == "delete program") {			//  มีการกดปุ่ม delete program
?>
<td>	
<?
		$array = $HTTP_POST_VARS["array"];
		if (count($array)==0)  //เช็คว่าได้ทำการ check โปรแกรมที่จะลบหรือไม่ ต้องเอาไว้บน select ที่จะ Quey จาก db ข้างล่าง ค่าจะได้ไม่ซ้อนกัน
			echo "<br><center><h3>กรุณาเลือกลิงค์ที่ต้องการจะลบ</h3></center>";
		else //ถ้ามีการเช็ค
		{	
			foreach($array as $key => $val) {
				$query4 = "delete from download_program where id='$val'";
				$data_query4 = mysql_query($query4) or die("ไม่สามารถ delete โปรแกรมจากตาราง download_program ได้");
				if ($data_query4) {
					echo "<br><center><h3>ลบโปรแกรมเสร็จแล้ว</h3></center>";
				}
			}
		}
?>
</td>	
<?
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$pass = true;			//  ตัวแปรที่ใช้เช็คว่าผู้ใช้กรอกแบบฟอร์มถูกต้องไหม  ถ้าไม่ถูกก็จะให้แก้จนกว่าจะถูกถึงจะแก้ไขรายละเอียดของโปรแกรมได้

if ($HTTP_POST_VARS["submit"] == "update program") {				//  มีการกดปุ่ม update เพื่อบันทึกสิ่งที่แก้ไขลงฐานข้อมูล
?>
<td>
<?
		$id = htmlspecialchars( trim( $HTTP_POST_VARS["id"] ) );
		$name = htmlspecialchars( trim( $HTTP_POST_VARS["name"] ) );
		$detail = htmlspecialchars( trim( $HTTP_POST_VARS["detail"] ) );
//		$submittedFile = htmlspecialchars( trim( $HTTP_POST_FILES["uploadedFile"]["name"] ) );
		$uploadedFile = $HTTP_POST_FILES["uploadedFile"]["tmp_name"];
		$uploadedFile_name = $HTTP_POST_FILES["uploadedFile"]["name"];
		$uploadedFile_size = $HTTP_POST_FILES["uploadedFile"]["size"];
		$uploadedFile_type = $HTTP_POST_FILES["uploadedFile"]["type"];
		$flag = $HTTP_POST_VARS["flag"];

/*		if (isset($HTTP_POST_FILES["uploadedFile"]["tmp_name"])) {
			$uploadedFile = $HTTP_POST_FILES["uploadedFile"]["tmp_name"];		// ไฟล์ที่เรา upload และไปเก็บใน TEMP ของระบบ
		}

		$flag = $HTTP_POST_VARS["flag"];

		if (isset($HTTP_POST_FILES["uploadedFile"]["name"])) {
			$uploadedFile_name = $HTTP_POST_FILES["uploadedFile"]["name"];
		}

		if (isset($HTTP_POST_FILES["uploadedFile"]["size"])) {
			$size = $HTTP_POST_FILES["uploadedFile"]["size"];
		}

		if (isset($HTTP_POST_FILES["uploadedFile"]["type"])) {
			$uploadedFile_type = $HTTP_POST_FILES["uploadedFile"]["type"];
		}
*/
		if ( !$name ) {
			$pass = false;
			echo "<font color=\"red\">คุณไม่ได้กรอกชื่อโปรแกรม</font><br>";
		}

		if ( !$detail ) {
			$pass = false;
			echo "<font color=\"red\">คุณไม่ได้กรอกรายละเอียด</font><br>";
		}

		if ($uploadedFile_name != "" && $uploadedFile_size == 0 ) {  // กรอกที่อยู่ของไฟล์มาแต่ว่าไม่มีไฟล์นั้นจริง อาจกรอกที่อยู่ผิดก็ได้
			$foundfile = false;			// ไม่พบไฟล์
			$pass = false;
			echo "<font color=\"red\">ไม่พบไฟล์ที่คุณได้กรอกมา  ตรวจสอบชื่อไฟล์และตำแหน่งของไฟล์ดูอีกที</font><br>";
		}

							
		if ($pass == true) {		// กดปุ่ม update program โดยที่กรอกแบบฟอร์มถูกต้องแล้ว
				if ($uploadedFile != "none") {				// ถ้าไม่ได้กรอกไฟล์ใหม่ หรือ กรอกผิด $uploadedFile จะมีค่าเป็น none							
						$gen_string = randomString(30);
						$surname = substr($uploadedFile_name, -4, 4);	// เก็บนามสกุลของไฟล์ เช่น  .pdf
						$filename = $gen_string . $surname;					// สร้างชื่อไฟล์โดยเอาสตริงที่ generate ขึ้นมา มาต่อเข้ากับนามสกุลของไฟล์
				/*		echo "This is filename : $filename<br>";
						echo "Size : $size KB<br>";															
						echo "Type : $uploadedFile_type <br>";																
						echo "<br><hr><br>";
				*/
//						$path1 = "C:/Inetpub/wwwroot/top/download/file/program/gteiopojpmr";     // directory ที่ใช้เก็บไฟล์ที่ upload โดยให้คนทั่วไป download ได้
//						$path2 = "C:/Inetpub/wwwroot/top/download/file/program/lwepfdeiowj";		 // directory ที่ใช้เก็บไฟล์ที่ upload โดยให้เฉพาะสต๊าฟ download ได้
						
						$path1 = "../file/filedownload/gteiopojpmr";     // directory ที่ใช้เก็บไฟล์ที่ upload โดยให้คนทั่วไป download ได้
						$path2 = "../file/filedownload/lwepfdeiowj";		 // directory ที่ใช้เก็บไฟล์ที่ upload โดยให้เฉพาะสต๊าฟ download ได้
		

						if ($flag == 'G') {
								$path = $path1;
						} 
						elseif ($flag == 'L' ){
								$path = $path2;
						}
		
						if ( copy($uploadedFile, "$path/$filename") ) {
					//		echo "<br><br><br><br>$filename has been copy to $path/$filename<br>";
						
/*						else {
								echo "Error ... can't upload<br>";
						}
						unlink($uploadedFile);
*/
							$query5 = "select filename from download_program where id = '$id'";
							$data_query5 = mysql_query($query5) or die("ไม่สามารถ select ชื่อไฟล์เก่าได้");
							$arr5 = mysql_fetch_array($data_query5);
							$oldfile = $arr5[filename];
							$oldpath = $path."/".$oldfile;
			//		echo "path of old file = $oldpath<br>";
							unlink($oldpath);

							$query6 = "update download_program set name='$name', detail='$detail', filename='$filename', size='$size', date_add=now(), user='$flag'  where id='$id'";
						
						}
						else {
							print "Error ... can't upload<br>";
						}
				
						unlink($uploadedFile);
				}	//  end if ($uploadedFile)
				else {
						$query6 = "update download_program set name='$name', detail='$detail', date_add=now(), user='$flag'  where id='$id'";
				}
	
				$data_query6 = mysql_query($query6) or die ("เอ็กซิคิวต์คำสั่ง update program ไม่ได้");
				if ($data_query6) {
						echo "<br><center><h3>update เสร็จเรียบร้อยแล้ว</h3></center>";
				}
		}      //  end if ($pass == true)
?>
</td>	
<?
}   // end if ($HTTP_POST_VARS["submit"] == "update program")


//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"] == "move") {		//มีการย้ายหมวดหมู่ของโปรแกรม และได้คลิกปุ่ม move แล้ว
		$array = $HTTP_POST_VARS["array"];
		if (count($array)==0)			//เช็คว่าได้ทำการ check โปรแกรมที่จะย้ายหมวดหมู่หรือไม่ 
			echo "<br><center><h3>กรุณาเลือกโปรแกรมที่ต้องการจะย้ายหมวดหมู่</h3></center>";
		else //ถ้ามีการเช็ค
		{	
			foreach($array as $key => $val) {
					$new_subj = $HTTP_POST_VARS["new_subj"];
					$query13 = "update download_program set subj_id = '$new_subj'  where id = '$val'";
					$data_query13 = mysql_query($query13) or die("ย้ายหมวดหมู่ไม่ได้");
					if ($data_query13) {
							echo "<br><center><h3>ย้ายหมวดหมู่ของโปรแกรมเสร็จเรียบร้อย</h3></center>";
					}
			}		// end foreach()
		}
}		// end if ($HTTP_POST_VARS["submit"] == "move")


//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												// แสดงโปรแกรมที่อยู่ในหมวดหมู่ที่คลิกเลือก
												// ถ้าเลือก group แล้ว อยู่ในหน้าที่แสดงโปรแกรมใน group นั้นแต่ กด edit program โดยไม่ได้คลิกโปรแกรม
												// ตัวแปร group จะไม่มีค่าอะไรเก็บไว้ ดังนั้นพอ select subj_name ดังข้างล่างนี้แล้วจะไม่ได้ข้อมูลขึ้นมา

if (isset($group)) {		// มีการคลิกที่ชื่อ subject
?>
<td  align=center>	
<?
		$query7 = "select subj_name from program_subject where subj_id = '$group'";
		$data_query7 = mysql_query($query7) or die("ส่งคิวรี select subj_name ในตาราง program_subject ไม่ได้");
		
		if ( ( ($data_query7) and mysql_num_rows($data_query7) ==1) or isset($HTTP_POST_VARS["submit"] ) ) { 
						//  ถ้า select แล้วได้ 1 row ( 1 group ) แสดงว่าถูกต้อง
						// submit เป็นชื่อปุ่ม edit program, edit group, delete program, delete group 4 ปุ่มเลย ( ใช้ชื่อเดียวกัน )

				$arr7 = mysql_fetch_array($data_query7);
				$subj_name = stripslashes( $arr7[subj_name] );
?>
    			<form  method=post  action="<? echo $PHP_SELF; ?>" >
<?					
				$query8 = "select id, name, subj_id, detail, filename, size, user_add, date_format(date_add, '%e %b %Y, %H:%i') as date_add, download, user from download_program where subj_id='$group'";
				$data_query8 = mysql_query($query8) or die("ส่งคิวรี select ทุก field ในตาราง download_program ไม่ได้");
				$numrows = mysql_num_rows($data_query8);
				if ($data_query8) {
						if ($numrows == 0) {
								echo "ไม่มีโปรแกรมอยู่ในหมวดหมู่นี้  โปรดคลิกหมวดหมู่ที่มีโปรแกรม<br>";
						}
						elseif ($numrows > 0) { 
								$count = 0;
								while ($arr8 = mysql_fetch_array($data_query8) ) {
										$id = $arr8[id];
										$name = stripslashes( $arr8[name] );
										$subj_id = $arr8[subj_id];
										$detail = stripslashes( $arr8[detail] );
										$size = $arr8[size];
										$user_add = $arr8[user_add];
										$date_add = $arr8[date_add];
										$download = $arr8[download];
										$user = $arr8[user];
										if (isset($id)) {
												$count = $count + 1;
												if ($count == 1) {
														echo "<center><h2>โปรแกรมในหมวดหมู่ $subj_name</h2></center>";
												}
										}
										else {
												echo "ไม่มีโปรแกรมในหมวดหมู่นี้<br>";
										}
?>
    									<table  border=0  cellpadding=1  cellspacing=1  width=400  height=100 >
												<input  type="hidden"  name="group"  value="<?  echo $group;  ?>">  
												<tr  id=table3>  <td  colspan=2  align=center><input  type="checkbox"  name="array[]"  value="<? echo "$id"; ?>">
																<? echo $name; ?>
														</td>
<!--														<td>		
																<? 
																		if ($user == "L") {
																			echo "<b>เฉพาะสต๊าฟเท่านั้นที่ดาวน์โหลดได้</b><br>";
																		}
																		elseif ($user == "G") {
																			echo "<b>คนทั่วไปสามารถดาวน์โหลดได้</b><br>";
																		}
																?>
														</td>  
-->														
														</tr>
												<tr  id=table1>  <td><b>มีการดาวน์โหลด : </b></td>  <td><? echo "$download "; ?>ครั้ง</td>  </tr>
												<tr  id=table1>  <td><b>วัน-เวลาที่อัพโหลด : </b></td>  <td><? echo $date_add; ?></td>  </tr>
		    										<tr  id=table1>  <td><b>ขนาดไฟล์ : </b></td>  <td><? echo "$size  ไบต์"; ?></td>  </tr>
												<tr  id=table1>  <td><b>รายละเอียด : </b></td>  <td><? echo $detail; ?></td>  </tr>
												<tr  id=table1>  <td><b>โดย : </b></td>  <td><? echo $user_add; ?></td>  </tr>
												<br><br>
								    	</table>
		
<?	
								}    // end while loop

								$query12 = "select * from program_subject";
								$data_query12 = mysql_query($query12) or die("select ชื่อหมวดหมู่ทุกชื่อไม่ได้");
								if ($data_query12) {
?>
												<br>ย้ายไปยังหมวดหมู่
												<select  name="new_subj">
<?						
												while ($arr12 = mysql_fetch_array($data_query12)) {
														$subj_id = $arr12[subj_id];
														$subj_name = stripslashes($arr12[subj_name]);
?>
														<option  value="<? echo $subj_id; ?>"><? echo $subj_name; ?><br>
<?									
												}		// end while loop
?>
												</select>
												<input  type="submit"  name="submit"  value="move">
<?
								}   
?>   
								<br><br><input  type="submit"  name="submit"  value="edit program">
								<input  type="submit"  name="submit"  value="delete program">

<?
						}  // end if ($numrows > 0)
				}		// end if ($data_query8)
?>
				</form>
<?
		} // end if ((($data_query7) and mysql_num_rows($data_query7) ==1) or isset($HTTP_POST_VARS["submit"] )
		else {
				echo "<center><b><font size=3>เลือกหมวดหมู่ของโปรแกรม ด้านขวามือ </font></b></center><br>";
		}
?>
</td>
<?
} // end if (isset($group))************************************


//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
		<td  align="right"  valign="top">
			<table  border=0  cellpadding=1  cellspacing=1>
<?						//  เมนูให้เลือกหมวดหมู่ของโปรแกรม

    				$query = "select subj_id,subj_name from program_subject";
					$data_query = mysql_query($query) or die("ส่งคิวรี 1 ไม่ได้");
?>
					<tr  id=table3>  <td  colspan=2><h3>โปรแกรม</h3></td>  </tr>
					<form  method="post"  action="<? echo $PHP_SELF; ?>">
<?
					while ($arr = mysql_fetch_array($data_query) ) {
							$i = $arr[subj_id];
							$subj_name = $arr[subj_name];

							$query2 = "select count(*) as num from download_program where subj_id='$i'";
							$data_query2 = mysql_query($query2) or die("ส่งคิวรี select count(*) เพื่อนับจำนวนโปรแกรมในหมวดหมู่ไม่ได้");
							$arr2 = mysql_fetch_array($data_query2);
							$number = $arr2[num];
?>
	    					<tr  id=table1>  <td>
											<input  type="checkbox"  name="array2[]"  value="<? echo $i; ?>">
											<? echo "<a href=$PHP_SELF?group=$i>$subj_name</a><br>"; ?>
									</td>
								    <td><? echo "$number"; ?></td>
							</tr>
<?
					}
?>
						<tr>  <td  colspan=2><input  type="submit"  name="submit"  value="edit subject"></td>  </tr>
						<tr>  <td  colspan=2><input  type="submit"  name="submit"  value="delete subject"></td>  </tr>
					</form>

			</table>

		</td>
		</tr>
</table>
<?

curve_close();
empty_4();
 ?> 