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
	color: #006699;
}
-->
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" height="28" border="0">
        <tr> 
          <td width="18%" height="24">&nbsp;</td>
          <td colspan="2"  class="style0"><p><br>
              <font color="#FF0000">Application Buffer Overflows</font><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Application Buffer Overflows นั้นเป็นปัญหาที่เกิดจากปริมาณพื้นที่ที่ได้เตรียมไว้สำหรับการรับข้อมูล นั้นน้อยกว่าข้อมูลที่ได้รับมา โดยจะทําตรงส่วนของ text box ที่รับข้อมูลจากผู้ใช้งานเว็บเพจนั้นๆ การโจมตีทําได้โดยการป้อนอินพุทปริมาณมากๆ ลงในช่อง หรือส่วนในการรับอินพุทจากหน้าเว็บเพจ เมื่อเว็บเพจนั้นส่งข้อมูลไปยังเซิร์ฟเวอร์แล้วข้อมูลที่มีขนาดมากกว่าที่กําหนดไว้จะไปทําให้แอปพลิเคชั่นหยุดการทํางานได


 เช่นดังตัวอย่างข้างล่างนี้
</p>
            <p><font color="#0000FF">&lt;form name=&quot;form2&quot; method=&quot;post&quot; 
              <font color="#FF0000">action=&quot;http://www.example.com/ckbuy.php&quot;</font>&gt; 
              </font></p>
            <p><font color="#0000FF">&lt;input name=&quot;textfield&quot; type=&quot;text&quot; 
              <font color="#FF0000">size=&quot;1000000&quot; maxlength=&quot;1000000&quot;</font> 
              &gt; </font></p>
            <p><font color="#0000FF">&lt;input type=&quot;submit&quot; name=&quot;Submit&quot; 
              value=&quot;Submit&quot;&gt; </font></p>
            <p><font color="#0000FF">&lt;/form&gt;</font> </p>
            <p>เป็นการทำ Application Buffer Overflows โดยการเพิ่มช่องรับอินพุตให้มีขนาด 1000000 เพื่อที่จะใส่ข้อมูลจำนวนมากไปยิงใส่ Server แล้วทำการแก้ filed action เพื่อส่งไปประมวลที่ Server ซึ่งอาจทำให้ Server หยุดการทำงานได้ซึ่งถ้าหากเป็น Application ที่มีการนำค่าดังกล่าวไปคำนวนก็อาจเกิดการคำนวณผิดพลาดได้ </p>
            <div align="right">
              
              <table width="100%" border="0">
                <tr> 
                  <td width="83%"><div align="right"> </div></td>
                  <td width="8%"><form name="form_test" method="post" action="buffer.php">
                      <input type="submit" name="Submit" value="ทำการทดลอง">
                    </form></td>
                  <td width="9%"><form name="form2" method="post" action="bufferpro.php">
                      <input type="submit" name="Submit2" value="การป้องกัน">
                    </form></td>
                </tr>
              </table>
              
            </div></td>
          <td width="8%" valign="top">&nbsp; </td>
          <td width="14%">&nbsp;</td>
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

<map name="Map">
  <area shape="rect" coords="2,3,427,114" href="../index1.html">
</map>
</BODY>
</HTML>