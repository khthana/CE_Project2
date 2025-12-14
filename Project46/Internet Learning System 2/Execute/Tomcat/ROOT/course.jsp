<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Course</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
A:link {
	FONT-WEIGHT: normal; FONT-SIZE: 14px; COLOR: #c1d6ea; TEXT-DECORATION: none
}
A:visited {
	FONT-WEIGHT: normal; FONT-SIZE: 14px;COLOR: #c1d6ea; TEXT-DECORATION: none
}
A:active {
	FONT-WEIGHT: normal; FONT-SIZE: 14px; COLOR: #c1d6ea; TEXT-DECORATION: none
}
A:hover {
	FONT-WEIGHT: normal; FONT-SIZE: 14px; COLOR: #c1d6ea; TEXT-DECORATION: none
}
TD {
	FONT-WEIGHT: normal; FONT-SIZE: 14px; TEXT-DECORATION: none
}
</style>
</head>
<body background="images/bg.gif">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  border="0">
    <tr> 
      <td height="13" colspan="3"><img src="images/coner.gif"/></td>
    </tr>
	<tr>
		<td height="30" align="right" background="images/greenbg.gif"><A 
		 href="main.jsp"> หน้าหลัก </A> |<A 
		 href="be_ourmember.jsp"> สมัครสมาชิก </A>| <A 
		href="whoarewe.jsp"> Who are we ? </A> |<A 
		href="contactus.jsp" > Contact us </A>| <A 
		href="boardlist.jsp" > Help </A></td>
	</tr>
	</table>
<%
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt=mycon.createStatement();
	String sql = "SELECT id,original_id,subject,teacher,co_teacher FROM subject";
	ResultSet rs=stmt.executeQuery(sql);
	out.println("<table width=100% border=0 cellpadding=0 cellspacing=0 >");
	out.println("<tr align=center>");
	out.println("<td width='20%'>รหัสวิชา</td>");
	out.println("<td width='40%'>ชื่อวิชา</td>");
	out.println("<td width='40%'>อาจารย์ผู้สอน</td>");
	out.println("</tr>");
	while(rs.next())
	{
		String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
		out.println("<tr align=center >");
		out.println("<td>"+rs.getString("original_id")+"</td>");
		out.println("<td align=left><a href='showsubject.jsp?original_id="+(rs.getString("original_id"))+"'>"+rs.getString("subject")+"</a></td>");
		out.println("<td align=left>"+teach +"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs.close();
	stmt.close();
	mycon.close();
%>
<body>
</html>