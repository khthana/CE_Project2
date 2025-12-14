<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="center.*"%>
<html><head><title>Welcome</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body>
<% Login_Impl proxy = new Login_Impl(); %>
<% LoginSoap soapProxy = proxy.getLoginSoap(); %>
<% String member_num = soapProxy.CheckUsername(request.getParameter("username"),request.getParameter("password")); %>
<% if (member_num != null )
{ %>
wellcome out.println(" "+ String ); 
<% } else{ %>
Login fail.
<% } %>	

</body>
</html>
