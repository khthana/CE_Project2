<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import="sql_code.sqlCom" %>
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
		<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
  <tr valign="top">
    <td><jsp:include page="popup2.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr>
    <td>
	<table width="100%" border="0">
			<tr>
				<td width="80"></td>
				<td width="110">รหัสวิชา</td>
				<td width="300">ชื่อวิชา</td>
				<td width="80">เกรด</td>
				<td ></td>
			</tr>
			<%
				sqlCom SQLC = new sqlCom(); String SQL;
//				String SQL = "select count(*) as xx  from grade where stdid ='"+ reg.getStdid() +"' and term ='"+reg.getTerm()+"' and year ='"+reg.getYear()+"';";
				//ResultSet rs = SQLC.select(SQL); int cou = 0;
//				if ( rs.next() )  cou = rs.getInt( "xx" );		//out.print("<tr><td colspan=\"5\">"+ cou + reg.getStdid() + reg.getTerm() + reg.getYear() + "<tr><td>");
				SQL = "select a.subid, a.tname, b.sec, b.grade from subject a, grade b  where	a.subid = b.subid and stdid ='"+session.getAttribute("user")+"';";
				ResultSet rs = SQLC.select(SQL);
				while( rs.next() ) {
					String na = new String(rs.getString("tname").getBytes("ISO8859_1"), "TIS-620");
					out.println("<tr>");
					out.println("<td align=\"center\"></td>");
					out.println("<td>" +rs.getString("subid")+"</td>");
					out.println("<td>" + na+"</td>");	
					out.println("<td>" + rs.getString("grade")+"</td>");
					out.println("<td></td>");
					out.println("<tr>");	
				}
			%>
		</table>
	</td>
  </tr>
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
