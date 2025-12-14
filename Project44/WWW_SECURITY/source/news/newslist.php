<?php 
include "interface.inc.php"; 
include "outputlib.php"; 
include "fn.php"; 
include "db.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
if(isset($HTTP_GET_VARS["IDNews"]))
{
$IDNews=$HTTP_GET_VARS["IDNews"];  
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
								$query = "
								select accesslist.Fullname AS Name,Type,Headline,Detail,Files,date_format(Date_post,'%e %M %Y') AS postdate,time_format(Times,'%H:%i') AS posttime,Links
								from accesslist,add_news 
								where IDNews='$IDNews' and accesslist.Username=add_news.IDUser";
								$result = mysql_query($query); 

								$row=mysql_fetch_array($result);
								$Type = $row['Type'];
								$Name = stripslashes($row['Name']);
								$Headline	=stripslashes($row['Headline']);
								$Detail	=stripslashes($row['Detail']);
								$Files	=$row['Files'];
								$postdate=$row['postdate'];
								$posttime=$row['posttime'];
								$Links=stripslashes($row['Links']);								
								
						

								if($Type=="b" or $Type=="c")
								{										
										if($Type=="b") print "<B>&nbsp;<font size=3>News</font></B><br><br>";
										if($Type=="c") print "<B>&nbsp; <font size=3>Events</font></B><br><br>";
?>
								<table cellpadding=0 cellspacing=0 width=95% border=0>								
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p1.gif"></td>
										<td width=100% background="<?=$path_web_img?>p2.gif" width=1 height=15></td>
										<td width=15 height=15><img src="<?=$path_web_img?>p3.gif"></td>
								</tr></table>
								
								<table cellpadding=0 cellspacing=0 width=95% border=0>
								<tr><td width=15 height=1 background="<?=$path_web_img?>p4.gif"><img src="<?=$path_web_img?>p4.gif"></td>
								<td width=100%  bgcolor="#EFEFEF"> 

								<table cellpadding=2 cellspacing=0 width=100% border=0>	
<?

										print "<tr><td><CENTER><B><font size=3>$Headline </font></B></CENTER></td></tr>";

										print "<tr bgcolor='#FFFFFF'><td><br>"; print_output($Detail); print "</td></tr>";

										print "<tr bgcolor='#FFFFFF'><td>"; print_output($Links); print "</td></tr>"; 
										if ($Files!="")  
										{
											print "<tr bgcolor='#FFFFFF'><td>&nbsp; <img src='../image/icon.gif'> <B> $Files 
											<a href='../file/news_file/$Files'>Download</a></B></td></tr> ";
										}							
										print "<tr bgcolor='#FFFFFF'><td><br><B>ประกาศเมื่อวันที่</B> $postdate เวลา $posttime  <br><B>โดย</B> $Name  </td></tr>";
?>
						
						</table>
								</td>
								<td width=15 height=1 background="<?=$path_web_img?>p5.gif"><img src="<?=$path_web_img?>p5.gif"></td>
								</tr></table>

								<table cellpadding=0 cellspacing=0 width=95% border=0>
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p6.gif"></td>
										<td width=100% background="<?=$path_web_img?>p7.gif" width=1 height=15>&nbsp;</td>
										<td width=15 height=15><img src="<?=$path_web_img?>p8.gif"></td>
								</tr>
								</table> 


						<br><a href="../home/index.php"><b> << กลับไปหน้าหลัก</b></a></center>
<?
								}
								else //ถ้าใส่ id ที่เป็นหมวดข่าวของ staff เข้ามา
								{
										print "ไม่พบข้อมูล";
								}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close("</center>");
empty_4();
?>
