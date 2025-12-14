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

<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="17%" rowspan="2">&nbsp;</td>
          <td colspan="2" class="style0"> <font color="#DE5208"><u>ข้อมูลเบื้องต้นเกี่ยวกับ 
            Cross-Site Script ( XSS) </u></font><br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#DE5208">Cross-Site 
            Script</font> เป็นการใช้ Web Application เช่น ระบบ เว็บบอร์ด ในการฝัง<br>
            script ที่มีจุดมุ่งหมายต่างๆไว้ เมื่อผู้ใช้คลิ้กเข้ามาก็จะทำให้ script 
            ที่ฝังไว้นั้นทำงานตามจุด<br>
            ประสงค์ต่างๆโดยอัตโนมัติ<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            ยกตัวอย่างเช่น เว็บไซต์บางเว็บได้ทำการฝังโค้ดเพื่อทำการขโมยคุกกี้เอาไว้ใรลิ้งค์ภาย<br>
            ในเว็บ แล้วทำการหลอกล่อให้ผู้เปิดดูเว็บนั้นให้ทำการคลิ้กลิ้งค์นั้นๆเมื่อทำการคลิ้กลิ้งนั้นแล้ว 
            <br>
            โค้ดที่ฝังไว้ก็จะทำงานโดยส่งค่าคุกกี้ในเครื่องเหยื่อกลับมาให้ผู้ประสงค์ร้ายนำข้อมูลไปใช้<br>
            ประโยชน์อย่างอื่นต่อไป<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;หรือผู้ไม่ประสงค์ดีก็สามารถวาง 
            Script ที่สามารลิ้งไปยังเว็บอื่นที่ไม่พึงประสงค์ได้เช่น<br> <font color="#DE5208">http://www.ourwebsite.com/index.php?cmd=http://www.google.com</font><br> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;โดยที่ <font color="#FF0000">http://www.ourwebsite.com/index.php</font> 
            คือเว็บเป้าหมายที่จะวางscript<br> <font color="#FF0000">?cmd=http://www.google.com</font> 
            เป็น script คำสั่งที่ทำการเปลี่ยนเป้าหมายให้ไปยังเว็บ<br>
            ที่ต้องการ โดยผู้บุกรุกสามารถวาง script ไว้ในเว็บบอร์ดหรือเกสต์บุ๊คที่ยังไม่ได้ทำการป้องกันได้<br>
            <br>
          </td>
          <td width="7%" rowspan="2" valign="top">&nbsp; </td>
          <td width="14%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="83%"><div align="right"> </div></td>
                <td width="8%"><form name="form_test" method="post" action="test/testxss.php" target="_blank">
                    <input type="submit" name="Submit" value="ทำการทดลอง">
                  </form></td>
                <td width="9%"><form name="form2" method="post" action="protected/testxss.php" target="_blank">
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

<map name="Map">
  <area shape="rect" coords="-8,1,417,115" href="../index1.html">
</map>
</BODY>
</HTML>