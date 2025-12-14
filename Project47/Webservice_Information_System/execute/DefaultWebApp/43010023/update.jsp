<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Officer's Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@ include file="../WEB-INF/checkofficer.jsp"%>
<%@ include file="../WEB-INF/checkstatus.jsp"%>
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
      <table width="480" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><div align="center">
            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#345487" background="images/logo.gif">
              <tr>
                <td><div align="center"><FONT class=title><B>Online Update Sending Order </B></FONT></div></td>
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
              <td><form name="form1" method="post" action="updateresult.jsp?<%out.println("trackno="+trackno);%>">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2">&nbsp;</td>
                    </tr>
                  <tr>
                    <td colspan="2"><div align="center"><font color="#000099"><strong>Send Status</strong></font></div>                      <div align="center"></div></td>
                    </tr>
<%
while(result.next())
{
%>
                  <tr>
                    <td width="47%"><div align="right"><%=result.getString("status")%> ::  </div></td>
                    <td width="53%"><div align="left"><%=result.getString("time")%></div></td>
                  </tr>
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
}
%>
                  <tr>
                    <td colspan="2">&nbsp;</td>
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
                    <td colspan="2"><div align="center">Click <a href="updatedetail.jsp?<%out.println("trackno="+trackno);%>">here</a> to check detail </div></td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
<%
if(i!=4)
{
%>
                  <tr>
                    <td colspan="2"><div align="center">Update status :: 
                        <select name="update" id="update">
<%
if(i==1)
{
%>
                          <option value="Ready to Send">Ready to Send</option>
<%
}
%>
	<%
	if(i<=2 )
	{
	%>
                          <option value="Sending">Sending</option>
						  <option value="Lost Product">Lost Product</option>
						  <option value="Damaged Product">Damaged Product</option>
	<%
	}
	%>
		<%
		if(i<=3 )
		{
		%>  
                          <option value="Send Sucess">Send Success</option>
                          <option value="Send Fail">Send Fail</option>
                          <option value="Send Late">Send Late</option>
		<%
		}
		%>

                        </select>
                    </div></td>
                    </tr>
<%
}
%>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                    </tr>
                  <tr>
                    <td colspan="2"><div align="center">
					<%
					if(i!=4)
					{
					%>
                      <input type="submit" name="Submit" value="Submit">
					  <%
					  }
					  else
					  {
					  %>
                      <a href="selectupdate.jsp">                    &lt;&lt;&lt;Back</a></div>
					  <%
					  }
					  %>
					  </td>
                    </tr>
                </table>
                </form></td>
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
