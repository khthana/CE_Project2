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
          <td width="29%" valign="top" class="style0"><br>
            <font color="#FF0000">การป้องกัน</font> <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;page นี้ได้รับการป้องกันแล้ว</td>
          <td colspan="2" valign="top" class="style0"><div align="center"><img src="../../images/Boom_Box_4.jpg" width="225" height="111"><br>
              <font color="#003366">ราคาชิ้นละ 5000 บาท</font><br><br>
			   คุณได้สั่งซื้อของราคาชิ้นละ
               <font color="#FF0000"> 
              <?php 
  $str="http://localhost/www/hidden/protected/hiddenprotected.html";
	  if(($_SERVER["HTTP_REFERER"]==$str)){
	  echo$price;
  }
  else{
  $price=5000;
  echo$price;
  }
$str="http://localhost/www/hidden/protected/hiddenprotected.html";
$lenorder=strlen($order);
if($order==''){
print"<br>กรุณาระบุจำนวนสั่งซื้อ";
}
else if($lenorder<=3){
	if(($_SERVER["HTTP_REFERER"]==$str)){
	$total=$order*$price; 
	 }
	 else{
	$total=$order*$price; 
	 }
	print"</font>บาท  <br> <br>  ";               
    print"จำนวน <font color='#FF0000'> $order</font> ชิ้น <br><br><font color='#003366'> ";
              
 print"</font> คิดเป็นเงิน <font color='#FF0000'> $total</font> บาท<br>";
              
}
else{
print"<br><br>สั่งซื้อได้ไม่เกิน 999 เครื่อง";
}

 ?>
             
              <br>
             <font color='#FF0000'>  <a href="hiddenprotected.php"color='#FF0000'>Back</a> </font>
              <table width="100%" height="100%" border="0">
                <tr> 
                  <td width="9%"></td>
                  <td width="40%"><form name="form_test" method="post" action="../hidden.php">
                      <input type="submit" name="Submit" value="ข้อมูลเบื้องต้น">
                    </form></td>
                  <td width="51%"><form name="form2" method="post" action="../test/hiddentest.php">
                      <input type="submit" name="Submit2" value="ทำการทดลอง">
                    </form></td>
                </tr>
              </table>
            </div>
            
          </td>
          <td width="37%" valign="top"> 
		  			<!-- ------------- iframe -------------------------------------------------------------------------------------------------------------------- -->
				  <iframe src="hint.html" width="100%" height="310"  frameborder="0"></iframe>
				   <!-- ------------- iframe -------------------------------------------------------------------------------------------------------------------- --> </td>
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
  <area shape="rect" coords="-21,2,420,112" href="../../index1.html">
</map>
</BODY>
</HTML>