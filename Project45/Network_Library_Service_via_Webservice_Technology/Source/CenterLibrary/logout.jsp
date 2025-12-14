<%@ page contentType="text/html; charset=windows-874" language="java"  errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>

<%
	Login_Impl proxy = new Login_Impl(); 
	LoginSoap soapProxy = proxy.getloginSoap();
	String username=(String)session.getAttribute("s_username");
	String library=(String)session.getAttribute("s_library");
	try{
		soapProxy.logout( username, library);
	}catch(Exception e){System.out.println(e);}
	session.invalidate();
%>
<jsp:forward page="index01.jsp"/> 
<html>
<head>
<title>ออกจากระบบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
