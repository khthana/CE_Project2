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
	String sql = "SELECT * FROM subject_detail ";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<table width='750' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30' background='images/greenbg.gif'><center>รายชื่อวิชาทั้งหมดก่อนลบ</center></td></tr></table>");
	
		while(rs.next())
		{	
			String detail = new String(rs.getString("detail").getBytes("ISO8859_1"),"MS874");
			 String detail2 = new String(rs.getString("detail2").getBytes("ISO8859_1"),"MS874");
			 String detail3 = new String(rs.getString("detail3").getBytes("ISO8859_1"),"MS874");
			 String detail4 = new String(rs.getString("detail4").getBytes("ISO8859_1"),"MS874");
			 String time = new String(rs.getString("time").getBytes("ISO8859_1"),"MS874");
			  String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
			  String coteach = new String(rs.getString("co_teacher").getBytes("ISO8859_1"),"MS874");
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0 bgcolor=#ffeeff >");
			out.println("<tr align=left><td width='13%' ><font size=2 color='blue'>"+rs.getString("subjectid")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("subjectname")+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail2+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail3+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail4+"</font></td></tr>");
			out.println("<tr align=left><td width='15%' ><font size=2 color='blue'>"+time+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+teach+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+coteach+"</font></td></tr><br>");
		}
		out.println("</table>");	
	}
	rs.close();
	stmt.close();
	mycon.close();
	}
%>	
<a href="adminlogin.jsp" align="center">กลับไปหน้าหลัก</a>
<br><br>

</body>
</html>

