<?php 
include "interface.inc.php";
include "accesscontrol.php";
include "fn.php"; 
include "outputlib.php";
logo_noleftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];
 //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($HTTP_POST_VARS["submit"]=="preview") or ($HTTP_POST_VARS["submit"]=="Add"))
{
		$Error=0;
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
		}
		print "</CENTER></font>";
		//--------------------------------------------------------------------------------------------------
		if (($HTTP_POST_VARS["submit"]=="Add") and ($Error==0))
		{
			if ($Filepdf != "") 
			{ 
				$Filename = "project".$Year."_".time().substr($uid,0,1).".zip";
				if (!copy($Filepdf,"$project_dir/$Filename")) 
				{
					print ("<center><b>ไม่สามารถ upload file เข้า Server ได้</b></center><br>"); 
				}
			}
			else
				$Filename=="";
			$sql_update = "insert into add_project values
			('','$uid','$Name_Thai','$Name_Eng','$Grade','$Year','$Advisor1','$AEmail1','$Advisor2','$AEmail2',			
			'$Student1','$SEmail1','$SID1','$Student2','$SEmail2','$SID2','$Detail','$Filename',now() ) ";					
			$result_update=mysql_query($sql_update);			
			if ($result_update)			
			redirect("../staff/isagstaff.php");
			exit;
		}
		//--------------------------------------------------------------------------------------------------
		if (($HTTP_POST_VARS["submit"]=="preview") and ($Error==0))
		{		
			print "<font size=3><br><CENTER><b>โครงงานวิจัยปีการศึกษา $Year </b></CENTER></font>";
		?>	<center><br>
				<table cellpadding=0 cellspacing=0 width=98% border=0>								
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p1.gif"></td>
										<td width=100% background="<?=$path_web_img?>p2.gif" width=1 height=15></td>
										<td width=15 height=15><img src="<?=$path_web_img?>p3.gif"></td>
								</tr></table>
								
								<table cellpadding=0 cellspacing=0 width=98% border=0>
								<tr><td width=15 height=1 background="<?=$path_web_img?>p4.gif"><img src="<?=$path_web_img?>p4.gif"></td>
								<td width=100%  bgcolor="#EFEFEF"> 
								<table cellpadding=2 cellspacing=0 width=99% border=0>			
<?				
				print "<tr><td><CENTER>&nbsp;<b><font size=3>$Name_Thai <br> $Name_Eng</font></b></CENTER></td></tr>"; 
					print "<tr><td bgcolor=\"FFFFFF\">&nbsp;<b>";
					if ($Grade==1) print "ระดับปริญญาตรี";
					else if($Grade==2) print "ระดับปริญญาโท";
					else if($Grade==3) print "ระดับปริญญาเอก";
					print "</b></td></tr>"; 
					print "<tr><td>&nbsp;<B>อาจารย์ที่ปรึกษา</B></td></tr>";
					print "<tr><td bgcolor=\"#FFFFFF\"> &nbsp;$Advisor1 $AEmail1 </td></tr>";
					if($Advisor2!="") print "<tr><td bgcolor=\"#FFFFFF\">&nbsp;$Advisor2 $AEmail2 </td></tr>"; 
					print "<tr><td>&nbsp;<B>ผู้รับผิดชอบโครงงาน</B></td></tr>";
					print "<tr><td bgcolor=\"#FFFFFF\"> &nbsp;$Student1 $SID1 </td></tr>";
					if($Student2!="") print "<tr><td bgcolor=\"#FFFFFF\">&nbsp;$Student2 $SID2 </td></tr>"; 
					print "<tr><td>&nbsp;<B>รายละเอียดโครงงาน</B></td></tr>";
					print "<tr><td bgcolor=\"#FFFFFF\"> &nbsp;";  print_output($Detail); print "</td></tr>";
					if($Filepdf != "")
					print "<tr><td>&nbsp;<img src=\"$path_web_img"."pdf.gif\"> <B> ดาวน์โหลดไฟล์</B>  $Filepdf_name <br><font color='red'>(เมื่อ Preview แล้ว ถ้าต้องการ add ต้องเลือกชื่อไฟล์ pdf อีกครั้ง ) </font></B></td></tr>"; 
					if($Filepdf=="")
					print "<tr><td>&nbsp;<img src=\"$path_web_img"."pdf.gif\"> <B> ดาวน์โหลดไฟล์</B> <font color='red'>Comming Soon</font></td></tr>"; 
					print "<tr><td bgcolor=\"#FFFFFF\">&nbsp;<b>Last Update</b>"; print date(" d M Y , H:i");
					 print "</td></tr>";  //<img src=\"$path_web_img"."bullet.gif\" height=10 width=10>
?>			
			</table>
					</td>
								<td width=15 height=1 background="<?=$path_web_img?>p5.gif"><img src="<?=$path_web_img?>p5.gif"></td>
								</tr></table>

								<table cellpadding=0 cellspacing=0 width=98% border=0>
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p6.gif"></td>
										<td width=100% background="<?=$path_web_img?>p7.gif" width=1 height=15>&nbsp;</td>
										<td width=15 height=15><img src="<?=$path_web_img?>p8.gif"></td>
								</tr>
								</table> 
			</center>
		<?
		}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($Error==1) or ($HTTP_POST_VARS["submit"]=="preview") or (($HTTP_POST_VARS["submit"]!="preview") and ($HTTP_POST_VARS["submit"]!="Add"))) 
{
?>	
	<CENTER>
	<form enctype = "multipart/form-data" method=post action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>">
	<input type="hidden" name="MAX_FILE_SIZE" value="10000000">
	<table cellpadding=2 cellspacing=1 width=99% >	
	
		<TR><TD colspan=6 ID=table3><CENTER>เพิ่มโครงงานวิจัย</CENTER></TD></TR>
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
				&nbsp;<input type=file size=20 name="Filepdf"> ให้รวมไฟล์ pdf แต่ละบท zip เป็น 1 ไฟล์</TD>
		</TR>
		<TR ID=table1><TD colspan=6><CENTER>
					<input type="submit"  name="submit" value="preview">
					<input type="submit" name="submit" value="Add" ></CENTER></TD></TR>
		<TR ID=table1><TD colspan=6>&nbsp;</TD></TR>
	</table>
	
	</form>
	</CENTER>
<?
}
curve_close();
staffmenu_4();
?>
<!--------------------------------------------------------------------------------------------------------------------------------------------------------------

	<!--  if($Filepdf_name) {
				<TR ID=table1><TD>&nbsp;ไฟล์ประกอบ</TD>
									  <TD colspan=3><B>  print "$Filename ( ".getsize($Filepdf)." )";  
									  <a href=$projecttemp/ echo $Filename>Download</a></B>
				 } -->
<!--
ต้อง addslashes และ strip ทั้งหมด
-->










