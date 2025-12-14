<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ChangePassword</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@ include file="../WEB-INF/checkcustomer.jsp"%>
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
      <table width="500" border="1" cellpadding="0" cellspacing="0" bordercolor="#345487" bgcolor="#eef2f7">
        <tr>
          <td background="images/logo.gif"><div align="center"><strong>Change Password </strong></div></td>
        </tr>
        <tr>
          <td><div align="center">
            <form name="form1" method="post" action="changepassresult.jsp">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="33%">&nbsp;</td>
                  <td width="2%">&nbsp;</td>
                  <td width="65%">&nbsp;</td>
                </tr>
                <tr>
                  <td><div align="right">Password :: </div></td>
                  <td>&nbsp;</td>
                  <td><div align="left">
                          <input name="password" type="password" id="password" size="30">
                      *</div></td>
                </tr>
                <tr>
                  <td><div align="right">Repassword :: </div></td>
                  <td>&nbsp;</td>
                  <td><div align="left">
                          <input name="repassword" type="password" id="repassword" size="30">
                      *</div></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><input type="submit" name="Submit" value="Submit">
                    <input type="submit" name="Submit2" value="Submit"></td>
                </tr>
              </table>
            </form>
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
