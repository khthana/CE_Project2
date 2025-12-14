<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="registry.library.com.*" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<%try{
%>
<% Registry_Impl proxy = new Registry_Impl(); %>
<% RegistrySoap soapProxy = proxy.getregistrySoap(); %>
<% String old_pw = new String(request.getParameter("old_pw").getBytes("iso-8859-1"),"utf-8"); %>
<% String new_pw1 = new String(request.getParameter("new_pw1").getBytes("iso-8859-1"),"utf-8"); %>
<% String new_pw2 = new String(request.getParameter("new_pw2").getBytes("iso-8859-1"),"utf-8"); %>
<% String library = (String)session.getAttribute("s_library"); %>
<% String username = (String)session.getAttribute("s_username"); %>
<% boolean ok ; %> 
<%--สร้าง errorMessage--%>
<jsp:useBean id="errorMessages" scope="request" class="java.util.Vector" />
<%		if (new_pw1.equals(new_pw2)){
 		ok = soapProxy.change_password(library,username,old_pw,new_pw1);
		System.out.println(ok);
		 if(ok == true){	
			%><jsp:forward page="page_one2.jsp"/> 
			<% ;}else{
			%>
			<% errorMessages.addElement(" !! รหัสผ่านผิดพลาด !!"); %>
			<jsp:forward page="change_password.jsp"/> 
			<% ;}
		}else {errorMessages.addElement(" !! รหัสผ่านใหม่ไม่ตรงกัน !!");
%><jsp:forward page="change_password.jsp"/>
<% ;}}catch(Exception e){System.out.print(e);} 
%> 
<body>

</body>
</html>
