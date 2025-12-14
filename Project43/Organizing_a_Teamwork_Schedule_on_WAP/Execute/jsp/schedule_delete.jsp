<%@page import="java.util.*"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% GregorianCalendar g = new GregorianCalendar(); %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="Delete" title ="Delete Schedule">
	<do type="accept" label=" View Delete">
		<go href="<%=response.encodeURL("schedule_delete_e.jsp")%>" method="post">
			<postfield name="schedule_date" value="$schedule_date"/>
			<postfield name="schedule_month" value="$schedule_month"/>
			<postfield name="schedule_year" value="$schedule_year"/>
		</go>
	</do>
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>

			Go Date:<input name="schedule_date" maxlength="2" value="<%=g.get(Calendar.DATE)%>"/><br/>
			Month:<input name="schedule_month" maxlength="2" value="<%=1+g.get(Calendar.MONTH)%>"/><br/>
			Year:<input name="schedule_year" maxlength="4" value="<%=g.get(Calendar.YEAR)%>"/><br/>
		</p>

	</card>
</wml>
<% } %>