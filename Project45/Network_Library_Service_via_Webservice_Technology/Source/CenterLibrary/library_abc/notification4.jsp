<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.x2002.x04.soap.conversation.*"%>

<%
	Information_Impl proxy=new Information_Impl();
	InformationSoap soapProxy=proxy.getinformationSoap();
	String id=request.getParameter("id");
	ContinueHeader c=new ContinueHeader(id);
	try{
		soapProxy.alert_book_off(c);
	}catch(Exception e){System.out.println(e);}
%>
<jsp:forward page="notification.jsp">
	<jsp:param name="id" value="0"/>
</jsp:forward>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
