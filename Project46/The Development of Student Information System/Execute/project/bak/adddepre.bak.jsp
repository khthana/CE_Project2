<%@ page contentType="text/html; charset=tis-620" language="java" import="java.sql.*" import="var.VarDB" %>
<jsp:useBean id="addd" class="insert.add_dep" />
	<jsp:setProperty name="addd" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body>
<table width="702" border="0" >
  <tr>
    <td height="30">ภาควิชา  <a href="adddep.jsp">add </a>  |  <a href="viewdep.jsp">view</a></td>
  </tr>
  <tr>
    <td height="184"  valign="top">&nbsp;
    <jsp:getProperty name="addd" property="add" /></td>
  </tr>
</table>   
</body>
</html>
