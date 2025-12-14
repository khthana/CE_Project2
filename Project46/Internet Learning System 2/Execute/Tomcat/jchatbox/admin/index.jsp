<%@ page contentType="text/html; charset=windows-874" %>
<html>
<%@ page import="jChatBox.Util.*" %>
<jsp:useBean id="SystemLogin" class="jChatBox.Service.SystemLogin" scope="request" />
<%
	XMLPropertyResourceBundle defaultBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(XMLConfig.DEFAULTLANGUAGE);
	//response.setContentType("text/html; charset="+defaultBundle.getString("global.encoding"));
	String jspDisplay = SystemLogin.doLogin(request,session);
	if (jspDisplay != null)
	{
		%><jsp:forward page='<%= jspDisplay %>' /><%
		//response.sendRedirect(jspDisplay);
	}
%>
<head>
<LINK REL=STYLESHEET TYPE="text/css" HREF="styles/admin.css">
<title>Internet Learning System Chatroom Login for Administrator</title>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">

<form method="post" action="index.jsp" name="chat">
  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#FF0000">
  <%
  	String error = SystemLogin.getSysMessage();
  	if (error != null)
  	{
		if (error.equals(Conf.ACCESSDENIED)) out.print("Access Denied : "+request.getRemoteAddr());
  	}
  %>
  </font></b></font><br>
    <br>
  </div>
  <table width="40%" border="0" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#999999">
            <td bgcolor="#003399">
              <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr bgcolor="#FFFFFF">
                  <td nowrap>
                    <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr>
                        <td nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>
                          </b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">Login
                          :</font></b></font> </td>
                        <td nowrap>
                          <input type="text" name="name" size="16" class="SystemBox">
                        </td>
                      </tr>
                      <tr>
                        <td nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">Password
                          :</font></b></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="-2">
                          </font></td>
                        <td nowrap>
                          <input type="password" name="password" size="16" class="SystemBox">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <br>
<center>
    <table border="0" cellspacing="2" cellpadding="1">
      <tr>
        <td align="center">
          <input type="submit" name="SystemLogin" value="Submit" class="SystemButton">
        </td>
        <td align="center">
          <input type="reset" value="Reset" class="SystemButton" name="reset">
        </td>
      </tr>
    </table>
    &nbsp;
  </center>
</form>
</body>
</html>
