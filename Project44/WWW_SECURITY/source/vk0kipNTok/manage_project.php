<?php 
include "interface.inc.php"; 
include "admin_accesscontrol.php"; 
logo_adminmenu("Add new user");
curve_open();
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Update")
{
		$Error=0;
		$id = $HTTP_POST_VARS["id"];
		$Name_Thai = htmlspecialchars(trim($HTTP_POST_VARS["Name_Thai"]));
		$Name_Eng = htmlspecialchars(trim($HTTP_POST_VARS["Name_Eng"]));
		$Advisor1 = htmlspecialchars(trim($HTTP_POST_VARS["Advisor1"]));
		$Advisor2 = htmlspecialchars(trim($HTTP_POST_VARS["Advisor2"]));
		$AEmail1 = htmlspecialchars(trim($HTTP_POST_VARS["AEmail1"]));
		$AEmail2 = htmlspecialchars(trim($HTTP_POST_VARS["AEmail2"]));
		$Student1 = htmlspecialchars(trim($HTTP_POST_VARS["Student1"]));
		$Student2 = htmlspecialchars(trim($HTTP_POST_VARS["Student2"]));
		$SEmail1 = htmlspecialchars(trim($HTTP_POST_VARS["SEmail1"]));
		$SEmail2 = htmlspecialchars(trim($HTTP_POST_VARS["SEmail2"]));		

		$Year = htmlspecialchars(trim($HTTP_POST_VARS["Year"]));
		$SID1 = htmlspecialchars(trim($HTTP_POST_VARS["SID1"]));
		$SID2 = htmlspecialchars(trim($HTTP_POST_VARS["SID2"]));
		$Grade = $HTTP_POST_VARS["Grade"];
		$Detail = htmlspecialchars(trim($HTTP_POST_VARS["Detail"]));

		if (is_uploaded_file($HTTP_POST_FILES["Filepdf"]["tmp_name"]))
		{
			$Filepdf=$HTTP_POST_FILES["Filepdf"]["tmp_name"]; 			
			$Filepdf_name=$HTTP_POST_FILES["Filepdf"]["name"];
			$Filepdf_type=$HTTP_POST_FILES["Filepdf"]["type"];
		}	
		//--------------------------------------------------------------------------------------------------
		print "<font color='$error_color'><CENTER>";
		if (!ereg("^.{4,}$",$Name_Thai))
			{
				$Error=1;				
				print "ชื่อโครงงานวิจัยภาษาไทยไม่ถูกต้อง<br>";
			}
		if (!ereg("^.{3,}$",$Name_Eng))
			{
				$Error=1;
				print "ชื่อโครงงานวิจัยภาษาอังกฤษไม่ถูกต้อง<BR>";
			}
		if (!ereg("^.+$",$Advisor1))
			{
				$Error=1;			
				print "ใส่ชื่ออาจารย์ที่ปรึกษาด้วย<BR>";
			}
		if ((!ereg("^.+$",$Advisor2)) and ($Advisor2!=""))
			{
				$Error=1;				
				print "ชื่ออาจารย์ที่ปรึกษาท่านที่สองไม่ถูกต้อง<BR>";
			}
		if (!ereg("^.+@.+\..+$",$AEmail1))
			{
				$Error=1;
				print "Email Address ของอาจารย์ท่านแรกไม่ถูกต้อง<BR>";
			}
		if ((!ereg("^.+@.+\..+$",$AEmail2)) and ($Advisor2!=""))
			{
				$Error=1;			
				print "Email Address ของอาจารย์ท่านที่สองไม่ถูกต้อง<BR>";
			}
		if (!ereg("^.+$",$Student1))
			{
				$Error=1;			
				print "ชื่อผู้จัดทำคนแรกไม่ถูกต้อง<BR>";
			}
		if ((!ereg("^.+$",$Student2)) and ($Student2!=""))
			{
				$Error=1;			
				print "ชื่อผู้จัดทำคนที่สองไม่ถูกต้อง<BR>";
			}
		if (!ereg("^[0-9]{8}$",$SID1))
			{
				$Error=1;			
				print "รหัสนักศึกษาคนแรกไม่ถูกต้อง<BR>";
			}
		if ((!ereg("^[0-9]{8}$",$SID2)) and ($Student2!=""))
			{
				$Error=1;			
				print "รหัสนักศึกษาคนที่สองไม่ถูกต้อง<BR>";
			}
		if (!ereg("^.+@.+\..+$",$SEmail1))
			{
				$Error=1;			
				print "Email Address นักศึกษาคนแรกไม่ถูกต้อง<BR>";
			}
		if ((!ereg("^.+@.+\..+$",$SEmail2)) and ($Student2!=""))
			{
				$Error=1;			
				print "Email Address นักศึกษาคนที่สองไม่ถูกต้อง<BR>";
			}
		if (!ereg(".+",$Detail))
			{
				$Error=1;
				print "บทคัดย่อไม่ถูกต้อง<BR>";
			}	
		if (!ereg("^[0-9]{4}$",$Year))
			{
				$Error=1;				
				print "ปีการศึกษาไม่ถูกต้อง<BR>";
			}
	  if (($Grade!=1) and ($Grade!=2) and ($Grade!=3))
		  {
				$Error=1;
				print "ชั้นปีไม่ถูกต้อง<BR>";
		  }
	  if (($Filepdf != "") and ($Filepdf_type!="application/x-zip-compressed"))
		{  //if (!ereg("^.+\.pdf$",$Filepdf_name))								
						$Error=1;			
						print "ชื่อไฟล์ไม่ถูกต้อง (zip) เท่านั้น<BR>";		
						print $Filepdf_type;
						
		}
		print "</CENTER></font>";

		//------------------------------------------------------>>
		if ($Error==0)  //เช็คก่อนนะครับว่า  ถ้ายังไ่ม่มีก็ให้ใส่ไป แต่ถ้ามีแล้วต้องลบตัวเก่าแล้วค่อยใส่เข้าไป
		{
				//มีการ upload ไฟล์ ให้ไปลบรูปเก่าก่อน แล้ว copy ไฟล์ แล้ว sql update  แบบมีรูป
				
				if (is_uploaded_file($HTTP_POST_FILES["Filepdf"]["tmp_name"]))
				{
			//**************************************
					$sql="select Filepdf_name from add_project where IDProject='$id'";
					$result = mysql_query($sql);
					if(mysql_num_rows($result)==1)
					{
						$row=mysql_fetch_array($result);										
						$filepdf=$row['Filepdf_name'];	
						if($filepdf!="")
						{
							// delete old and add new file
							if (!unlink("$project_dir/$filepdf"))  
								echo "<font color='$error_color'>&nbsp;ไม่สามารถลบไฟล์เดิมทิ้งได้.</font>";				
						}
					}
					else
					{
						print "<b><center>เกิดข้อผิดพลาดขึ้น ติดต่อ webmaster ครับ</center></b>";
					}
			//**************************************
					$Filename = "project".$Year."_".time().substr($uid,0,1).".zip";
					$Error2=0;
					if (!copy($Filepdf,"$project_dir/$Filename")) 
					{
						print ("<center><b>ไม่สามารถ upload file เข้า Server ได้</b></center><br>"); 
						$Error2=1;
					}
					$sql_update = "update add_project set 
					Name_Thai='$Name_Thai', Name_Eng='$Name_Eng', Grade='$Grade', Year='$Year', Advisor1='$Advisor1', AEmail1='$AEmail1', Advisor2='$Advisor2', AEmail2='$AEmail2', Student1='$Student1', SEmail1='$SEmail1', SID1='$SID1', Student2='$Student2', SEmail2='$SEmail2', SID2='$SID2', Detail='$Detail', Filepdf_name='$Filename' where IDProject='$id' ";
				}
				//ไ่ม่มีการ upload ไฟล์ ก็ sql update แบบไม่มีรูป
				if (!is_uploaded_file($HTTP_POST_FILES["Filepdf"]["tmp_name"]))
				{
					$sql_update = "update add_project set 
					Name_Thai='$Name_Thai', Name_Eng='$Name_Eng', Grade='$Grade', Year='$Year', Advisor1='$Advisor1', AEmail1='$AEmail1', Advisor2='$Advisor2', AEmail2='$AEmail2', Student1='$Student1', SEmail1='$SEmail1', SID1='$SID1', Student2='$Student2', SEmail2='$SEmail2', SID2='$SID2', Detail='$Detail' where IDProject='$id' ";
				}

			$result_update=mysql_query($sql_update);			
			if ($result_update)			
			{
				redirect("../vk0kipNTok/");
				exit;
			}			
		}
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS["id"]) or $Error==1 )
{
		$id = $HTTP_GET_VARS["id"];
		//ถ้ามี error แสดงว่ามาจากฟอร์ม ดังนั้นจึงใช้ post แทน แต่ข้างบนมาจาก อันที select ตอน list
		if($Error==1) $id = $HTTP_POST_VARS["id"];
		$query = "select * from add_project where IDProject='$id' ";
		$result = mysql_query($query);
		if(mysql_num_rows($result)==1)
		{
		list($IDProject, $IDUser, $Name_Thai, $Name_Eng, $Grade, $Year, $Advisor1, $AEmail1, $Advisor2, $AEmail2, $Student1, $SEmail1, $SID1, $Student2, $SEmail2, $SID2, $Detail, $Filepdf_name, $Daypost)=mysql_fetch_row($result);
?>
	<CENTER>
	<form enctype = "multipart/form-data" method=post action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>">
	<input type="hidden" name="MAX_FILE_SIZE" value="10000000">
	<input type="hidden" name="id" value="<?=$id?>">
	<table cellpadding=2 cellspacing=1 width=99% >	
	
		<TR><TD colspan=6 ID=table3><CENTER>แก้ไขข้อมูลโปรเจค</CENTER></TD></TR>
		<TR ID=table1>	<TD> 		
		&nbsp; ชื่อโครงงานวิจัย (Thai)</TD>
				<TD colspan=3> 							
				&nbsp;<input type=text  size=37 name="Name_Thai" value="<?=stripslashes($Name_Thai)?>"></TD>
				<TD> &nbsp; ระดับ</TD>
				<TD>
					<select name="Grade">
						<option value="1" <? if ($Grade=="1") print "SELECTED"; ?>>ปริญญาตรี</option>
						<option value="2"  <? if ($Grade=="2") print "SELECTED"; ?>>ปริญญาโท</option> 
						<option value="3"  <? if ($Grade=="3") print "SELECTED"; ?>>ปริญญาเอก</option>
					</select>
				</TD>
		</TR>

		<TR ID=table1>
			<TD width=20%> &nbsp; ชื่อโครงงานวิจัย (Eng)</TD>
			<TD colspan=3> 
			&nbsp;<input type=text  size=37 name="Name_Eng" value="<?=stripslashes($Name_Eng)?>"></TD>
			<TD> &nbsp; ปีการศึกษา พ.ศ.</TD>
			<TD>										
			&nbsp;<input type=text size=4 maxlength=4 name="Year" value="<?=stripslashes($Year)?>"></TD>
		</TR>

		<TR ID=table1>
				<TD rowspan=2> &nbsp; อาจารย์ที่ปรึกษา </TD>
				<TD colspan=3>																
				&nbsp;<input type=text size=20 name="Advisor1" value="<? if(($Advisor1=="") and ($Preview!="preview")) print ("อาจารย์ธนา หงษ์สุวรรณ"); else print stripslashes($Advisor1); ?>"></TD>			
				<TD> &nbsp; E-mail</TD><TD>													
				&nbsp;<input type=text size=20 name="AEmail1"  value="<? if(($AEmail1=="") and ($Preview!="preview")) print ("thana@ce.kmitl.ac.th"); else print stripslashes($AEmail1); ?>"></TD>
		</TR>

		<TR ID=table1>
				<TD colspan=3>													
				&nbsp;<input type=text size=20 name="Advisor2" value="<? if(($Advisor2=="") and ($Preview!="preview")) print ("อาจารย์อัครเดช วัชระภูพงษ์"); else print stripslashes($Advisor2); ?>"></TD>
				<TD> &nbsp; E-mail</TD><TD>													
				&nbsp;<input type=text size=20 name="AEmail2" 
				value="<? if(($AEmail2=="") and ($Preview!="preview")) print ("adek@ce.kmitl.ac.th"); else print stripslashes($AEmail2); ?>"></TD>
		</TR>
		
		<TR ID=table1>
				<TD  rowspan=2> &nbsp; ผู้จัดทำโครงงานวิจัย<br> &nbsp; (ไม่ต้องใส่เลขลำดับ) </TD>
				<TD>															
				&nbsp;<input type=text size=20 name="Student1" value="<?=stripslashes($Student1)?>"></TD>
				<TD> &nbsp; รหัส</TD><TD>																	
				&nbsp;<input type=text size=9 maxlength=8 name="SID1" value="<?=stripslashes($SID1)?>"></TD>
				<TD> &nbsp; E-mail</TD><TD>													
				&nbsp;<input type=text size=20 name="SEmail1" value="<?=stripslashes($SEmail1)?>"></TD>
		</TR>

		<TR ID=table1>
				<TD>													
				&nbsp;<input type=text size=20 name="Student2" value="<?=stripslashes($Student2)?>"></TD>
				<TD> &nbsp; รหัส</TD><TD>											
				&nbsp;<input type=text size=9 maxlength=8 name="SID2" value="<?=stripslashes($SID2)?>"></TD>
				<TD> &nbsp; E-mail</TD><TD>																	
				&nbsp;<input type=text size=20 name="SEmail2" value="<?=stripslashes($SEmail2)?>"></TD>
		</TR>

		<TR ID=table1>
				<TD> &nbsp; บทคัดย่อ (ภาษาไทย)</TD>
				<TD colspan=5>
				&nbsp;<textarea cols=75 rows=7 name="Detail"><?=stripslashes($Detail)?></textarea></TD>
		</TR>		
		<TR ID=table1>
				<TD> &nbsp; ไฟล์เนื้อหา PDF<br> &nbsp; (ถ้าไม่มียังไม่ต้องใส่) </TD><TD colspan=5>													
				&nbsp;<input type=file size=20 name="Filepdf"><br>&nbsp;<? if($Filepdf_name!="") print "<font color=blue> ไฟล์โปรเจคเดิมคือ <b>(".$Filepdf_name.")</b></font>"; else print "<font color=blue>* โปรเจคนี้ยังไม่ได้ Upload ไฟล์ ให้รวม pdf แต่ละบท ทำเป็นไฟล์ zip 1 ไฟล์";  ?></TD>
		</TR>
		<TR ID=table1><TD colspan=6><CENTER>
					<input type="submit"  name="submit" value="Update">
</CENTER></TD></TR>
		<TR ID=table1><TD colspan=6>&nbsp;</TD></TR>
	</table>
	
	</form>
	</CENTER>
<?
		}
		else
		{
				print "<center><font size=3><b>ไม่พบข้อมูลของโปรเจคนี้</b></font></center>";
		}
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if($HTTP_POST_VARS["submit"]=="Delete selected project")
{
		$link=$HTTP_POST_VARS["link"];
		if (count($link)==0)  //เช็คว่าได้ทำการ check ที่จะลบหรือไม่
			print "<center><font size=3 color='$error_color'><b>กรุณาเลือก Project ที่ต้องการจะลบ</b></font></center><br> ";
		else //ถ้ามีการเช็ค
		{
			foreach($link as $key => $val)  //เวลาลบต้องลบทั้งสองตารางด้วย
			{				
					//ลบไฟล์ทิ้งก่อนแล้วค่อยเข้าไปลบโปรเจคจริงๆ
					$query = "select * from add_project where IDProject='$val' ";
					$result = mysql_query($query);
					$row = mysql_fetch_array($result);
					$Filepdf_name = $row['Filepdf_name'];
					if ($Filepdf_name!="")
					{
						if (!unlink("$project_dir/$Filepdf_name"))  echo "<font size=3><center>ไม่สามารถลบไฟล์โปรเจค $val ทิ้งได้</center></font>";
					}			
					//เข้าไปลบโปรเจคจริงๆ
					$sql2="delete from add_project where IDProject='$val' "; //ลบโปรเจคนี้ในตาราง add_project
					$result2 = mysql_query($sql2);
					//--------------------------------------------------------------------------------------------
					if($result2)
							print "<font size=3><CENTER> ลบโปรเจค <B> $val </B> เรียบร้อยแล้ว </CENTER></font>";
			}
		}
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(!isset($HTTP_GET_VARS["id"]) and !isset($HTTP_POST_VARS["submit"]))
{
		$sql = "select IDProject,Year,Name_Eng from add_project order by Year desc";
		$result = mysql_query($sql);
		if(($result) and mysql_num_rows($result)>0)
		{
?>
			<form action="<?=$HTTP_SERVER_VARS["PHP_SELF"]?>" method="post">
<?
			print "<center><font size=3><b>แก้ไขข้อมูลโปรเจค</b></font><br>";
			print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
			print "<tr ID=table3><td colspan=5>&nbsp;</td></tr>";
			while ($row=mysql_fetch_array($result))
				{
						$IDProject=$row['IDProject'];
						$Year=$row['Year'];
						$Name_Eng=$row['Name_Eng'];
						print "<tr ID=table1><td><input type='checkbox' name='link[]' value='$IDProject'>&nbsp;$Year</td><td>&nbsp;";
						print "<a href='".$HTTP_SERVER_VARS["PHP_SELF"]."?id=$IDProject'>$Name_Eng</a></td></tr>";
				}
			print "</table><br>";
?>
			<input type='submit' name='submit' value='Delete selected project' onclick="return confirm('คุณต้องการที่จะลบ Project ที่เลือกออกจากฐานข้อมูล?')"></center>
<?
			print "</form>";
		}
		else
		{
			print "<center><font size=3><B>ไม่สามารถ Query ข้อมูลจากฐานข้อมูลได้หรือ ไม่พบข้อมูลโปรเจคในฐานข้อมูล</B></font></center>";
		}
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close();
empty_4();
?>
