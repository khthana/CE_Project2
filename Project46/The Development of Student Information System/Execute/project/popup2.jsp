<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<body leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0">
<table width="80%"  height ="40" border="0"  cellpadding="0" cellspacing="0"  >
	<tr valign="top">
		<td  colspan="7"   align="right" valign="top">ผู้ใช้งานในระบบ : <%=session.getAttribute("name") %> | <a href="chpass.jsp" > change password </a> | <a href="auth.jsp" > logout </a></td>
  </tr>
	<tr>
	  <td  width="50">
			
	  </td>
	  <td  width="100">
			<a href="viewgrade.jsp">ดูเกรด</a>
	  </td>
	  <td width="100">
			<a href="regis2.jsp">ลงทะเบียน</a>
	  </td>
	  <td width="80">&nbsp;</td>
	  <td width="80">&nbsp;</td>
	  <td>&nbsp;</td>
	  <td >&nbsp;</td>
	</tr>
</table>
</body>
</html>
