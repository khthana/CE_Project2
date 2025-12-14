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
		   
                if((document.form2.order.value=="")||(isNaN(document.form2.order.value)))
				     {
                      alert ("กรุณากรอกจำนวนที่ต้องการสั่งซื้อ");
                     document.form2.order.focus();
                     return;
					  }
					  document.form2.submit();
            }
</script>
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
          <td width="30%" rowspan="2" valign="top" class="style0"><br><font color="#FF0000">ภารกิจ</font><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ทำการสั่งซื้อสินค้าในราคาที่เรากำหนดเอง<br> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;โดยใช้<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">Java Injection 
            Form Editing </font> </td>
          <td colspan="2" valign="top" class="style0"> <div align="center"> <img src="../../../images/Boom_Box_4.jpg" width="225" height="111"><br>
              <font color="#003366">ราคา 5000 บาท</font><br>
              <form name="form2" method="post" action="jchk.php">
                <input name="price" type="hidden" id="price2" value="5000">
                ซื้อจำนวน 
                <input name="order" type="text" size="3" maxlength="3" >
                เครื่อง<br>
                <br>
                <input type="button" name="Submit3" value="Submit" onClick=checkIsNum()  >
              </form>
            </div>
            &nbsp;</td>
          <td width="32%" rowspan="2" valign="top"><iframe src="hint.php" class="style0"  frameborder="0" height="300" ></iframe></td>
          <td width="3%" rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="0">
              <tr> 
                <td width="83%"><div align="right"> </div></td>
                <td width="8%"><form name="form_test" method="post" action="../javainjecttest.php">
                    <input type="submit" name="Submit" value="ข้อมูลเบื้องต้น">
                  </form></td>
                <td width="9%"><form name="formp" method="post" action="../protected/javaprotected.php">
                    <input type="submit" name="Submit2" value="การป้องกัน">
                  </form></td>
              </tr>
            </table></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		
    <TD COLSPAN=3 class="style0"> <div align="center">:: Java Injection Form Editing 
        :: <br>
      </div></TD>
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
  <area shape="rect" coords="-27,2,415,114" href="../../../index1.html">
</map>
</BODY>
</HTML>