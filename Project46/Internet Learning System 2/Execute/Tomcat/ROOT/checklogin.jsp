<%@ page contentType="text/html ; charset=windows-874"  language="java" import="java.sql.*"%>
<html>
<head>
<title>Status</title>
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold;
	Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
</head>

<body >
<%
		int error=0;
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
		Statement stmt = mycon.createStatement();
		String sql = "SELECT * FROM login WHERE username='"+username+"'";
		//String sql = "SELECT count(*) as num  FROM login WHERE username='"+username+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
			{
					if(rs.getString("password").equals(password))
					{
						session.setAttribute("auth",username);
					//	out.println(session.getAttribute("auth"));
					//    response.sendRedirect("membersection.jsp");
						/*out.println("<br><center><font color=orange>login ถูกต้อง<br>");
						out.println("<center><a href='regis_course.jsp'>ดูรายละเอียดของการลงทะเบียน</a>");
						out.println("|<a href='show_profile.jsp'>แสดงราบละเอียดของสมาชิก</a>");
						out.println("|<center><a href='clear.jsp'>กลับไปหน้าหลัก</a><br>");*/
					}
					else
					{
						error=1;
						out.println("<br><br>");
						out.println("<center><font color=red>USERNAME หรือ PASSWORD ไม่ถูกต้อง");
						out.println("<br><center><a href='main.jsp'>กลับไปหน้าหลัก</a>");	
					 } 
			}
			rs.close();
			stmt.close();
			mycon.close();

%>
</body>
</html>
