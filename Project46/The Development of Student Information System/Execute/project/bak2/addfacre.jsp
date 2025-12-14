<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"%>
<jsp:useBean id = "addf" class="insert.add_fac"  scope="page" />
	<jsp:setProperty name="addf" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body><jsp:include page="popup.jsp" flush="false"></jsp:include>
<table width="702" border="0" >
  <tr>
    <td height="55" bgcolor="#99FF99">&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609; / &#3588;&#3603;&#3632;<a href="addfac.jsp">add</a> <a href="viewfac.jsp">view</a></td>
  </tr>
  <tr>
    <td height="356" bgcolor="#CCFFCC" valign="top">&nbsp;<jsp:getProperty name="addf" property="add" /></td>
  </tr>
</table>   
</body>
</html>
