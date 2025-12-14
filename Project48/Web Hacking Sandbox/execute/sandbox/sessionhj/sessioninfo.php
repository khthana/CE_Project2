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
					   scrollbar-face-color: #0099FF;
					   scrollbar-highlight-color: #006699; 
					   scrollbar-shadow-color: #006699; 
					   scrollbar-arrow-color: #FFFFFF;
					   scrollbar-track-color: #FFFFFF; 
					   scrollbar-darkshadow-color: #009900;
        }
		a:link {
	color: #F58227;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #006699;
}
a:hover {
	text-decoration: none;
	background-color: #7DD6E8;
	color: #F58227; 
	width:100%
}-->
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
          <td colspan="2" class="style0"><br><font color="#FF0000">การขโมยเซสชั่น 
            (Session Hijacking)</font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การขโมยเซสชั่นเป็นวิธีการหนึ่งที่ทำให้สามารถได้สิทธิการเข้าถึงระบบใดระบบหนึ่งซึ่ง<br>
            สามารถทำได้หลายรูปแบบเช่น การโจมตีเพื่อให้ได้เซสชั่นของผู้อื่นหรือวิธีการสังเกตลำดับของ<br>
            หมายเลขเซสชั่นที่ระบบนั้นแจกจ่ายให้กับผู้ใช้แต่ละคน<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;การขโมยเซสชั่นเบื้องต้นประกอบด้วยขั้นตอนดังนี้<br> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">&nbsp;- 
            เลือกเป้าหมาย <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
            เรียนรู้การเปลี่ยนแปลงของหมายเลขลำดับเซสชั่น <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
            ทำนาย, คาดเดาหมายเลขเซสชั่นของเป้าหมาย<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
            ทดลองเปลี่ยนเซสชั่นที่ได้มาใหม่ </font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ตัวอย่างในชุดทดลองนี้ 
            ให้สังเกตหมายเลขเซสชั่นของผู้ใช้แต่ละคนที่ระบบทำการแจกจ่าย<br>
            ให้โดยที่มีการเข้ารหัสอย่างง่ายๆ ให้สังเกตความสัมพันธ์ของแต่ละหมายเลขและทดลองถอดรหัส<br>
            เซสชั่นของเป้าหมาย และทำการเปลี่ยนเซสชั่นที่ได้มาให้เป็นของเราโดยใช้วิธีการในหัวข้ออื่นๆมา<br>
            ประกอบการทดลองเพื่อให้สัมฤทธิ์ผลได้.... <br>
          </td>
          <td width="2%" rowspan="2" valign="top">&nbsp; </td>
          <td width="20%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="83%"><div align="right"> </div></td>
                <td width="8%"><form name="form_test" method="post" action="test/index.php" target="_blank">
                    <input type="submit" name="Submit" value="ทำการทดลอง">
                  </form></td>
                <td width="9%"><form action="protected/protected.php" method="post" name="form2" target="_blank">
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
		<TD COLSPAN=4>
			<IMG SRC="../images/scr_12.gif" WIDTH=750 HEIGHT=87 ALT=""></TD>
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
<map name="Map">
  <area shape="rect" coords="-19,3,417,111" href="../index1.html">
</map>
</BODY>
</HTML>