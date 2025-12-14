<%@ page contentType="text/html; charset=TIS-620" %>
<%@page import="java.sql.*,mybean.Utility" %>
<html>
<head>
<!-- กำหนดสไตล์ชีทที่จะใช้ -->
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620"></head>
<body>
<%
	String submit = request.getParameter("submit"),topic="",name="",email="",comment="",ip="";
	int error=0;
	// ถ้าผู้ชมคลิก submit
	if(submit!=null)
	{
		// รับข้อมูลที่ส่งมาจากแบบฟอร์ม
		topic = Utility.filter(request.getParameter("topic"));
		name = Utility.filter(request.getParameter("name"));
		email = Utility.filter(request.getParameter("email"));
		comment = Utility.filter(request.getParameter("comment"));
		ip = request.getRemoteAddr();
		// ตรวจสอบข้อมูลที่ส่งมาจากแบบฟอร์ม
		if(topic.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบหัวข้อคำถามให้ถูกต้อง</font></center>");
		}
		if(name.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบชื่อให้ถูกต้อง</font></center>");
		}
		if(comment.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบความคิดเห็นให้ถูกต้อง</font></center>");
		}
		// ถ้าข้อมูลถูกต้องจะเพิ่มข้อมูลลงในฐานข้อมูล
		if(error==0)
		{
			// ขั้นตอนที่ 1 โหลดคลาสไดรเวอร์
			Class.forName("org.gjt.mm.mysql.Driver");
			// ขั้นตอนที่ 2 เปิดการเชื่อมต่อไปยังระบบฐานข้อมูล
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/center?user=root&password=library");
			// ขั้นตอนที่ 3 ติดต่อกับฐานข้อมูลโดยใช้คำสั่ง SQL
			Statement stmt = mycon.createStatement();
			String sql = "INSERT INTO board_ques VALUES('','"+topic+"','"+name+"','"+email+"','"+comment+"','"+ip+"',NOW(),NOW(),'"+name+"',0,0)";
			int myresult = stmt.executeUpdate(sql);
			// ขั้นตอนที่ 4 จัดการกับผลลัพธ์ที่ได้จากคำสั่ง SQL
			if(myresult!=0)
			{
				// เมื่อเพิ่มข้อมูลในฐานข้อมูลแล้ว จะ redirect ไปยังไฟล์ boardlist.jsp
				response.sendRedirect("boardlist.jsp");
			}
			else
			{
				out.println("ไม่สามารถเพิ่มข้อมูลลงในฐานข้อมูลได้");
			}
			stmt.close();
			mycon.close();
		}
	}
	// ถ้าผู้ชมยังไม่ได้คลิก submit หรือคลิกแล้วแต่ข้อมูลยังไม่ถูกต้องให้แสดงแบบฟอร์ม
	if(submit==null || error==1)
	{
%>
<form action="addnew.jsp" method="post">
<table width='80%' align=center border=0 cellspacing=1 cellpadding=2>
	<tr id=color1>
		<td colspan=2 align=center>ตั้งหัวข้อใหม่</td></tr>
	<tr id=color2>
		<td>หัวข้อ</td>
		<td><input type=text name=topic size=50 value="<%=new String(topic.getBytes("ISO8859_1"),"TIS-620")%>"></td></tr>
	<tr id=color2>
		<td>ชื่อ</td>
		<td><input type=text name=name size=30 value="<%=new String(name.getBytes("ISO8859_1"),"TIS-620")%>"></td></tr>
	<tr id=color2>
		<td>อีเมล</td>
		<td><input type=text name=email size=30 value="<%=new String(email.getBytes("ISO8859_1"),"TIS-620")%>"></td></tr>
	<tr id=color2>
		<td>รายละเอียด</td>
		<td><textarea cols=50 rows=6 name=comment><%=new String(comment.getBytes("ISO8859_1"),"TIS-620")%></textarea></td></tr>
	<tr id=color2>
		<td colspan=2 align=center><input type=submit name=submit value=Submit>&nbsp;<input type=reset></td></tr>
</table>
</form>
<%
	}
%>
</body>
</html>