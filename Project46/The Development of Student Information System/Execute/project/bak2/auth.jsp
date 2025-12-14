<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"%>
<%
	if (!session.isNew())  { session.invalidate(); }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<link rel="stylesheet" href="css/popupmenu.css" type="text/css">
<style type="text/css" >
	BODY {
		font-size:13px;
	}
	A {text-decoration:none}
</style>
</head>
<body>
<form name="form1" method="post" action="authre.jsp">
<table width="518" border="0" bgcolor="#00FF66">
  <tr>
    <td width="264" height="113" rowspan="4" valign="top" >ขอต้อนรับสู่ระบบทะเบียนนักศึกษา<br>
     สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง 
	 </td>
    <td width="244" height="50"  >&nbsp;</td>
  </tr>
  <tr>
    <td height="30">user : 
      <input type="text" name="user"></td>
  </tr>
  <tr>
    <td height="30" >pass : 
      <input type="password" name="pass"></td>
  </tr>
  <tr>
    <td height="30" align="right" ><input type="submit" name="Submit" value="login"></td>
  </tr>
</table>
</form>
</body>
</html>
