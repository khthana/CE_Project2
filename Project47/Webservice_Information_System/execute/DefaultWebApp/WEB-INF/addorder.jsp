<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%
String sfirstname=request.getParameter("sfirstname");
String slastname=request.getParameter("slastname");
String sphone=request.getParameter("sphone");
String saddress=request.getParameter("saddress");
String spackage=request.getParameter("package");

String rfirstname=request.getParameter("rfirstname");
String rlastname=request.getParameter("rlastname");
String rphone=request.getParameter("rphone");
String raddress=request.getParameter("raddress");
int success=0;
int irandom=0;
if(!sphone.equals("") && !saddress.equals("") && !spackage.equals("") && !rphone.equals("") && !raddress.equals(""))
{
	success=1;
try
{
	int id[]=new int[8];
	String testsql=new String();
	boolean checkrandom=true;
	String random=new String();
	int uid=Integer.parseInt((String)session.getAttribute("UID"));
	
	Class.forName("com.mysql.jdbc.Driver");
	String url ="jdbc:mysql://localhost:3306/project";
	Connection mycon =DriverManager.getConnection( url,"root", "olala023");
	Statement stmt = mycon.createStatement();
	
	while(checkrandom)
	{
		for(int i=0;i<8;i++)
		{
			id[i]=(int)(Math.random()*9);
        	random=random+id[i];
		}
		irandom=Integer.parseInt(random);
		testsql="select * from product where TrackNO ="+irandom;
		ResultSet result= stmt.executeQuery(testsql);
		if(!result.next())
		{
			checkrandom=false;
		}
	}
	String sql1="insert into product values("+irandom+",'"+sfirstname+"','"+slastname+"','"+sphone+"','"+saddress+"','"+spackage+"','"+rfirstname+"','"+rlastname+"','"+rphone+"','"+raddress+"')";
	ResultSet rs1 = stmt.executeQuery(sql1);
	String sql2="insert into orderservice(uid,TrackNO,time) values("+uid+","+irandom+",now())";
	ResultSet rs2 = stmt.executeQuery(sql2);
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
}
%>