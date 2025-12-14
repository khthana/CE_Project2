<?php 

//setcookie("Status","Offline", time()+36000);
session_start();
?>
<?php 
if ($_COOKIE['admin']=='no'){ ?>
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
}
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 class="style0">
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="1%" rowspan="2">&nbsp;</td>
          <td width="40%" rowspan="2" valign="top" class="style0"><font color="#FF0000">ภารกิจ</font><br> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ทำการเปลี่ยนค่า cookie <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;จาก <font color="#FF0000">no</font> 
            ให้เป็น <font color="#FF0000">yes</font> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;โดยใช้ 
            <font color="#FF0000">Java Injection Cookie Editing </font> <div align="center">-----------------------------------------------------------</div> </td>
          <td colspan="2" valign="top" class="style0"> 
            <div align="center"> 
              <table width="100%" height="100%" border="0">
                <tr> 
                  <td valign="top" class="style0"><div align="center">
                      <form name="form1" method="post" action="" >
                        UserName <br>
                        <input name="user" type="text" size="20" maxlength="20">
                        <br>
                        <br>
                        Password<br>
                        <input name="Pwd" type="password" size="20" maxlength="20">
                        <br>
                        <br>
                        <input type="submit" name="Submit3" value="Login">
                        <br>
                      </form>
                    </div>
                    <font color="#FF0000">หมายเหตุ</font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;เว็บนี้เก็บ 
                    cookie กำหนดสถานะการ login เข้าระบบ<br> <script language="JavaScript">
          function popupcookie()
           {
                   alert(document.cookie);
				     return;
            }
</script> <input type="submit" name="Submit22" value="ดูค่า cookie" onClick=popupcookie()></td>
                </tr>
              </table>
            </div>
          </td>
          <td width="24%" rowspan="2" valign="top"><iframe src="hint.php"  frameborder="0" height="300"></iframe></td>
          <td width="2%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="83%"><div align="right"> </div></td>
                <td width="8%"><form name="form_test" method="post" action="../../javainject.php">
                    <input type="submit" name="Submit" value="ข้อมูลเบื้องต้น">
                  </form></td>
                <td width="9%"><form name="formp" method="post" action="../../protected/javaprotected.php">
                    <input type="submit" name="Submit2" value="การป้องกัน">
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		
    <TD COLSPAN=3 class="style0"> <div align="center">:: Java Injection Cookie 
        Editing ::</div></TD>
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
  <area shape="rect" coords="-22,3,416,113" href="../../../index1.html">
</map>
</BODY>
</HTML>  
<?php } 

else {
//if ($_COOKIE['Status']=='Online'||'online'){ 
setcookie("admin",$_COOKIE['admin'], time()+36000); ?>
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
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 class="style0">
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../../images/scr_01.gif" WIDTH=750 HEIGHT=112 ALT=""></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="0%" rowspan="2">&nbsp;</td>
          <td width="22%" rowspan="2" valign="top" class="style0">&nbsp;</td>
          <td colspan="2" valign="top" class="style0"> 
            <div align="center"> 
              <table width="100%" height="100%" border="0">
                <tr> 
                  <td valign="top" class="style0"><div align="center"> <br>
                      <font color="#FF0000">Good </font><br>
                      <br>
                      ลอง Refresh ดูผลลัพธ์<br>       
                      <br>
                      หรือ<br>
                      <a href="setcookie.php">ทดลองใหม่</a> </div>
                    <font color="#FF0000">หมายเหตุ</font><br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;เว็บนี้เก็บ cookie กำหนดสถานะการ 
                      login เข้าระบบ<br>
                      <script language="JavaScript">
          function popupcookie()
           {
                   alert(document.cookie);
				     return;
            }
</script>
                     <div align="center"> <input type="submit" name="Submit22" value="ดูค่า cookie" onClick=popupcookie()>
                    </div></td>
                </tr>
              </table>
            </div>
          </td>
          <td width="15%" rowspan="2" valign="top">&nbsp;</td>
          <td width="23%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="83%"><div align="right"> </div></td>
                <td width="8%"><form name="form_test" method="post" action="../../javainject.php">
                    <input type="submit" name="Submit" value="ข้อมูลเบื้องต้น">
                  </form></td>
                <td width="9%"><form name="formp" method="post" action="../../protected/javaprotected.php">
                    <input type="submit" name="Submit2" value="การป้องกัน">
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		<TD COLSPAN=3 class="style0"> <div align="center">:: Java Injection Cookie 
        Editing ::</div></TD>
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
  <area shape="rect" coords="-22,3,416,113" href="../../../index1.html">
</map>
</BODY>
</HTML>
<?php }?>