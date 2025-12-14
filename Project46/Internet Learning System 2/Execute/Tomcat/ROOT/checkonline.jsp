<%@ page contentType="text/html; charset=windows-874" language="java"
import="java.sql.*,java.math.*,java.lang.*" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<LINK href="css/default.css" type=text/css rel=stylesheet>
</HEAD>

<BODY background="images/bg.gif">
<%
if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	java.util.Date ts= new java.util.Date();
	long ts1=ts.getTime();
	String id =request.getParameter("subject_id");
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	String sql = "SELECT * FROM room_online  WHERE subject_id='"+id+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	if(rs!=null)
			{
				while(rs.next())
				{
					out.println("<center>ยังไม่ถึงเวลาที่จะเข้าได้</center>");
					if(rs.getLong("time_start")<=ts1 && ts1<=rs.getLong("time_end"))
					{
	                    response.sendRedirect("online.jsp");
					}
				}
			}
	rs.close();
	stmt.close();
	mycon.close();
out.println("<br><center>รหัสวิชา "+id+" ยังไม่ถึงเวลาที่จะเข้าได้</center>");
	}
%>
</BODY>
</HTML>
