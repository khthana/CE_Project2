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
	int timeout=20,number=0,myresult=0;
	String sql;
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	
	sql="DELETE FROM online WHERE lasttime <"+(ts-timeout*60*1000);
	myresult=stmt.executeUpdate(sql);

	sql="UPDATE online SET lasttime = "+ts+" WHERE sessid='"+session.getId()+"' ";
	myresult=stmt.executeUpdate(sql);

	if(myresult==0)
	{
		sql="INSERT INTO online VALUES('" +session.getId()+ "','"+ts+"')";
		myresult=stmt.executeUpdate(sql);
    }
	ResultSet myresult0 = stmt.executeQuery("SELECT COUNT(*) AS num FROM online");
	
	while(myresult0.next())
	{
		number=myresult0.getInt("num");
	}
	

out.println("<table width='100%'  border=0 cellpadding=0 cellspacing=0 >");

out.println("<tr><td background='images/online.gif' align=center>มีผู้ชมออนไลน์ทั้งหมด "+number+" คน</td></tr></table>");

%>
</BODY>
</HTML>
