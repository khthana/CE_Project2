<%@ page session="true" import="java.text.SimpleDateFormat,dtw.webmail.model.*" %>

<html>
<head>
        <title>Java WebMail Project</title>
         <link rel=stylesheet href="style.css" type="text/css">
</head>

<BODY aLink=#ff9933 bgColor=#FFFFFF bottomMargin=0 leftMargin=0 link=#336699 
rightMargin=0 topMargin=0 vLink=#6699cc MARGINWIDTH="0" MARGINHEIGHT="0">
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
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
		JwmaInboxInfo inbox=(JwmaInboxInfo) session.getValue("jwma.inboxinfo");
        String mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");
%>
</font> 
<table width="88%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19"><object
classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="130" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="130" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top" width="30%"> 
      <table width="93%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="19%" align="left" valign="top" nowrap> 
  <TABLE border=0 cellPadding=0 cellSpacing=0>
        <TBODY> 
        <TR> 
          <TD><FONT color=#cc6600 
                  face="Verdana, Arial, Helvetica, sans-serif" size=-1> 
            <!-- LOCAL NAV TITLE -->
            <B>Web Mail Project</B></FONT></TD>
        </TR>
        <TR> 
          <TD bgColor=#cccc99 width=130><IMG alt="Spacer Image" border=0 
                  height=1 
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></TD>
        </TR>
        <TR> 
          
          <TD 
                  width=130> 
            <p><BR>
              <!-- LIST OF LOCAL NAV LINKS GOES HERE -->
	      <%
		if (mailclientprotocol.equals("imap"))
		{
	      %>
              <FONT 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><A 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=session&todo=redirect&view=main">Mail 
              Home</A></FONT>
              <%
		}
	      %>
              <FONT 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><BR>
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
                  vspace=7 width=130></FONT><FONT 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><br>
              <b>Utility</b><br>
	      <%
		if (mailclientprotocol.equals("imap"))
		{
	      %>
              <a 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=folder&todo=updatedata"">Folders</a><br>
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
                  vspace=7 width=130></FONT></p>
          </TD>
        </TR>
        <TR> 
          <TD bgColor=#cccc99 width=130></TD>
        </TR>
        <TR> 
          <TD width=130></TD>
        </TR>
        </TBODY> 
      </TABLE>
         
          </td>
          <td width="81%" valign="top"> 
			<table border="0" cellspacing="0" cellpadding="0" align="left">
              <tr> 
                <td height="8" width="13"></td>
                <td width="501"><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="3">Preferenecs </font></b></font></td>
              </tr>
              <tr> 
                <!--insert line it slide -->
                <td align=right 
    background="images/line_lt_side.gif" rowspan=4 
    valign=top width=13 height="1"><img alt="Art Corner Image" border=0 height=13 
      src="images/corner_top_lt.gif" 
      width=13><br>
                  <img alt="Art Line Image" border=0 height=380
      src="images/line_lt_side.gif" width=13></td>
                <!--end insert -->
                <td width="501" height="602" valign="top"> 
                  <table width="86%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align=left valign=top width=635 height="13"><img alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=500></td>
          <td width="1"></td>
        </tr>
        <tr> 
          <td bgcolor=#cccc99 height="467"><form method="post" action="<%= htmlhelper.getControllerUrl() %>">
              <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="hidden" name="acton" value="preferences">
              <input type="hidden" name="todo" value="update">
              </font> 
              <table border="0" width="90%" cellspacing="1" cellpadding="1">
                <tr> 
                  <td colspan=2 bgcolor="#000000" align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Personal 
                    Data </font></b></font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" > 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fulltname</b> 
                    </font></td>
                  <td width="80%" align="left" valign="top" > 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="text" name="fullname" value="<%= prefs.getFullname() %>" size="50">
                    </font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Signature</b></font></td>
                  <td width="80%"  align="left" valign="top"> 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <textarea name="signature" cols="40" rows="5"><%= prefs.getSignature() %></textarea>
                    </font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Alternative<br>
                    Signature</b></font></td>
                  <td width="80%"  align="left" valign="top"> 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <textarea name="altsignature" rows="5" cols="40"><%= prefs.getAltSignature() %></textarea>
                    </font></td>
                </tr>
              </table>
              <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
              </font> 
              <table border="0" width="90%" cellspacing="1" cellpadding="1">
                <tr> 
                  <td colspan=2 bgcolor="#000000" align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">System 
                    Settings</font></b></font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Url-sensitive</b></font></td>
                  <td width="80%" align="left" valign="top" > 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="checkbox" name="urlsensitive"  value="true" <%= ((prefs.isUrlSensitive())? "checked":"") %>>
                    Enable<br>
                    *if this feature is activated, the URL's in plaintext messages 
                    will be clickable. </font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>auto-sign</b></font></td>
                  <td width="80%" align="left" valign="top" > 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="checkbox" name="autosigning"  value="true" <%= ((prefs.isAutoQuote())? "checked":"") %>>
                    Enable<br>
                    *if this feature is activated your signature will be automatically 
                    attached to mail you send. </font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>auto-quote<br>
                    on reply</b> </font></td>
                  <td width="80%" align="left" valign="top" > 
                    <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="checkbox" name="autoquote"  value="true" <%= ((prefs.isAutoQuote())? "checked":"") %>>
                      Enable<br>
                      *if this feature is activated the mail you reply to will 
                      automatically be quoted.</font></p>
                  </td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>quoting 
                    character</b></font></td>
                  <td width="80%" > 
                    <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="text" name="quotechar" size="10" maxlength="1" value="<%= prefs.getQuoteChar() %>">
                      <br>
                      * this character denotes a quotation in a reply. It is at 
                      the beginning of each quoted line..</font></p>
                  </td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" > 
                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>auto-archive<br>
                      sent messages</b></font></p>
                  </td>
                  <td width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="checkbox" name="autoarchivesent" value="true" <%= ((prefs.isAutoArchiveSent())? "checked":"") %>>
                    Enable<br>
                    *if this feature is enabled any message you send via the webmail 
                    system will be archived in the archive mailbox. (IMAP only)</font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
                    sent messages<br>
                    mailbox</b></font></td>
                  <td width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="text" name="sentmailarchive" size="40" maxlength="100" value="<%= prefs.getSentMailArchive() %>">
                    <br>
                    * this mailbox will be used as archive for the auto-archive 
                    feature. (IMAP only)</font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>auto-move<br>
                    read messages</b></font></td>
                  <td width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="checkbox" name="automoveread"  value="true" <%= ((prefs.isAutoMoveRead())? "checked":"") %>>
                    Enable<br>
                    * if this feature is activated the mail you read will be automatically 
                    moved to the read-messages mailbox. (IMAP only)</font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>read-messages<br>
                    mailbox </b></font></td>
                  <td width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="text" name="readmailarchive" size="40" maxlength="100" value="<%= prefs.getReadMailArchive() %>">
                    <br>
                    * this mailbox will be used as archive for the auto-move feature. 
                    (IMAP only)</font></td>
                </tr>
                <tr> 
                  <td width="20%" align="left" valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>auto-empty<br>
                    trash</b></font></td>
                  <td width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="checkbox" name="autoempty" value="true" <%= ((prefs.isAutoEmpty())? "checked":"") %>>
                    Enable<br>
                    *if this feature is activated the trashbin will be automatically 
                    emptied on logout. (IMAP only)</font></td>
                </tr>
              </table>
              <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
              </font> 
              <table border="0" width="90%" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="15" align="left" valign="top" width="25%">&nbsp; </td>
                  <td height="15" align="right" valign="top" width="75%" nowrap> 
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input type="reset" name="reset" value="Reset">
                    <input type="submit" name="submit" value="Update">
                    </font></td>
                </tr>
              </table>
            </form>
          </td>
          <td></td>
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
  <tr> 
    <td> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">&copy;2001 
      Pjung & Pommy All rights reserved. </font> </td>
  </tr>
</table>
</body>
</html>
