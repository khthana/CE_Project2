<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Web Hacking Sandbox... Solution  for protected the Web...</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../../../../smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#006699;
        }
		a:link {
	color: #F58227;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
.style1 {
	color: #FF6666;
	font-size: 18px;
}
.style4 {color: #0099FF}
.style5 {
	font-size: 18;
	color: #33CC66;
}
.style9 {font-size: 18px}
.style10 {color: #993399}
.style11 {color: #FF33FF}
-->
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- ImageReady Slices (scr.jpg) -->
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" height="100" border="0">
        <tr> 
          <td width="1%"><div align="center">
            <p class="style0 style1">&nbsp;</p>
            <p class="style0 style1"><span class="style4">เป้าหมายภาระกิจ</span> คือขโมย Session ของผู้ดูแลระบบมาให้ได้ </p>
            <p align="left" class="style0 style1">1 โดยการผ่านระบบ Authentication ไปให้ได้ซึ่งทางเราทราบมาว่าทางเว็บเป้าหมายได้นำเอา email มา Genterated เป็นSession ID </p>
            <p align="left" class="style0 style1">2 ใช้เทคนิคต่างๆเพื่อที่จะได้มาซึ่ง email ของผู้ดูแลระบบหลังจากนั้นก็สร้าง Session ของผู้ดูแลระบบ ซึ่งการสร้าง Session นั้นทางเราได้ทราบมาว่าเป็นการใช้การ xor กับ key ซึ่งเป็นวิธีการเข้ารหัสแบบง่ายๆตัวอย่างเช่น</p>
            <table width="504" height="147" border="0">
              <tr class="style5">
                <td><div align="center" class="style9 style10">email</div></td>
                <td><div align="center" class="style9 style11">Session ID </div></td>
              </tr>
              <tr class="style5">
                <td><div align="center" class="style9">test1@hotmail.com</div></td>
                <td><div align="center" class="style9">decfd9de9beac2c5dec7cbc3c684c9c5c7</div></td>
              </tr>
              <tr class="style5">
                <td><div align="center" class="style9">test2@hotmail.com</div></td>
                <td><div align="center" class="style9">decfd9de98eac2c5dec7cbc3c684c9c5c7</div></td>
              </tr>
              <tr class="style5">
                <td><div align="center" class="style9">test3@hotmail.com</div></td>
                <td><div align="center" class="style9">decfd9de99eac2c5dec7cbc3c684c9c5c7</div></td>
              </tr>
            </table>
            <p align="left" class="style0 style1">3 ทำการเปลี่ยน Session ID ไปเป็นผู้ดูแลระบบ</p>
            <p class="style0 style1">&nbsp; </p>
          </div></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		
    <TD COLSPAN=3 class="style0"> <div align="center"><font face="Microsoft Sans Serif, MS Sans Serif, sans-serif">:: 
        Mission Detail::</font></div></TD>
		<TD>
			<IMG SRC="../../images/scr_04.gif" WIDTH=109 HEIGHT=41 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=2>
			<IMG SRC="../../images/scr_05.gif" WIDTH=473 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_06.gif" WIDTH=168 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_07.gif" WIDTH=109 HEIGHT=46 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="../../images/scr_08.gif" WIDTH=36 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_09.gif" WIDTH=437 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_10.gif" WIDTH=168 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_11.gif" WIDTH=109 HEIGHT=42 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=4>&nbsp;			</TD>
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
<map name="Map">
  <area shape="rect" coords="1,2,416,111" href="../../index1.html">
</map>
</BODY>
</HTML>