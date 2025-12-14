<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
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
		String login = request.getParameter("login"),temp="",username="",password="",username2="",password2="";
		int error=0;
		if(login!=null)
		{
			username=request.getParameter("username");
			password=request.getParameter("password");
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt = mycon.createStatement();
			String sql = "SELECT * FROM login WHERE username='"+username+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
		if(rs!=null)
		{
			while(rs.next())
			{
					if(rs.getString("password").equals(password))
					{
						session.setAttribute("auth",username);
						//response.sendRedirect("main.jsp");
						out.println("<br><center><font color=orange>login ถูกต้อง<br>");
						out.println("<center><a href='regis_course.jsp'>ดูรายละเอียดของการลงทะเบียน</a>");
						out.println("&nbsp;&nbsp;<a href='show_profile.jsp'>แสดงราบละเอียดของสมาชิก</a>");
						out.println("<br><center><a href='clear.jsp'>กลับไปหน้าหลัก</a><br><br>");
						//form
					/*	out.println("<form name='login2' method='post' action='regis_course.jsp'>");
     					out.println("<input type='text' name='username2'><br>");
                	 	 out.println("<input type='password' name='password2'><br>"); 
            			 out.println("<input name='login2' type='submit' value='ยืนยัน' border='0'></form>"); 
        			*/
							Class.forName("org.gjt.mm.mysql.Driver");
							Connection mycon2 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
							Statement stmt2 = mycon2.createStatement();
							String sql2 = "SELECT * FROM login_subject WHERE ID='"+username+"'";
							ResultSet rs2 = stmt2.executeQuery(sql2);
								if(rs2!=null)
								{ 
									while(rs2.next())
									{
										 //out.println("<br><br>");
										 out.println("<table width=75% cellSpacing=0 cellPadding=0 align=center border=1 >");
										 out.println("<tr id=color1 align=center><td width='25%'>"+rs2.getString("Sid")+"</td><td width='25%'>"+rs2.getString("Subject")+"</td>");	
										
										 out.println("<td  width='25%'>"+rs2.getString("Teacher")+"</td><td width='25%'>"+rs2.getString("Co_Teacher")+"</td></tr></table>");
										// out.println("<center>"+rs2.getString("Sid")+"<br>");	
									}
									rs2.close();
									stmt2.close();
									mycon2.close();
								}		
					}
					else
					{
						error=1;
						//out.println(username);
						//out.println(password);
					    out.println("<br><br>");
						out.println("<center><font color=red>USERNAME หรือ PASSWORD ไม่ถูกต้อง");
						//out.println(rs.getInt("num"));
				     	out.println("<br><center><a href='main.jsp'>กลับไปหน้าหลัก</a>");	
					 } 
			}
			rs.close();
			stmt.close();
			mycon.close();
		}
		}
%>
</body>
</html>
