<jsp:useBean id="massaged" class="massage.deleteview" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="massaged" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Title : :Sender">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% massaged.select(); %>
<%while (massaged.next()) {%>

	<%
		String _massid = massaged.getMassid();
		String _sender = massaged.getSender();
		String _title = massaged.getTitle();
	%>
	<a href="<%=response.encodeURL(massaged.getLink())%>" title="Delete"> <%=_title%>: :<%=_sender%></a>
	
<br/> 
	<% } %>	
	
	<% massaged.cleanup();%>
	</p>
		</card>
</wml>
<% } %>