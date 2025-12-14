<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%
String username=(String)session.getAttribute("username");
String firstname=new String();
String lastname=new String();
String phone=new String();
String sql="select * from account t1,customer t2 where t1.uid=t2.uid and username='"+username+"'";
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String url ="jdbc:mysql://localhost:3306/project";
	Connection mycon =DriverManager.getConnection( url,"root", "olala023");
	Statement stmt = mycon.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next())
	{
		firstname=rs.getString("firstname");
		lastname=rs.getString("lastname");
		phone=rs.getString("phone");
	}
}
catch(ClassNotFoundException e)
{
	out.println("ClassNotFound");
}
catch(SQLException e)
{
	out.println("SQLException: "+sql);
	e.printStackTrace();
}
%>