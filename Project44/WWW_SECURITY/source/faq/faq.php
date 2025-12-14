<?php 
include "interface.inc.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$group=$HTTP_GET_VARS["group"];
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ส่วนนี้จะ print หมวด จากหมายเลข group ที่ได้รับเข้ามา
$sql0 = "select group_name from faq_group where id='$group' ";
$result = mysql_query($sql0);

if (($result) and mysql_num_rows($result) ==1) //ถ้าเลขที่ post มามีในหมวดก็ print หมวด พร้อม all link
{
	$row=mysql_fetch_array($result);
	$group_name=$row['group_name'];

	//print "<center><b><font size=3> </font></b></center><br>";
	print "<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td id=table3><B><font size=3> <CENTER>FAQ หมวด $group_name</CENTER> </font></B></td></tr></table><br>";
	// select question and answer
			$sql2="select question,answer from faq_each where id_group='$group' ";
			$result = mysql_query($sql2);
			if(($result) and mysql_num_rows($result) > 0)
			{
				print "<table border=0 cellpadding=3 cellspacing=0 width=100%>";
				while ($row=mysql_fetch_array($result))
					{
							$question=$row['question'];
							$answer=$row['answer']; 
							print "<tr><td valign=top ID=w2><img src=$path_web_img"."bullet.gif> <b>$question </b></td></tr>";
							print "<tr><td><font color='black'>$answer</font><br><br></td></tr>";
					}
				print "</table>";
			}
			else // มีกลุ่มที่ถูกต้อง แต่ไม่มี faq ในกลุ่มนั้น
			{
					print " ";
			}
}
else
	{	print "<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td id=w2><B><font size=3> <CENTER>เลือกหมวด FAQ ด้านขวามือ</CENTER> </font></B></td></tr></table>"; }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
other_5("faqmenu");
?>