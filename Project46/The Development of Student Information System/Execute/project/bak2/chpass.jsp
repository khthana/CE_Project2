<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"%>
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
<form name="form1" method="post" action="chpassre.jsp">
<input name="user" type="hidden" value="<%=session.getAttribute("user")%>">
<table width="553" border="0" bgcolor="#00FF66">
  <tr>
    <td width="264" height="113" rowspan="5" valign="top" >ขอต้อนรับสู่ระบบทะเบียนนักศึกษา<br>
       สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>
	   การเปลี่ยนรหัสผ่าน
      </td>
    <td width="58"  >&nbsp;</td>
    <td width="217" height="50"  >&nbsp;</td>
  </tr>
  <tr>
    <td >pass :</td>
    <td height="30" ><input type="password" name="opass"></td>
  </tr>
  <tr>
    <td bgcolor="#00FF66">newpass : </td>
    <td height="30" > <input type="password" name="npass"></td>
  </tr>
  <tr>
    <td bgcolor="#00FF66">confirm :</td>
    <td height="30"><input type="password" name="cpass"></td>
  </tr>
  <tr>
    <td align="right" >&nbsp;</td>
    <td height="30" align="right" ><input type="submit" name="Submit" value="apply"></td>
  </tr>
</table>
</form>
</body>
</html>
