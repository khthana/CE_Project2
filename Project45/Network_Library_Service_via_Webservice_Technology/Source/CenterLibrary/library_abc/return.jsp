<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<input name="baht" type="hidden" value="0">
<%System.out.println("baht = "+baht);%>
<jsp:forward page="return1.jsp?baht=0"/> 
</body>
</html>
