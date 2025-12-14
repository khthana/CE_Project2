<?php 
session_start();
?>
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
<script language="JavaScript">
          function checkIsNum()
           {
		   
                if((document.form2.textfield.value=="")||(isNaN(document.form2.textfield.value)))
				     {
                      alert ("กรุณากรอกจำนวนที่ต้องการสั่งซื้อ");
                     document.form2.textfield.focus();
                     return;
					  }
					  document.form2.submit();
            }
</script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<?php
if (!session_is_registered("price")) session_register("price");
$_SESSION['pvalue']=5000;
?>
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="22%" rowspan="2" valign="top" class="style0"><font color="#FF0000"><br>Page นี้ได้รับการป้องกันแล้ว<br>
            </font></td>
          <td colspan="2" valign="middle" class="style0"><div align="center">
              <div align="center"> 
                <form name="form1" method="post" action="" >
                  UserName <br>
                  <input name="user" type="text" size="20" maxlength="20">
                  <br>
                  <br>
                  Password<br>
                  <input name="Pwd" type="password" size="20" maxlength="16">
                  <br>
                  <br>
                  <input type="submit" name="Submit3" value="Login">
                </form>
              <script language="JavaScript">
          function popupcookie()
           {
                   alert(document.cookie);
				     return;
            }
</script>
                <input type="submit" name="Submit22" value="ดูค่า cookie" onClick=popupcookie()>
                <br>
              </div>
            </div></td>
          <td width="30%" rowspan="2" valign="top" class="style0"><font color="#FF0000">การป้องกัน</font><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;หลีกเลี่ยงการใช้ cookie หรือ การใช้ form ก็ควรระมัดระวังโดยการกรอง 
            input โดยระเอียดและไม่ใช้ Hidden field ในการส่งข้อมูลสำคัญ ถ้าจะใช้ 
            cookie ก็เก็บข้อมูลส่วนที่ไม่สำคัญแล้วก็ต้องเข้ารหัส cookie ด้วย</td>
          <td width="3%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="49%" valign="middle"><div align="right">
                    <form name="form1" method="post" action="../../javainject.php">
                      <input type="submit" name="Submit" value="ข้อมูลเบื้องต้น">
                    </form>
                  </div>
                </td>
                <td width="51%" valign="top"><form name="formA" method="post" action="../../test/javainjecttest.php">
                    <input type="submit" name="Submit2" value="ทำการทดลอง">
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		
    <TD COLSPAN=3 class="style0"> <div align="center">:: Java injection Protected ::</div></TD>
		<TD>
			<IMG SRC="../../../images/scr_04.gif" WIDTH=109 HEIGHT=41 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=2>
			<IMG SRC="../../../images/scr_05.gif" WIDTH=473 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../../images/scr_06.gif" WIDTH=168 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../../images/scr_07.gif" WIDTH=109 HEIGHT=46 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="../../../images/scr_08.gif" WIDTH=36 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../../images/scr_09.gif" WIDTH=437 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../../images/scr_10.gif" WIDTH=168 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../../images/scr_11.gif" WIDTH=109 HEIGHT=42 ALT=""></TD>
	</TR>
	<TR>
		
	</TR>
</TABLE>

<map name="Map">
  <area shape="rect" coords="-35,2,416,125" href="../../../index1.html">
</map>
</BODY>
</HTML>