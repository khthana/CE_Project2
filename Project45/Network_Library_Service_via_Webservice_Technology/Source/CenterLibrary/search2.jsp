<%@ page  language="java" errorPage="" %>
<%
String search_from = request.getParameter("search_from");
String library=request.getParameter("library");
try{
	if(search_from.equals("author")){
%>
<jsp:forward page="search_author.jsp">
	<jsp:param name="library" value="<%=library%>"/>
</jsp:forward>

<%
	}
	else if(search_from.equals("title")){
%>

<jsp:forward page="search_title.jsp" />
	
<%
	}
	else if(search_from.equals("subject")){
%>

<jsp:forward page="search_subject.jsp" />
	
<%
	;}
	else if(search_from.equals("words")){
%>

<jsp:forward page="search_words.jsp" />
	
<%
	;}
	else if(search_from.equals("call_num")){
%>

<jsp:forward page="search_callnum.jsp" />
	
<%
	;}
	}catch(Exception e){System.out.print(e);}
%> 


