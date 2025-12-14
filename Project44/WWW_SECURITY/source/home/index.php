<?php 
include "interface.inc.php"; 
include "outputlib.php"; 
include "db.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$PHP_SELF=$HTTP_SERVER_VARS["PHP_SELF"];
$type=$HTTP_GET_VARS["type"];

/*
print "<center><table cellpadding=0 cellpadding=0 border=0>";
print "<tr><td><br><font size=3 color=red><b>ขณะเวบ ISAG กำลังอยู่ในระหว่างการรวบรวมข้อมูลครับ และพร้อมจะเปิดให้บริการข้อมูลทางด้านระบบรักษาความปลอดภัย ในต้นเดือนพฤษภาคมครับ</b></font><br><br></td></tr>";
print "</table></center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>";
*/
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($type) and ($type=="news"))
{
	$query = "select IDNews,Headline,date_format(Date_post,'%e/%c') AS postdate from add_news where Type='b' and Date_until>now() order by  IDNews DESC";
								$result = mysql_query($query);
								if ($result)   
								{
										print "<table border=0 cellpadding=1 cellspacing=0 width=98%><tr id=table3><td><B>&nbsp;<font size=3> ISAG :- News</font></B></td></tr></table><br>";
										//print "<hr color='$hr_color' width=90% align=center>";

										while ($row=mysql_fetch_array($result))
										{
											$IDNews	=$row['IDNews'];
											$Headline	=stripslashes($row['Headline']);
											$postdate	=$row['postdate'];
											print "&nbsp;<img src='$path_web_img"."bullet.gif'  height=10 width=10> [$postdate] <a href='../news/newslist.php?IDNews=$IDNews'>$Headline</a><br>";
										} 
								}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($type) and ($type=="events"))
{
	$query = "select IDNews,Headline,date_format(Date_post,'%e/%c') AS postdate from add_news where Type='c' and Date_until>now() order by  IDNews DESC";
								$result = mysql_query($query);
								if ($result)   
								{
										print "<table cellpadding=0 cellspacing=0 width=98% border=1 bordercolor='$bg_box'>";			
										print "<tr><td id=table3><B>&nbsp;<font size=3> ISAG :- Events</font></B></td></tr></table><br>";
										while ($row=mysql_fetch_array($result))
										{
											$IDNews	=$row['IDNews'];
											$Headline	=stripslashes($row['Headline']);
											$postdate	=$row['postdate'];
											print "&nbsp;<img src='$path_web_img"."bullet.gif'  height=10 width=10> [$postdate] <a href='../news/newslist.php?IDNews=$IDNews'>$Headline</a><br>";
										} 
										print "<br><br><br>";
								}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(isset($type) and ($type!="events") and ($type!="news"))
{
	print "<center>Sorry !!! File not found</center>";
}
if(!isset($type))
{
								$query = "select IDNews,Headline,date_format(Date_post,'%e/%c') AS postdate from add_news where Type='b' and Date_until>now() order by  IDNews DESC limit 10";
								$result = mysql_query($query);
								if ($result)   
								{
										print "<table border=0 cellpadding=0 cellspacing=0 width=98%><tr id=w2><td><B>&nbsp;<font size=3> ISAG :- News</font></B></td></tr></table><br>";

										while ($row=mysql_fetch_array($result))
										{
											$IDNews	=$row['IDNews'];
											$Headline	=stripslashes($row['Headline']);
											$postdate	=$row['postdate'];
											print "&nbsp;<img src='$path_web_img"."bullet.gif'  height=10 width=10> [$postdate] <a href='../news/newslist.php?IDNews=$IDNews'>$Headline</a><br>";
										} ?>
										<br>&nbsp;&nbsp;&nbsp;&nbsp; <a href="<?=$PHP_SELF?>?type=news"><b> More News  >></b></a>
										<? print "<br><br>";																	
								}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
								$query = "select IDNews,Headline,date_format(Date_post,'%e/%c') AS postdate from add_news where Type='c' and Date_until>now() order by  IDNews DESC limit 10";
								$result = mysql_query($query);
								if ($result)   
								{
										print "<table cellpadding=0 cellspacing=0 width=98% border=0 bordercolor='$bg_box'>";			
										print "<tr><td id=w2><B>&nbsp; <font size=3>ISAG :- Events</font></B></td></tr></table><br>";
										while ($row=mysql_fetch_array($result))
										{
											$IDNews	=$row['IDNews'];
											$Headline	=stripslashes($row['Headline']);
											$postdate	=$row['postdate'];
											print "&nbsp;<img src='$path_web_img"."bullet.gif'  height=10 width=10> [$postdate] <a href='../news/newslist.php?IDNews=$IDNews'>$Headline</a><br>";
										} ?>
										<br>&nbsp;&nbsp;&nbsp;&nbsp; <a href="<?=$PHP_SELF?>?type=events"><b> More Events  >></b></a><br>
										<? print "<br>";
								}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
							$query = "select id_articles,ar_name,date_format(day_add,'%e/%c') AS nowdate from articles_each order by  day_add DESC limit 10";
							$result = mysql_query($query);
							if(($result) and mysql_num_rows($result) > 0)
							{
?>
								<center><table cellpadding=0 cellspacing=0 width=95% border=0 bordercolor=black>
								
								<tr><td width=15 height=25><img src="<?=$path_web_img?>a1.gif"></td>
										<td width=80 height=25><img src="<?=$path_web_img?>a2.gif"></td>
										<td width=100% background="<?=$path_web_img?>a3.gif" width=1 height=25>&nbsp;</td>
										<td width=15 height=25><img src="<?=$path_web_img?>a4.gif"></td>
								</tr>
								<tr><td width=15 height=1 background="<?=$path_web_img?>a5.gif"><img src="<?=$path_web_img?>a5.gif"></td>
										<td width=100% colspan=2  bgcolor="#FFFFFF">
<?
								while ($row=mysql_fetch_array($result))
								{
									 $id_articles	=$row['id_articles'];
									 $ar_name	=stripslashes($row['ar_name']);
									 $nowdate = $row['nowdate'];
									 print "<a href='../articles/articlelist.php?id=".$id_articles."'>$ar_name</a> [$nowdate]<br>";
								} 
?>
							</td>
										<td width=15 height=1 background="<?=$path_web_img?>a6.gif"><img src="<?=$path_web_img?>a6.gif"></td>
								</tr>
								<tr><td width=15 height=15><img src="<?=$path_web_img?>a7.gif"></td>
										<td width=100% background="<?=$path_web_img?>a8.gif" colspan=2 width=1 height=15>&nbsp;</td>
										<td width=15 height=15><img src="<?=$path_web_img?>a9.gif"></td>
								</tr>
								</table></center><br>
<?
							}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
curve_close();
//other_5("search"); // also articles append
empty_4();
?>

