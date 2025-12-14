<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html><head><title>Welcome</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="#3399FF">
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
	out.println(" "+name ); </body>
%>
</html>
