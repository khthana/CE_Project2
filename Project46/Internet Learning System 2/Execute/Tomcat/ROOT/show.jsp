<%@ page contentType="text/html; charset=windows-874"%>
<%@page import="java.sql.*"%>
<html>
<title>Show Data</title>
<head>
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold;
	Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874"></head>
<body>
<%
			String submit = request.getParameter("submit");
			if (submit==null)
			{	Class.forName("org.gjt.mm.mysql.Driver");
				Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
				Statement stmt=mycon.createStatement();
				String sql = " SELECT id,name,surname FROM info ";
				ResultSet myresult = stmt.executeQuery(sql);
					out.println("<center><b>รายชื่อผู้สมัครงาน<br></center><br>");
					out.println("<table width='80%' align=center cellspacing=0 cellpadding=0  bgcolor='#E1E9FC' bordercolor='#336699'>");
					out.println("<tr height='40' align=center><td width='20%'><font size=2>จำนวน</font></td><td><font size=2>รายชื่อ</font></td></tr><br>");
						while (myresult.next())
					{	
					out.println("<tr align=center><td><font size=2>"+myresult.getString("id")+"</font></td>");
					out.println("<td><a href='showdata1.jsp?num="+(myresult.getString("id"))+"'>"+myresult.getString("name")+"   "+myresult.getString("surname")+"</a></td></tr>");
					}
					out.println("</form>");
					out.println("</table>");
				myresult.close();
				stmt.close();
				mycon.close();
			}
%>
</body>
</html>
				