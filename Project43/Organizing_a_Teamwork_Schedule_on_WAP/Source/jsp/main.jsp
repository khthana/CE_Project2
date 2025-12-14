<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Main Page">

		<p align="center">
			User <%= session.getValue("userid") %><br/>
		</p>
		<p>
			<a href="<%=response.encodeURL("massage.jsp")%>">Message</a><br/>
			<a href="<%=response.encodeURL("schedule.jsp")%>">Schedule</a><br/>
			<a href="<%=response.encodeURL("teamwork.jsp")%>">Team Working</a><br/>
			<a href="<%=response.encodeURL("appointment.jsp")%>">Appointment</a><br/>
			<a href="<%=response.encodeURL("account.jsp")%>">Account Information</a><br/>
			<a href="<%=response.encodeURL("logout.jsp")%>">Log out</a><br/>
		</p>
	</card>
</wml>
<% } %>
