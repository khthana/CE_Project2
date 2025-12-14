<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean class="insert.regis" id="regi"  scope="session"/>
<%
	regi.setSubid(request.getParameterValues("subid")); 
	regi.setSec(request.getParameterValues("sec")); 
	regi.check();
%>	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" >
<table width="100%"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
    <td colspan="2" ><jsp:include page="popup2.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">
		<form method="post" action="
		<% 
			if( regi.getFlag() == 1 )  out.print("regisconf2.jsp");
			else out.print("");
		%>
		">
		<table border="0" width="100%">
		<tr>
				<td width="40"></td>
				<td width="110">รหัสวิชา</td>
				<td width="200">รายชื่อวิชา</td>
				<td width="200">หมายเหตุ</td>
				<td ></td>
		</tr>
		<%
		String [] tmp1 = regi.getSubid(); String [] tmp2 = regi.getSname(); String  [] tmp3 = regi.getResult();
		for( int i = 0 ; i < tmp1.length; i++ ) {
			out.println("<tr>");
			out.println("<td></td>");
			out.println("<td>" + tmp1[i]+"</td>");
			out.println("<td>" + tmp2[i]+"</td>");	
			out.println("<td>" + tmp3[i]+"</td>");
			out.println("<td></td>");
			out.println("<tr>");
		}
		%>
		<tr>
			<td colspan="4" align="right">
			<%
				if( regi.getFlag() == 1 )  out.print("<input type=\"submit\" name=\"Submit\" value=\"confirm\">");
				else out.print("<input type=\"button\" name=\"Submit2\" value=\"back\" onClick=\"window.opener.history.back();\">");
			%>
			</td>
			<td></td>
		</tr>
		</table>
		</form>
	</td>
  </tr>  
  <tr valign="top">
	<td colspan="2">	</td>
  </tr>
  <tr valign="bottom">
    <td height="5%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
