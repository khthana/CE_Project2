<html>
<head>
<title>Index Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
    <td width="139" rowspan="3" valign="top"><%@ include file="side.jsp"%></td>
    <td width="621"><table width="540" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#345487" background="images/logo.gif">
      <tr>
        <td><div align="center"><FONT class=title><B>Online Account Registration</B></FONT></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="540" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#345487" bgcolor="#eef2f7">
      <tr>
        <td background="images/orange.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0"><tr><td width="98%" background="images/logo.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="98%"> <strong>Please answer the following questions:</strong> </td>
          </tr>
        </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><form name="form1" method="post" action="registresult.jsp">
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#eef2f7">
              <tr>
                <td width="2%">&nbsp;</td>
                <td width="24%">&nbsp;</td>
                <td width="2%">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td width="2%">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right">First Name :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="firstname" type="text" id="firstname" size="40">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right">Last Name :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="lastname" type="text" id="lastname" size="40">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <div align="right">Company Name :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="companyname" type="text" id="companyname" size="50">
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <div align="right">Mailing Address :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="mailaddress" type="text" id="mailaddress" size="50">
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <div align="right">City :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="city" type="text" id="city" size="50">
                  * </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <div align="right">State / Province :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="state" type="text" id="state" size="50">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right"> Country :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="country" type="text" id="country" size="50">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right"> Postal Code ::  </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="postcode" type="text" id="postcode" size="50">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <div align="right">Phone Number :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="phone" type="text" id="phone" size="40">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right"> Fax Number :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="fax" type="text" id="fax" size="40"></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <div align="right">E-mail Address ::  </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="email" type="text" id="email" size="50">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="4"><div align="center"><strong><font color="#000099">Please Enter Your Username and Password </font></strong></div></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right">Username :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="username" type="text" id="username" size="35">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right">Password :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="password" type="password" id="password" size="40">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div align="right">Re-Password :: </div></td>
                <td>&nbsp;</td>
                <td colspan="2"><input name="repassword" type="password" id="repassword" size="40">
                  *</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">* Indicates required fields </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td width="11%"><input type="submit" name="Submit3" value="Submit"></td>
                <td width="59%"><input type="reset" name="Submit22" value="Reset Form"></td>
                <td>&nbsp;</td>
              </tr>
            </table>
        </form></td>
      </tr>
    </table></td>
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
