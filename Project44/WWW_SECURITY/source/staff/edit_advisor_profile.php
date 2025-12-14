<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php";
logo_leftmenu("ISAG (Edit staff profile)"); 
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];
		//select ดูก่อนว่า user คนนี้มีในตารางของอาจารย์ยัง ถ้ามีจะได้ update ถ้ายังไม่มีจะได้ insert
		$query = "select * from advisor_profile where user='$uid' ";
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
		$Error=0;
		if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]))
		{
			$picture=$HTTP_POST_FILES["picture"]["tmp_name"]; //$picture_name=$HTTP_POST_FILES["picture"]["name"];
			$picture_type=$HTTP_POST_FILES["picture"]["type"];  //$picture_size=$HTTP_POST_FILES["picture"]["size"];
		}
		$name=htmlspecialchars(trim($HTTP_POST_VARS["name"]));	
		$position=htmlspecialchars(trim($HTTP_POST_VARS["position"]));	
		$email=htmlspecialchars(trim($HTTP_POST_VARS["email"]));	
		$tel=htmlspecialchars(trim($HTTP_POST_VARS["tel"]));	
		$research=htmlspecialchars(trim($HTTP_POST_VARS["research"]));
		$subject=htmlspecialchars(trim($HTTP_POST_VARS["subject"]));
		$edu=htmlspecialchars(trim($HTTP_POST_VARS["edu"]));

		if (!ereg("^.{5,}$",$name))
			{
				$Error=1;
				print "<font color=red> &nbsp;ตรวจสอบชื่อให้ถูกต้อง</font><br>";
			}
		if (!ereg("^.{5,}$",$position))
			{
				$Error=1;
				print "<font color=red> &nbsp;ตรวจสอบตำแหน่งให้ถูกต้อง</font><br>";
			}
		if (!ereg("^.+@.+\..+$",$email))
			{
				$Error=1;			
				print "<font color=red>&nbsp; ตรวจสอบอีเมลล์ให้ถูกต้อง</font><br>";
			}	
		if (!ereg("^.{5,}$",$research))
			{
				$Error=1;
				print "<font color=red> &nbsp;ตรวจสอบสาขางานวิจัยให้ถูกต้อง</font><br>";
			}
		if (!ereg("^.{5,}$",$subject))
			{
				$Error=1;
				print "<font color=red> &nbsp;ตรวจสอบภาระงานสอนให้ถูกต้อง</font><br>";
			}
		if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]) and ($picture_type != "image/gif") and ($picture_type != "image/pjpeg") and ($picture_type != "image/jpeg"))
			{			
				$Error=1; 
				print "<font color=red>&nbsp;รูปต้องเป็นไฟล์ .gif หรือ .jpg เท่านั้น</font>";
			}		

		//ถ้ามีการ upload รูปและไม่มี error จะ select เอาชื่อรูปเก่าใน database และไปลบไฟเก่า
		 if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]) and ($Error!=1)) 			 
		{			
			$query = "select * from advisor_profile where user='$uid' ";
			$result = mysql_query($query);
			$row = mysql_fetch_array($result);
			$picturestaff = $row['pic'];		
			if ($picturestaff!="")
			{
			if (!unlink("$path_staff_pic$picturestaff"))  echo "<font color='$error_color'>&nbsp;ไม่สามารถลบรูปเดิมทิ้งได้.</font>";
			}					
		}		
		if($Error==0)
		{					
				if (is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]))  // ถ้ามีไฟล์ให้ update ไฟล์ใน database ด้วย
				{ 										
					if ($picture_type=="image/gif") $picturestaff = $uid."_pics.gif";  
					if (($picture_type=="image/pjpeg") or ($picture_type=="image/pjpeg")) $picturestaff = $uid."_pics.jpg";  
					$Error2=0;
					if  (!copy($picture,"$path_staff_pic$picturestaff"))  
					{
					print ("<CENTER><B><font size=2 color='$error_color'>ไม่สามารถ upload file ได้<br></font></B></CENTER> ");
					$Error2=1;
					}
					if($status==1)  //มีข้อมูลอยู่แล้วให้ทำการ update
						$sql_update = "update advisor_profile set
						name='$name',position='$position',email='$email',tel='$tel',pic='$picturestaff',edu='$edu',research='$research',
						subject='$subject',lastupdate=now()  where user='$uid' ";			
					if($status==0) //ยังไม่มีให้ทำการ insert
						$sql_update= "insert into advisor_profile values ('','$name','$position','$email','$tel','$picturestaff','$edu','$research','$subject',now())";
				}
				if (!is_uploaded_file($HTTP_POST_FILES["picture"]["tmp_name"]))  // ถ้าไม่ได้ upload ไฟล์ก็ไม่ต้อง update รูปใน database
				{
					if($status==1)
						$sql_update = "update advisor_profile set
						name='$name',position='$position',email='$email',tel='$tel',edu='$edu',research='$research',
						subject='$subject',lastupdate=now()  where user='$uid' ";						
					if($status==0)
						$sql_update= "insert into advisor_profile values ('','$uid','$name','$position','$email','$tel','','$edu','$research','$subject',now())";
				}
				$result_update=mysql_query($sql_update);			
				if (($result_update) and ($Error2!=1))
				print "<CENTER><B><font size=2>Update ข้อมูลเรียบร้อยแล้ว</font></B></CENTER>";
				else  print "<CENTER><B><font size=2>ไม่สามารถ Update ข้อมูลได้</font></B></CENTER>";
		}		
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($HTTP_POST_VARS["submit"] != "update") or ($Error==0) or ($Error==1)) 
{
		if($HTTP_POST_VARS["submit"]=="update" and $Error==0)
		{
				$query = "select * from advisor_profile where user='$uid' ";
				$result = mysql_query($query);
		}
		if($status==1)	//if this user exist
				list($id,$user,$name,$position,$email,$tel,$pic,$edu,$research,$subject,$lastupdate)=mysql_fetch_row($result);
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
		// ตอนเริ่มต้น มามันได้ แต่พอ update รูปแล้วมันไม่ได้

?>
<center>
<form enctype = "multipart/form-data" method="post" action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>">
<input type=hidden name="MAX_FILE_SIZE" value=30000>
<table cellpadding=1 cellspacing=1 width=98%>
<tr ID=table3><td colspan=3>&nbsp;แก้ไขข้อมูลอาจารย์ (สำหรับอาจารย์เท่านั้น)</td></tr>
		<tr ID=table1><td>&nbsp;ชื่อ - นามสกุล <font color=red>*</font></td>	
					   <td><input type=text  name="name" size=25 value="<?=$name?>"></td>
					   <td rowspan=6><CENTER>


						<? if ($pic!="") {?>
						<img src="<? print "$path_staff_pic$pic"; ?>"  
						<?
						$dimen = GetImageSize("$path_staff_pic$pic"); 
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
		<tr ID=table1><td>&nbsp;ตำแหน่ง <font color=red>*</font></td><td><input type=text name="position" size=25  value="<?=$position?>"></td></tr>
		<tr ID=table1><td colspan=2>&nbsp;ตำแหน่ง เช่น หัวหน้าห้องวิจัย, รองหัวหน้าห้องวิจัย ... </td></tr>
		<tr ID=table1><td>&nbsp;email <font color=red>*</font></td><td><input type=text name="email" size=25 value="<?=$email?>"></td></tr>
		<tr ID=table1><td rowspan=2 valign=top>&nbsp;โทรศัพท์</td><td><input type=text name=tel size=25 value="<?=$tel?>">	</td></tr>
		<tr ID=table1><td>&nbsp;</td></tr>

		<tr ID=table1><td>&nbsp;รูป </td><td colspan=2><input type=file name=picture size=30><br>
			<font color=red>ใช้ Photoshop บีบไฟล์ภาพ  ไม่ให้เกิน <B>30 K</B> ขนาดไม่เกิน <B>150x150 pixels</B></font></td></tr>
		<tr ID=table1><td colspan=3>&nbsp;สาขางานวิจัย <font color=red>*</font> (ไม่ต้องใส่เลขลำดับ  กด enter เพื่อเว้นบรรทัดได้)</td></tr>
		<tr ID=table1><td colspan=3>&nbsp;<textarea cols=70 rows=5 name="research"><?=$research?></textarea></td></tr>
		<tr ID=table1><td colspan=3>&nbsp;ภาระงานสอน <font color=red>*</font> (ไม่ต้องใส่เลขลำดับ  กด enter เพื่อเว้นบรรทัดได้)</td></tr>
		<tr ID=table1><td colspan=3>&nbsp;<textarea cols=70 rows=5 name="subject"><?=$subject?></textarea></td></tr>
		<tr ID=table1><td colspan=3>&nbsp;</td></tr>
		<tr><td colspan=3 ID=table1><CENTER><input type=submit name=submit value=update>&nbsp;<input type=reset></CENTER></td></tr>
		<tr><td colspan=3><br></td></tr>
		</table>
</form>
</center>
<?
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
staffmenu_5();
?>