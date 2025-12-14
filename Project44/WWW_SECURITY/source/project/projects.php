<?php 
include "interface.inc.php";
include "outputlib.php";
include "db.php";
include "fn.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($HTTP_GET_VARS['id']) and !isset($HTTP_GET_VARS['Year']))
{
			$id=$HTTP_GET_VARS['id'];
			$sql1 = "select IDUser,Name_Thai,Name_Eng,Grade,Year,Advisor1,AEmail1,Advisor2,AEmail2,Student1,SID1,SEmail1,Student2,SID2,SEmail2,Detail,Filepdf_name,date_format(Daypost,'%e %b %Y, %H:%i') AS nowdate from add_project where IDProject='$id' ";
			$result = mysql_query($sql1);
			if (($result) and (mysql_num_rows($result) ==1))
			{
												$row=mysql_fetch_array($result);										
												$IDUser=$row['IDUser'];											
												$Name_Thai=stripslashes($row['Name_Thai']);											
												$Name_Eng=stripslashes($row['Name_Eng']);		
												$Grade=$row['Grade'];
												$Year=$row['Year'];
												$Advisor1=stripslashes($row['Advisor1']);
												$AEmail1=$row['AEmail1'];
												$Advisor2=stripslashes($row['Advisor2']);
												$AEmail2=$row['AEmail2'];
												$Student1=stripslashes($row['Student1']);
												$SID1=$row['SID1'];
												$SEMail1=$row['SEmail1'];
												$Student2=stripslashes($row['Student2']);
												$SID2=$row['SID2'];
												$SEMail2=$row['SEmail2'];
												$Detail=stripslashes($row['Detail']);
												$Filepdf_name=$row['Filepdf_name'];
												$nowdate=$row['nowdate'];
					print "<font size=3><CENTER><b>โครงงานวิจัยปีการศึกษา $Year </b></CENTER></font><br>";
?>
								<table cellpadding=0 cellspacing=0 width=100% border=0>								
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p1.gif"></td>
										<td width=100% background="<?=$path_web_img?>p2.gif" width=1 height=15></td>
										<td width=15 height=15><img src="<?=$path_web_img?>p3.gif"></td>
								</tr></table>
								
								<table cellpadding=0 cellspacing=0 width=100% border=0>
								<tr><td width=15 height=1 background="<?=$path_web_img?>p4.gif"><img src="<?=$path_web_img?>p4.gif"></td>
								<td width=100%  bgcolor="#EFEFEF"> 
								<table cellpadding=2 cellspacing=0 width=100% border=0>	
<?																											
					print "<tr><td colspan=3><CENTER>&nbsp;<b><font size=3>$Name_Thai <br> $Name_Eng</font></b></CENTER></td></tr>"; 					
					print "<tr><td bgcolor='FFFFFF' colspan=3>&nbsp;<b>";
					if ($Grade==1) print "ระดับปริญญาตรี";
					else if($Grade==2) print "ระดับปริญญาโท";
					else if($Grade==3) print "ระดับปริญญาเอก";
					print "</b></td></tr>"; 

					print "<tr><td colspan=3>&nbsp;<B>อาจารย์ที่ปรึกษา</B></td></tr>";

					print "<tr bgcolor='#FFFFFF'><td width=33%> &nbsp;$Advisor1 </td><td colspan=2>$AEmail1 </td></tr>";
					if($Advisor2!="") print "<tr bgcolor='#FFFFFF'><td>&nbsp;$Advisor2 </td><td colspan=2>$AEmail2 </td></tr>"; 
					print "<tr><td colspan=3>&nbsp;<B>ผู้รับผิดชอบโครงงาน</B></td></tr>";
					print "<tr bgcolor='#FFFFFF'><td> &nbsp;$Student1</td><td width=33%>รหัส $SID1</td><td>$SEMail1 </td></tr>";
					if($Student2!="") print "<tr bgcolor='#FFFFFF'><td>&nbsp;$Student2 </td><td>รหัส $SID2 </td><td>$SEMail2</td></tr>"; 
					print "<tr><td colspan=3>&nbsp;<B>รายละเอียดโครงงาน</B></td></tr>";
					print "<tr><td bgcolor='#FFFFFF' colspan=3> &nbsp;";  print_output($Detail); print "</td></tr>";
					if($Filepdf_name!="")
					{
						//$fullpath="http://161.246.5.13/file/project_pdf/$Filepdf_name";
						print "<tr><td colspan=3><img src=\"$path_web_img"."zip.gif\"> <B>ดาวน์โหลดไฟล์</B>&nbsp; <a href=\"../download/download.php?link_small=$Filepdf_name&t11=111\">$Filepdf_name </a> &nbsp; </td></tr>"; 
					}
					else
					print "<tr><td colspan=3><img src=\"$path_web_img"."pdf.gif\"> <B>ดาวน์โหลดไฟล์</B>&nbsp; <font color=red>Comming Soon </font></td></tr>"; 
					
					print "<tr><td bgcolor='#FFFFFF' colspan=3>&nbsp;<b>Last Update</b> $nowdate</td></tr>";

					
											
?>
								</table>
								</td>
								<td width=15 height=1 background="<?=$path_web_img?>p5.gif"><img src="<?=$path_web_img?>p5.gif"></td>
								</tr></table>

								<table cellpadding=0 cellspacing=0 width=100% border=0>
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p6.gif"></td>
										<td width=100% background="<?=$path_web_img?>p7.gif" width=1 height=15>&nbsp;</td>
										<td width=15 height=15><img src="<?=$path_web_img?>p8.gif"></td>
								</tr>
								</table> 
<?
			}
			else
			{
					print "ไม่พบข้อมูล";
			}
}
if(!isset($HTTP_GET_VARS['Year']) and !isset($HTTP_GET_VARS['id']))  //เข้ามาครั้งแรกจะ select year ที่มากที่สุดให้เป็นเริ่มต้น
{			
			$sql1 = "select max(Year) from add_project";
			$result = mysql_query($sql1);
			if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{
												$Year=$row['max(Year)'];																							
										}			
								}			
}		//ไม่ต้องมี else เพราะเดี๋ยวข้างล่างจะไม่ทำงานถ้าเข้ามาครั้งแรก
if((isset($HTTP_GET_VARS['Year']) or isset($Year)) and !isset($HTTP_GET_VARS['id']))
{
			if(isset($HTTP_GET_VARS['Year'])) $Year=$HTTP_GET_VARS['Year']; //this case mean user click year but if user first visit $Year come from upper if
			
			
			$sql1 = "select IDProject,Name_Thai,Name_Eng from add_project where Year='$Year'";
			$result = mysql_query($sql1);
			if (($result) and (mysql_num_rows($result) >0))
								{
										print "<font size=3><CENTER><B>โครงงานวิจัยปีการศึกษา $Year  </B></CENTER></font><br>";
?>
								<table cellpadding=0 cellspacing=0 width=100% border=0>								
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p1.gif"></td>
										<td width=100% background="<?=$path_web_img?>p2.gif" width=1 height=15></td>
										<td width=15 height=15><img src="<?=$path_web_img?>p3.gif"></td>
								</tr></table>
								
								<table cellpadding=0 cellspacing=0 width=100% border=0>
								<tr><td width=15 height=1 background="<?=$path_web_img?>p4.gif"><img src="<?=$path_web_img?>p4.gif"></td>
								<td width=100%  bgcolor="#EFEFEF"> 
								<table cellpadding=2 cellspacing=0 width=100% border=0>	

<?				
										while ($row=mysql_fetch_array($result))
										{
												$IDProject=$row['IDProject'];											
												$Name_Thai=$row['Name_Thai'];											
												$Name_Eng=$row['Name_Eng'];		
					
													
					
					print "<tr><td>&nbsp;<img src=\"$path_web_img"."bullet2.gif\"><b> <a href=\"$PHP_SELF?id=$IDProject\">$Name_Thai </a></b></td></tr>"; 
					print "<tr><td bgcolor=\"#FFFFFF\"> &nbsp;$Name_Eng </td></tr>";
					
										}	
?>
								</table>
								</td>
								<td width=15 height=1 background="<?=$path_web_img?>p5.gif"><img src="<?=$path_web_img?>p5.gif"></td>
								</tr></table>

								<table cellpadding=0 cellspacing=0 width=100% border=0>
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p6.gif"></td>
										<td width=100% background="<?=$path_web_img?>p7.gif" width=1 height=15>&nbsp;</td>
										<td width=15 height=15><img src="<?=$path_web_img?>p8.gif"></td>
								</tr>
								</table> 
<?
								}		
								else
								{
									print "ปีการศึกษาอยู่ทางด้านขวามือครับ";
								}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
other_5("projectsmenu");
?>
