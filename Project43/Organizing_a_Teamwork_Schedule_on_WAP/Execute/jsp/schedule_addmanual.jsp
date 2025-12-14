<%@ page import="java.util.*"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% GregorianCalendar g = new GregorianCalendar(); %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="addschdule" title="Add Schdule">
	<do type="accept" label="Add">
		<go href="<%=response.encodeURL("schedule_add_e.jsp")%>" method="post">
			<postfield name="schedule_date" value="$schedule_date"/>
			<postfield name="schedule_month" value="$schedule_month"/>
			<postfield name="schedule_year" value="$schedule_year"/>
			<postfield name="schedule_hour_time" value="$schedule_hour_time"/>
			<postfield name="schedule_hour_to" value="$schedule_hour_to"/>
			<postfield name="schedule_minute_time" value="$schedule_minute_time"/>
			<postfield name="schedule_minute_to" value="$schedule_minute_to"/>
			<postfield name="schedule_title" value="$schedule_title"/>
			<postfield name="schedule_detail" value="$schedule_detail"/>
		</go>
	</do>
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			Date:<input name="schedule_date" format="*N" maxlength="2"/><br/>
			Month:<input name="schedule_month" format="*N" maxlength="2"/><br/>
			Year:<input name="schedule_year"  format="4N" value="<%=g.get(Calendar.YEAR)%>"/><br/>
			------From Time------ <br/>
			hour:<input name="schedule_hour_time"  format="*N" maxlength="2"/> 
			minute:
			<select name="schedule_minute_time" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select>	<br/>
			------To Time------<br/>
			hour:<input name="schedule_hour_to"  format="*N" maxlength="2"/> 
			minute:
			<select name="schedule_minute_to" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select><br/>
			title:<input name="schedule_title"  maxlength="12"/><br/>
			detail:<input name="schedule_detail"/><br/>
						
		</p>
	</card>
</wml>
<% } %>