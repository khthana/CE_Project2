<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<%
      String ad_no=new String(request.getParameter("adhoc"));
	  session.setAttribute("adhoc",ad_no);
	  response.sendRedirect("servlet/GenPr");
%>