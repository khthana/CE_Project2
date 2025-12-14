<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Checklist</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
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
      <table width="500" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center">
            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#345487" background="images/logo.gif">
              <tr>
                <td><div align="center"><FONT class=title><B>Online Checklist Sending Order </B></FONT></div></td>
              </tr>
            </table>
          </div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#345487" bgcolor="#eef2f7">
            <tr>
              <td><div align="center"></div>                
                <div align="center">
                  <form name="form1" method="post" action="checklist.jsp">
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="34%"><div align="right"></div></td>
                        <td width="2%">&nbsp;</td>
                        <td width="64%"><div align="left"> </div></td>
                      </tr>
                      <tr>
                        <td><div align="right"> Tracking_No:: </div></td>
                        <td>&nbsp;</td>
                        <td><div align="left">
                            <input name="track" type="text" id="track2" size="30">
                        </div></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><div align="left"> </div></td>
                        <td>&nbsp;</td>
                        <td><div align="left">
                            <input type="submit" name="Submit" value="Submit">
                            <input type="reset" name="Submit2" value="Cancel">
                        </div></td>
                      </tr>
                    </table>
                                    </form>
                </div></td>
              </tr>
          </table></td>
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
