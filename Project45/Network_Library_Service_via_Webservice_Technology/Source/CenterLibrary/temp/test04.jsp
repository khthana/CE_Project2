<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>
<% Search_all_Impl proxy = new Search_all_Impl(); 
 Search_allSoap soapProxy = proxy.getsearch_allSoap(); 

	try{
	BookList b[]=soapProxy.searchBookByAuthor("nut");
	System.out.println(b[0].getLibrary());
	}catch(Exception e){System.out.println(e);}
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
