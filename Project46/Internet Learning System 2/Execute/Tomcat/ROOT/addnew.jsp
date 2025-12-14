<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold;
	Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
</head>
<body>
<%
	if (session.getAttribute("auth")==null)
	{
			response.sendRedirect("main.jsp");
			return;
	}
	else{
	String submit = request.getParameter("submit"),topic="",name="",email="",comment="",ip="";
	int error=0;

	if (submit!=null)
	{
		topic =request.getParameter("topic");
		name = request.getParameter("name");
		email = request.getParameter("email");
		comment =request.getParameter("comment");
		ip = request.getRemoteAddr();

		if (topic.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบหัวข้อคำถามให้ถูกต้อง</font></center>");
		}
		if (name.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบชื่อให้ถูกต้อง</font></center>");
		}
		if (email.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบอีเมล์ให้ถูกต้อง</font></center>");
		}
		if (comment.equals(""))
		{
			error = 1;
			out.println("<center><font color=red>ตรวจสอบความคิดเห็นให้ถูกต้อง</font></center>");
		}
		
		if (error==0)
		{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sql = "INSERT INTO board_ques VALUES(' ',' "+ topic + " ',' " + name + " ',' " + email + " ',' " +comment+ "','"+ip+" ',NOW(),NOW(),' "+name+"',0,0)";
			int myresult = stmt.executeUpdate(sql);

			if (myresult!=0)
			{
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

	if (submit==null || error==1)
	{
%>
		<form action="addnew.jsp" method="post">
		<table width='80%' align=center border=0 cellspacing=1 cellpadding=2>
			<tr id=color1>
				<td colspan=2 align=center>ตั้งหัวข้อใหม่</td>
			</tr>
			<tr id=color2>
				<td>หัวข้อ</td>
				<td><input type=text name=topic size=50 value="<%=new String(topic.getBytes("ISO8859_1"),"windows-874")%>"></td>
			</tr>
			<tr id=color2>
				<td>ชื่อ</td>
				<td><input type=text name=name size=30 value="<%=new String(name.getBytes("ISO8859_1"),"windows-874")%>"></td>
			</tr>
			<tr id=color2>
				<td>อีเมล์</td>
				<td><input type=text name=email size=30 value="<%=new String(email.getBytes("ISO8859_1"),"windows-874")%>"></td>
			</tr>
			
			<tr id=color2>
				<td>รายละเอียด</td>
				<td><textarea cols=50 rows=6 name=comment><%=new String(comment.getBytes("ISO8859_1"),"windows-874")%></textarea></td>
			</tr>
			<tr id=color2>
				<td colspan=2 align=center><input type=submit name=submit value=Submit>&nbsp;<input type=reset></td>
			</tr>
		</table>
		</form>
<%}}%>
</body>
</html>