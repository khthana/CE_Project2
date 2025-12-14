<?php
session_start();
//ส่วนของ search ยังไม่ได้แก้
//t32 สีตัวอักษรของหน้า staff คือม่วงเข้มมากๆ เพราะธรรมดาไม่พอ
//w1 w2 is webboard color boardlist.php
$isag="http://isag.ce.kmitl.ac.th";
$sisag="https://isag.ce.kmitl.ac.th";

$adminsec="../vk0kipNTok/";

$bgcolor="#9088B0";  //สีของ body
$text="#56426C"; //ไม่เห็นมีผลเลย สงสัยเป็นที่สไตชีต body  ตัวอักษรสีน้ำเงินเข้มๆๆๆ
$stylesheet="../general.css";
$tdcenter="#FFFFFF";  //สีแบ็คกราวของตรงกลางทั้งหมด
$copyright_color="#FFFFFF";  //สีของข้อความ copyright
$bgcolor_logo="#60679F"; //สี background ของส่วน logo ด้านบน
$path_web_img="../image/"; //พาทของรูปที่ใช้ในตกแต่งหน้าตาเวบ
$border_box="#FFFFFF"; //สีกรอบของกล่องด้านขวาที่แสดงหมวดต่างๆ ในหน้าแรก
$bg_box="#9088B0";  //สีแบ็กกราวของกล่องด้านขวาที่แสดงหมวดต่างๆ ในหน้าแรก


$path_staff_pic="../staff/pic/";

$bg_staff_profile="#FFFFFF"; //สีของตารางที่แสดงข้อมูล staff หน้าแรก

$hr_color="#9088B0";

$color_under_box="#FFFFFF"; //สีของ  under box background เมนูด้านขวา ที่มีการส่ง para เป็น functionname


$temp_pic_articles = "../pic/temp/"; //path ที่ใช้ upload temp pic ของบทความ
$real_pic_articles="../pic/2001/";  //path จริงๆ ของรูปในบทความ

$project_dir="../file/project_pdf"; // path ที่ใช้ upload ไฟล์ pdf project
$error_color="#FF0000"; //สีที่แสดงข้อความเตือน error ในกรณีที่พิมพ์ผิดในหน้า add project , add link login wrong


$file_news="../file/news_file";  //news
$file_public = "../file/publication";  // ไฟล์ของ publication
$file_paper = "../file/paper";  // ไฟล์ของ paper

// LOG FILE
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (getenv(HTTP_X_FORWARDED_FOR)){ 
		$ip=getenv(HTTP_X_FORWARDED_FOR); 
		} 
		else { 
		$ip=getenv(REMOTE_ADDR); 
		} 


	$ip = $ip." [".gethostbyaddr($ip)."]  --- ".$HTTP_SERVER_VARS["REQUEST_URI"]."  ".date('[d M Y H:i]')." @ ".$HTTP_SESSION_VARS["uid"]." \r\n";

	$FILE = fopen("../log_5820827ebe14530ab1ab8c61bfd467d2.txt","a");
	fputs($FILE,$ip);
	fclose($FILE);
	//5820827ebe14530ab1ab8c61bfd467d2
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function logo_leftmenu($title)
{
	global $bgcolor;
	global $text;
	global $stylesheet;
	global $tdcenter;
?>
<HTML><HEAD>
<TITLE><?=$title;?></TITLE>
<LINK REL=STYLESHEET TYPE='text/css' HREF='<?=$stylesheet;?>'>
</HEAD>
<BODY BGCOLOR="<?=$bgcolor;?>" TEXT="<?=$text;?>" TOPMARGIN=2 LEFTMARGIN=0  MARGINWIDTH=0 MARGINHEIGHT=2>
				<? logo(); ?>
<table width=100%  cellpadding=0 cellspacing=0 border=0 bordercolor=red>
<tr>
		<td><table  cellpadding=1 cellspacing=0 border=0><tr><td>&nbsp;</td></tr></table>
		</td>
		<td width=140 valign=top ID=table3>
				<? leftmenu();	?>
		</td>
		<td width=100%  valign=top bgcolor='<?=$tdcenter;?>'>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function logo_adminmenu($title)
{
	global $bgcolor;
	global $text;
	global $stylesheet;
	global $tdcenter;
?>
<HTML><HEAD>
<TITLE><?=$title;?></TITLE>
<LINK REL=STYLESHEET TYPE='text/css' HREF='<?=$stylesheet;?>'>
</HEAD>
<BODY BGCOLOR="<?=$bgcolor;?>" TEXT="<?=$text;?>" TOPMARGIN=2 LEFTMARGIN=0  MARGINWIDTH=0 MARGINHEIGHT=2>
				<? logo(); ?>
<table width=100%  cellpadding=0 cellspacing=0 border=0 bordercolor=red>
<tr>
		<td><table  cellpadding=1 cellspacing=0 border=0><tr><td>&nbsp;</td></tr></table>
		</td>
		<td width=140 valign=top ID=table3>
				<? adminmenu();	?>
		</td>
		<td width=100%  valign=top bgcolor='<?=$tdcenter;?>'>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function logo_noleftmenu($title) // เช่นหน้า addproject
{
	global $bgcolor;
	global $text;
	global $stylesheet;
	global $tdcenter;  //ต่างจากข้างบน เพราะมีสอง nbsp
?>
<HTML><HEAD>
<TITLE><?=$title;?></TITLE>
<LINK REL=STYLESHEET TYPE='text/css' HREF='<?=$stylesheet;?>'>
</HEAD>
<BODY BGCOLOR="<?=$bgcolor;?>" TEXT="<?=$text;?>" TOPMARGIN=2 LEFTMARGIN=0  MARGINWIDTH=0 MARGINHEIGHT=2>
				<? logo(); ?>
<table width=100%  cellpadding=0 cellspacing=0 border=0 bordercolor=red>
<tr>  
		<td><table  cellpadding=1 cellspacing=0 border=0><tr><td>&nbsp;&nbsp;</td></tr></table>
		</td>
		<td width=100%  valign=top bgcolor='<?=$tdcenter;?>'>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function curve_open($center)
{
	global $path_web_img;
?>
<table cellpadding=0 cellspacing=0 width=100% border=0>
						<tr><td colspan=3><img src="<?=$path_web_img?>1_leftup.gif" width=13 height=13></td></tr>
						<tr><td>&nbsp;</td>
								<td width=100% height=400 valign=top><br>
<?
	print $center;
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function curve_close($center)
{
	global $path_web_img;
	print $center;
?>							<br>
								</td>
								<td>&nbsp;</td>
						</tr>
						<tr><td colspan=3><img src="<?=$path_web_img?>1_leftdown.gif" width=13 height=13></td></tr>
						</table>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function staffmenu_5()  //มีทั้ง menu ด้านซ้ายและขวา
{
?>
		</td>
		<td width=140 valign=top ID=table3>
				<?php staffmenu(); ?>				
		</td> 
		<td><table  cellpadding=0 cellspacing=0 border=0><tr><td>&nbsp;</td></tr></table>
		</td>
</tr>
<tr><td colspan=5><? copyright(); ?></td></tr>
</table>
</BODY>
</HTML>
<?
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function staffmenu_4()  // เช่นหน้า add project
{
?>
		</td>
		<td width=140 valign=top ID=table3>
				<?php staffmenu(); ?>				
		</td> 
		<td><table  cellpadding=0 cellspacing=0 border=0><tr><td>&nbsp;</td></tr></table>
		</td>
</tr>
<tr><td colspan=4><? copyright(); ?></td></tr>
</table>
</BODY>
</HTML>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function other_5($other)  //มีทั้ง menu ด้านซ้ายและขวา
{
	global $color_under_box;
?>
		</td>
		<td width=140 valign=top bgcolor="<?=$color_under_box?>">
				<?php $other(); ?>				
		</td> 
		<td><table  cellpadding=0 cellspacing=0 border=0><tr><td>&nbsp;</td></tr></table>
		</td>
</tr>
<tr><td colspan=5><? copyright(); ?></td></tr>
</table>
</BODY>
</HTML>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function other_4($other)  // articles and articlelist , only right menu
{
	global $color_under_box;
?>
		</td>
		<td width=140 valign=top bgcolor="<?=$color_under_box?>">
				<?php $other(); ?>				
		</td> 
		<td><table  cellpadding=0 cellspacing=0 border=0><tr><td>&nbsp;</td></tr></table>
		</td>
</tr>
<tr><td colspan=4><? copyright(); ?></td></tr>
</table>
</BODY>
</HTML>
<?
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function empty_4()  //ไมีมีเมนูด้านขวา
{
?>
</td>
		<td><table  cellpadding=0 cellspacing=0 border=0><tr><td>&nbsp;&nbsp;</td></tr></table>
		</td>
</tr>
<tr><td colspan=4><? copyright(); ?></td></tr>
</table>
</BODY>
</HTML>
<?
}
function empty_3()  //ไมีมีเมนูด้านขวา
{
?>
</td>
		<td><table  cellpadding=0 cellspacing=0 border=0><tr><td>&nbsp;&nbsp;</td></tr></table>
		</td>
</tr>
<tr><td colspan=3><? copyright(); ?></td></tr>
</table>
</BODY>
</HTML>
<?
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function copyright()
{
	global $copyright_color;
print "<br><CENTER>";
	//print "<SCRIPT LANGUAGE='javascript1.1'> page='".$HTTP_SERVER_VARS["PHP_SELF"]."';</SCRIPT>";
?>
	<!-- <SCRIPT LANGUAGE="javascript1.1" src="http://truehits1.gits.net.th/data/c0002698.js"></SCRIPT> -->

<?
print "<font color='$copyright_color' size=\"2\" face=\"MS Sans Serif\">Copyrights &copy; 2545 ISAG. All rights reserved</font></CENTER><br>";
}



//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function logo()
{
	global $HTTP_SESSION_VARS;
	global $bgcolor_logo;
	global $path_web_img;
	global $isag;
	global $sisag;
?>
<table bgcolor="<?=$bgcolor_logo;?>" cellpadding=0 cellspacing=0 border=0 bordercolor=white width=100%>
<tr>
		<td><img src="<?=$path_web_img;?>logoleft.gif">&nbsp; 
		&nbsp;&nbsp;</td>
		<td align=right><img src="<?=$path_web_img;?>logocenter.gif"><img src="<?=$path_web_img;?>logoright.gif"></td>
</tr>
</table>
<table bgcolor="<?=$bgcolor_logo;?>" cellpadding=0 cellspacing=0 border=0 bordercolor=white width=100%>
<tr>
		<td background="<?=$path_web_img;?>1_new3.gif">
			<a href="<?=$isag?>/home/index.php"><img src="<?=$path_web_img;?>logo_home.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$sisag?>/staff/isagstaff.php"><img src="<?=$path_web_img;?>logo_login.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$isag?>/menu/sitemap.php"><img src="<?=$path_web_img;?>logo_sitemap.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$isag?>/menu/resource.php"><img src="<?=$path_web_img;?>logo_resource.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$isag?>/menu/community.php"><img src="<?=$path_web_img;?>logo_community.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$isag?>/menu/search.php"><img src="<?=$path_web_img;?>logo_search.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$isag?>/menu/contact.php"><img src="<?=$path_web_img;?>logo_contact.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif"><a href="<?=$isag?>/faq/faq.php"><img src="<?=$path_web_img;?>logo_faq.gif" border=0></a><img src="<?=$path_web_img;?>logo_center.gif">
			
	
		<td background="<?=$path_web_img;?>1_new3.gif" align=right>
							<font color=white><? if (session_is_registered("uid"))  
							{
									print "<b><font color='cyan'>login : ".$HTTP_SESSION_VARS["uid"]."</font></b>&nbsp;&nbsp;"; 									
							}		
							?> </font>
		</td>
		<td background="<?=$path_web_img;?>1_new3.gif">
							<? if (session_is_registered("uid"))  
							{
									?><a href="../staff/logout.php"><img src="<?=$path_web_img;?>logo_logout.gif" border=0></a> <?
							}		
							?>						
		</td>
			</tr>
</table> 
<?php
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function leftmenu()
{
	global $path_web_img;
	global $isag;
?>
<table  cellpadding=1 cellspacing=1 width=140 border=0>
					<tr><td ID=table3>&nbsp;<img src="<?=$path_web_img;?>1_new1.gif">&nbsp;<B>Community</B></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/staff/staff.php">Members</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/webboard/boardlist.php">Webboard</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/guestbook/guestbook.php">Guestbook</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/mailing-list/subscribe.php">Subscribe mailing list</a></td></tr>
					
					<tr><td ID=table3>&nbsp;<img src="<?=$path_web_img;?>1_new1.gif">&nbsp;<B>Resource</B></td></tr>			
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/home/index.php?type=news">News</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/home/index.php?type=events">Events</a></td></tr>
        			<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/project/projects.php">Projects</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/paper/public.php">Publication</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/download/showprogram.php">Download</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/link/listgroup.php">Links </a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/articles/articlelist.php">Articles</a></td></tr>
			
					<tr><td ID=table3>&nbsp;<img src="<?=$path_web_img;?>1_new1.gif">&nbsp;<B>About ISAG</B></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/faq/faq.php">FAQ</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<a href="<?=$isag?>/menu/contact.php">Contact</a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp;<!-- About --></td></tr>					
					<tr><td ID=table1>&nbsp;&nbsp;<!-- FAQ --></td></tr>	
					<tr><td ID=table1>&nbsp;&nbsp;<!-- FAQ --></td></tr>	
					<tr><td ID=table1>&nbsp;&nbsp;<!-- FAQ --></td></tr>	
			</table>
<?php
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function adminmenu()
{
	global $path_web_img;
?>
<table  cellpadding=1 cellspacing=1 width=140 border=0>
					<tr><td ID=table3>&nbsp;<img src="<?=$path_web_img;?>1_new1.gif">&nbsp;<B>Admin menu</B></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/newuser.php">Add new user</a></td></tr>					
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/manageuser.php">Manage users</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/addfaq.php">Add FAQ</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/managefaq.php">Manage FAQ</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/deleteguestbook.php">Manage Guest book</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/frmsendmail.php">Send mailing list</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/mailing_list_member.php">Mailing list member</a></td></tr>

					<tr><td ID=admin>&nbsp;&nbsp;<!-- Staff --></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/staff/isagstaff.php">Staff Section</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/log_5820827ebe14530ab1ab8c61bfd467d2.txt" target="_new_">ล็อกไฟล์ของเว็บไซต์</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/statistic.php">สถิติของเว็บไซต์</a></td></tr>
					
					
					<tr><td ID=table3>&nbsp;<img src="<?=$path_web_img;?>1_new1.gif">&nbsp;<B>Update contents</B></td></tr>			
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/manage_project.php">แก้ไขข้อมูลโปรเจค</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/listgroup_admin.php">แก้ไขลิงค์ </a></td></tr>
 

					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/editprogram.php">แก้ไขไฟล์และโปรแกรม</a></td></tr>
					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/update_webboard.php">ลบกระทู้ในเวบบอร์ด</a></td></tr>


					

					<tr><td ID=admin>&nbsp;&nbsp;<a href="<?=$sisag?>/vk0kipNTok/editcontact.php">แก้ไขข้อมูลติดต่อ</a></td></tr>
			
	

			</table>
<?php
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function articles()  //ไม่ต้องตรวจ register_global เพราะ select เองทั้งหมด
{
	global $border_box;
	global $bg_box;
	global $path_web_img;
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=170 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=170 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>เอกสารเผยแพร่</B></CENTER></td></tr>
<?
						$sql1 =
												"select  articles_group.group_name AS groupname,
												articles_group.id_group AS idgroup,
												count(articles_each.ar_name) AS numgroup
												from articles_group LEFT join articles_each on articles_group.id_group=articles_each.id_group
												group by articles_group.group_name";												
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{
												$idgroup=$row['idgroup'];
												$groupname=stripslashes($row['groupname']);			
												$numgroup=$row['numgroup'];
												?>
												<tr><td ID=table1>&nbsp;
												<?
												print "<a href=\"../articles/articlelist.php?group=$idgroup\">$groupname</a> [ $numgroup ] </td></tr>";
										}			
								}
?>		
					</table>
						</td>			
						</tr>
						</table>

<?php
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function links()  //ไม่ต้องแก้ register_global
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=190 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=190 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>Links</B></CENTER></td></tr>
<?
						$sql1 =
				"select  link_group.group_name AS groupname,
								link_group.id_group AS idgroup,
								count(link_each.link) AS numgroup
				from link_group LEFT join link_each on link_group.id_group=link_each.group_name
				group by link_group.group_name";										
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{
												$idgroup=$row['idgroup'];
												$groupname=stripslashes($row['groupname']);			
												$numgroup=$row['numgroup'];
												print "<tr><td ID=table1>&nbsp;";							
												//print "<input type='checkbox' name='group_check[]' value='$idgroup'>";
							print "<a href=\"$PHP_SELF?group=$idgroup\">$groupname<a></td><td ID=table1>&nbsp; $numgroup &nbsp;</td></tr>";

										}			
								}
?>		
					</table>
						</td>			
						</tr>
						</table>

<?php
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function links_admin()  //ไม่ต้องแก้ register_global
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=190 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=190 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>Links</B></CENTER></td></tr>
<?
						$sql1 =
				"select  link_group.group_name AS groupname,
								link_group.id_group AS idgroup,
								count(link_each.link) AS numgroup
				from link_group LEFT join link_each on link_group.id_group=link_each.group_name
				group by link_group.group_name";										
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{
												$idgroup=$row['idgroup'];
												$groupname=stripslashes($row['groupname']);			
												$numgroup=$row['numgroup'];
												print "<tr><td ID=table1>&nbsp;";												
												print "<input type='checkbox' name='group_check[]' value='$idgroup'>";
							print "<a href=\"$PHP_SELF?group=$idgroup\">$groupname<a></td><td ID=table1>&nbsp; $numgroup &nbsp;</td></tr>";

										}			
								}
?>		
					</table><br> <!-- delete group button -->
					<center><input type=submit name='submit' value='Delete Group' onclick="return confirm('คุณต้องการที่จะลบ Group ที่เลือก พร้อมลบ link ทั้งหมดใน Group นี้?')"><br><br>
									 <input type=submit name='submit' value='Edit group name'></center>
					
						</td>			
						</tr>
						</table>

<?php
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function links_staff()  //ไม่ต้องแก้ register_global
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=190 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=190 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>เลือกหมวดที่ต้องการแก้ไข</B></CENTER></td></tr>
<?
						$sql1 =
				"select  link_group.group_name AS groupname,
								link_group.id_group AS idgroup,
								count(link_each.link) AS numgroup
				from link_group LEFT join link_each on link_group.id_group=link_each.group_name
				group by link_group.group_name";										
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{
												$idgroup=$row['idgroup'];
												$groupname=stripslashes($row['groupname']);			
												$numgroup=$row['numgroup'];
												print "<tr><td ID=table1>&nbsp;";																								
							print "<a href=\"$PHP_SELF?group=$idgroup\">$groupname<a></td><td ID=table1>&nbsp; $numgroup &nbsp;</td></tr>";

										}			
								}
?>		
					</table><br> <!-- delete group button -->
					
						</td>			
						</tr>
						</table>

<?php
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function projectsmenu() // ไม่ต้องแก้ register_global
{
	global $border_box;
	global $bg_box;
	global $path_web_img;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=100 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=100 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>ปีการศึกษา</B></CENTER></td></tr>
<?
					$sql1 = "select  distinct Year from add_project order by Year desc";																												
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{												
												$Year=stripslashes($row['Year']);		
												?>

												<tr><td ID=table1>&nbsp;<img src="<?=$path_web_img;?>icon.gif" width=20 height=19>&nbsp;
												<?
												print "<a href='$PHP_SELF?Year=$Year'>$Year<a></td></tr>";
										}			
								}
?>		
					</table>
						</td>			
						</tr>
						</table>

<?php
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function faq_admin() // ไม่ต้องแก้ register_global
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=170 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=170 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>FAQ</B></CENTER></td></tr>
<?
					$sql1="select id,group_name from faq_group order by group_name";				
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{												
												$id=$row['id'];
												$group_name=$row['group_name'];					
												print "<tr><td ID=table1>&nbsp;<input type='checkbox' name='group_check[]' value='$id'>";
												print "<a href='$PHP_SELF?group=$id'>$group_name<a></td></tr>";
										}			
								}
?>		
					</table><br>
						<center><input type=submit name='submit' value='Delete Group' onclick="return confirm('คุณต้องการที่จะลบ FAQ กลุ่มที่เลือก พร้อมลบคำถาม-คำตอบทั้งหมดในกลุ่มนี้?')"><br><br>
									 <input type=submit name='submit' value='Edit group name'></center>
						</td>			
						</tr>
						</table>

<?php
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function faqmenu() // ไม่ต้องแก้ register_global
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=170 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=170 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>FAQ</B></CENTER></td></tr>
<?
					$sql1="select id,group_name from faq_group order by group_name";				
					$result = mysql_query($sql1);
					if ($result)   
								{
										while ($row=mysql_fetch_array($result))
										{												
												$id=$row['id'];
												$group_name=$row['group_name'];									
												print "<tr><td ID=table1>&nbsp;<a href='$PHP_SELF?group=$id'>$group_name<a></td></tr>";
										}			
								}
?>		
					</table>
						</td>			
						</tr>
						</table>

<?php
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function staff_member_menu()
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=120 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=120 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>สมาชิกห้องวิจัย</B></CENTER></td></tr>
					
					<tr><td ID=table1>&nbsp; <a href="<?=$PHP_SELF?>?type=1">อาจารย์<a></td></tr>
					<!--<tr><td ID=table1>&nbsp; <a href="#">เจ้าหน้าที่<a></td></tr>-->
					<!--<tr><td ID=table1>&nbsp; <a href="<?=$PHP_SELF?>?type=5">นักศึกษาปริญญาเอก<a></td></tr>-->
					<tr><td ID=table1>&nbsp; <a href="<?=$PHP_SELF?>?type=4">นักศึกษาปริญญาโท<a></td></tr>
					<tr><td ID=table1></td></tr>
<?
					$sql="select distinct year_project from staff_profile where type=3 order by year_project desc ";
					$result=mysql_query($sql);
					if (($result) and (mysql_num_rows($result) > 0))
					{
							print "<tr><td ID=table1>&nbsp; นักศึกษาปริญญาตรี </td></tr>"; //type=3
							while ($row=mysql_fetch_array($result))
							{
									$year_project	=$row['year_project'];
?>
								<tr><td ID=w3>&nbsp;&nbsp;&nbsp;&nbsp;- 
								<a href="<?=$PHP_SELF?>?type=<?=$year_project?>"><?=$year_project?></a></td></tr>
<?
							}
					}

?>							
												
					</table>
						</td>			
						</tr>
						</table>

<?php
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function loginmenu()
{
	global $HTTP_SERVER_VARS;
	global $path_web_img;
	global $bg_box;
?>
<ul>
<b><font size=3><center>You are not logged in or you don't have permission to access this page. This could be due to one of several reasons: </center></font></b><br><br>

<B>1</B>. You are not logged in. Fill in the form at the below of this page and try again. <br>
<B>2</B>. You do not have permission to access the page that you were trying to.  <br>
<B>3</B>. Your username and password incorrect.  <br>
</ul> 

<center><table  cellpadding=2 cellspacing=1 bgcolor="<?=$bg_box;?>"  width=260 border=0 bordercolor=green>
<tr ID=table3><td colspan=2><b>&nbsp; Staff Login --></b></td></tr>

		<form action="https://isag.ce.kmitl.ac.th<?=$HTTP_SERVER_VARS['REQUEST_URI']?>" method="post">
		<tr><td ID=table1>&nbsp;Username :</td><td ID=table1>&nbsp;<input type=text  name="uid0" size=12></td></tr>
		<tr><td ID=table1>&nbsp;Password</td><td ID=table1>&nbsp;<input type=password name="pwd" size=12 maxlength=50></td></tr>
		<tr><td colspan=2 ID=table1><br></td></tr>
		<tr><td colspan=2 ID=table1><CENTER><input type=submit name=Add2 value="Login">&nbsp;<input type=reset></CENTER></td></tr>
		</form>

</table></center>



<?php
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function staffmenu()
{
?>
<table  cellpadding=0 cellspacing=1 border=0 width=140 bordercolor=red>
	<tr><td ID=table3>&nbsp;&nbsp;<B>Staff Menu</B></td></tr>

	<tr><td ID=staff>&nbsp;&nbsp; <B><a href="<?=$sisag?>/webboard/boardlist.php?type=0" target="_new_">เวบบอร์ดภายใน</a></B><br>
	&nbsp;&nbsp; <a href="<?=$sisag?>/staff/isagstaff.php">ข่าวภายใน</a><!-- <br>
	&nbsp;&nbsp; File & Program --><br>
	&nbsp;&nbsp; <a href="<?=$sisag?>/paper/paper.php">ดู Paper</a></td></tr>

	
	<tr><td ID=staff2>&nbsp;&nbsp; <a href="<?=$sisag?>/download/uploadprogram.php">เพิ่มไฟล์และโปรแกรม</a><br>
	&nbsp;&nbsp;<a href="<?=$sisag?>/download/editprogram.php"> แก้ไขไฟล์และโปรแกรม</a></td></tr>

	<tr><td ID=staff>&nbsp;&nbsp; <a href="<?=$sisag?>/news/add_news.php">ประกาศข่าว</a><!-- <br>
	&nbsp;&nbsp; แก้ไขข่าว --></td></tr>
	
	<tr><td ID=staff2>&nbsp;&nbsp; <a href="<?=$sisag?>/project/addproject.php">เพิ่มโปรเจค</a><br>			
	&nbsp;&nbsp; <a href="<?=$sisag?>/project/edit_project.php">แก้ไขข้อมูลโปรเจค</a> </td></tr>

	<tr><td ID=staff>&nbsp;&nbsp; <a href="<?=$sisag?>/paper/publication.php">เพิ่ม publication</a><!-- <br>
	&nbsp;&nbsp; แก้ไข publication --></td></tr>

	<tr><td ID=staff2>&nbsp;&nbsp; <a href="<?=$sisag?>/articles/add_articles.php" target="_new_">เขียนบทความ</a><!-- <br>
	&nbsp;&nbsp; แก้ไขบทความ --></td></tr>

	<tr><td ID=staff>&nbsp;&nbsp; <a href="<?=$sisag?>/link/addgroup.php">เพิ่มลิงค์</a><br>
	&nbsp;&nbsp; <a href="<?=$sisag?>/link/edit_link.php">แก้ไขลิงค์</a></td></tr>
	
	<tr><td ID=staff2>&nbsp;&nbsp; <a href="<?=$sisag?>/staff/chpass.php">เปลี่ยนรหัสผ่าน</a><br>
	&nbsp;&nbsp; <a href="<?=$sisag?>/staff/edit_profile.php">แก้ไขข้อมูล Staff</a> </td></tr>

	<tr><td ID=staff>&nbsp;&nbsp; <a href="<?=$sisag?>/staff/edit_advisor_profile.php">แก้ไขข้อมูลอาจารย์</a></td></tr>
	<tr><td ID=staff>&nbsp;&nbsp; <a href="<?=$sisag?>/paper/reviewpaper.php">Review paper</a></td></tr>
	<tr><td ID=staff>&nbsp;&nbsp; <b><a href='<?=$sisag?>/webboard/view.php?ID=32' target='_new_'>รายงานข้อผิดพลาด</a></b></td></tr>							

	
</table>
<?php
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function redirect($to_url)
{
$refresh =3;
?>
<meta http-equiv="refresh" content="<?php echo $refresh; ?>;URL=<? echo $to_url; ?>">
<br><br>
<font size=3><center><b>เพิ่มหรือแก้ไข ข้อมูลใน Database เรียบร้อยแล้ว<br> เราจะ Redirect คุณไปยังหน้าหลัก โดยอัติโนมัติ <br> หรือ <br> 
	<a href="<?=$to_url?>">คลิกที่นี่</a></b></center></font>
<?
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function logout($to_url)
{
$refresh =3;
?>
<meta http-equiv="refresh" content="<?php echo $refresh; ?>;URL=<? echo $to_url; ?>">
<br><br>
<font size=3><center><b>logout เรียบร้อยแล้ว<br> เราจะ Redirect คุณไปยังหน้าหลัก โดยอัติโนมัติ <br> หรือ <br> 
	<a href="<?=$to_url?>">คลิกที่นี่</a></b></center></font>
<?
}
function manageuser()
{
	global $border_box;
	global $bg_box;
	$PHP_SELF=$HTTP_SERVER_VARS['PHP_SELF'];  // undefiled**************************
?>
						<table cellpadding=1 cellspacing=1  bgcolor="<?=$border_box;?>" width=100 border=0>
						<tr>
						<td>
					<table cellpadding=1 cellspacing=1  width=100 border=0 bgcolor="<?=$bg_box;?>">
					<tr><td ID=table3><CENTER><B>User type</B></CENTER></td></tr>
					
					<tr><td ID=table1>&nbsp;&nbsp; <a href="<?=$PHP_SELF?>?type=0">All user<a></td></tr>					
					<tr><td ID=table1>&nbsp;&nbsp; <a href="<?=$PHP_SELF?>?type=1">Administrator<a></td></tr>
					<tr><td ID=table1>&nbsp;&nbsp; <a href="<?=$PHP_SELF?>?type=2">General Staff<a></td></tr>
					
												
					</table>
						</td>			
						</tr>
						</table>

<?php
}
function mysplit($input, $length=80) {
    $word = explode(" ", $input);
    for ($i=0; $i < count($word); $i++) 
	{
        if (strlen($word[$i]) > $length) {
        $input = eregi_replace($word[$i], chunk_split($word[$i],$length),$input); 
        }
    }
return $input;
}	
function file_ext($filename) {  // get file extension
  return substr($filename,strrpos($filename,'.')+1);
}

?>