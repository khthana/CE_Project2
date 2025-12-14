<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<LINK href="css/default.css" type=text/css rel=stylesheet>
</head>
<body background="images/bg.gif">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<!--<tr> 
		<td height="30" align="right" bgcolor="#00CC00"><A 
			href="main.jsp"> หน้าหลัก </A> |<A 
			href="be_ourmember.jsp"> สมัครสมาชิก </A>| <A 
			href="course.jsp"> หลักสูตร </A>| <A 
			href="boardlist.jsp"> เว็บบอร์ด </A>| <A 
			href="whoarewe.jsp"> Who are we ? </A> |<A 
			href="contactus.jsp" > Contact us </A>| <A 
			href="boardlist.jsp" > Help </A></td>
	  </tr>
	  </table>-->

<%
	//out.println(session.getAttribute("auth"));
	if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	out.println("<table width='800' cellpadding='0' cellspacing=0  border='0'>");
	out.println("<tr><td height='30' background='images/coner.gif' align='right'>ยินดีต้อนรับคุณ  "+session.getAttribute("auth")+"</td></tr></table>");
	
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon2 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt2 = mycon2.createStatement();
	String sql2 = "SELECT t1.*,t2.subject,t2.teacher,t2.co_teacher   FROM login_subject AS t1,subject AS t2 WHERE t1.subject_id=t2.original_id && t1.username='"+session.getAttribute("auth")+"'";
	ResultSet rs2 = stmt2.executeQuery(sql2);
	
	out.println("<table width='800' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30' background='images/greenbg.gif' align='right'><b><a href='editinfo.jsp'>แก้ไขข้อมูลส่วนตัว</a>|<a href='logout.jsp'>ออกจากระบบ</a>|<a href='course.jsp'>หลักสูตร</a>|<a href='boardlist.jsp'>Webboard</a>|<a href='download.jsp'>Download</a>|<a href='exam.jsp'>Presentation</a>|<a href='mailform.html'>ส่งเมล</a></b></td></tr></table>");
	

	out.println("<hr>");
	if(rs2!=null)
	{ 
		while(rs2.next())
		{
			 out.println("<table width=75% cellSpacing=3 cellPadding=0 align=center bordercolor=#790C42 border=0  >");
			 out.println("<tr id=color1 align=center><td background='images/detail.gif' width='25%'><a href='showsubject2.jsp?subject_id="+(rs2.getString("subject_id"))+"'>"+rs2.getString("subject_id")+"</td><td width='25%'><a href='checkonline.jsp?subject_id="+(rs2.getString("subject_id"))+"'>"+rs2.getString("subject")+"</td>");	
				 String teach = new String(rs2.getString("teacher").getBytes("ISO8859_1"),"MS874");
				  String coteach = new String(rs2.getString("co_teacher").getBytes("ISO8859_1"),"MS874");				
			 out.println("<td  width='25%'>"+teach+"</td><td width='25%'>"+coteach+"</td></tr></table>");
		}
		rs2.close();
		stmt2.close();
		mycon2.close();
	}
 }
%>
</body>
</html>