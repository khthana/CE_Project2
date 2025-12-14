<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
 <%	try{
	    %>
<%System.out.println("********************************");%>
<% String username=new String(request.getParameter("username"));%>
<%System.out.println("----------------------------------------------");%>
 <% }catch(Exception e){System.out.println(e);} 
	    %> 
<body>

</body>
</html>
