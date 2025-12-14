<%@ page contentType="text/html; charset=windows-874"%>
<%@page import="java.sql.*"%>
<html>
<title>Show Information Registration</title>
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
<body>
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
	String sql = "SELECT * FROM login ";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<center>รายชื่อสมาชิกทั้งหมดก่อนลบ</center><hr>");
		while(rs.next())
		{	
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0 bgcolor=#ffeeff >");
			out.println("<tr align=center><td width='20%' align='left' >username :"+rs.getString("username")+"&nbsp;</td><td width='20%' align='left'>password : "+rs.getString("password")+"</td></tr>");
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
