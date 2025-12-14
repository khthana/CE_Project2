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
	<card id="main" title="Appoint Goup">
	<do type="accept" label="Add">
		<go href="<%=response.encodeURL("teamwork_add_e.jsp")%>" method="post">
			<postfield name="teamwork_gname" value="<%= request.getParameter("gname") %>"/>
			<postfield name="teamwork_date" value="$teamwork_date"/>
			<postfield name="teamwork_month" value="$teamwork_month"/>
			<postfield name="teamwork_year" value="$teamwork_year"/>
			<postfield name="teamwork_atime" value="$teamwork_atime"/>
			<postfield name="teamwork_title" value="$teamwork_title"/>
			<postfield name="teamwork_detail" value="$teamwork_detail"/>
			<postfield name="teamwork_objective" value="$teamwork_objective"/>

		</go>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			Date:<input name="teamwork_date" format="*N" maxlength="2"/><br/>
			Month:<input name="teamwork_month" format="*N" maxlength="2"/><br/>
			Year:<input name="teamwork_year" maxlength="4" value="<%=g.get(Calendar.YEAR)%>"/><br/>
			About hour:<input name="teamwork_atime"  format="*N" maxlength="2"/><br/>
			Title:<input name="teamwork_title"  maxlength="15"/><br/>
			Detail:<input name="teamwork_detail"/><br/>
			Objective:
			<select name="objective" value="Work_time">
				<option value="Work_time">Work time[8.00-12.00,13.00-17.00]</option>
				<option value="midday">Midday[12.00-13.00]</option>
				<option value="evening">Evening[17.00-20.00]</option>
				<option value="night">Night[20.00-24.00]</option>
				<option value="all">all[8.00-24.00]</option>
			</select>		
		</p>
	</card>
</wml>
<% } %>