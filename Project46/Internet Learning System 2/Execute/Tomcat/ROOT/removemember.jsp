<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<title>Remove Member</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
</head>
<body background="images/bg.gif">
<%
	if (session.getAttribute("admin")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	String sql = "SELECT * FROM login";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{   
		out.println("<table width='750' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30' background='images/greenbg.gif'><center>รายชื่อสมาชิกทั้งหมดก่อนลบ</center></td></tr></table>");
	
		while(rs.next())
		{	
			out.println("<table width=700 cellSpacing=0 cellPadding=0 align=center border=0 >");
			out.println("<tr align=center><td width='20%' align='left'>username :<a href='showremovemember.jsp?key1="+(rs.getString("username"))+"'>"+rs.getString("username")+"&nbsp;</td><td width='20%' align='left'>password : "+rs.getString("password")+"</td></tr>");
		}
		out.println("</table>");	
	}
	}
%>	

</body>
</html>