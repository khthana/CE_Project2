<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Appointment">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
		<do type="prev" label="Back">
			<prev/>
		</do>
		<p>
			<a href="<%=response.encodeURL("appointment_new_select.jsp")%>">New Appointment</a><br/>
			<a href="<%=response.encodeURL("appointment_view_select.jsp")%>">View Appointment</a><br/>
			<a href="<%=response.encodeURL("appointment_delete_select.jsp")%>">Delete Appointment</a><br/>
			<a href="<%=response.encodeURL("appointment_get.jsp")%>">Get Appointment</a><br/>
			<a href="<%=response.encodeURL("appointment_requestedv.jsp")%>">Requested Appointment</a><br/>
		</p>
	</card>
</wml>
<% } %>
