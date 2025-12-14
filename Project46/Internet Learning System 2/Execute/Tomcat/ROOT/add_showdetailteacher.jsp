<%@ page contentType="text/html; charset=windows-874"%>
<%@page import="java.sql.*"%>
<html>
<title>Show Information Registration</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<SCRIPT TYPE="text/javascript">
<!--
function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, 'width=800,scrollbars=yes');
return false;
}
//-->
</SCRIPT>
<body  background="images/bg.gif">
<%
	if (session.getAttribute("admin")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	String sql = "SELECT * FROM teacher_personal ";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<table width='750' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30' background='images/greenbg.gif'><center>รายชื่ออาจารย์สอนทั้งหมดก่อนเพิ่ม</center></td></tr></table>");
		
		while(rs.next())
		{	
			  String name1 = new String(rs.getString("name").getBytes("ISO8859_1"),"MS874");
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0  >");
			out.println("<tr align=left><td width='30%' ><font size=2 color='blue'>"+name1+"&nbsp;</font></td><td width='17%'><font size=2 color='blue'>"+rs.getString("room")+"</font></td><td width='25%' ><font size=2 color='blue'>"+rs.getString("phone")+"</font></td><td width='25%' ><font size=2 color='blue'>"+rs.getString("email")+"</font></td></tr>");
		}
		out.println("</table>");	
	}
	rs.close();
	stmt.close();
	mycon.close();
	}
%>	
<br><br>
<%
			int error = 0;
		String name = request.getParameter("name");
		String room = request.getParameter("room");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
			
			if(name.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อให้ถูกต้อง</font></center>");
	}
				if(room.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบห้องให้ถูกต้อง</font></center>");
	}
				if(phone.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบเบอร์โทรศัพท์ให้ถูกต้อง</font></center>");
	}
		if(email.equals("") || email.indexOf('@')==-1 || email.indexOf('.')==-1)
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบอีเมล์แอดเดรสให้ถูกต้อง</font></center>");
	}
	out.println("<center><font color=red size=2>รายละเอียดที่ได้เพิ่มไป <a href='show_afteradd.jsp'  onClick='return popup(this, ''show_afteradd')'>ดูได้ที</a>่</font></center>");
			
			int myresult=0;
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sqla = "INSERT INTO teacher_personal VALUES ('', '"+name+"', '"+room+"', '"+phone+"', '"+email+"' )";
			myresult=stmt.executeUpdate(sqla);
			
			stmt.close();
			mycon.close();
%>
</body>
</html>
