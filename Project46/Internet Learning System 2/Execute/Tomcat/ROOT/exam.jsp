<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
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
</head>
<body background="images/bg.gif">
<%
	//out.println(session.getAttribute("auth"));
	if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	out.println("<table width='800' cellpadding='0' cellspacing=0  border='0'>");
	out.println("<tr><td height='30' background='images/coner.gif' align='center'>ยินดีต้อนรับคุณ  "+session.getAttribute("auth")+"งเพื่อชมวิดีทัศน์</td></tr></table>");
		out.println("<table width='800' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30'  width='25%' align='left'><b><a href='exam/project.htm'  onClick=return popup(this, 'project') >Presented File1</a></b></td><td width='75%' align='left'><b>นี้เป็นตัวอย่างไฟล์ที่ใช้ในการชมการสอนของครั้งที่แล้ว</b></td></tr></table>");
		out.println("<hr>");
	}
%>
</body>
</html>