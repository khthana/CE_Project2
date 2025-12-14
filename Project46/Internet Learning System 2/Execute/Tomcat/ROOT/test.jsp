<%@ page contentType="text/html ; charset=windows-874"  language="java" import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<%
	long ts = new java.util.Date().getTime();
String sql;
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	sql="INSERT INTO online VALUES('yajok_su','"+ts+"')";
		myresult=stmt.executeUpdate(sql);
%>
</BODY>
</HTML>
