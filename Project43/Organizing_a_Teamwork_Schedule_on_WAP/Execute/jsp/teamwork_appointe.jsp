<jsp:useBean id="teamworkae" class="teamwork.appoint" scope="session"/>
<jsp:setProperty name="teamworkae" property="teamwork_atime" param="teamwork_atime" />
<jsp:setProperty name="teamworkae" property="teamwork_title" param="teamwork_title" />
<jsp:setProperty name="teamworkae" property="teamwork_detail" param="teamwork_detail" />
<jsp:setProperty name="teamworkae" property="teamwork_objective" param="teamwork_objective" />
<jsp:setProperty name="teamworkae" property="teamwork_date" param="teamwork_date" />
<jsp:setProperty name="teamworkae" property="teamwork_month" param="teamwork_month" />
<jsp:setProperty name="teamworkae" property="teamwork_year" param="teamwork_year" />
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="teamworkae" property="name" value="<%=username%>"/>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="main" title="Detail">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
		<p align="center">
			<jsp:getProperty name="teamworkae" property="teamwork_atime"/>:<jsp:getProperty name="teamworkae" property="teamwork_title"/> - <jsp:getProperty name="teamworkae" property="teamwork_detail"/>:<jsp:getProperty name="teamworkae" property="teamwork_objective"/> <br/>
		</p>
		<p>
			<% teamworkae.select(); %>
			<% teamworkae.next(); %>
			title : <jsp:getProperty name="teamworkae" property="title"/><br/>
			detail :
			<jsp:getProperty name="teamworkae" property="detail"/>

		</p>
	</card>
</wml>
<% teamworkae.cleanup();%>
<% } %>