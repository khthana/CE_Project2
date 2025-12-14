<%@ page session="true" import="java.text.SimpleDateFormat,dtw.webmail.model.*" %>

<html>

<head>
        <title>jwma WebMail</title>
</head>

<body bgcolor="#ffffff" link="#666666" vlink="#666666" alink="#FFFFFF">
<%-- Ensure authenticated & valid session --%>
<%
    if(session.isNew() || session.getValue("jwma.htmlhelper")==null) {	
    	response.sendRedirect(response.encodeRedirectUrl("login.jsp"));
    }
%>
<%-- Prepare references for use in the page --%>
<%
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
	JwmaPreferences prefs=(JwmaPreferences) session.getValue("jwma.preferences");
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19" width="69%"><font size="+1" face="Arial, Helvetica, sans-serif"><b>Welcome 
      to your web mail access! </b></font></td>
    <td height="19" width="31%"><img src="images/wm_logo.jpg" width="190" height="36" align="right"></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top" colspan="2"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td width="81%" valign="top"> 
            <p><em><font face="Arial, Helvetica, sans-serif" size="+1">Because this 
              is your first login, we would like you to fill out your first and 
              your last name properly.<br>
              These will be visible on any outgoing mail, and you will not be 
              able to change them after you continued.<br>
              We also like to suggest that you take a look at your settings once 
              you are logged in, to adapt them to your individual needs.</font></em>
            <form method="post" action="<%= htmlhelper.getControllerUrl() %>">
              <input type="hidden" name="acton" value="preferences">
              <input type="hidden" name="todo" value="update">
              <table border="0" width="90%" cellspacing="1" cellpadding="1">
                <tr> 
                  <td colspan=2 bgcolor="#000000" align="left" height="23"><b><font face="Arial, Helvetica, sans-serif" color="#FFFFFF">Personal 
                    Data </font></b></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><b>Firstname 
                    </b></td>
                  <td width="80%" align="left" valign="top" > 
                    <input type="text" name="firstname" size="40" maxlength="100" value="<%= prefs.getFirstname() %>">
                  </td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><b>Lastname</b></td>
                  <td width="80%"  align="left" valign="top"> 
                    <input type="text" name="lastname" size="40" maxlength="100" value="<%= prefs.getLastname() %>">
                  </td>
                </tr>
              </table>
              <br>
              <table border="0" width="90%" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="15" align="left" valign="top" width="25%">&nbsp; </td>
                  <td height="15" align="right" valign="top" width="75%" nowrap> 
                    <input type="submit" name="submit" value="Save &amp; continue &gt;&gt;">
                  </td>
                </tr>
              </table>
            </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td width="69%">&nbsp;</td>
    <td width="31%"> <font size=-2 face=ARIAL,HELVETICA>&copy;2001 Pjung & Pommy All rights reserved. </font> </td>
  </tr>
</table>
</body>
</html>
