<title>&aacute;&iexcl;&eacute;&auml;&cent;&cent;&eacute;&Iacute;&Aacute;&Ugrave;&Aring;&Euml;&sup1;&Ntilde;&sect;&Ecirc;&times;&Iacute;</title><%@ page  language="java" import="java.sql.*" errorPage="" %>
<%
String search_from = request.getParameter("search_from");
	if(search_from.equals("book_record"))
	{out.print(search_from);
%>
<jsp:forward page="catalog_edit3.jsp"/>
<%
	;}
	else {
%>

<jsp:forward page="catalog_list.jsp" />
	
<%
	;}
%> 

