<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Web Hacking Sandbox... Solution  for protected the Web...</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../../../smf.css" rel="stylesheet" type="text/css">
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
-->
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- ImageReady Slices (scr.jpg) -->
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="19%" rowspan="2">&nbsp;</td>
          <td colspan="2" class="style0"> <br> <font color="#DE5208">ข้อมูลเบื้องต้น </font><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; เทคนิคที่ Hacker 
            นิยมทำ SQL Injection เนื่องจากเมื่อเวลาเราต้องการที่จะ Login (Authentication) 
            เข้าสู่ web site ทาง Web Server จะถาม "Username" และ "Password" ของเรา 
            เมื่อเราใส่ Username และ password แล้ว Browser ก็จะนำข้อมูลไป check 
            กับฐานข้อมูลในลักษณะ select * from table where user_name = "username" 
            จากการที่เราใช้ "where clause" ในการเขียน web application เพื่อการค้นข้อมูลของ 
            user ซึ่งในการเขียนโปรแกรมนี้จะดูง่ายแต่ในทางมุมมองของ Hacker นั้น 
            Hacker จะใช้ วิธีใส่ SQL command แปลกๆ เพิ่มเติมเข้ามาใน SQL Query 
            เพื่อดึงข้อมูลที่ Hacker ต้องการออกมาจาก Web Site แฮกเกอร์จะใส่ชื่อ 
            username อะไรก็ได้แต่ password สำหรับการทำ SQL injection จะใส่เป็น 
            Logic Statement ยกตัวอย่างเช่น ' or '1' = '1 หรือ " or "1"= "1 ถ้า 
            Web Application ของเราไม่มีการเขียน Input Validation ดัก password 
            แปลกๆ แบบนี้ แฮกเกอร์ก็สามารถที่จะ bypass ระบบ Authentication ของเราและ 
            Login เข้าสู่ระบบเราโดยไม่ต้องรู้username และ password ของเรามาก่อนเลย 
          </td>
          <td width="4%" rowspan="2" valign="top">&nbsp; </td>
          <td width="20%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="83%"><div align="right"> </div></td>
                <td width="8%"><form name="form_test" method="post" action="test/sqlinject.php">
                    <input type="submit" name="Submit" value="ทำการทดลอง">
                  </form></td>
                <td width="9%"><form name="form2" method="post" action="protected/sqlprotected.php">
                    <input type="submit" name="Submit2" value="การป้องกัน">
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		<TD COLSPAN=3>
			<IMG SRC="../images/scr_03.gif" WIDTH=641 HEIGHT=41 ALT=""></TD>
		<TD>
			<IMG SRC="../images/scr_04.gif" WIDTH=109 HEIGHT=41 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=2>
			<IMG SRC="../images/scr_05.gif" WIDTH=473 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../images/scr_06.gif" WIDTH=168 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../images/scr_07.gif" WIDTH=109 HEIGHT=46 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="../images/scr_08.gif" WIDTH=36 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../images/scr_09.gif" WIDTH=437 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../images/scr_10.gif" WIDTH=168 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../images/scr_11.gif" WIDTH=109 HEIGHT=42 ALT=""></TD>
	</TR>
	<TR>
		
    
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
<map name="Map">
  <area shape="rect" coords="-6,2,419,115" href="../index1.html">
</map>
</BODY>
</HTML>