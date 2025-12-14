<jsp:useBean id="schedule_del" class="schedule.delete" scope="session"/>
<jsp:setProperty name="schedule_del" property="schedule_htime" param="htime" />
<jsp:setProperty name="schedule_del" property="schedule_mtime" param="mtime" />
<jsp:setProperty name="schedule_del" property="schedule_hto" param="hto" />
<jsp:setProperty name="schedule_del" property="schedule_mto" param="mto" />
<jsp:setProperty name="schedule_del" property="schedule_date" param="date" />
<jsp:setProperty name="schedule_del" property="schedule_month" param="month" />
<jsp:setProperty name="schedule_del" property="schedule_year" param="year" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="schedule_del" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Detail">
	<do type="Accept" label="Schedule">
		<go href="<%=response.encodeURL("schedule.jsp") %>"/>
	</do>
	<do type="prev" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>

		<p align="center">
			User <%= session.getValue("userid") %><br/>
		</p>

		<% if ( schedule_del.isSchedule() ) { %>
		<p>
				<% schedule_del.delete(); %>
				Delete Complete
		</p>
		<% } else { %>
		<p>
				Improper Delete
		</p>
		<% } %>
	</card>
</wml>
<% schedule_del.cleanup();%>
<% } %>