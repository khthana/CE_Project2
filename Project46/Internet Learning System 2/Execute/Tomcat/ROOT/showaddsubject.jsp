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
<body background="images/bg.gif">
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
	String sql = "SELECT * FROM subject ";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<center>รายชื่อวิชาทั้งหมดก่อนเพิ่ม</center><hr>");
		while(rs.next())
		{	
			  String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
			   String coteach = new String(rs.getString("co_teacher").getBytes("ISO8859_1"),"MS874");
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0  >");
			out.println("<tr align=left><td width='13%' ><font size=2 color='blue'>"+rs.getString("original_id")+"&nbsp;</font></td><td width='40%'><font size=2 color='blue'>"+rs.getString("subject")+"</font></td><td width='30%' ><font size=2 color='blue'>"+teach+"</font></td><td width='25%' ><font size=2 color='blue'>"+coteach+"</font></td></tr>");
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
		String subject_id = request.getParameter("subject_id");
		String subject= request.getParameter("subject");
		String teacher = request.getParameter("teacher");
		String coteacher = request.getParameter("coteacher");
			
			if(subject_id.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบรหัสวิชาให้ถูกต้อง</font></center>");
	}
				if(subject.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}
				if(teacher.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่ออาจารย์ให้ถูกต้อง</font></center>");
	}
	
out.println("<center><font color=red size=2>รายละเอียดที่ได้เพิ่มไป <a href='showafteraddsubject.jsp'  onClick='return popup(this, ''showafteraddsubject')'>ดูได้ที</a>่</font></center>");
			int myresult=0;
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
	String sqla = "INSERT INTO subject VALUES ('', '"+subject_id+"', '"+subject+"', '"+teacher+"', '"+coteacher+"' )";
		myresult=stmt.executeUpdate(sqla);
			
			stmt.close();
			mycon.close();
%>
</body>
</html>

