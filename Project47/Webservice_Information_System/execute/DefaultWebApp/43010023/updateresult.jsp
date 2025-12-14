<%@ page import="java.sql.*" %>
<%@ include file="../WEB-INF/checkofficer.jsp"%>
<%@ include file="../WEB-INF/addupdate.jsp"%>
<%
	response.sendRedirect("update.jsp?trackno="+trackno);
%>