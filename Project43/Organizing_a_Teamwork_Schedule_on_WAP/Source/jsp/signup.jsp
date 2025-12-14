<jsp:useBean id="signupd" class="user.signup"/>
<jsp:setProperty name="signupd" property="name" param="name"  />
<jsp:setProperty name="signupd" property="sign_password" param="sign_password" />
<jsp:setProperty name="signupd" property="sign_repassword" param="sign_repassword" />
<jsp:setProperty name="signupd" property="sign_nicname" param="sign_nicname" />
<jsp:setProperty name="signupd" property="sign_name" param="sign_name" />
<jsp:setProperty name="signupd" property="sign_surname" param="sign_surname" />
<jsp:setProperty name="signupd" property="sign_telephone" param="sign_telephone" />
<jsp:setProperty name="signupd" property="sign_smspass" param="sign_smspass" />
<%@ page language="java" contentType="text/vnd.wap.wml" %>

<?xml version="1.0"?> 

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 

<wml>
	<card id="add">
	<do type="accept" label="Login">
		<go href="login.jsp" method="post"/>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<% if (signupd.Valid()) { %>
		<% signupd.insert(); %>
		<p>
			Successfull.
		</p>
		<% } else { %>
		<p>
			<%= signupd.Geterror() %>
		</p>
		<% } %>
	</card>
</wml>
<% signupd.cleanup(); %>