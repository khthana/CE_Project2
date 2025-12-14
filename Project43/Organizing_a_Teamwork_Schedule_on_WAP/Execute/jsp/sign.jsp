<%@ page language="java" contentType="text/vnd.wap.wml" %>

<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<wml>
	<card id="signup">
	<do type="accept" label="Submit">
		<go href="signup.jsp" method="post">
			<postfield name="name" value="$name"/>
			<postfield name="sign_password" value="$sign_password"/>
			<postfield name="sign_repassword" value="$sign_repassword"/>
			<postfield name="sign_nicname" value="$sign_nicname"/>
			<postfield name="sign_name" value="$sign_name"/>
			<postfield name="sign_surname" value="$sign_surname"/>
			<postfield name="sign_telephone" value="$sign_telephone"/>
			<postfield name="sign_smspass" value="$sign_smspass"/>
		</go>
	</do>
		<do type="prev" label="Back">
		<prev/>
	</do>	
		<p align="center">
			<b>Sign Page !</b>
		</p>
		<p>
			User Name :<input name="name" maxlength="20"/><br/>
			Password :<input name="sign_password" maxlength="10" tabindex="2" type="password"/><br/>
			retype Password:<input name="sign_repassword" maxlength="15" type ="password"/><br/>
			Nicname:<input name="sign_nicname" maxlength="15"  /><br/>
			Name:<input name="sign_name" maxlength="15"  /><br/>
			Surname:<input name="sign_surname" maxlength="15"  /><br/>
			telephone:<input name="sign_telephone" format="*N" maxlength="15" /><br/>
			Pasword SMS:<input name="sign_smspass" format="*N" maxlength="15" /><br/>
		</p>
	</card>
</wml>

