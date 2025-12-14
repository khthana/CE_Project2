<%@ page contentType="text/html; charset=windows-874"%>
<html>
<body>
<%
		session.invalidate();
		response.sendRedirect("main.jsp");
%>
</body>
</html>