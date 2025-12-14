<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 off autocompleted marginwidth="0"  marginheight="0">
<table width="100%"  height="100%" border=0   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG">
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td colspan="2">
		<table width="55%" border="0">
<form name="form1" method="post" action="chpassre.jsp">
<input name="user" type="hidden" value="<%=session.getAttribute("user")%>">
  <tr>
    <td width="277" height="113" rowspan="5" valign="middle" >ขอต้อนรับสู่ระบบทะเบียนนักศึกษา<br>
       สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>      </td>
    <td height="50" colspan="2" align="center" valign="middle"  ><h1>การเปลี่ยนรหัสผ่าน</h1></td>
    </tr>
  <tr>
    <td width="70" >oldpass :</td>
    <td width="183" height="30"  align="right"><input type="password" name="opass"></td>
  </tr>
  <tr>
    <td bgcolor=>newpass : </td>
    <td height="30" align="right"> <input type="password" name="npass"></td>
  </tr>
  <tr>
    <td bgcolor=>confirm :</td>
    <td height="30" align="right"><input type="password" name="cpass"></td>
  </tr>
  <tr>
    <td align="right" >&nbsp;</td>
    <td height="30" align="right" ><input type="submit" name="Submit" value="apply"></td>
  </tr>
  </form>
</table>
	</td>
  </tr>
  <tr valign="bottom">
    <td height="10%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
