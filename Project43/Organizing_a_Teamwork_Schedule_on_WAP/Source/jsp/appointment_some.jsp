<jsp:useBean id="appointment_some" class="appointment.appointment_some" scope="session"/>
<% String username=(String)session.getValue("userid");%>
<% String gname=(String)session.getValue("appointment_gname");%>

<jsp:setProperty name="appointment_some" property="gname" value="<%=gname%>" />
<jsp:setProperty name="appointment_some" property="name" value="<%=username%>"/>



<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Request to">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% appointment_some.select(); %>
	<%while (appointment_some.next()) {%>

	<%
		 String link = appointment_some.getMember();
	%>
 	<a href="<%=response.encodeURL(appointment_some.getLink())%>" title="Subscribe" ><%=link %> 
	
	</a>
	<br/>

	<% } %>	

		<% appointment_some.cleanup();%>
	</p>
		</card>
</wml>
<% } %>