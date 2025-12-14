<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="information.abc.library.com.*" %>
<%@ page import="weblogic.jws.proxies.*" %>

<%
String title = new String (request.getParameter("title").getBytes("iso-8859-1"), "tis-620");
String text = new String (request.getParameter("text").getBytes("iso-8859-1"), "tis-620");
String subject =  new String (request.getParameter("subject").getBytes("iso-8859-1"), "tis-620");;
String id = request.getParameter("id");
%>

<%
Information_Impl proxy = new Information_Impl(); 
InformationSoap soapProxy = proxy.getinformationSoap(); 
%>

<%	//àÃÕÂ¡ãªéà«ÍÃìÇÔÊ
	soapProxy.insertData(title,text,subject);
%><jsp:forward page="notification.jsp"> 
	<jsp:param name="id" value="<%=id%>"/>
</jsp:forward>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<%=title%>
<%=text%>
<%=subject%>
</body>
</html>
