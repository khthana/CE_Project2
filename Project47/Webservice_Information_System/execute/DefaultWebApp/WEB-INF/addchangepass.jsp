<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%
String username=(String)session.getAttribute("username");
String password=request.getParameter("password");
String repassword=request.getParameter("repassword");
if(password.equals(repassword))
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url ="jdbc:mysql://localhost:3306/project";
		Connection mycon =DriverManager.getConnection( url,"root", "olala023");
		Statement stmt = mycon.createStatement();
		String sql="update account set password=password('"+password+"') where username='"+username+"'" ;
		ResultSet rs = stmt.executeQuery(sql);
	}
	catch(ClassNotFoundException e)
	{
		out.println("ClassNotFound");
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	catch(Exception e)
	{
		out.println("Exception");
	}
}
%>