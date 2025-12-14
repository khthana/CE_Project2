<%@ page import = "java.util.*" %>
<%@ page contentType="text/html; charset=TIS-620" %>
<html>
<body>
<%
	if (session.isNew())
		out.println("session นี้เป็น session ที่สร้างขึ้นมาใหม่");
	else
		out.println("session นี้เป็น session เดิมที่มีอยู่แล้ว");
	
	session.setAttribute("username","tum");
	session.setAttribute("email","tumclub2000@yahoo.com");
	session.setAttribute("script","JSP");

	out.println("ข้อมูลที่อยู่ใน session นี้คือ");
	out.println("<pre>");
	Enumeration enames = session.getAttributeNames();
	while (enames.hasMoreElements()) {
		String name = (String)enames.nextElement();
		String value = (String)session.getAttribute(name);
		out.println(name + " = " + value);
	}
	out.println("</pre>");
%>
<table cellpadding=0 cellspacing=0 border=0>
<tr>
	<td>Session ID</td>
	<td>&nbsp;<%=session.getId()%></td>
</tr>
<tr>
	<td>เวลาที่เริ่มสร้าง session</td>
	<td>&nbsp;<%=session.getCreationTime()%></td>
</tr>
<tr>
	<td>เวลาที่ใช้ session ครั้งสุดท้าย</td>
	<td>&nbsp;<%=session.getLastAccessedTime()%></td>
</tr>
</table><br>
<a href="showsession2.jsp">คลิ๊กที่นี่</a>เพื่อดูไฟล์ showsession2.jsp
</body>
</html>