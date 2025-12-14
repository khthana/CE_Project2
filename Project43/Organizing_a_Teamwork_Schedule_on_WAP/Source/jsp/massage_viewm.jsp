 <jsp:useBean id="massagev" class="massage.view" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="massagev" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="View">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% massagev.select(); %>
<%while (massagev.next()) {%>

	<%
		String _massid = massagev.getMassid();
		String _sender = massagev.getSender();
		String _title = massagev.getTitle();
	%>
	<a href="<%=response.encodeURL(massagev.getLink())%>"> <%=_title%></a>-from :<%=_sender%>
	
<br/> 
	<% } %>	
	
	<% massagev.cleanup();%>
	</p>
		</card>
</wml>
<% } %>