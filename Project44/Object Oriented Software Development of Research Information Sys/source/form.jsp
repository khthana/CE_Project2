<%@  page session="true"  %>
<%@  include file ="checksession.inc" %>
<%

    String formNo = request.getParameter("FormNo");
		
	if ( formNo.equals("15")  || formNo.equals("16")  ) {
response.sendRedirect("AddTeacherPage.jsp");
	}
else {
	response.sendRedirect("ReqStdid.jsp?FormNo="+formNo);
};

%>