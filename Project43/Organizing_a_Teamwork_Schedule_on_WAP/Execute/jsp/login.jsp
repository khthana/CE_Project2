<%@ page language="java" contentType="text/vnd.wap.wml" %>

<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<wml>
	<card id="login">
	<do type="accept" label="Login">
		<go href="logine.jsp" method="post">
			<postfield name="name" value="$name"/>
			<postfield name="password" value="$password"/>
		</go>
	</do>

		<p align="center">
			<b>Login Page !</b>
		</p>
		<p>
			Name :<input name="name" maxlength="15"/><br/>
			Password :<input name="password" maxlength="15" tabindex="2" type="password"/><br/>
		</p>
		<p>
			<a href="sign.jsp">Sign Up !</a>
		</p>
	</card>
</wml>

