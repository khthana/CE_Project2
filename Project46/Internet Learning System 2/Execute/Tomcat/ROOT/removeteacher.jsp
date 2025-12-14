<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<title>Remove Member</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
</head>
<body background="images/bg.gif">
<%
	if (session.getAttribute("admin")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	String sql = "SELECT * FROM teacher_personal";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<table width='750' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30' background='images/greenbg.gif'><center>รายชื่ออาจารย์สอนทั้งหมด</center></td></tr></table>");
		
		while(rs.next())
		{
			  String name1 = new String(rs.getString("name").getBytes("ISO8859_1"),"MS874");
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0  >");
			out.println("<tr align=left><td width='30%' ><font size=2 color='blue'><a href='remove_showdetailteacher.jsp?key1="+name1+"'>"+name1+"&nbsp;</font></td><td width='17%'><font size=2 color='blue'>"+rs.getString("room")+"</font></td><td width='25%' ><font size=2 color='blue'>"+rs.getString("phone")+"</font></td><td width='25%' ><font size=2 color='blue'>"+rs.getString("email")+"</font></td></tr>");
		}
		out.println("</table>");	
	}
	}
%>	

</body>
</html>