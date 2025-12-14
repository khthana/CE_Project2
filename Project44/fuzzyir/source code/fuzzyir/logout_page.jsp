<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
	session.putValue("id","");
	session.putValue("name","");
	session.putValue("surname","");
	session.putValue("pass_authen","");
	response.sendRedirect("authen.jsp");
%>
</HEAD>

<BODY BGCOLOR="#FFFFFF">

</BODY>
</HTML>
