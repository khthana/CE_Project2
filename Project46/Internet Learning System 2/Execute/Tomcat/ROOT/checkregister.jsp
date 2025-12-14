<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY background="images/bg.gif">
<%
	if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	int error = 0,row1=0,row2=0,row3=0;
	

	String subject1 = request.getParameter("subject1");
	String subject2 = request.getParameter("subject2");
	String subject3 = request.getParameter("subject3");

	if(subject1.length()>8)
	{
		error = 1;
		out.println("<center><font color=red size=2>กรุณาใส่รหัสวิชาอันดับแรกให้ถูกต้อง</font></center>");
	}	else if(subject1.length()==8)
		{
			row1= 1;
		}	

		if(subject2.length()>8)
	{
		error = 1;
		out.println("<center><font color=red size=2>กรุณาใส่รหัสวิชาอันดับสองให้ถูกต้อง</font></center>");
	}else if(subject2.length()==8)
		{
			row2 = 1;
		}	

		if(subject3.length()>8)
	{
		error = 1;
		out.println("<center><font color=red size=2>กรุณาใส่รหัสวิชาอันดับสามให้ถูกต้อง</font></center>");
	}else if(subject3.length()==8)
		{
			row3 = 1;
		}	
		
	if (error==1)
	{out.println("<br>");
		out.println("<center><b><a href='register_subject.jsp'>คลิ้กที่นี่เพื่อกลับไปลงทะเบียนใหม่</a></b></center>");
	}
	if (error==0)
	{
		if(row1==1)
		{	Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sql = "INSERT INTO login_subject VALUES('','"+session.getAttribute("auth")+"','"+subject1+"')";
				int myresult = stmt.executeUpdate(sql);
			if (myresult!=0)
				{
					out.println("<center><b>การสมัครสมบูรณ์แล้ว<br>");
				
				}
			stmt.close();
			mycon.close();
		}
			//subject2
		if(row2==1)
		{	Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon2 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt2=mycon2.createStatement();
			String sql2= "INSERT INTO login_subject VALUES('','"+session.getAttribute("auth")+"','"+subject2+"')";
				int myresult2 = stmt2.executeUpdate(sql2);
				if (myresult2!=0)
				{  out.println("<center><b>ลงทะเบียนเสร็จสมบูรณ์แล้ว<br>");
					
				}
			stmt2.close();
			mycon2.close();
		}	//subject3
		
		if(row3==1)
		{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon3 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt3=mycon3.createStatement();
			String sql3= "INSERT INTO login_subject VALUES('','"+session.getAttribute("auth")+"','"+subject3+"')";
				int myresult3 = stmt3.executeUpdate(sql3);
				if (myresult3!=0)
				{  out.println("<center><b>ลงทะเบียนเสร็จสมบูรณ์แล้ว<br>");
					out.println("<center><b><a href='register_subject.jsp'>คลิ้กที่นี่เพื่อกลับไปลงทะเบียนใหม่</a></b></center>");
				}
			stmt3.close();
			mycon3.close();
		}
	}

	
	
	}
%>

|<a href='logout.jsp'>ออกจากระบบ</a>
</BODY>
</HTML>
