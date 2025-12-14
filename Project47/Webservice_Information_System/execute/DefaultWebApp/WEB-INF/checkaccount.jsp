<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
int success=0;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url ="jdbc:mysql://localhost:3306/project";
	Connection mycon =DriverManager.getConnection( url,"root", "olala023");
	Statement stmt = mycon.createStatement();
	String sql="select * from account where username='"+username+"' and password=password('"+password+"')";
	ResultSet result = stmt.executeQuery(sql);
	if(result.next())
	{
		success=1;
		session.setAttribute("UID",result.getString("uid"));
		session.setAttribute("username",username);
		session.setAttribute("type",result.getString("type"));
	}
}
catch(ClassNotFoundException e)
{
	out.println("ClassNotFound");
}
catch(SQLException e)
{
	out.println("SQLException");
}
%>
