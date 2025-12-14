<!--  ----------   หน้าแรก XssTest   -----------    -->
<?php
	session_start();
	  //$_SESSION['hintxss']=0;
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: Cross-Site Script SandBox ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:##000000;
					   scrollbar-face-color: #F8C4AC;
					   scrollbar-highlight-color: #FFFFFF; 
					   scrollbar-shadow-color: #FFFFFF; 
					   scrollbar-arrow-color: #DE5208;
					   scrollbar-track-color: #FFFFFF; 
					   scrollbar-darkshadow-color: #009900;
        }
.style1 { font-family: "MS Sans Serif"; font-size: 14px; color: #003366; }
a:link {
	color: #0000ff;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FF3333;
}
a:hover {
	text-decoration: none;
	background-color: #FF8204;
	color: #993300; 
	width:100%;
					 
}
a:active {
	text-decoration: none;
	color: #BAF8C5;
}
-->
</style>
</head>
<body class="style0">
<table width="90%" height="90%" border="0" align="center">
  <tr> 
    <td height="253" rowspan="2" valign="top" > <iframe src="webboard.php" width="750" height="500" frameborder="0" ></iframe> 
    </td>
    <td width="37%" height="183" valign="top"><iframe src="hint.html"  width="220" height="500"  marginheight="0" marginwidth="0" frameborder="0"></iframe></td>
  </tr>
  <tr> 
    <td width="37%" rowspan="2" align="left" valign="top"></td>
  </tr>
  <tr   class="style0" align="center"> 
    <td height="18" valign="top" >&nbsp;</td>
  </tr>
</table>
</body>
</html>
