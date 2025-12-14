<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean id = "addf" class="insert.add_fac"  scope="page" />
	<jsp:setProperty name="addf" property="*" />
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
	<tr valign="top" height="40">
    	<td colspan="2"><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
	</tr>
	<tr valign="top" height="30">
    	<td colspan="2">ข้อมูลหน่วยงาน/คณะ <a href="addfac.jsp">add</a> <a href="viewfac.jsp">view</a></td>
  	</tr>
  	<tr valign="top">
    	<td colspan="2"><jsp:getProperty name="addf" property="add" /> การเพิ่มคณะเรียบร้อย </td>
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
