<?php 
include "interface.inc.php"; 
 include "outputlib.php"; 
 include "db.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
$PHP_SELF=$HTTP_SERVER_VARS["PHP_SELF"];
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(!isset($HTTP_GET_VARS['type']) and !isset($HTTP_GET_VARS['id']))  
{
		//อันนี้เข้ามาครั้งแรก ยังไม่มีอะไร ถ้าไม่มีอะไรให้เซ้ต type เป็นอาจารย์ไปเลย
		$type=1;
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(!isset($HTTP_GET_VARS['id']) and isset($HTTP_GET_VARS['ida']) and !isset($HTTP_GET_VARS['type']))
{
		//อันนี้เลือกคนแล้วว่าจะดู อาจารย์คนไหน
		$id=$HTTP_GET_VARS['ida'];
		$sql1 = "select * from advisor_profile where id='$id' ";
		$result = mysql_query($sql1);
		if (($result) and (mysql_num_rows($result) >0))
			{												
							$row=mysql_fetch_array($result);										
							$name=stripslashes($row['name']);
							$position=stripslashes($row['position']);
							$email=$row['email'];
							$tel=$row['tel'];
							$Picturestaff=$row['pic'];
							$edu=$row['edu'];
							$research=$row['research'];
							$subject=$row['subject'];

							print "<font size=3><b>บุคลากรห้องวิจัย</b></font><br><br>"; 

							print "<table cellpadding=2 cellspacing=0 border=0 width=100%  bgcolor='$bg_staff_profile'>";				
							print "<tr ID=table3><td colspan=3>&nbsp;&nbsp;$name</td></tr>";
												
							if ($Picturestaff!="") 
								{ 
									print "<tr ID=w1><td rowspan=5>&nbsp;<img src='$path_staff_pic$Picturestaff' ";

									$dimen = GetImageSize("$path_staff_pic$Picturestaff"); 
									if (($dimen[0] < 150) and ($dimen[1] <150)) 
											print " width=$dimen[0] height=$dimen[1] ";
									if (($dimen[0] > 150) and ($dimen[1] >150))
											print " width=150 ";
									if (($dimen[0] < 150) and ($dimen[1] >150)) 
											print " height=150 ";
									if (($dimen[0] > 150) and ($dimen[1] <150)) 
											print " width =150 "; 																								
				print "border=0>&nbsp;</td><td colspan=2>&nbsp;</td></tr>"; 
								}
							else							
								{ ?>
								<tr ID=w1><td rowspan=5 width=25%>&nbsp;&nbsp;</td><td colspan=2>&nbsp;</td></tr>
																<? 
								}
							if($position!="")
								print "<tr ID=w1><td>&nbsp;<B>ตำแหน่ง</B></td><td>&nbsp; $position</td></tr>";
								else print "<tr ID=w1><td>&nbsp;</td><td>&nbsp;</td></tr>";
							if($tel!="")
								print "<tr ID=w1><td>&nbsp;<B>Tel</B></td><td>&nbsp; $tel</td></tr>";
							else print "<tr ID=w1><td>&nbsp;</td><td>&nbsp;</td></tr>";
							if($email!="")
									print "<tr ID=w1><td>&nbsp;<B>Email</B></td><td>&nbsp; $email</td></tr>";					
							else print "<tr ID=w1><td>&nbsp;</td><td>&nbsp;</td></tr>";

							print "<tr ID=w1><td colspan=2>&nbsp; <br><br></td></tr>";
							
							
							//if($Website!="")
							//	print "<tr ID=w1><td>&nbsp;<B>Website</B></td><td  colspan=2>&nbsp; $Website</td></tr>";

							if($edu!="")
							{
								print "<tr ID=w2><td colspan=3>&nbsp; <B>การศึกษา</B> </td></tr>";												
								print "<tr ID=w1><td colspan=3>";
								print_output($edu); 
								print "</td></tr>";
								print "<tr ID=w1><td colspan=3>&nbsp;</td></tr>";
							}							
							if($research!="")
							{
								print "<tr ID=w2><td colspan=3>&nbsp; <B>สาขางานวิจัย</B> </td></tr>";												
								print "<tr ID=w1><td colspan=3>";
								print_output($research); 
								print "</td></tr>";
								print "<tr ID=w1><td colspan=3>&nbsp;</td></tr>";
							}			
							if($subject!="")
							{
								print "<tr ID=w2><td colspan=3>&nbsp; <B>วิชาที่สอน</B> </td></tr>";												
								print "<tr ID=w1><td colspan=3>";
								print_output($subject); 
								print "</td></tr>";
								print "<tr ID=w1><td colspan=3>&nbsp;</td></tr>";
							}			
						print "</table>";
			}
	else
			{
				print "ไม่พบข้อมูลอาจารย์ ";
			}		
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS['id']) and !isset($HTTP_GET_VARS['ida']) and !isset($HTTP_GET_VARS['type']))
{
		//อันนี้เลือกคนแล้วว่าจะดูคนไหน
		$id=$HTTP_GET_VARS['id'];
		$sql1 = "select * from staff_profile where ID='$id' ";
		$result = mysql_query($sql1);
		if (($result) and (mysql_num_rows($result) >0))
			{												
						$row=mysql_fetch_array($result);										
							$Name=stripslashes($row['Name']);
							$Nickname=stripslashes($row['Nickname']);
							$Student_ID=$row['Student_ID'];
							$Date_birth=$row['Date_birth'];
							$Month_birth=$row['Month_birth'];
							$Year_birth=$row['Year_birth'];
							//$Generation=$row['Generation'];
							$Type=$row['Type'];
							$Picturestaff=$row['Picturestaff'];
							$year_project=$row['year_project'];
							$Address1=stripslashes($row['Address1']);
							$Tel1=stripslashes($row['Tel1']);
							$Position=stripslashes($row['Position']);
							$Address2=stripslashes($row['Address2']);
							$Tel2=stripslashes($row['Tel2']);
							$Address3=stripslashes($row['Address3']);
							$Tel3=stripslashes($row['Tel3']);
							$Mobile_phone=stripslashes($row['Mobile_phone']);
							$PCT=stripslashes($row['PCT']);
							$Pager=stripslashes($row['Pager']);
							$ICQ=$row['ICQ'];
							$Email=stripslashes($row['Email']);
							$Website=stripslashes($row['Website']);
							$Skill=stripslashes($row['Skill']);
							
							if($Type==1) print "<font size=3><b>อาจารย์ประจำห้องวิจัย</b></font><br><br>"; 
							if($Type==3) print "<font size=3><b>นักศึกษาปริญญาตรี ปีการศึกษา $year_project</b></font><br><br>"; 
							if($Type==4) print "<font size=3><b>นักศึกษาปริญญาโท</b></font><br><br>"; 
							

							print "<table cellpadding=2 cellspacing=0 border=0 width=100%  bgcolor='$bg_staff_profile'>";

						

					print "<tr ID=table3><td colspan=3>&nbsp;&nbsp;$Name</td></tr>";
												
							if ($Picturestaff!="") 
								{ 
									print "<tr ID=w1><td rowspan=3>&nbsp;<img src='$path_staff_pic$Picturestaff' ";

									$dimen = GetImageSize("$path_staff_pic$Picturestaff"); 
									if (($dimen[0] < 150) and ($dimen[1] <150)) 
											print " width=$dimen[0] height=$dimen[1] ";
									if (($dimen[0] > 150) and ($dimen[1] >150))
											print " width=150 ";
									if (($dimen[0] < 150) and ($dimen[1] >150)) 
											print " height=150 ";
									if (($dimen[0] > 150) and ($dimen[1] <150)) 
											print " width =150 "; 																								
											print "border=0>&nbsp;</td><td>&nbsp;<B>Nickname</B></td><td>&nbsp;$Nickname</td></tr>"; 
								}
							else							
								{ ?>
								<tr ID=w1><td rowspan=3 width=25%>&nbsp;&nbsp;</td><td>&nbsp;<B>Nickname</B></td><td>&nbsp;
							<?=$Nickname?></td></tr>
																<? 
								}
							print "<tr ID=w1><td>&nbsp;<B>Birthday</B></td><td>&nbsp;$Date_birth/$Month_birth/$Year_birth</td></tr>";							
							print "<tr ID=w1><td colspan=2>&nbsp;<br><br><br><br></td></tr>";

							if($Address1!="")
								print "<tr ID=w1><td>&nbsp;<B>ที่อยู่ที่ทำงาน</B></td><td colspan=2>&nbsp;$Address1  โทร $Tel1 ตำแหน่ง $Position</td></tr>";
							if($Address2!="")
								print "<tr ID=w1><td>&nbsp;<B>ที่อยู่ภูมิลำเนา</B></td><td  colspan=2>&nbsp;$Address2  โทร $Tel2</td></tr>";
							if($Address3!="")
								print "<tr ID=w1><td>&nbsp;<B>ที่อยู่ปัจจุบัน</B></td><td  colspan=2>&nbsp;$Address3 โทร $Tel3</td></tr>";

							if($Mobile_phone!="" or $PCT!="" or $Pager!="" or $ICQ!="" or $Email!="" or $Website!="")
								{
									print "<tr ID=w2><td colspan=3>&nbsp;<B>Contact Information</B></td></tr>";
									print "<tr ID=w1><td colspan=3>&nbsp;</td></tr>";
								}
							if($Mobile_phone!="")
								print "<tr ID=w1><td>&nbsp;<B>Mobile phone</B></td><td  colspan=2>&nbsp; $Mobile_phone</td></tr>";
							if($PCT!="")
									print "<tr ID=w1><td>&nbsp;<B>PCT</B></td><td  colspan=2>&nbsp; $PCT</td></tr>";
							if($Pager!="")
									print "<tr ID=w1><td>&nbsp;<B>Pager</B></td><td  colspan=2>&nbsp; $Pager</td></tr>";
							if($ICQ!="")
									print "<tr ID=w1><td>&nbsp;<B>ICQ</B></td><td  colspan=2>&nbsp; $ICQ</td></tr>";
							if($Email!="")
									print "<tr ID=w1><td>&nbsp;<B>Email</B></td><td  colspan=2>&nbsp; $Email</td></tr>";
							if($Website!="")
									print "<tr ID=w1><td>&nbsp;<B>Website</B></td><td  colspan=2>&nbsp; $Website</td></tr>";

							if($Skill!="")
							{
								print "<tr ID=w2><td colspan=3>&nbsp; <B>Skill</B> </td></tr>";												
								print "<tr ID=w1><td colspan=3>&nbsp;</td></tr>";
								print "<tr ID=w1><td colspan=3>";
								print_output($Skill); 
								print "</td></tr>";
							}								
						print "</table>";
			}
	else
			{
				print "ไม่พบข้อมูล ";
			}		
}
if((isset($HTTP_GET_VARS['type']) or isset($type)) and !isset($HTTP_GET_VARS['id']) and !isset($HTTP_GET_VARS['ida'])) 
{		
		//เลือก type แล้วให้ list รายชื่อนักศึกษาตาม type นั้น
		 if(isset($HTTP_GET_VARS['type'])) //ต้องเอาไว้จะได้รู้ว่า get มาหรือเซ็ตเอง
			 $type=$HTTP_GET_VARS['type'];

		// ถ้า type  อาจารย์
		if($type==1)
		{
				$sql = "select id,name,position from advisor_profile";
				$result = mysql_query($sql);
				if(($result) and (mysql_num_rows($result)>0))
				{
						print "<font size=3><b>อาจารย์ประจำห้องวิจัย</b></font><br><br>";
						print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
						print "<tr ID=table3><td colspan=3>&nbsp;</td></tr>";
						while ($row=mysql_fetch_array($result))
										{
												$ID=$row['id'];											
												$Name=$row['name'];											
												$Position=$row['position'];																									

												print "<tr ID=table1><td>&nbsp; <a href='$PHP_SELF?ida=$ID'>$Name</a> </td><td>&nbsp; $Position</td></tr>";
										}	
						print "</table>";
				}
		}
		elseif($type==4)
		{
			$sql1 = "select ID,Name,Nickname,Email from staff_profile where Type='$type' ";
			$result = mysql_query($sql1);
			if (($result) and (mysql_num_rows($result) >0))
			{						
						print "<font size=3><b>นักศึกษาปริญญาโท</b></font><br><br>";
						print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
						print "<tr ID=table3><td colspan=3>&nbsp;</td></tr>";
						while ($row=mysql_fetch_array($result))
										{
												$ID=$row['ID'];											
												$Name=$row['Name'];											
												$Nickname=$row['Nickname'];																									
												$Email=$row['Email'];
												print "<tr ID=table1><td>&nbsp; <a href='$PHP_SELF?id=$ID'>$Name</a> </td><td> &nbsp;$Nickname </td><td>&nbsp; $Email</td></tr>";
										}	
						print "</table>";
			}
		}
		// ถ้า type เป็นปีของนักศึกษาปริญญาตรี
		else
		{
				$sql = "select ID,Name,Nickname,Email from staff_profile where year_project='$type' and type=3";
				$result =mysql_query($sql);
				if (($result) and (mysql_num_rows($result) >0))
				{
						print "<font size=3><b>นักศึกษาปริญญาตรี ปีการศึกษา $type</b></font><br><br>";
						print "<table cellpadding=2 cellspacing=1 border=0 width=85%>";
						print "<tr ID=table3><td colspan=3>&nbsp;</td></tr>";	
						while ($row=mysql_fetch_array($result))
										{
												$ID=$row['ID'];											
												$Name=$row['Name'];											
												$Nickname=$row['Nickname'];																									
												$Email=$row['Email'];
												print "<tr ID=table1><td>&nbsp; <a href='$PHP_SELF?id=$ID'>$Name</a> </td><td> &nbsp;$Nickname </td><td>&nbsp; $Email</td></tr>";
										}	
						print "</table>";
				}
				else
				{
					 print "<center>ไม่พบข้อมูล</center>";
				}
		}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close("</center>");				
other_5("staff_member_menu");
?>													

