<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<%
		String login = request.getParameter("login2"),temp="",username="",password="";
		int error=0;
		if(login!=null)
		{
			username=request.getParameter("username2");
			password=request.getParameter("password2");
			out.println(username);
			out.println(password);
		}
%>
</body>
</html>
