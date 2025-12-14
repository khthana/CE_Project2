<jsp:useBean id="appointment_cviewe" class="appointment.appointment_cviewe" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_cviewe" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_cviewe" property="gid" param="gid"/>
<% session.putValue("gid",request.getParameter("gid")); %>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Select Time">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% if (appointment_cviewe.isValid()) { %>
		<% appointment_cviewe.select(); %>
		<%while (appointment_cviewe.next()) {%>
	
		<%
			String year =appointment_cviewe.getYear();
			String month =appointment_cviewe.getMonth();
			String date =appointment_cviewe.getDate();
			String hour_time =appointment_cviewe.getHour_time();
			String minute_time = appointment_cviewe.getMinute_time();
			String hour_to = appointment_cviewe.getHour_to();
			String minute_to = appointment_cviewe.getMinute_to();
			String title = appointment_cviewe.getTitle();
			String user_name = appointment_cviewe.getUser_name();
		%>
		<a href="<%=response.encodeURL(appointment_cviewe.getLink())%>">
			To :<%=user_name%><br/>
			<%=date%>-<%=month%>-<%=year%><br/>
			<%=hour_time%>:<%=minute_time%>-<%=hour_to%>:<%=minute_to%>-<%=title%></a>

		
		<br/> 
		<% } %>
	<% } else { %>
	error select group name
	<% } %>
	</p>
	<% appointment_cviewe.cleanup();%>
		</card>
</wml>
<% } %>