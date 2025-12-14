<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:1444/project?user=root&password=olala023");
		Statement stmt = mycon.createStatement();
		String sql1="insert into account(username,password) values('por','olala023')";
		ResultSet rs1 = stmt.executeQuery(sql1);
	}
	catch(ClassNotFoundException e)
	{
		out.println("ClassNotFound");
	}
	catch(SQLException e)
	{
		out.println("SQLException");
		e.printStackTrace();
	}
	catch(Exception e)
	{
		out.println("Exception");
	}
%>
