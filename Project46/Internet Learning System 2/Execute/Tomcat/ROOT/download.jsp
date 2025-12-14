<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<meta http-equiv="Content-Language" content="th">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Download ไฟล์ต่างๆ </title>
<link rel="stylesheet" type="text/css" href="style00.css">
</head>
<body  background="images/bg.gif">
<%

	if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	out.println("<table width='800' cellpadding='0' cellspacing=0  border='0'>");
	out.println("<tr><td height='30' background='images/coner.gif' align='right'>ยินดีต้อนรับคุณ  "+session.getAttribute("auth")+"สำหรับดาวโหลด</td></tr></table>");
	%>

<div align="center">
<center>
<table border="0" width="80%" cellspacing="1">
    <tr>
      <td width="14%" valign="top"><font face="BrowalliaUPC" size="4"><a href="pdf/lesson01.pdf">บทที่
        1</a></font></td>
      <td width="86%" valign="top"><font face="BrowalliaUPC" size="4">เนื้อหาไฟล์บทที่1 <br></font></td>
    </tr>
    <tr>
      <td width="14%" valign="top"><font FACE="BrowalliaUPC" size="4"><a href="pdf/lesson02.pdf">บทที่
        2</a></font></td>
      <td width="86%" valign="top"><font FACE="BrowalliaUPC" size="4">เนื้อหาไฟล์บทที่2 <br></font></td>
    </tr>
    <tr>
      <td width="14%" valign="top"><font FACE="BrowalliaUPC" size="4"><a href="pdf/lesson03.pdf">บทที่ 3</a></font></td>
      <td width="86%" valign="top"><font FACE="BrowalliaUPC" size="4">เนื้อหาไฟล์บทที่3 <br></font></td>
    </tr>
    <tr>
      <td width="14%" valign="top"><font FACE="BrowalliaUPC" size="4"><a href="pdf/lesson04.pdf">บทที่ 4</a></font></td>
      <td width="86%" valign="top"><font FACE="BrowalliaUPC" size="4">เนื้อหาไฟล์บทที่4 <br></font></td>
    </tr>
  </table>
  </center>
</div>
<%
	}
%>
</body>
</html>
