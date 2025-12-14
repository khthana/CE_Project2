<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>

<jsp:useBean class="insert.add_cur" id="addc" scope="session"></jsp:useBean>
<%
	addc.setCode1(request.getParameterValues("code1")); addc.setCode2(request.getParameterValues("code2"));
	addc.setYearapplied1(request.getParameterValues("yearapplied1")); addc.setYearapplied2(request.getParameterValues("yearapplied2"));
	addc.setAmt1(request.getParameterValues("amt1")); addc.setAmt2(request.getParameterValues("amt2"));	
%>
<script language="javascript">
	self.close();
</script>