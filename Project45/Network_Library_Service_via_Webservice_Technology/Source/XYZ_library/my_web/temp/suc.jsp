<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>

<html><head><title>Welcome</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>

<body>
<% Login_Impl proxy = new Login_Impl(); %>
<% LoginSoap soapProxy = proxy.getloginSoap(); %>
<% UserProfile user = soapProxy.check_id(request.getParameter("username"),request.getParameter("password"),request.getParameter("library")); %>
<% 	String id=user.getId();
	String library=user.getLibrary();	
	String name=user.getName();
	String passwd=new String(request.getParameter("password"));
	if (name!= null )
	{ 
%>
	welcome 
<% 
	out.println(" "+name ); 
	Cookie cookie=new Cookie("id",id);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	cookie=new Cookie("library",library);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	cookie=new Cookie("name",name);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	cookie=new Cookie("passwd",passwd);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	} 
	else{ 
%>
	Login fail.
<jsp:forward page="index01.jsp"/>
<% 
	
	} 
%>	

</body>
</html>
