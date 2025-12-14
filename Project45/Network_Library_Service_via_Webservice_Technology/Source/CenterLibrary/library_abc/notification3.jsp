<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.x2002.x04.soap.conversation.*"%>

<%
	Information_Impl proxy=new Information_Impl();
	InformationSoap soapProxy=proxy.getinformationSoap();
	String timeout=request.getParameter("timeout");
	String repeat=request.getParameter("repeat");
	String id=request.getParameter("id");
	StartHeader s=new StartHeader( id, "http://multimedia10.ce.kmitl.ac.th");
	try{
		soapProxy.alert_book_on(timeout, repeat, s);
	}catch(Exception e){System.out.println(e);}
%>
<jsp:forward page="notification.jsp">
	<jsp:param name="id" value="<%=id%>"/>
</jsp:forward>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
