<jsp:useBean id="appointmentviewselect" class="appointment.appointviewselect" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointmentviewselect" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Select Group">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% appointmentviewselect.select(); %>
	</p>
	<p>
	<%while (appointmentviewselect.next()) {%>

	<%
		String _gname =appointmentviewselect.getGname();
	%>
	<a href="<%=response.encodeURL(appointmentviewselect.getLink())%>"><%=_gname%></a><br/>
	<% } %>
	<% appointmentviewselect.cleanup();%>
	</p>
		</card>
</wml>
<% } %>