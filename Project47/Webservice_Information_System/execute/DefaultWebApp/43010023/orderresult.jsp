<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Order result</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<%@ include file="../WEB-INF/checkcustomer.jsp"%>
<%@ include file="../WEB-INF/addorder.jsp"%>
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
      <table width="550" border="1" cellpadding="0" cellspacing="0" bordercolor="#345487" bgcolor="#eef2f7">
        <tr>
          <td background="images/logo.gif">
            <div align="center"><strong>Order Result </strong></div></td>
        </tr>
        <tr>
          <td><div align="center">
              <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>&nbsp; </td>
                </tr>
                <tr>
                  <td><%if(success==1){%>
                      <p align="center"> <strong>Order Success ! </strong></p>
                      <p align="center">Your tracking number is <strong><%=irandom%></strong> </p>
                      <p align="center">Click <a href="newproduct.jsp">here</a> to  order more sending request  </p>
                      <%}else{%>
                      <p align="center" class="style1"> Order Fail!</p>
                      <p align="center">Please enter all required fields.</p>
                      <p align="center">Click <a href="newproduct.jsp">here</a> to return to order  sending request </p>
                      <%}%></td>
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
