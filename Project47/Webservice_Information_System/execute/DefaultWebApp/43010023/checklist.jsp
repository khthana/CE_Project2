<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Checklist</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@ include file="../WEB-INF/showlist.jsp"%>
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
          <td background="images/logo.gif"><div align="center"><strong>Order Checklist </strong></div></td>
        </tr>
        <tr>
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="2">&nbsp;</td>
              </tr>
<%
while(result.next())
{
%>
            <tr>
              <td width="47%"><div align="right"><%=result.getString("status")%> ::  </div></td>
              <td width="53%"><div align="left"><%=result.getString("time")%></div></td>
            </tr>
            <tr>
<%
	}
}
catch(ClassNotFoundException e)
{
	out.println("ClassNotFound");
}
catch(SQLException e)
{
	e.printStackTrace();
	response.sendRedirect("../43010023/incorrectno.jsp");
}%>
              <td colspan="2"><div align="center"></div></td>
              </tr>
            <tr>
              <td colspan="2"><div align="center"></div></td>
              </tr>
            <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
			<%
			String newstatus=new String();
			if(i==1 || i==2) newstatus="Prepare to Send";
			if(i==3) newstatus="Sending";
			if(i==4) newstatus="Send Finish";
			%>
            <tr>
                    <td colspan="2"><div align="center">Your recent status is <strong><font color="#000099"><%=newstatus%> </font></strong></div></td>
                    </tr>
            <tr>
              <td colspan="2"><div align="center">Click <a href="productdetail.jsp?<%out.println("trackno="+trackno);%>">here</a> to check detail </div></td>
              </tr>
            <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2"><div align="center"><a href="selectchecklist.jsp">&lt;&lt;&lt;Back</a></div></td>
            </tr>
            <tr>
              <td colspan="2">&nbsp;</td>
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
