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
	background-color: #FF8204;
	color: #FFFFFF; 
	width:100%
}
-->
</style>
<script language="JavaScript">
          function checkIsNum()
           {
		   
                if((document.formSubmit.textfield.value=="")||(isNaN(document.formSubmit.textfield.value)))
				     {
                      alert ("กรุณากรอกจำนวนที่ต้องการสั่งซื้อ");
                     document.formSubmit.textfield.focus();
                     return;
					  }
					  document.formSubmit.submit();
            }
</script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 class="style0">

<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" border="0">
        <tr> 
          <td width="1%">&nbsp;</td>
          <td width="29%" valign="top" class="style0"><br><font color="#FF0000">ภารกิจ</font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ทำการสั่งซื้อสินค้าในราคาที่เรากำหนดเอง 
          </td>
          <td colspan="2" valign="top" class="style0"><br><br><div align="center"><img src="../../images/Boom_Box_4.jpg" width="225" height="111"><br>
              <font color="#003366">ราคาชิ้นละ 
              5000 บาท</font><br><br>
              ท่านได้สั่งซื้อของชิ้นละ <font color="#FF0000"> 
              <?php 
	  echo $price;
	  print"</font> บาท<br><br>";
	 $lenprice=strlen($price);
	  $lenorder=strlen($order);
	  if(($lenorder<=3)&&($lenprice<=7)){
	  $total=$order*$price; 
		
              
         print"     จำนวน </span> <font color='#FF0000'>$order</font> เครื่อง<br><br>";
              
         print"     คิดเป็นเงิน<font color='#FF0000'> $total  </font>บาท<br>";
             
	  }
		else{
		print"<font color='#FF0000'>สั่งซื้อได้ไม่เกินครั้งละ 999 เครื่อง</font> ";
		}

	  ?>
	  </div>
              
            <table width="100%" height="100%" border="0">
              <tr> 
                <td width="9%"><div align="right"> </div></td>
                <td width="40%"><form name="form_test" method="post" action="../hidden.php">
                    <input type="submit" name="Submit" value="ข้อมูลเบื้องต้น">
                  </form></td>
                <td width="51%"><form name="form2" method="post" action="../protected/hiddenprotected.php">
                    <input type="submit" name="Submit2" value="การป้องกัน">
                  </form></td>
              </tr>
            </table></td>
          <td width="37%" valign="top" class="style0">
            <?php 
if($price!=5000){
?>
            <div align="center"><br>
              <h3>สำเร็จ</h3>
              <br>
              <a href="hiddentest1.php">ลองใหม่</a> </div>
            <br> 
            <?php 
;} else  { 
?>
            <div align="center"> 
              <h3>ไม่สำเร็จ</h3>
              <br>
              <a href="hiddentest1.php">ลองใหม่</a>
              <p></p>
            </div>
            <?php ; } ?>
          </td>
          <td width="2%">&nbsp;</td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		
    <TD COLSPAN=3 class="style0"><div align="center">:: Hidden Manipulation ::</div></TD>
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
		
 
	</TR>
</TABLE>

<map name="Map">
  <area shape="rect" coords="-1,1,413,110" href="../../index1.html">
</map>
</BODY>
</HTML>