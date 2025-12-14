<%@ page import="java.util.*"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% session.putValue("appointment_gname",request.getParameter("gname")); %>
<% GregorianCalendar g = new GregorianCalendar(); %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="New Appointment">
	<do type="accept" label="New">
		<go href="<%=response.encodeURL("appointment_newe.jsp")%>" method="post">
			<postfield name="gname" value="<%= request.getParameter("gname") %>"/>
			<postfield name="appointment_date" value="$appointment_date"/>
			<postfield name="appointment_month" value="$appointment_month"/>
			<postfield name="appointment_year" value="$appointment_year"/>
			<postfield name="appointment_hour_time" value="$appointment_hour_time"/>
			<postfield name="appointment_hour_to" value="$appointment_hour_to"/>
			<postfield name="appointment_minute_time" value="$appointment_minute_time"/>
			<postfield name="appointment_minute_to" value="$appointment_minute_to"/>
			<postfield name="appointment_ahour" value="$appointment_ahour"/>
			<postfield name="appointment_aminute" value="$appointment_aminute"/>
			<postfield name="appointment_title" value="$appointment_title"/>
			<postfield name="appointment_detail" value="$appointment_detail"/>
		</go>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			Date:<input name="appointment_date" format="*N" maxlength="2"/><br/>
			Month:<input name="appointment_month" format="*N" maxlength="2"/><br/>
			Year:<input name="appointment_year" maxlength="4" value="<%=g.get(Calendar.YEAR)%>"/><br/>
			Search<br/>
			-----From Time----- <br/>
			hour:<input name="appointment_hour_time"  format="*N" maxlength="2"/> 
			minute:
			<select name="appointment_minute_time" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select>	<br/>
			-----To Time-----<br/>
			hour:<input name="appointment_hour_to"  format="*N" maxlength="2"/> 
			minute:
			<select name="appointment_minute_to" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select><br/>
			-----Amount -----<br/>
			hour:<input name="appointment_ahour"  format="*N" maxlength="2"/><br/>
			minute:
			<select name="appointment_aminute" value="0">
				<option value="0">0</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="45">45</option>
			</select><br/>
			Title:<input name="appointment_title"  maxlength="15"/><br/>
			Detail:<input name="appointment_detail"/><br/>
		</p>
	</card>
</wml>
<% } %>