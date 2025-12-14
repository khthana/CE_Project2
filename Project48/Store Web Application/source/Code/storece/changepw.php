<?php
include "chksession.php";
?>

<HTML>
<HEAD>
<TITLE> ระบบสมาชิก </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
.style1 {color: #3399FF}
.style2 {
	color: #3300FF;
	font-weight: bold;
}
.style3 {color: #3366FF}
</style>
</HEAD>

<body bgcolor="#99FFFF">
<h2 align="center" class="style1">	<br> 
  <span class="style2">:: เปลี่ยนรหัสผ่าน :: </span></h2>
<FORM METHOD="POST" ACTION="changepw2.php">
<center> 
<TABLE width="293" CELLSPACING="2">
<TR>
<TD width="116"><span class="style1">Username : </span></TD>
<TD width="165"><b><font color="#3300FF"><?=$sess_username?></font></b></TD>
</TR>

<TR>
<TD><span class="style1"> รหัสผ่านเดิม : </span></TD>
<TD><INPUT name="oldpass" type="password"> * </TD>
</TR>

<TR>
<TD><span class="style1"> รหัสผ่านใหม่ : </span></TD> 
<TD><INPUT name="newpass" type="password"> * </TD>
</TR>

<TR>
<TD><span class="style1"> ยืนยันรหัสผ่าน : </span></TD>
<TD><INPUT name="newpass2" type="password"> * </TD>
</TR>

<TR>
<TD></TD>
<TD> <INPUT TYPE="submit" value="ตกลง"> <input type="reset" value="ยกเลิก"> </TD>
</TR>
</TABLE>
</center>
</FORM>
<div align="center" class="style3">[ <a href="profile.php"> กลับหน้าแรก </a> ]</div>
</BODY>
</HTML>
