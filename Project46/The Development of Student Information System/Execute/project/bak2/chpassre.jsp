<%@ page contentType="text/html; charset=tis-620" language = "java"  pageEncoding="tis-620"%>
<jsp:useBean id="ch" class="auth.chpass" />
	<jsp:setProperty name="ch" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<style type="text/css" >
	BODY {
		font-size:13px; font-family:"Times New Roman", Times, serif;
	}
	A {
		text-decoration:none
	}
</style>
</head>
<body>
<jsp:include page="popup.jsp" flush="false"></jsp:include>
<table width="702" border="0" >
  <tr>
    <td height="188" valign="top" bgcolor="#99FF99"><%= ch.Change()%></td>
  </tr>
</table>   
</body>
</html>
