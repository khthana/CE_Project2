<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>

<%
	Return_book_Impl proxy = new Return_book_Impl(); 
	Return_bookSoap soapProxy = proxy.getreturn_bookSoap(); 
	String book_record[]=new String[1];
	book_record[0]=request.getParameter("book_record");
	int baht=Integer.parseInt(request.getParameter("baht"));
	System.out.println(baht);
	try{
		baht=baht+soapProxy.insert_book(book_record);
	}catch(Exception e){System.out.println(e);}
	System.out.println(baht);
%>
<jsp:forward page="return1.jsp">
	<jsp:param name="baht" value="<%=baht%>"/>
</jsp:forward>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
