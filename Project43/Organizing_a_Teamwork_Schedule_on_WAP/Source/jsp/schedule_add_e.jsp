<jsp:useBean id="schedule" class="schedule.add" scope="session"/>
<jsp:setProperty name="schedule" property="schedule_date" param="schedule_date"  />
<jsp:setProperty name="schedule" property="schedule_month" param="schedule_month"  />
<jsp:setProperty name="schedule" property="schedule_year" param="schedule_year"  />
<jsp:setProperty name="schedule" property="schedule_hour_time" param="schedule_hour_time"  />
<jsp:setProperty name="schedule" property="schedule_minute_time" param="schedule_minute_time"  />
<jsp:setProperty name="schedule" property="schedule_hour_to" param="schedule_hour_to"  />
<jsp:setProperty name="schedule" property="schedule_minute_to" param="schedule_minute_to"  />
<jsp:setProperty name="schedule" property="schedule_title" param="schedule_title"  />
<jsp:setProperty name="schedule" property="schedule_detail" param="schedule_detail"  />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="schedule" property="name" value="<%=username%>" />
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="add" title="Add">
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
	<% if ( schedule.isValid() ) { %>
		<% if ( schedule.isSchedule() ) { %>
		<p> Improper Schedule </p>
		<% } else { %>
		<%schedule.insert();%>

		<p>
			Insert Schedule Successfull.
		</p>
		<% } %>
		<% schedule.cleanup(); %>
	<% } else {  %>
		<p> Improper <jsp:getProperty name="schedule" property="error"/></p>
	<% } %>
		</card>
</wml>

<% } %>