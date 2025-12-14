<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<title>Status</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
</head>
<body background="images/bg.gif">

<%
		String login = request.getParameter("login"),temp="",username="",password="",username2="",password2="";
		int error=0;
		if(login!=null)
		{
			
			username=request.getParameter("username");
			password=request.getParameter("password");
					session.setAttribute("teacher",username);
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt = mycon.createStatement();
			String sql = "SELECT * FROM teacherlogin WHERE username='"+username+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs!=null)
			{
				while(rs.next())
				{
					if(rs.getString("password").equals(password))
					{
						out.println("<strong><center>ดูรายละเอียดของงอาจารย์</center></strong><hr>");
						out.println("<table width='100%' cellpadding='0' cellspacing=0  border='0'>");
						out.println("<tr><td height='13' colspan='1'><img src='images/coner.gif'/></td></tr>");
						out.println("<tr  align='right' ><td height='30' background='images/greenbg.gif'>|");
						out.println("<a href='editinfoteach.jsp'>แก้ไขข้อมูลส่วนตัว</a>");
						out.println("|<a href='course.jsp'>หลักสูตร</a>");
						out.println("|<a href='boardlist2.jsp'>Webboard</a>");
						out.println("|<a href='mailform.html'>ส่งเมล</a>");
						out.println("|<a href='logout.jsp'>ออกจากระบบ</a>");
						out.println("</td></tr></table>");
					 
						// detail teacher
						Connection mycon2 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
						Statement stmt2 = mycon2.createStatement();
						String sql2 = "SELECT * FROM teacher_personal ";
						ResultSet rs2=stmt2.executeQuery(sql2);
						if (rs!=null)
						{		
							    out.println("<br><br><strong><center>รายชื่ออาจารย์ทั้งหมด</center></strong><hr>");
								while(rs2.next())
								{
									 String name1 = new String(rs2.getString("name").getBytes("ISO8859_1"),"MS874");
									  String room = new String(rs2.getString("room").getBytes("ISO8859_1"),"MS874");
										    String phone = new String(rs2.getString("phone").getBytes("ISO8859_1"),"MS874");
									out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0  >");
									out.println("<tr align=left><td width='30%' ><font size=2 color='blue'>"+name1+"&nbsp;</font></td><td width='17%'><font size=2 color='blue'>"+room+"</font></td><td width='25%' ><font size=2 color='blue'>"+phone+"</font></td><td width='25%' ><font size=2 color='blue'>"+rs2.getString("email")+"</font></td></tr>");
								}
								out.println("</table><br><br>");	
						}
						rs2.close();
						stmt2.close();
						mycon2.close();
			/*			//detail subject
						Connection mycon3 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
						Statement stmt3 = mycon3.createStatement();
						String sql3 = "SELECT * FROM subject ";
						ResultSet rs3=stmt3.executeQuery(sql3);
						if (rs3!=null)
						{
						out.println("<strong><center>รายชื่อวิชาทั้งหมด</center></strong><hr>");
						while(rs3.next())
						{	
							out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0  >");
							out.println("<tr align=left><td width='13%' ><font size=2 color='blue'>"+rs3.getString("original_id")+"&nbsp;</font></td><td width='40%'><font size=2 color='blue'>"+rs3.getString("subject")+"</font></td><td width='30%' ><font size=2 color='blue'>"+rs3.getString("teacher")+"</font></td><td width='25%' ><font size=2 color='blue'>"+rs3.getString("co_teacher")+"</font></td></tr>");
						}
						out.println("</table><br><br>");	
						}
						rs3.close();
						stmt3.close();
						mycon3.close();
				*/	
						//detail course
						Connection mycon4 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
						Statement stmt4 = mycon4.createStatement();
						String sql4 = "select * from subject_detail where time <>'' ";
						ResultSet rs4=stmt4.executeQuery(sql4);
						if (rs4!=null)
						{
							out.println("<strong><center>รายชื่อวิชาที่มีการเรียนการสอน</center></strong><hr>");
							while(rs4.next())
							{	
								  String time = new String(rs4.getString("time").getBytes("ISO8859_1"),"MS874");
								String teach = new String(rs4.getString("teacher").getBytes("ISO8859_1"),"MS874");
						        String coteach = new String(rs4.getString("co_teacher").getBytes("ISO8859_1"),"MS874");
								out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0  >");
								out.println("<tr align=left><td width='30%' ><font size=2 color='blue'>"+rs4.getString("subjectid")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs4.getString("subjectname")+"</font></td><td width='11%' ><font size=2 color='blue'>"+time+"</font></td><td width='10%' ><font size=2 color='blue'>"+teach+"</font></td><td width='10%' ><font size=2 color='blue'>"+coteach+"</font></td></tr>");
							}
							out.println("</table>");	
						}
						rs4.close();
						stmt4.close();
						mycon4.close();

					}
					else
					{
						error=1;
						out.println("<br><br>");
						out.println("<center><font color=red>USERNAME หรือ PASSWORD ไม่ถูกต้อง");
						out.println("<br><center><a href='adminlogin.jsp'>login ใหม่</a>");	
					 } 
			}
			rs.close();
			stmt.close();
			mycon.close();
		}
		}
		if (login==null || error==1)
		{
%>

<form name="login" method="post" action="teacherlogin.jsp">
       <td width="28%" rowspan="2" align="center" valign="top"  bgcolor="#00CC00"> <font color="#066618"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher Login</font> <br> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="10%" height="43" align="left"><font color="#066618"><strong>Username</font></td>
            <td width="76%" align="left"> <input type="text" name="username"></td>
          </tr>
          <tr> 
            <td height="20" align="left"><font color="#066618"><strong>Password</font></td>
            <td align="left"><input type="password" name="password"> </td>
          </tr>
        </table>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  name="login" type="submit" value="login" border="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='logout.jsp'>ออกจากระบบ</a>
      </td>
      </form>
<%
		}
%>
</body>
</html>
