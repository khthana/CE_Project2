<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>

<%
	Use_Impl proxy = new Use_Impl(); 
	UseSoap soapProxy = proxy.getuseSoap(); 
	int i=0;
	String book;
	String username=new String ( request.getParameter("username").getBytes("iso-8859-1"), "tis-620");
	String status=request.getParameter("status");
	String book_record=request.getParameter("book");
	String id=request.getParameter("id");
	String book_status=new String();
	try{
		book_status=soapProxy.record_book(username, status, book_record);
	}catch(Exception e){System.out.println(e);}
%>
<jsp:forward page="borrow2.jsp"> 
	<jsp:param name="book_status" value="<%=book_status%>"/>
	<jsp:param name="id" value="<%=id%>"/>
</jsp:forward>
<html>
<head>
<title>บันทึกการยืม</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
