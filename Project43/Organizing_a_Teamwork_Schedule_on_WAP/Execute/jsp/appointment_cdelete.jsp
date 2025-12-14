<jsp:useBean id="appointment_cdelete" class="appointment.appointment_cdelete" scope="session"/>
<jsp:setProperty name="appointment_cdelete" property="reschedule_id" param="reschedule_id" />
<%String username=(String)session.getValue("userid");%>
<%String gid=(String)session.getValue("gid");%>
<jsp:setProperty name="appointment_cdelete" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_cdelete" property="gid" value="<%=gid%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Delete">
	<do type="Accept" label="Appointment">
		<go href="<%=response.encodeURL("appointment.jsp") %>"/>
	</do>
	<do type="prev" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
		<% if ( appointment_cdelete.Valid() ) { %>
		<p>
				<% appointment_cdelete.delete(); %>
				Delete Complete
		</p>
		<% } else { %>
		<p>
				Improper Delete
		</p>
		<% } %>
	</card>
</wml>
<% appointment_cdelete.cleanup();%>
<% } %>