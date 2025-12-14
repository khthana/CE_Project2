<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Product's Detail</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@ include file="../WEB-INF/showdetail.jsp"%>
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
    <td width="621"><div align="center">
      <table width="500" border="1" cellpadding="0" cellspacing="0" bordercolor="#345487" bgcolor="#eef2f7">
        <tr>
          <td background="images/logo.gif"><div align="center"><strong>Product's Detail </strong></div></td>
        </tr>
        <tr>
          <td><div align="center">
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="36%"><div align="right"></div></td>
                <td width="2%">&nbsp;</td>
                <td width="62%"><div align="left"></div></td>
              </tr>
              <tr>
                <td><div align="right"></div>                  
                  <div align="right"><strong>Sending's Detail</strong></div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <td><div align="right">Sender's Firstname ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=sfirstname%></div></td>
              </tr>
              <tr>
                <td><div align="right">Sender's Lastname ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=slastname%></div></td>
              </tr>
              <tr>
                <td><div align="right">Phone Number ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=sphone%></div></td>
              </tr>
              <tr>
                <td><div align="right">Package Type ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=spackage%></div></td>
              </tr>
              <tr>
                <td><div align="right">Sendind Address ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=saddress%></div></td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td>&nbsp;</td>
                <td><div align="left"></div></td>
              </tr>
              <tr>
                <td><div align="right"></div>                  
                  <div align="right"></div>                  <div align="center"></div>                  
                  <div align="right"><strong>Recieving's Detail </strong></div></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr>
                <td><div align="right">Reciever's Firstname ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=rfirstname%></div></td>
              </tr>
              <tr>
                <td><div align="right">Reciever's Lastname ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=rlastname%></div></td>
              </tr>
              <tr>
                <td><div align="right">Phone Number ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=rphone%></div></td>
              </tr>
              <tr>
                <td><div align="right">Recieving Address ::</div></td>
                <td>&nbsp;</td>
                <td><div align="left"><%=raddress%></div></td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td>&nbsp;</td>
                <td><div align="left"></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td><div align="left"><a href="update.jsp?<%out.println("trackno="+trackno);%>">&lt;&lt;&lt;Back</a></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
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
