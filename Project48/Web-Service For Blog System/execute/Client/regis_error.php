<?php 
		session_start() ; 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style8 {font-family: Arial, Helvetica, sans-serif}
.style9 {font-size: 12px}
.style3 {color: #ffffff}
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style10 {color: #ed1b23}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function checkSubmit(form) {
	Checkbox = document.form1.accept.checked;
	if (!Checkbox ) { alert('กรุณายินยอมตกลงตามเงื่อนไขการให้บริการ');}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body onLoad="MM_preloadImages('09_1.jpg','10_1.jpg','11_1.jpg')">
<form name="form1" method="post" action="regis.php" onSubmit="return checkSubmit(this.form)">
  <table width="547" height="104" border="0" cellspacing="0">
    <tr>
      <td width="545" height="61"><img src="images/Regis_form_header_error.jpg" width="545" height="60"></td>
    </tr>
    <tr>
      <td height="13"><div align="center" class="style9">
        <p align="center"><br>
        ขออภัยเกิดข้อผิดพลาดเนื่องจาก :&nbsp;
          <?php
	  	print $_SESSION['ss_ErrorReg_Msg'];
	  ?>
</p>
        <p align="center">&nbsp;        </p>
      </div></td>
    </tr>
    <tr>
      <td height="13" bgcolor="#F36C4E"><div align="right">
        <table width="541" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="95" height="30"><div align="left">			
			<a href="javascript:history.back()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('back','','images/Regis_form_09_1.jpg',1)">
			<input name="back" type="image" id="back" value="submit" src="images/Regis_form_09.jpg" width="85" height="23">
			</a>
			    </div></td>
            <td width="375"><div align="center">
			<a href="mailto:webmaster@soi13.com?subject=Problem in register process" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','images/Regis_form%2011_1.jpg',1)">
			<input name="Image2" type="image" id="back" value="submit" src="images/Regis_form_11.jpg" width="130" height="23">
			</a>
            </div></td>
            <td width="71" height="30"><div align="right">
			<a href="javascript:window.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('bclose','','images/Regis_form_10_1.jpg',1)">
			<input name="bclose" type="image" id="close" value="submit" src="images/Regis_form_10.jpg" width="66" height="23">
			</a></div></td>
          </tr>
        </table>
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
