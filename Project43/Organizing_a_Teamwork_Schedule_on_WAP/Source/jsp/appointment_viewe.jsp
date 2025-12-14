<jsp:useBean id="appointment_viewe" class="appointment.appointment_viewe" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="appointment_viewe" property="name" value="<%=username%>"/>
<jsp:setProperty name="appointment_viewe" property="gid" param="gid"/>

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
	<% if (appointment_viewe.isValid()) { %>
		<% appointment_viewe.select(); %>
		<%while (appointment_viewe.next()) {%>
	
		<%
			String year =appointment_viewe.getYear();
			String month =appointment_viewe.getMonth();
			String date =appointment_viewe.getDate();
			String hour_time =appointment_viewe.getHour_time();
			String minute_time = appointment_viewe.getMinute_time();
			String hour_to = appointment_viewe.getHour_to();
			String minute_to = appointment_viewe.getMinute_to();
			String title = appointment_viewe.getTitle();
		%>
		<%--<a href="<%=response.encodeURL(appointment_viewe.getLink())%>">
			<%=date%>-<%=month%>-<%=year%><br/>
			<%=hour_time%>:<%=minute_time%>-<%=hour_to%>:<%=minute_to%>-<%=title%></a>--%>

			<%=date%>-<%=month%>-<%=year%><br/>
			<%=hour_time%>:<%=minute_time%>-<%=hour_to%>:<%=minute_to%><br/><%=title%><br/>---------------------<br/>
		
		<br/> 
		<% } %>
	<% } else { %>
	error select group name
	<% } %>
	</p>
	<% appointment_viewe.cleanup();%>
		</card>
</wml>
<% } %>