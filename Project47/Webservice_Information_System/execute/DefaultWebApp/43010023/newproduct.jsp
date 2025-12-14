<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../WEB-INF/checkcustomer.jsp"%>
<%@ include file="../WEB-INF/adddefultuser.jsp"%>
<title>Send Order</title>
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
    <td width="621"><div align="center">
      <table width="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#345487" background="images/logo.gif">
        <tr>
          <td><div align="center"><FONT class=title><B>Online Order Registration </B></FONT></div></td>
        </tr>
      </table>
      </div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">
      <table width="580" border="1" cellpadding="0" cellspacing="0" bordercolor="#345487" bgcolor="#eef2f7">
        <tr>
          <td><div align="center"></div>
              <div align="center">
                <form name="form1" method="post" action="orderresult.jsp">
                  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td colspan="4">
                        <div align="left"></div></td>
                    </tr>
                    <tr>
                      <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="6%">&nbsp;</td>
                            <td width="94%"><div align="left"><strong><font color="#000099">Please Enter Sending Data </font></strong></div></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="27%"><p align="right">Sender's Firstname::</p></td>
                      <td width="1%">&nbsp;</td>
                      <td width="72%" colspan="2">
                        <div align="left">
                          <input name="sfirstname" type="text" id="firstname5" value="<%=firstname%>" size="40">
                      </div></td>
                    </tr>
                    <tr>
                      <td><div align="right">Sender's Lastname :: </div></td>
                      <td>&nbsp; </td>
                      <td colspan="2">
                        <div align="left">
                          <input name="slastname" type="text" id="firstname23" value="<%=lastname%>" size="40">
                      </div></td>
                    </tr>
                    <tr>
                      <td><div align="right">Phone Number :: </div></td>
                      <td>&nbsp;</td>
                      <td colspan="2">
                        <div align="left">
                          <input name="sphone" type="text" id="phone3" value="<%=phone%>" size="40">
                      *</div></td>
                    </tr>
                    <tr>
                      <td><div align="right">Package Type :::</div></td>
                      <td>&nbsp;</td>
                      <td colspan="2">
                        <div align="left">
                          <select name="package" id="package">
                            <option value="box - small">box - small</option>
                            <option value="box - medium">box - medium</option>
                            <option value="box - large">box - large</option>
                            <option value="Envelope">Envelope</option>
                            <option value="Tube">Tube</option>
                          </select> 
                          *
</div></td>
                    </tr>
                    <tr>
                      <td valign="top"><div align="right">Sendind Address :: </div></td>
                      <td>&nbsp;</td>
                      <td colspan="2" valign="top">
                        <div align="left">
                          <textarea name="saddress" cols="45" rows="8" id="saddress"></textarea>
                      *</div></td>
                    </tr>
                    <tr>
                      <td colspan="5"><div align="right"></div>
                          <div align="center"><strong></strong></div>
                          <div align="left"></div></td>
                    </tr>
                    <tr>
                      <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="6%">&nbsp;</td>
                            <td width="94%"><div align="left"><strong><font color="#000099">Please Enter Recieving Data </font></strong></div></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><div align="right">Reciever's Firstname :: </div></td>
                      <td>&nbsp;</td>
                      <td colspan="2">
                        <div align="left">
                          <input name="rfirstname" type="text" id="rfirstname" size="40">
                      </div></td>
                    </tr>
                    <tr>
                      <td><div align="right">Reciever's Lastname ::</div></td>
                      <td>&nbsp;</td>
                      <td colspan="2">
                        <div align="left">
                          <input name="rlastname" type="text" id="rlastname" size="40">
                      </div></td>
                    </tr>
                    <tr>
                      <td><div align="right">Phone Number :: </div></td>
                      <td>&nbsp;</td>
                      <td colspan="2">
                        <div align="left">
                          <input name="rphone" type="text" id="rphone" size="40">
                      *</div></td>
                    </tr>
                    <tr>
                      <td valign="top"><div align="right">Recieving Address :: </div></td>
                      <td>&nbsp; </td>
                      <td colspan="2" valign="top">
                        <div align="left">
                          <textarea name="raddress" cols="45" rows="8" id="raddress"></textarea>
                      *</div></td>
                    </tr>
                    <tr>
                      <td colspan="4"><div align="left"></div>
                          <div align="left"></div>
                          <div align="left"></div></td>
                    </tr>
                    <tr>
                      <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="6%">&nbsp;</td>
                          <td width="94%"><div align="center"><strong>* Indicates required fields </strong></div></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="4"><div align="center">
                          <input type="submit" name="Submit" value="Submit">
                          <input type="reset" name="Submit2" value="Reset Form">
                      </div></td>
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
