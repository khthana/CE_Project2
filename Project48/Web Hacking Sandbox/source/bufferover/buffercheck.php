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
	color:#FF3333;
}
a:hover {
	text-decoration: none;
	background-color: #FF8204;
	color: #FFFFFF; 
	width:100%
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
          <td width="18%" rowspan="3">&nbsp;</td>
          <td width="34%">&nbsp;</td>
          <td width="4%" rowspan="2">&nbsp;</td>
          <td width="21%" rowspan="3" valign="top">&nbsp;</td>
          <td width="23%" rowspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td height="57"><table width="100%" border="1" cellspacing="0" bordercolor="#006699">
              <tr> 
                <td class="style0">
<?php
$lenname=strlen($user);
$lenpwd=strlen($Pwd);
 if(($user=='')&&($Pwd=='')){
	print" <div align='center'>กรุณาใส่ Username หรือ Password ";
	print"   <br><br>";
	print"    <a href='buffer.php'>ทดลองใหม่</a> </div>";
 }
else if(($lenname>20)||($lenpwd>20)){
	

					print"<div align='center'> <font color='#FF3333'>สำเร็จ</font><br>";
					print"    ยินดีต้อนรับ<br>";       
					
					print"   <br><br>";
					print"    <a href='buffer.php'>ทดลองใหม่</a> ";
	} else {

				   print"   </div>";
				   print"   <br> <div align='center' class='style0'><font color='#FF3333'>ไม่สำเร็จ</font><br>";
				   print"     ลองใหม่นะครับ <br>";
				   print"     <a href ='buffer.php' >Back</a></div>";
				   
	}

?>
                </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="34%"><table width="100%" border="0">
              <tr> 
                <td width="80%"><form name="form_inside_goto_protected" method="post" action="bufferpro.php">
                    <div align="right"> 
                      <input type="submit" name="Submit2" value="การป้องกัน">
                    </div>
                  </form></td>
                <td width="20%"><form name="form_to_info" method="post" action="buffer.html">
                    <div align="right"> 
                      <input type="submit" name="Submit3" value="ข้อมูลเบื้องต้น">
                    </div>
                  </form></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
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
  <area shape="rect" coords="0,0,420,116" href="../../index1.html">
</map>
</BODY>
</HTML>