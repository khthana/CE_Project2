<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>

<jsp:useBean class="insert.add_cur" id="addc" scope="session"></jsp:useBean>
<%
	addc.setExpense1(request.getParameterValues("expense1")); addc.setExpense2(request.getParameterValues("expense2"));
	addc.setE1(request.getParameterValues("e1")); addc.setE2(request.getParameterValues("e2"));
	addc.setA1(request.getParameterValues("a1")); addc.setA2(request.getParameterValues("a2"));	
%>
<script language="javascript">
	self.close();
</script>