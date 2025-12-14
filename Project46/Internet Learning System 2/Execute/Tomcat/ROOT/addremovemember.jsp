<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<title>Add Remove Member</title>
</head>
<body>
<%
	if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	String sql = "SELECT * FROM info";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<center>รายชื่อสมาชิกทั้งหมด</center><hr>");
		while(rs.next())
		{
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0 bgcolor=ff9900 >");
			out.println("<tr align=center><td width='25%'><a href='showdetail.jsp?key1="+(rs.getString("username"))+"&key2="+rs.getString("password")+"'>"+rs.getString("name")+"</td><td width='25%'>"+rs.getString("surname")+"</td><td width='25%'>"+rs.getString("nameeng")+"</td><td width='25%'>"+rs.getString("surnameeng")+"</td>");
		}
	}
	}
%>	
</body>
</html>