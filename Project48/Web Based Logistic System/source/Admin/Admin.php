<HTML>
<HEAD>
<TITLE>Admin</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-874">
<style type="text/css">
<!--
body,td,th {
	font-family: MS Sans Serif;
	font-size: 14px;
}
a {
	font-size: 14px;
	color: #000000;
}
a:hover {
	color: #0000FF;
	text-decoration: none;
}
body {
	background-color: #FFCC33;
	background-image: url(images/bg01.gif);
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style></HEAD>
<BODY LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- ImageReady Slices (Admin.psd) -->
<table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#6F4200">
  <tr>
    <td><TABLE WIDTH=800 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
      <TR>
        <TD> <IMG SRC="images/Admin_01.gif" WIDTH=99 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_02.gif" WIDTH=99 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_03.gif" WIDTH=103 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_04.gif" WIDTH=98 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_05.gif" WIDTH=109 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_06.gif" WIDTH=100 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_07.gif" WIDTH=100 HEIGHT=35 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_08.gif" WIDTH=92 HEIGHT=35 ALT=""></TD>
      </TR>
      <TR>
        <TD> <IMG SRC="images/Admin_09.gif" WIDTH=99 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_10.gif" WIDTH=99 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_11.gif" WIDTH=103 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_12.gif" WIDTH=98 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_13.gif" WIDTH=109 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_14.gif" WIDTH=100 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_15.gif" WIDTH=100 HEIGHT=37 ALT=""></TD>
        <TD> <IMG SRC="images/Admin_16.gif" WIDTH=92 HEIGHT=37 ALT=""></TD>
      </TR>
      <TR>
        <TD colspan="8"><table width="100%" height="23" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFCC">
              <tr>
                <td width="83"><div align="center"><strong><a href="../index.php">หน้าเว็บ</a></strong></div></td>
                <td width="115" height="23"><div align="center"><strong><a href="?file=userdata.php">ข้อมูลพนักงาน</a></strong></div></td>
                <td width="109"><div align="center"><strong><a href="?file=customerdata.php">ข้อมูลสมาชิก</a></strong></div></td>
                <td width="121"><div align="center"><strong><a href="?file=stationdata.php">ข้อมูลสถานที่ตั้ง</a></strong></div></td>
                <td width="147"><div align="center"><strong><a href="?file=transdata.php">ตรวจสอบตารางสินค้า</a></strong></div></td>
                <td width="115"><div align="center"><strong><a href="?file=packdata.php">อัตราค่าบริการ</a></strong></div></td>
                <td width="110"><div align="center"><strong><a href="?file=webborddata.php">ข้อมูลเว็บบอร์ด</a></strong></div></td>
              </tr>
            </table></TD>
      </TR>
    </TABLE></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td bgcolor="#CBCBCF">&nbsp;</td>
      </tr>
      <tr>
          <td height="238" bgcolor="#EFEFEF" valign="top">
		  	  <? if($file=="")
		  {
		  require('userdata.php'); 
		  }
		  else{
		  require("$file"); 
		  }
		  ?>
	</td>
      </tr>
      <tr>
        <td bgcolor="#CBCBCF">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<!-- End ImageReady Slices -->
</BODY>
</HTML>