<?php 
include "interface.inc.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
?>


<table border=0 cellpadding=8 cellspacing=0 width=95%>
<tr id=table1><td><CENTER><font size=3><b>ISAG Community</b></font></CENTER></td></tr>
<tr id=w1><td><B><a href="../staff/staff.php">Members</B></a><br>บุคลากรและสมาชิกห้องวิจัย ISAG</td></tr>
<tr id=table1><td><B><a href="../webboard/boardlist.php">General Webboard</a></B><br>เวบบอร์ดสอบถาม-แสดงความคิดเห็นเกี่ยวกับปัญหาทางด้าน security</td></tr>
<tr id=w1><td><B><a href="../webboard/boardlist.php?type=0">Staff Webboard</B></a><br>เวบบอร์ดแสดงความคิดเห็นภายใน สำหรับ Staff เท่านั้น</td></tr>
<tr id=table1><td><B><a href="../guestbook/guestbook.php">Guestbook</B></a><br>สมุดเยี่ยมชม  แนะนำ-ติชม เกี่ยวกับเว็บไซต์นี้</td></tr>
<tr id=w1><td><B>Mailinglist</B><br> สมัครสมาชิก เพื่อรับข่าวสารใหม่ๆ ก่อนใคร</td></tr>
</table>



<?
curve_close("</center>");
empty_4();
?>