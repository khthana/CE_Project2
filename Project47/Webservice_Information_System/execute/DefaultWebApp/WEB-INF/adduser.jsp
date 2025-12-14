<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%
//customer
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String companyname=request.getParameter("companyname");
String mailaddress=request.getParameter("mailaddress");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String postcode=request.getParameter("postcode");
String phone=request.getParameter("phone");
String fax=request.getParameter("fax");
String email=request.getParameter("email");
//account
String username=request.getParameter("username");
String password=request.getParameter("password");
String repassword=request.getParameter("repassword");
String sql1="insert into customer(firstname,lastname,companyname,mailaddress,city,state,country,postalcode,phone,fax,email) values('"+firstname+"','"+lastname+"','"+companyname+"','"+mailaddress+"','"+city+"','"+state+"','"+country+"','"+postcode+"','"+phone+"','"+fax+"','"+email+"')";
String sql3="insert into account (username,password,type) values('"+username+"',password('"+password+"'),'Customer')";
int success=0;
if(password.equals(repassword) && !firstname.equals("") && !lastname.equals("") &&  !city.equals("") && !state.equals("") && !country.equals("") && !postcode.equals("") && !phone.equals("") && !email.equals(""))
{
	success=1;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url ="jdbc:mysql://localhost:3306/project";
		Connection mycon =DriverManager.getConnection( url,"root", "olala023");
		Statement stmt = mycon.createStatement();
		ResultSet rs1 = stmt.executeQuery(sql1);
		ResultSet rs3 = stmt.executeQuery(sql3);
	}
	catch(ClassNotFoundException e)
	{
		out.println("ClassNotFound");
	}
	catch(SQLException e)
	{
		out.println("SQLException: "+sql1);
		e.printStackTrace();
	}
	catch(Exception e)
	{
		out.println("Exception");
	}
}
%>
