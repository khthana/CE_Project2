 <jsp:useBean id="schedules" class="schedule.view" scope="session"/>
<jsp:setProperty name="schedules" property="schedule_date" param="schedule_date" />
<jsp:setProperty name="schedules" property="schedule_month" param="schedule_month" />
<jsp:setProperty name="schedules" property="schedule_year" param="schedule_year" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="schedules" property="name" value="<%=username%>"/>

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
	<% if ( schedules.isValid() ) {%>
	<p>
	<% schedules.select(); %>
	<%while (schedules.next()) {%>

	<%
		String hour_time =schedules.getHour_time();
		String minute_time = schedules.getMinute_time();
		String hour_to = schedules.getHour_to();
		String minute_to = schedules.getMinute_to();
		String title = schedules.getTitle();
	%>
	<a href="<%=response.encodeURL(schedules.getLink())%>"><%=schedules.getShowlink()%>: :<%=title%></a><br/> 
	<% } %>
	<% schedules.cleanup();%>
	</p>
	<% } else {  %>
		<p> Improper <jsp:getProperty name="schedules" property="error"/></p>
	<% } %>
		</card>
</wml>
<% } %>