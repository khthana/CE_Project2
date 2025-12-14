<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<link rel="stylesheet" href="main.css" type="text/css">
<style type="text/css" >
	BODY {
		font-size:14px;
	}
	A {text-decoration:none}
	DIV.menu {
		position:absolute;
		background:dddddd;
		color:black;
		visibility:hidden;
		width:100;
		float:left;
	}
	DIV.mbutton {
		background-color:dddddd;
	}
</style>
<script language="javascript" src="js/popupmenu.js">
</script>
</head>
<body>
	<table width="790" border="0" bgcolor="#33CCFF">
  <tr>
    <td height="18">&nbsp;</td>
  </tr>
  <tr>
    <td height="18" align="left" valign="middle">
		<a href="javascript:void(0)"
			onMouseOver="showmenu()";
			onMouseOut="timeout=setTimeout('hidemenu()',100)">
		</a>บันทึกข้อมูล <br>
		<div class="menu" id="menu1">
		<a href="javascript:void(0)"
			onclick="alert('test')";
			onMouseOver="showmenuconfirm()";
			onMouseOut="timeout=setTimeout('hidemenu()',100)">Item1
		</a><br>
		<a href="javascript:void(0)"
			onclick="alert('test')";
			onMouseOver="showmenuconfirm()";
			onMouseOut="timeout=setTimeout('hidemenu()',100)">Item2
		</a>
		</div>
		</td> 
  </tr>
</table>
</body>
</html>
