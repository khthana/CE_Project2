<jsp:useBean id="account_inf" class="account.information" scope="session"/>
<%String username=(String)session.getValue("userid");%>
<jsp:setProperty name="account_inf" property="name" value="<%=username%>"/>

<%@ page language="java" contentType="text/vnd.wap.wml" %>
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 


<wml>
	<card id="main" title="Information">
	<do type="accept" label="Update">
		<go href="account_update.jsp" method="post">
			<postfield name="account_password" value="$account_password"/>
			<postfield name="account_repassword" value="$account_repassword"/>
			<postfield name="account_nicname" value="$account_nicname"/>
			<postfield name="account_name" value="$account_name"/>
			<postfield name="account_surname" value="$account_surname"/>
			<postfield name="account_telephone" value="$account_telephone"/>
			<postfield name="account_smspass" value="$account_smspass"/>
		</go>
	</do>
	<do type="Accept" label="Main Page">
		<go href="<%=response.encodeURL("main.jsp") %>"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>	
	<p>
	<% account_inf.select(); %>
	Userame: <%= session.getValue("userid") %><br/>
	Password:<input name="account_password" maxlength="15" type ="password" value="<jsp:getProperty name="account_inf" property="account_password"/>"/><br/>
	retype Password:<input name="account_repassword" maxlength="15" type ="password" value="<jsp:getProperty name="account_inf" property="account_repassword"/>"/><br/>
	Nicname:<input name="account_nicname" maxlength="15"  value="<jsp:getProperty name="account_inf" property="account_nicname"/>"/><br/>
	Name:<input name="account_name" maxlength="20"  value="<jsp:getProperty name="account_inf" property="account_name"/>" /><br/>
	Surname:<input name="account_surname" maxlength="20"  value="<jsp:getProperty name="account_inf" property="account_surname"/>"/><br/>
	telephone:<input name="account_telephone" maxlength="10" value="<jsp:getProperty name="account_inf" property="account_telephone"/>"/><br/>
	Pasword SMS:<input name="account_smspass" maxlength="10" value="<jsp:getProperty name="account_inf" property="account_smspass"/>" /><br/>

	</p>
		</card>
</wml>
<%account_inf.cleanup(); %>
<% } %>