<jsp:useBean id="schedulevd" class="schedule.viewdelete" scope="session"/>
<jsp:setProperty name="schedulevd" property="schedule_date" param="schedule_date" />
<jsp:setProperty name="schedulevd" property="schedule_month" param="schedule_month" />
<jsp:setProperty name="schedulevd" property="schedule_year" param="schedule_year" />
<% String username=(String)session.getValue("userid");%>
<jsp:setProperty name="schedulevd" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="View Delete">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<% if ( schedulevd.isValid() ) {%>
	<p>
	<% schedulevd.select(); %>
	<%while (schedulevd.next()) {%>

	<%
		String hour_time =schedulevd.getHour_time();
		String minute_time = schedulevd.getMinute_time();
		String hour_to = schedulevd.getHour_to();
		String minute_to = schedulevd.getMinute_to();
		String title = schedulevd.getTitle();
	%>
	<a href="<%=response.encodeURL(schedulevd.getLink())%>" title="Delete"><%=schedulevd.getShowlink()%> 
	
	: :<%=title%></a><br/> 
	<% } %>
	<% schedulevd.cleanup();%>
	</p>
	<% } else {  %>
		<p> Improper <jsp:getProperty name="schedulevd" property="error"/></p>
	<% } %>
		</card>
</wml>
<% } %>