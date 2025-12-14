<%@ page session="true" %>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
 
<% if (session.getValue("userid")==null) {%>
	<jsp:forward page="login.jsp"/>
<% } else { %>
<wml>
	<card id="searchuser">
	<do type="accept" label="Search User">
		<go href="addusere.jsp" method="post">
			<postfield name="searchname" value="$searchname"/>
			<postfield name="nicname" value="$nicname"/>
			<postfield name="sriname" value="$sriname"/>
			<postfield name="email" value="$email"/>
			<postfield name="company" value="$company"/>
			<postfield name="contry" value="$contry"/>
		</go>
	</do>
	<do type="prev" label="Back">
		<prev/>
	</do>
		<p>
			Name :<input name="searchname" maxlength="20"/><br/>
			Nicname :<input name="nicname" maxlength="20"/><br/>
			Sriname :<input name="sriname" maxlength="20"/><br/>
			Email :<input name="email" maxlength="20"/><br/>
			Company :<input name="company" maxlength="20"/><br/>
			Contry :<input name="contry" maxlength="20"/><br/>
			
		</p>
	</card>
</wml>
<% } %>