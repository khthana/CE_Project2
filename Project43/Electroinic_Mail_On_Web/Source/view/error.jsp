<%@ page session="true" import="dtw.webmail.model.*" %>

<html>

<head>
        <title>Java WebMail Project</title>
         <link rel=stylesheet href="style.css" type="text/css">
</head>

<BODY aLink=#ff9933 bgColor=#FFFFFF bottomMargin=0 leftMargin=0 link=#336699 
rightMargin=0 topMargin=0 vLink=#6699cc MARGINWIDTH="0" MARGINHEIGHT="0">
<font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
<%-- Ensure authenticated & valid session --%>
<%
    if(session.isNew() || session.getValue("jwma.htmlhelper")==null) {	
    	response.sendRedirect(response.encodeRedirectUrl("login.jsp"));
    }
%>
<%-- Prepare references for use in the page --%>
<% 
        JwmaInboxInfo inbox = (JwmaInboxInfo)session.getAttribute("jwma.inboxinfo");
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
	JwmaError error=(JwmaError) session.getValue("jwma.error");
	String mailclientprotocol = (String)session.getAttribute("jwma.mailclientprotocol"); 
%>
</font> 
<table width="80%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="130" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="130" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top" width="30%"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="19%" align="left" valign="top" nowrap> 
            <TABLE border=0 cellPadding=0 cellSpacing=0>
              <TBODY> 
              <TR> 
                <TD><font color="#cc6600" face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                  <!-- LOCAL NAV TITLE -->
                  <B>Web Mail Project</B></font></TD>
              </TR>
              <TR> 
                <TD bgColor=#cccc99 width=130><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><IMG alt="Spacer Image" border=0 
                  height=1 
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></font></TD>
              </TR>
              <TR> 
                <TD 
                  width=130> 
                  <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><BR>
                    <!-- LIST OF LOCAL NAV LINKS GOES HERE -->
		 <%
		    if (mailclientprotocol.equals("imap"))
		    {
		 %>
                    <FONT 
                  color=#999933><A 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=session&todo=redirect&view=main">Mail 
                    Home</A></FONT></font>
		 <%
		   }
		 %>
		 <font color="#999933" face="Verdana, Arial, Helvetica, sans-serif" size="2"><BR>
                    <IMG alt="Art Dotted Line Image" border=0 
                  height=3 
                  src="images/art_dotted_line.gif" 
                  vspace=7 width=130><BR>
                    <B>Message Action</B><BR>
                    <A 
                  href="<%= htmlhelper.getMailboxDisplayAction(inbox.getName()) %>">Check 
                    Mail</A><BR>
                    <A 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=message&todo=compose">Compose</A><BR>
                    <IMG 
                  alt="Art Dotted Line Image" border=0 height=3 
                  src="images/art_dotted_line.gif" 
                  vspace=7 width=130><br>
                    <b>Utility</b><br>
                    <a 
                  href="<%= htmlhelper.getMailboxDisplayAction(inbox.getName()) %>">Mailbox</a><br>
		  <%
		     if (mailclientprotocol.equals("imap"))
		     {
		  %>
                    <a 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=folder&todo=updatedata">Folders</a><br>
		  <%
		    }
		  %>
                    <a 
                  href="addressbook.jsp">Addressbook</a><br>
                    <IMG 
                  alt="Art Dotted Line Image" border=0 height=3 
                  src="images/art_dotted_line.gif" 
                  vspace=7 width=130><BR>
                    <B>Accessories</B><BR>
                    <A 
                  href="preferences.jsp">Options</A><BR>
                    <A 
                  href="https://161.246.11.205/webmail/help/index.html">Help 
                    Desk</A><BR>
                    <A 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=session&amp;todo=logout">Sign Out</A><BR>
                    <IMG alt="Art Dotted Line Image" 
                  border=0 height=3 
                  src="images/art_dotted_line.gif" 
                  vspace=7 width=130></font></p>
                </TD>
              </TR>
              <TR> 
                <TD bgColor=#cccc99 width=130><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><IMG alt="Spacer Image" border=0 
                  height=1 
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></font></TD>
              </TR>
              <TR> 
                <TD width=130></TD>
              </TR>
              </TBODY> 
            </TABLE>
          </td>
          <td width="81%" valign="top"> 
            <br>
              <font size="4" face="Verdana, Arial, Helvetica, sans-serif">Java Webmail Error Message:</font>
            <br>
            <br>
            <p> <font size="2" color="#ff0033"face="Verdana, Arial, Helvetica, sans-serif"><%= error.getMessage() %> </font></p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&copy; 2001 
      Pjung & Pommy All rights reserved.</font></td>
  </tr>
</table>
</body>
</html>
