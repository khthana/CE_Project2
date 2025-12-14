<jsp:useBean id="appointment_accept" class="appointment.appointment_accept" scope="session"/>
<jsp:setProperty name="appointment_accept" property="appointment_reschedule_id" param="reschedule_id" />
<jsp:setProperty name="appointment_accept" property="appointment_hour_time" param="request_hour_time" />
<jsp:setProperty name="appointment_accept" property="appointment_minute_time" param="request_minute_time" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_accept" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Detail">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
			<prev/>
	</do>
	<p>
		<% if ( appointment_accept.Valid() ) { %>
				<% appointment_accept.insert(); %>
				<% appointment_accept.insertoname(); %>
				<% appointment_accept.delete(); %>
				<% appointment_accept.message(); %>
				Accept sucessfull.
				
		<% } else { %>
			 
			Time inpute is Invalid.
		
		<% } %>
	</p>
	</card>
</wml>
<% appointment_accept.cleanup();%>
<% } %>