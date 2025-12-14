<?php 
include "interface.inc.php"; 
include "accesscontrol.php"; 
logo_leftmenu("ISAG (Edit staff profile)"); 
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];

		//select ดูก่อนว่า user คนนี้มีในตารางของอาจารย์ยัง ถ้ามีจะได้ update ถ้ายังไม่มีจะได้ insert
		$query = "select * from staff_profile where Staffuser='$uid' ";
		$result = mysql_query($query);
		if(($result) and mysql_num_rows($result)==1) //มีอยู่แล้วในตารางนี้ ก็เอาข้อมูลมาจากตารางนี้
		{
			$status=1;		
		}
		if(($result) and mysql_num_rows($result)==0) //ยังไม่มีข้อมูลในตารางนี้ ก็ไปเอามาจาก accesslist ก่อนละกัน
		{
			$status=0;
		}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"]=="update") // check input for error
{
		if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]))
		{
			$picture=$HTTP_POST_FILES["picture"]["tmp_name"]; //$picture_name=$HTTP_POST_FILES["picture"]["name"];
			$picture_type=$HTTP_POST_FILES["picture"]["type"];  //$picture_size=$HTTP_POST_FILES["picture"]["size"];
		}		
		$name=$HTTP_POST_VARS["name"];		
		$nickname=$HTTP_POST_VARS["nickname"];		
		$student_id=$HTTP_POST_VARS["student_id"];		
		$date_birth=$HTTP_POST_VARS["date_birth"];		
		$month_birth=$HTTP_POST_VARS["month_birth"];		
		$year_birth=$HTTP_POST_VARS["year_birth"];		
		$year_project=$HTTP_POST_VARS["year_project"];	
		$generation=$HTTP_POST_VARS["generation"];		
		$type=$HTTP_POST_VARS["type"];		
		
		$address1=$HTTP_POST_VARS["address1"];		
		$tel1=$HTTP_POST_VARS["tel1"];		
		$position=$HTTP_POST_VARS["position"];		
		$address2=$HTTP_POST_VARS["address2"];		
		$tel2=$HTTP_POST_VARS["tel2"];		
		$address3=$HTTP_POST_VARS["address3"];		
		$tel3=$HTTP_POST_VARS["tel3"];
		$mobile_phone=$HTTP_POST_VARS["mobile_phone"];
		$pct=$HTTP_POST_VARS["pct"];
		$pager=$HTTP_POST_VARS["pager"];
		$icq=$HTTP_POST_VARS["icq"];
		$email=$HTTP_POST_VARS["email"];
		$website=$HTTP_POST_VARS["website"];
		$skill=$HTTP_POST_VARS["skill"];

		$Error=0;
		$name = htmlspecialchars(trim($name));
		$nickname = htmlspecialchars(trim($nickname));
		
		$address1 = htmlspecialchars(trim($address1));
		$tel1 = htmlspecialchars(trim($tel1));
		$position = htmlspecialchars(trim($position));
		$address2 = htmlspecialchars(trim($address2));
		$tel2 = htmlspecialchars(trim($tel2));
		$address3 = htmlspecialchars(trim($address3));
		$tel3 = htmlspecialchars(trim($tel3));

		$mobile_phone = htmlspecialchars(trim($mobile_phone));
		$pct = htmlspecialchars(trim($pct));
		$pager = htmlspecialchars(trim($pager));		
		$email = htmlspecialchars(trim($email));
		$website = htmlspecialchars(trim($website));
		$skill = htmlspecialchars(trim($skill));   // email msn

		if (!ereg("^.{5,}$",$name))
			{
				$Error=1;
				print "<font color=red> &nbsp;ตรวจสอบชื่อให้ถูกต้อง</font><br>";
			}
		if (!ereg("^.{2,}$",$nickname))
			{
				$Error=1;
				print "<font color=red>&nbsp;ตรวจสอบชื่อเล่นให้ถูกต้อง</font><br>";
			}
		if ((!ereg("^[0-9]{6}$",$student_id)) and (!ereg("^[0-9]{8}$",$student_id)))
			{
				$Error=1;			
				print "<font color=red>&nbsp;ตรวจสอบรหัสนักศึกษาให้ถูกต้อง 6 ถึง 8 ตัว</font><br>";
			}
		if (!ereg("^[0-9]{4}$",$year_birth))
			{
				$Error=1;			
				print "<font color=red>&nbsp;ตรวจสอบปีเกิดให้ถูกต้อง</font><br>";
			}
		if (!ereg("^[0-9]{1,2}$",$generation))
			{
				$Error=1;			
				print "<font color=red>&nbsp;ตรวจสอบรุ่นให้ถูกต้อง</font><br>";
			}
		if (!ereg("^[0-9]{4}$",$year_project))
			{
				$Error=1;			
				print "<font color=red>&nbsp;ตรวจสอบปีที่ทำโปรเจคให้ถูกต้องให้ถูกต้อง</font><br>";
			}
		if (!ereg("^.+@.+\..+$",$email))
			{
				$Error=1;			
				print "<font color=red>&nbsp; ตรวจสอบอีเมลล์ให้ถูกต้อง</font><br>";
			}			
		//  is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"])
		if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]) and ($picture_type != "image/gif") and ($picture_type != "image/pjpeg") and ($picture_type != "image/jpeg"))
			{			
				$Error=1; 
				print "<font color=red>&nbsp;รูปต้องเป็นไฟล์ .gif หรือ .jpg เท่านั้น</font>";
			}		
		 if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]) and ($Error!=1)) //ถ้ามีการ upload รูปและไม่มี error จะ select เอาชื่อรูปเก่าใน database และไปลบไฟเก่า
		{			
			$query = "select * from staff_profile where Staffuser='$uid' ";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);
			$picturestaff = $row['Picturestaff'];		
			if ($picturestaff!="")
			{
			if (!unlink("$path_staff_pic$picturestaff"))  echo "<font color='$error_color'>&nbsp;ไม่สามารถลบรูปเดิมทิ้งได้.</font>";
			}					
		}		
		if($Error==0)
		{					
			
				if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]))  // ถ้ามีไฟล์ให้ update ไฟล์ใน database ด้วย
				{ 				

					if ($picture_type=="image/gif") $picturestaff = $uid."_pic.gif";  
					if (($picture_type=="image/pjpeg") or ($picture_type=="image/pjpeg")) $picturestaff = $uid."_pic.jpg";  
					$Error2=0;
					if  (!copy($picture,"$path_staff_pic$picturestaff"))  
					{
					print ("<CENTER><B><font size=2 color='$error_color'>ไม่สามารถ upload file ได้<br></font></B></CENTER> ");
					$Error2=1;
					}
					if($status==1)  //มีข้อมูลอยู่แล้วให้ทำการ update
					$sql_update = "update staff_profile set
				Name='$name',Nickname='$nickname',Student_ID='$student_id',Date_birth='$date_birth',Month_birth='$month_birth',Year_birth='$year_birth',
				Generation='$generation',Type='$type',Picturestaff='$picturestaff',year_project='$year_project',Address1='$address1',Tel1='$tel1',Position='$position',Address2='$address2',Tel2='$tel2',
			Address3='$address3',Tel3='$tel3',Mobile_phone='$mobile_phone',PCT='$pct',Pager='$pager',ICQ='$icq',Email='$email',Website='$website',Skill='$skill',Last_update=now()  where Staffuser='$uid' ";

					if($status==0) //ยังไม่มีให้ทำการ insert
						$sql_update= "insert into staff_profile values ('','$uid','$name','$nickname','$student_id','$date_birth','$month_birth','$year_birth','$generation','$type','$picturestaff','$year_project','$address1','$tel1','$position','$address2','$tel2','$address3','$tel3','$mobile_phone','$pct','$pager','$icq','$email','$website','$skill',now())";
				}
				if (!is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]))  // ถ้าไม่ได้ upload ไฟล์ก็ไม่ต้อง update รูปใน database
				{
						if($status==1)  //มีข้อมูลอยู่แล้วให้ทำการ update
						$sql_update = "update staff_profile set
					Name='$name',Nickname='$nickname',Student_ID='$student_id',Date_birth='$date_birth',Month_birth='$month_birth',Year_birth='$year_birth',
					Generation='$generation',Type='$type',year_project='$year_project',Address1='$address1',Tel1='$tel1',Position='$position',Address2='$address2',Tel2='$tel2',
				Address3='$address3',Tel3='$tel3',Mobile_phone='$mobile_phone',PCT='$pct',Pager='$pager',ICQ='$icq',Email='$email',Website='$website',Skill='$skill',Last_update=now()  where Staffuser='$uid' ";

					if($status==0) //ยังไม่มีให้ทำการ insert
						$sql_update= "insert into staff_profile values ('','$uid','$name','$nickname','$student_id','$date_birth','$month_birth','$year_birth','$generation','$type','','$year_project','$address1','$tel1','$position','$address2','$tel2','$address3','$tel3','$mobile_phone','$pct','$pager','$icq','$email','$website','$skill',now())";
				}
				$result_update=mysql_query($sql_update);

				if (($result_update) and ($Error2!=1))
				print "<CENTER><B><font size=2>Update ข้อมูลเรียบร้อยแล้ว</font></B></CENTER>";

		}
		
}
// เข้ามาครั้งแรกยังไม่ได้กด update หรือ  กด update แล้วแต่ error หรือ update ok แล้ว 
if (($HTTP_POST_VARS["submit"] != "update") or ($Error==0) or ($Error==1)) 		
{		
		//ถ้าเพิ่งเข้าครั้งแรก หรือว่า update ok แล้วก็ดึงเอาข้อมูลใหม่ทั้งหมดมาแสดง		

		if ($status==1 and (($HTTP_POST_VARS["submit"]!="update") or ($Error==0))) //ถ้ายังมี error อยู่จะไม่ดึงข้อมูลจาก database มาแสดง จะเอาข้อมูลเก่าที่พิพม์ไว้ form น่ะ
		{
			$query = "select * from staff_profile where Staffuser='$uid' ";
			$result = mysql_query($query);
			list ($ID,$Staffuser,$name,$nickname,$student_id,$date_birth,$month_birth,$year_birth,$generation,$type,$picturestaff,$year_project,$address1,$tel1,$position,$address2,$tel2,$address3,$tel3,$mobile_phone,$pct,$pager,$icq,$email,$website,$skill,$last_update)=mysql_fetch_row($result);			
		}
		if ($status==1 and $Error==1)  //ถึงมี error  จะ select เลือกรูปใน db ขึ้นมาเพื่อแสดงรูปภาพให้เห็น
		{
			$query = "select * from staff_profile where Staffuser='$uid' ";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);
			$picturestaff = $row['Picturestaff'];
		}
		if($status==0)  //if no user in this table
		{
				$sql = "select Fullname,Email from accesslist where Username='$uid' ";
				$result = mysql_query($sql);
				if(($result) and mysql_num_rows($result)==1)
				{
						$row=mysql_fetch_array($result);
						$name=$row['Fullname'];
						$email=$row['Email'];
				}
		}
?>
		<CENTER>
	<font size=3><b>แก้ไขข้อมูลนักศึกษา</b></font>
		<form enctype = "multipart/form-data" method="post" action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>">
		<input type=hidden name="MAX_FILE_SIZE" value=30000>

		<table cellpadding=1 cellspacing=1 width=98%>
		
		<tr ID=table3><td colspan=3>&nbsp;General Information</td></tr>
		<tr ID=table1><td>&nbsp;ชื่อ - นามสกุล <font color=red>*</font></td>	
					   <td><input type=text  name="name" size=20 value="<? echo $name; ?>"></td>
					   <td rowspan=6><CENTER>


						<? if ($picturestaff!="") {?>
						<img src="<? print "$path_staff_pic$picturestaff"; ?>"  

						<?
						$dimen = GetImageSize("$path_staff_pic$picturestaff"); 

						if (($dimen[0] < 150) and ($dimen[1] <150)) 
									print " width=$dimen[0] height=$dimen[1] ";
						if (($dimen[0] > 150) and ($dimen[1] >150))
									print " width=150 ";
						if (($dimen[0] < 150) and ($dimen[1] >150)) 
									print " height=150 ";
						if (($dimen[0] > 150) and ($dimen[1] <150)) 
									print " width =150 ";
						?>
						border=1

						>
						<? } else {?>   <img src="<?=$path_staff_pic?>hacker.jpg"  width=130 height=150 border=1> <? } ?>


					   </CENTER></td></tr>
		<tr ID=table1><td>&nbsp;ชื่อเล่น</td><td><input type=text name="nickname" size=5 maxlength=10 value="<?=$nickname?>"></td></tr>
		<tr ID=table1><td>&nbsp;รหัส <font color=red>*</font></td><td><input type=text name="student_id" size=8 maxlength=8 value="<?=$student_id?>"></td></tr>
		<tr ID=table1><td>&nbsp;วันเกิด</td><td>
			<select name="date_birth">
				<option value="1" <? if ($date_birth=="1") print "SELECTED"; ?>>1</option>
				<option value="2" <? if ($date_birth=="2") print "SELECTED"; ?>>2</option>
				<option value="3" <? if ($date_birth=="3") print "SELECTED"; ?>>3</option>
				<option value="4" <? if ($date_birth=="4") print "SELECTED"; ?>>4</option>
				<option value="5" <? if ($date_birth=="5") print "SELECTED"; ?>>5</option>
				<option value="6" <? if ($date_birth=="6") print "SELECTED"; ?>>6</option>
				<option value="7" <? if ($date_birth=="7") print "SELECTED"; ?>>7</option>
				<option value="8" <? if ($date_birth=="8") print "SELECTED"; ?>>8</option>
				<option value="9" <? if ($date_birth=="9") print "SELECTED"; ?>>9</option>
				<option value="10" <? if ($date_birth=="10") print "SELECTED"; ?>>10</option>
				<option value="11" <? if ($date_birth=="11") print "SELECTED"; ?>>11</option>
				<option value="12" <? if ($date_birth=="12") print "SELECTED"; ?>>12</option>
				<option value="13" <? if ($date_birth=="13") print "SELECTED"; ?>>13</option>
				<option value="14" <? if ($date_birth=="14") print "SELECTED"; ?>>14</option>
				<option value="15" <? if ($date_birth=="15") print "SELECTED"; ?>>15</option>
				<option value="16" <? if ($date_birth=="16") print "SELECTED"; ?>>16</option>
				<option value="17" <? if ($date_birth=="17") print "SELECTED"; ?>>17</option>
				<option value="18" <? if ($date_birth=="18") print "SELECTED"; ?>>18</option>
				<option value="19" <? if ($date_birth=="19") print "SELECTED"; ?>>19</option>
				<option value="20" <? if ($date_birth=="20") print "SELECTED"; ?>>20</option>
				<option value="21" <? if ($date_birth=="21") print "SELECTED"; ?>>21</option>
				<option value="22" <? if ($date_birth=="22") print "SELECTED"; ?>>22</option>
				<option value="23" <? if ($date_birth=="23") print "SELECTED"; ?>>23</option>
				<option value="24" <? if ($date_birth=="24") print "SELECTED"; ?>>24</option>
				<option value="25" <? if ($date_birth=="25") print "SELECTED"; ?>>25</option>
				<option value="26" <? if ($date_birth=="26") print "SELECTED"; ?>>26</option>
				<option value="27" <? if ($date_birth=="27") print "SELECTED"; ?>>27</option>
				<option value="28" <? if ($date_birth=="28") print "SELECTED"; ?>>28</option>
				<option value="29" <? if ($date_birth=="29") print "SELECTED"; ?>>29</option>
				<option value="30" <? if ($date_birth=="30") print "SELECTED"; ?>>30</option>
				<option value="31" <? if ($date_birth=="31") print "SELECTED"; ?>>31</option>
			</select>
			<select name="month_birth">
				<option value="1" <? if ($month_birth=="1") print "SELECTED"; ?>>มกราคม</option>
				<option value="2" <? if ($month_birth=="2") print "SELECTED"; ?>>กุมภาพันธ์</option>
				<option value="3" <? if ($month_birth=="3") print "SELECTED"; ?>>มีนาคม</option>
				<option value="4" <? if ($month_birth=="4") print "SELECTED"; ?>>เมษายน</option>
				<option value="5" <? if ($month_birth=="5") print "SELECTED"; ?>>พฤษภาคม</option>
				<option value="6" <? if ($month_birth=="6") print "SELECTED"; ?>>มิถุนายน</option>
				<option value="7" <? if ($month_birth=="7") print "SELECTED"; ?>>กรกฏาคม</option>
				<option value="8" <? if ($month_birth=="8") print "SELECTED"; ?>>สิงหาคม</option>
				<option value="9" <? if ($month_birth=="9") print "SELECTED"; ?>>กันยายน</option>
				<option value="10" <? if ($month_birth=="10") print "SELECTED"; ?>>ตุลาคม</option>
				<option value="11" <? if ($month_birth=="11") print "SELECTED"; ?>>พฤศจิกายน</option>
				<option value="12" <? if ($month_birth=="12") print "SELECTED"; ?>>ธันวาคม</option>
			</select>
				พ.ศ. <input type=text name="year_birth" size=4 maxlength=4 value="<?=$year_birth?>">
		</td></tr>
		<tr ID=table1><td>&nbsp;รุ่นที่ <font color=red>*</font></td>
					  <td><input type=text  name="generation" size=2 maxlength=2 value="<?=$generation?>"></td></tr>
		<tr ID=table1><td>&nbsp;ประเภท <font color=red>*</font></td>		
		<td>
		<select name="type">
				<option value="3" <? if ($type=="3") print "SELECTED"; ?>>ปริญญาตรี</option>
				<option value="4" <? if ($type=="4") print "SELECTED"; ?>>ปริญญาโท</option>
				<!-- <option value="5" if ($type=="5") print "SELECTED"; >ปริญญาเอก</option> -->
				<!-- <option value="1"  if ($type=="1") print "SELECTED"; >อาจารย์</option> -->

				
			</select>
		</td></tr>
		<tr ID=table1><td>&nbsp;รูป </td><td colspan=2><input type=file name=picture size=30><br><font color=red>ใช้ Photoshop บีบไฟล์ภาพ  ไม่ให้เกิน <B>30 K</B> ขนาดไม่เกิน <B>150x150 pixels</B></font></td></tr>
		<tr ID=table1><td colspan=3>&nbsp;ปีการศึกษาที่ทำโปรเจค (พ.ศ.) <input type=text name=year_project value="<?=$year_project?>" maxlength=4 size=4><br></td></tr>
		<tr><td colspan=3><br></td></tr>
		</table>

		<table cellpadding=1 cellspacing=1 width=98%>
		<tr ID=table3><td colspan=2>&nbsp;Address Information (ใส่ที่อยู่อย่างน้อย 1 แห่ง)</td></tr>
		<tr ID=table1><td>&nbsp;ที่อยู่ (ที่ทำงาน)</td>
					  <td><input type=text name="address1" size=45 value="<?=$address1?>"></td></tr>
		<tr ID=table1><td>&nbsp;โทรศัพท์ </td>
					  <td><input type=text name="tel1" size=15 value="<?=$tel1?>"></td></tr>
		<tr ID=table1><td>&nbsp;ตำแหน่ง</td>
					   <td><input type=text name="position" size=15 value="<?=$position?>"></td></tr>
		<tr ID=table1><td>&nbsp;ที่อยู่ (ภูมิลำเนา)</td>
					   <td><input type=text name="address2" size=45 value="<?=$address2?>"></td></tr>
		<tr ID=table1><td>&nbsp;โทรศัพท์</td>
					   <td><input type=text name="tel2" size=15 value="<?=$tel2?>"></td></tr>
		<tr ID=table1><td>&nbsp;ที่อยู่ (ปัจจุบัน)</td>
					   <td><input type=text name="address3" size=45 value="<?=$address3?>"></td></tr>
		<tr ID=table1><td>&nbsp;โทรศัพท์</td>
					   <td><input type=text name="tel3" size=15 value="<?=$tel3?>"></td></tr>
		<tr><td colspan=2><br></td></tr>

		<tr ID=table3><td colspan=2>&nbsp;Contact Information</td></tr>
		<tr ID=table1><td>&nbsp;มือถือ</td>
					   <td><input type=text name="mobile_phone" size=15 value="<?=$mobile_phone?>"></td></tr>
		<tr ID=table1><td>&nbsp;PCT</td>
					   <td><input type=text name="pct" size=15 value="<?=$pct?>"></td></tr>
		<tr ID=table1><td>&nbsp;เพจเจอร์</td>
					   <td><input type=text name="pager" size=15 value="<?=$pager?>"></td></tr>
		<tr ID=table1><td>&nbsp;ICQ</td>
					   <td><input type=text name="icq" size=15 value="<?=$icq?>"></td></tr>
		<tr ID=table1><td>&nbsp;อีเมลล์ <font color=red>*</font></td>
					   <td><input type=text name="email" size=35 value="<?=$email?>"></td></tr>
		<tr ID=table1><td>&nbsp;Website</td>
					   <td><input type=text name="website" size=35 value="<?=$website?>"></td></tr>
		<tr><td colspan=2><br></td></tr>

		<tr ID=table3><td colspan=2>&nbsp;Skill</td></tr>
		<tr ID=table1><td colspan=2><CENTER>
					   <textarea cols=60 name="skill" rows=4><?=$skill?></textarea></CENTER></td></tr>
		<tr><td colspan=2 ID=table1><br></td></tr>
		<tr><td colspan=2 ID=table1><CENTER><input type=submit name=submit value=update>&nbsp;<input type=reset></CENTER></td></tr>
		</table>
		</form>
		</CENTER>
<?
}
			curve_close();
			staffmenu_5();
?>