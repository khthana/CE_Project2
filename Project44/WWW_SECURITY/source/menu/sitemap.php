<?php 
include "interface.inc.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
?>

<CENTER><img src="<?=$path_web_img?>topic_sitemap.gif"></CENTER><br>
<table cellpadding=0 cellspacing=1 border=0 width=85%>
<tr>
		<td width=33%><table cellpadding=3 cellspacing=0 border=0 width=100%>
			<tr id=table3><td><CENTER><B>Resource</B></CENTER></td></tr></table></td>
		<td>&nbsp;&nbsp;</td>
		<td width=33%><table cellpadding=3 cellspacing=0 border=0 width=100%>
			<tr id=table3><td><CENTER><B>Community</B></CENTER></tr></table></td>
		<td>&nbsp;&nbsp;</td>
		<td width=33%><table cellpadding=3 cellspacing=0 border=0 width=100%>
			<tr id=table3><td><CENTER><B>About ISAG</B></CENTER></tr></table></td>
</tr>
<tr>
		<td valign=top><table cellpadding=5 cellspacing=1 border=0 width=100%>
			<tr id=w2><td><B><a href="../home/index.php?type=news">News</a></B><br>ข่าวความเคลื่อนไหวต่างๆ </td></tr>
			<tr id=w1><td><B><a href="../home/index.php?type=events">Events</a></B><br>กิจกรรม งานอมรม บรรยายต่างๆ</td></tr>
			<tr id=w2><td><B><a href="../articles/articlelist.php">Articles & Document </a></B><br>เอกสารและบทความที่น่าสนใจ</td></tr>
			<tr id=w1><td><B><a href="../project/projects.php">Project </a></B><br>โครงงานของห้องวิจัย</td></tr>
			<tr id=w2><td><B><a href="../paper/public.php">Publication</a></B><br>บทความวิจัยตีพิมพ์ </td></tr>
			<tr id=w1><td><b>Download</b><br> Patch โปรแกรม เครื่องมือต่างๆ</td></tr>
			<tr id=w2><td><b><a href="../link/listgroup.php">Links</a></b><br>รวมลิงค์ที่น่าสนใจ </td></tr>
		</table></td>

		<td>&nbsp;&nbsp;</td>
		<td valign=top><table cellpadding=5 cellspacing=1 border=0 width=100%>
			<tr id=w2><td><B><a href="../staff/staff.php">Members</a></B><BR>สมาชิกห้องวิจัย</td></tr>
			<tr id=w1><td><B><a href="../webboard/boardlist.php"> Webboard</a></B><BR>เวบบอร์ดแสดงความคิดเห็น</td></tr>
			<tr id=w2><td><B><a href="../guestbook/guestbook.php">Guest book</a></B><BR>สมุดเยี่ยมชม</td></tr>
			<tr id=w1><td><B>Mailing list </B><BR>รับจดหมายข่าว</td></tr>
		</table></td>

		<td>&nbsp;&nbsp;</td>
		<td valign=top><table cellpadding=5 cellspacing=1 border=0 width=100%>
			<tr id=w2><td><B><a href="../menu/contact.php">Contact </a></B><BR>เกี่ยวกับห้องวิจัย</td></tr>
			<tr id=w1><td><B><a href="../faq/faq.php">FAQ</a></B><BR>คำถามที่ถามบ่อย</td></tr>
			<tr id=w2><td><B><a href="../menu/search.php">Search</a></B><BR>ค้นหาข้อมูลในเวบไซต์</td></tr>
		</table></td>
</tr>
</table>
<?
curve_close("</center>");
empty_4();
?>