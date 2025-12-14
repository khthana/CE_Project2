<html>
<head>
<title>Untitled Document</title>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<frameset cols="177,830*" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="leftFrame" scrolling="NO" noresize src="menu_left.jsp">
  <frame name="mainFrame2" src="modify_page.jsp">
</frameset>
<noframes><body bgcolor="#FFFFFF">

</body></noframes>
</html>