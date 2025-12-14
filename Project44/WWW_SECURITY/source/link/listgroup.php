<?php 
include "interface.inc.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$group=$HTTP_GET_VARS["group"];
//------------------------------------------------------------------------------------------------------------------------------------------------------------
// ส่วนนี้จะ print หมวด จากหมายเลข group ที่ได้รับเข้ามา
$sql0 = "select group_name from link_group where id_group='$group' ";
$result = mysql_query($sql0);

if (($result) and mysql_num_rows($result) ==1) //ถ้าเลขที่ post มามีในหมวดก็ print หมวด พร้อม all link
{
	while($row=mysql_fetch_array($result))
	$group_name=$row['group_name'];

	print "<center><b><font size=3>link หมวด $group_name </font></b></center><br>";

//------------------------------------------------------------------------------------------------------------------------------------------------------------		
			// select link และคำอธิบาย มาแสดง
			$sql2="select id_link,linkname,link,link_detail,date_format(day_add,'%e %b %Y, %H:%i') AS day_add,user_add from link_each where group_name='$group' order by day_add desc";
			$result = mysql_query($sql2);
			if(($result) and mysql_num_rows($result) > 0)
			{
?>
					<table border=0 cellpadding=2 cellspacing=0 width=100%>				
	<?
					while ($row=mysql_fetch_array($result))
					{
							$idlink=$row['id_link'];
							$link=stripslashes($row['link']);
							$linkname=stripslashes($row['linkname']);
							$detail=stripslashes($row['link_detail']);
							$day_add=$row['day_add'];
							$user_add=$row['user_add'];
					
							print "<tr><td valign=top ID=w2>";
							//print "<input type='checkbox' name='link[]' value='$idlink'>";
							print "<img src='$path_web_img"."bullet.gif'> <b><a href='$link' target='_new_'>$linkname</a></b></td></tr>"; 
							print "<tr><td><font color='black'> $detail </font><br><font color='brown'> <B>by</B> $user_add ($day_add) <br><br></font></td></tr>";
					}
					print "</table>";
			}
			else // มีกลุ่มที่ถูกต้อง แต่ไม่มี link ในกลุ่มนั้น
			{
					print " ";
			}
	} // ถ้าผู้ใช้พิมพ์ id กลุ่มที่ไม่มีจริงๆ 
	else
	{	print "<center><b><font size=3>เลือกหมวด link ด้านขวามือ </font></b></center><br>"; }

//-------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
other_5("links");
?>
<!--- staff เห็นหรือคนอื่นเห็น -->