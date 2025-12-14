<%@ page contentType="text/html; charset=TIS-620" %>
<%@page import="java.sql.*" %>
<html>
<head>
<!-- กำหนดสไตล์ชีทที่จะใช้ -->
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF; }
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620"></head>
<body>
<%
	//ขั้นตอนที่ 1 โหลดคลาสไดรเวอร์
	Class.forName("org.gjt.mm.mysql.Driver");
	//ขั้นตอนที่ 2 เปิดการเชื่อมต่อไปยังระบบฐานข้อมูล
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/center?user=root&password=library");
	//ขั้นตอนที่ 3 ติดต่อกับฐานข้อมูลโดยใช้คำสั่ง SQL
	Statement stmt = mycon.createStatement();
	String sql = "SELECT id,topic,name,ans,view,DATE_FORMAT(lastpost,'%e %b %Y, %T') AS lastpost,lastname FROM board_ques ORDER BY id DESC";
	ResultSet myresult = stmt.executeQuery(sql);
		out.println("<center><b>เว็บบอร์ดแสดงความคิดเห็น<br></center><br>");
		out.println("<a href='addnew.jsp'>ตั้งคำถามใหม่</a>");
		out.println("<table width=98% border=0 cellpadding=0 cellspacing=1 cellpadding=2>");
		out.println("<tr id=color1 align=center>");
		out.println("<td colspan=2>หัวข้อ</td>");
		out.println("<td>ผู้ถาม</td>");
		out.println("<td>ตอบ</td>");
		out.println("<td>ดู</td>");
		out.println("<td>โพสต์ครั้งสุดท้าย</td></tr>");
	//ขั้นตอนที่ 4 จัดการกับผลลัพธ์ที่ได้จากคำสั่ง SQL
	while(myresult.next())
	{
		out.println("<tr id=color2 align=center>");
		out.println("<td width='3%'><img src='icon.gif'></td>");
		out.println("<td width='47%' align=left>&nbsp;<a href='view.jsp?id="+myresult.getString("id")+"' target='_new'>"+myresult.getString("topic")+"</a></td>");
		out.println("<td width='15%'>"+myresult.getString("name")+"</td>");
		out.println("<td width='7%'>"+myresult.getString("ans")+"</td>");
		out.println("<td width='8%'>"+myresult.getString("view")+"</td>");
		out.println("<td width='20%'><font face='MS Sans Serif' size='2'>"+myresult.getString("lastpost")+"<br>โดย <B><font color='#56426C' >"+myresult.getString("lastname")+"</font></B></font></td></tr>");
	}
	out.println(" </table>");
	myresult.close();
	stmt.close();
	mycon.close();
%>
</body>
</html>