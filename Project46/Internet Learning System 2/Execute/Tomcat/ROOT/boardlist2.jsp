<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<style type="text/css">
	#color1 {background-color:#5971AF; font-weight:bold;
	Color:#FFFFFF;}
	#color2 {background-color:#E1E9FC; Color:#000000;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874"></head>
<body >
<%
			if ( session.getAttribute("teacher")==null)
			{
			response.sendRedirect("main.jsp");
			return;
			}
			else{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sql = "SELECT id,topic,name,ans,view,DATE_FORMAT(lastpost,'%e %b %Y,%T') AS lastpost,lastname FROM board_ques ORDER BY id DESC";
			ResultSet myresult = stmt.executeQuery(sql);
				out.println("<center> <b>เว็บบอร์ดแสดงความคิดเห็น<br></center><br>");
				out.println("<a href='addnew.jsp'>ตั้งคำถามใหม่</a>");
				out.println("<table width=98% border=0 cellpadding=0 cellspacing=1 cellpadding=2 >");
				out.println("<tr id=color1 align=center>");
				out.println("<td colspan=2>หัวข้อ</td>");
				out.println("<td>ผู้ถาม</td>");
				out.println("<td>ตอบ</td>");
				out.println("<td>ดู</td>");
				out.println("<td>โพสต์ครั้งสุดท้าย</td></tr>");

			while(myresult.next())
			{
				 String topic = new String(myresult.getString("topic").getBytes("ISO8859_1"),"MS874");
				String name = new String(myresult.getString("name").getBytes("ISO8859_1"),"MS874");
				String lastname = new String(myresult.getString("lastname").getBytes("ISO8859_1"),"MS874");
				out.println("<tr id=color2 align=center>");
				out.println("<td width='3%'><img src='indexpic/icon.gif'></td>");
				out.println("<td width='47%' align=left>&nbsp;<a href='view.jsp?id="+myresult.getString("id")+"'target='_new'>"+topic+"</a></td>");
				out.println("<td width='15%'>"+name+"</td>");
				out.println("<td width='7%'>"+myresult.getString("ans")+"</td>");
				out.println("<td width='8%'>"+myresult.getString("view")+"</td>");
				out.println("<td width='20%'><font face='MS Sans Serif' size='2'>"+myresult.getString("lastpost")+"<br>โดย<B><font color='#56426C'>"+lastname+"</font></B></font></td></tr>");
			}
			out.println("</table><br><a href='logout.jsp'>ออกจากระบบ</a>");
			myresult.close();
			stmt.close();
			mycon.close();
			}
%>
</body>
</html>