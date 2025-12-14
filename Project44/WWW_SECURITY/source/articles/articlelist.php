<?php 
include "db.php"; 
include "interface.inc.php"; 
include "outputlib.php"; 
logo_noleftmenu("Information Security Advisory Group (ISAG)");
curve_open(); 
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->	
 ?>								
		
<?								
if(isset($HTTP_GET_VARS['id']) and !isset($HTTP_GET_VARS['group'])) 
{
								$id=$HTTP_GET_VARS['id'];
								$sql1 = "select  ar_name,ar_detail,day_add,user_add from articles_each where id_articles='$id' ";							
								$result = mysql_query($sql1);
								if (($result) and mysql_num_rows($result) ==1)
								{
												$row=mysql_fetch_array($result);
												$arname=stripslashes($row['ar_name']);
												$ardetail=stripslashes($row['ar_detail']);			
												$arday=$row['day_add'];
												$aruser=$row['user_add'];
?>
								<table cellpadding=0 cellspacing=0 width=100% border=0>								
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p1.gif"></td>
										<td width=100% background="<?=$path_web_img?>p2.gif" width=1 height=15></td>
										<td width=15 height=15><img src="<?=$path_web_img?>p3.gif"></td>
								</tr></table>
								
								<table cellpadding=0 cellspacing=0 width=100% border=0>
								<tr><td width=15 height=1 background="<?=$path_web_img?>p4.gif"><img src="<?=$path_web_img?>p4.gif"></td>
								<td width=100%  bgcolor="#EFEFEF"> 

								<table cellpadding=2 cellspacing=0 width=100% border=0><tr><td>	
<?
												print "<font size=3><CENTER><B>$arname</B></CENTER></font><br>";
												print "<B>โดย </B> $aruser<br>";
												print "<B>วันที่ </B> $arday<br><br>";
												print "$ardetail";
?>
								</td></tr></table>
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
								else print "<font size=3><br>&nbsp;&nbsp;&nbsp;&nbsp;ไม่พบเอกสารที่ท่านต้องการ</font>";
}
if(!isset($HTTP_GET_VARS['group']) and !isset($HTTP_GET_VARS['id']))
{
	print "<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td id=w2><B><font size=3> <CENTER>เอกสารเผยแพร่ (20 บทความล่าสุด)</CENTER> </font></B></td></tr></table><br>";

				$sql1 = "select id_articles,ar_name,date_format(day_add,'%e %b %Y') AS day,user_add from articles_each order by day_add DESC limit 20";
				$result = mysql_query($sql1);
				if (($result) and mysql_num_rows($result) >0)
				{
										while ($row=mysql_fetch_array($result))
										{
												$arid=$row['id_articles'];
												$arname=stripslashes($row['ar_name']);			
												$arday=$row['day'];
     											$aruser=stripslashes($row['user_add']);

												print "&nbsp;<img src=\"$path_web_img"."bullet.gif\" width=10 height=10>&nbsp;
												<a href='articlelist.php?id=$arid'>$arname<a><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												$arday  โดย $aruser <br><br>";
										}			
				}
}
if(isset($HTTP_GET_VARS['group']) and !isset($HTTP_GET_VARS['id']))
{
		//print "เลือกหมวดของเอกสารที่ต้องการจากด้านขวามือ";

		$group=$HTTP_GET_VARS['group']; //ตัวแปรนี้มาจาก ฟังก์ชัน articles จาก interface

		$sql1 = "select group_name from articles_group where id_group='$group' ";
		$result = mysql_query($sql1);
		if (($result) and mysql_num_rows($result) >0)  
								{
										while ($row=mysql_fetch_array($result))
										{
												$gname=$row['group_name'];											
												print "<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td id=w2><B><font size=3> <CENTER>เอกสารเผยแพร่ หมวด $gname</CENTER> </font></B></td></tr></table><br>";
										}			
								}								
?>								
								</B>
				
								<!------------------------------------------------------------------------------------------>
<?
			$sql1 = "select id_articles,ar_name,date_format(day_add,'%e %b %Y') AS day,user_add from articles_each where id_group='$group' ";
			$result = mysql_query($sql1);
			if (($result) and mysql_num_rows($result) >0)
			{
										while ($row=mysql_fetch_array($result))
										{
												$arid=$row['id_articles'];
												$arname=stripslashes($row['ar_name']);			
												$arday=$row['day'];
     											$aruser=stripslashes($row['user_add']);

												print "&nbsp;<img src=\"$path_web_img"."bullet.gif\" width=10 height=10>&nbsp;
												<a href=\"articlelist.php?id=$arid\">$arname<a><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												$arday  โดย $aruser <br><br>  ";
										}			
			}
			else print "<font size=3>&nbsp;&nbsp;&nbsp;&nbsp;<b>ยังไม่มีเอกสารในหมวดนี้</b></font>";
}
 //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->	
curve_close(); 
other_4("articles");
?>

