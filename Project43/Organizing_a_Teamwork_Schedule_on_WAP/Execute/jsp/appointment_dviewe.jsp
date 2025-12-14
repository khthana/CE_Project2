<jsp:useBean id="appointment_dviewe" class="appointment.appointment_dviewe" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_dviewe" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_dviewe" property="gid" param="gid"/>
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
	<% if (appointment_dviewe.isValid()) { %>
		<% appointment_dviewe.select(); %>
		<%while (appointment_dviewe.next()) {%>
	
		<%
			String year =appointment_dviewe.getYear();
			String month =appointment_dviewe.getMonth();
			String date =appointment_dviewe.getDate();
			String hour_time =appointment_dviewe.getHour_time();
			String minute_time = appointment_dviewe.getMinute_time();
			String hour_to = appointment_dviewe.getHour_to();
			String minute_to = appointment_dviewe.getMinute_to();
			String title = appointment_dviewe.getTitle();
		%>
		<a href="<%=response.encodeURL(appointment_dviewe.getLink())%>">
			<%=date%>-<%=month%>-<%=year%><br/>
			<%=hour_time%>:<%=minute_time%>-<%=hour_to%>:<%=minute_to%>-<%=title%></a>

		
		<br/> 
		<% } %>
	<% } else { %>
	error select group name
	<% } %>
	</p>
	<% appointment_dviewe.cleanup();%>
		</card>
</wml>
<% } %>