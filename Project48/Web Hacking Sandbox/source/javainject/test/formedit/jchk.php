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
          <td width="30%" rowspan="2" valign="top" class="style0"><font color="#FF0000">ภารกิจ</font><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ทำการสั่งซื้อสินค้าในราคาที่เรากำหนดเอง<br> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;โดยใช้ <font color="#FF0000">Java 
            Injection Form Editing </font> </td>
          <td colspan="2" valign="top" class="style0"> 
            <div align="center">  <img src="../../../images/Boom_Box_4.jpg" width="225" height="111"><br>
              <font color="#003366">ราคาชิ้นละ 5000 บาท</font><br><br>
            
            &nbsp;ท่านได้สั่งซื้อของชิ้นละ<font color="#FF0000"> 
            <?php 
	  
	  $lenprice=strlen($price);
	  $lenorder=strlen($order);
	  if($order==''){
	print"<br>กรุณาระบุจำนวนสั่งซื้อ";
	  }
	  else if(($lenorder<=3)&&($lenprice<=7)){
	  $total=$order*$price;
	  print" $price";
	 print"</font>บาท<br>";
      print      "<br>";
       print       "จำนวน<font color='#FF0000'> $order</font> ชิ้น<br>";
      print      "<br> คิดเป็นเงิน<font color='#FF0000'>";
		print "$total</font> บาท</div><br>"; 
	  }
	  else{
		print"<br><br>สั่งซื้อได้ไม่เกิน 999 เครื่อง";
	  }
	  ?>
         </td>
            
          <td width="37%" rowspan="2" valign="top"> 
            <div align="center"></div>
            <div align="center">
              <?php 
						if($price!=5000)
							echo '<div align="center"><br>สำเร็จ<br><a href="javaformtest.php">ลองใหม่</a></div>';
                      else echo '<div align="center"><br>ไม่สำเร็จ<br><a href="javaformtest.php">ลองใหม่</a></div>';
					  ?>
            </div></td>
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
		
    <TD COLSPAN=3 class="style0"> <div align="center">:: Java Injection Form Editing ::</div></TD>
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
  <area shape="rect" coords="-40,2,416,118" href="../../../index1.html">
</map>
</BODY>
</HTML>