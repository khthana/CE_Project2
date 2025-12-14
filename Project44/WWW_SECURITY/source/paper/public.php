<?php 
include "interface.inc.php";
include "outputlib.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
$PHP_SELF=$HTTP_SERVER_VARS["PHP_SELF"];
$screen=$HTTP_GET_VARS["screen"];       
$rows_per_page = 10;

$sql = "select  ID from public"; 
$result = mysql_query($sql);
$total_records = mysql_num_rows($result);
$pages = ceil($total_records / $rows_per_page);
if (!isset($screen))   $screen = 1;
if(isset($HTTP_GET_VARS["id"])) //---------------------------------------------------------------------------------------------------------->>
{
		$id=$HTTP_GET_VARS["id"];
		$query="select name_t,name_e,journal,page,num,name1,from1,name2,from2,name3,from3,abstract,filename,date_format(day_add,'%e %b %Y, %H:%i') AS nowdate from public where ID=$id";
		$result = mysql_query($query);
		if (($result) and (mysql_num_rows($result) ==1))
		{
				$row=mysql_fetch_array($result);
				$name_t=stripslashes($row['name_t']);	
				$name_e=stripslashes($row['name_e']);	
				$journal=stripslashes($row['journal']);	
				$page=$row['page'];	
				$num=$row['num'];	
				$name1=stripslashes($row['name1']);	
				$from1=stripslashes($row['from1']);	
				$name2=stripslashes($row['name2']);	
				$from2=stripslashes($row['from2']);	
				$name3=stripslashes($row['name3']);	
				$from3=stripslashes($row['from3']);	
				$abstract=stripslashes($row['abstract']);	
				$filename=$row['filename'];	
				$nowdate=$row['nowdate'];	
				print "<font size=3><CENTER><b>บทความวิจัยตีพิมพ์</b></CENTER></font><br>";
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
								print "<tr><td><CENTER>&nbsp;<b><font size=3>$name_t <br> $name_e</font></b></CENTER></td></tr>"; 							
								print "<tr bgcolor='#FFFFFF'><td><B>จากวารสาร</B> $journal  <B>เล่ม</B> $num  <b>หน้า</b> $page</td></tr>";
								print "<tr><td><B>ผู้วิจัย</B></td></tr>";
								print "<tr bgcolor='#FFFFFF'><td>- $name1 $from1</td></tr>";
								if($name2!="") print "<tr bgcolor='#FFFFFF'><td>- $name2 $from2</td></tr>";
								if($name3!="") print "<tr bgcolor='#FFFFFF'><td>- $name3 $from3</td></tr>";
								print "<tr><td><B>บทคัดย่อ</B></td></tr>";
								print "<tr bgcolor='#FFFFFF'><td>$abstract</td></tr>";
								print "<tr><td><b>Download file</b></td></tr>";
								print "<tr bgcolor='#FFFFFF'><td><a href='$file_public/".$filename."'>$filename</a></td></tr>";
								print "<tr><td><b>Last Update </b> $nowdate </td></tr>";
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
<?
		}
		else
		{
				print "ไม่พบข้อมูล";
		}
}
else
{
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//ถ้ามีการกำหนดหน้าเป็นอย่างอื่น คือพิมพ์ลงไปเองก็จะแจ้ง Not found
if($screen <1 or $screen > $pages)  print "<center><b><br>Sorry. Not found</b></center>";
else
{
		$start = ($screen-1) * $rows_per_page;

		//select ทุกๆ publication เข้ามาทั้งหมดเลยอ่ะ
		$query="select ID,name_t,name_e,abstract from public order by ID desc LIMIT $start, $rows_per_page";
		$result = mysql_query($query);  
		if($result)
		{	$num=1;
			//----------------------------------------------------------------------->>
			print "<table border=0 cellpadding=5 cellspacing=1 width=98%>";
			print "<tr><td id=w2><font size=3><b>Security Publication</b></font> (จำนวน Publication ทั้งหมด <B>$total_records</B>) </td></tr><tr><td>&nbsp;</td></tr>";
			print "<tr id=w2><td>";
						print "<b><U>Page</U> </b>";
					if ($screen > 1) print "<a href='$PHP_SELF?screen=".($screen - 1)."'> << </a>";
					for ($i = 1; $i <= $pages; $i++) 
					{
						if($i==$screen) echo " <B>[$i]</B> ";		
						else print "<a href='$PHP_SELF?screen=".$i."'> $i </a>";
					}
					if ($screen < $pages ) print "<a href='$PHP_SELF?screen=".($screen + 1)."'> >> </a>";
			print "</td></tr>";
			//----------------------------------------------------------------------->>
			while($row=mysql_fetch_array($result))
			{
			$ID		= $row['ID'];
			$name_t		= stripslashes($row['name_t']);
			$name_e		= stripslashes($row['name_e']);
			$abstract		= stripslashes($row['abstract']);
			$alter = ($num % 2 == 0) ? "w1" : "w3";
			// print แสดงในหน้าแรกเฉพาะชื่อไทย อังกฤษ และเนื้อหาย่อสั้นๆ แล้วมี link ไปตัวเต็ม
?>
				 
				<tr ID="<?=$alter?>">					
					<td> 					
							<table border=0 cellpadding=0 cellspacing=0 width=100%>
								<tr><td width=1>&nbsp;</td><td>
										<? print "<B><img src='$path_web_img"."bullet.gif'>&nbsp;$name_t</B>"; ?><br>
										<? print "<B>$name_e</B>"; ?><br><br>
										<? print substr($abstract,0,300)." ...  <a href='$PHP_SELF?id=".$ID."'><B>More Detail</B></a>"; ?><br>
								</td></tr></table>						
					</td>				
				</tr>							
<?			$num++;
				}
			//----------------------------------------------------------------------->>
			//print "<tr ID=table32><td align=right><font color=white>&nbsp;</font></td></tr>";						
			print "<tr ID=w2><td align=right>&nbsp;";					
					print "<b><U>Page</U> </b>";
					if ($screen > 1) print "<a href='$PHP_SELF?screen=".($screen - 1)."'> << </a>";
					for ($i = 1; $i <= $pages; $i++) 
					{
						if($i==$screen) echo " <B>[$i]</B> ";		
						else print "<a href='$PHP_SELF?screen=".$i."'> $i </a>";
					}
					if ($screen < $pages ) print "<a href='$PHP_SELF?screen=".($screen + 1)."'> >> </a>";
			print "</td></tr>";
			//----------------------------------------------------------------------->>

				print "</table>";
		}
		else { print "<center>Cannot Query Database</center>"; }
}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close("</center>");
empty_4();
?>
