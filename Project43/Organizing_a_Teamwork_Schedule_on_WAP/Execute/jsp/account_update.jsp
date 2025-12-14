<jsp:useBean id="accountupdate" class="account.update" scope="session"/>
<jsp:setProperty name="accountupdate" property="account_password" param="account_password" />
<jsp:setProperty name="accountupdate" property="account_repassword" param="account_repassword" />
<jsp:setProperty name="accountupdate" property="account_nicname" param="account_nicname" />
<jsp:setProperty name="accountupdate" property="account_name" param="account_name" />
<jsp:setProperty name="accountupdate" property="account_surname" param="account_surname" />
<jsp:setProperty name="accountupdate" property="account_telephone" param="account_telephone" />
<jsp:setProperty name="accountupdate" property="account_smspass" param="account_smspass" />
<% String username=(String)session.getValue("userid");%>
<jsp:setProperty name="accountupdate" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="view" title="Information">
		<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<% if ( accountupdate.Valid() ) {%>
	<p>
		<% accountupdate.update(); %>
		Update complete.
	</p>
	<% } else {  %>
		<p>
		Password does not match.
		</p>
	<% } %>
		</card>
</wml>
<% accountupdate.cleanup();%>
<% } %>