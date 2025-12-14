<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() ) { response.sendRedirect("auth.jsp"); }
	else {	if( !session.getAttribute("auth").equals("1") ) { response.sendRedirect("auth.jsp"); } }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>popup menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<link rel="stylesheet" href="css/popupmenu.css" type="text/css">
<style type="text/css" >
	BODY {
		font-size:13px; font-family:"Times New Roman", Times, serif;
	}
	A {text-decoration:none}
</style>
<script language="javascript" src="js/popupmenu.js">
</script>
</head>
<body>
<br>
<table width="702" height="20" border="0" bgcolor="#66FF00" >
	<tr valign="middle">
		<td height="22" colspan="7" bgcolor="#99FF00" >
      <div align="right"><%=session.getAttribute("name") %> | <a href="chpass.jsp" > change password </a> | <a href="auth.jsp"> logout </a></div></td>
  </tr>
	<tr>
		<td width="100" height="22" bgcolor="#99FF00">
			<div class="main" id="mmenu">
			<a href="javascript:void(0)"
				onMouseOver="showmenu()";
				onMouseOut="timeout=setTimeout('hidemenu()',100)">บันทึกข้อมูล
			</a> <br></div>
			<div class="menu" id="menu1">
			<a href="viewfac.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu()',100)">ข้อมูลคณะ
			</a><br>
			<a href="javascript:void(0)"
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu()',100)">ข้อมูลภาควิชา
			</a><br>
			<a href="javascript:void(0)"
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu()',100)">ข้อมูล
			</a><br>
	  		</div>	
	  </td>
	  <td width="100" bgcolor="#99FF00">&nbsp;</td>
	  <td width="100" bgcolor="#99FF00">&nbsp;</td>
	  <td width="100" bgcolor="#99FF00">&nbsp;</td>
	  <td width="100" bgcolor="#99FF00">&nbsp;</td>
	  <td width="100" bgcolor="#99FF00">&nbsp;</td>
	  <td width="100" bgcolor="#99FF00">&nbsp;</td>
	</tr>
</table>
</body>
</html>
