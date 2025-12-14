<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="5;URL=index.jsp">
<title>Register_result</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<%@ include file="../WEB-INF/adduser.jsp"%>
<body>
<table width="760" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="header.jsp"%></td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="760" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="139" valign="top"><%@ include file="side.jsp"%></td>
    <td width="621" valign="top"><div align="center">
        <table width="550" border="1" cellpadding="0" cellspacing="0" bordercolor="#345487">
          <tr>
            <td background="images/logo.gif"> 
            <div align="center">Account Registration Result </div></td>
          </tr>
          <tr>
            <td><div align="center">
              <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>&nbsp;				  </td>
                  </tr>
                <tr>
                  <td><%if(success==1){%>
                    <p align="center"> <strong>Thanks for your Request! </strong></p>
                    <p align="center"> We will process your application and contact you within the next two working days.</p>
                    <%}else{%>
                    <p align="center" class="style1"> Request new account failed!</p>
                    <p align="center">Please check your spelling and/or Answer required questions. </p>
                    <%}%>
                    <p align="center"><strong>*This page will return to Account Registeration in 5 Sec. </strong></p></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  </tr>
              </table>
              </div></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
</html>
