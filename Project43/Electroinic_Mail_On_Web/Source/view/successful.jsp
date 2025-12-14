<%@ page session="true" import="java.text.SimpleDateFormat,java.util.Date,dtw.webmail.model.*" %>

<html>
<head>
	<title>Java WebMail Project</title>
 	<meta http-equiv="Content-Type" content="text/html; charset=windows-874"> 
	<meta http-equiv="Pragma" content="no-cache">
	<script type="text/javascript">
	<!--
		function submitDelete(aform,no) {
			//enhance: check for selected folders or mailboxes	
			aform.todo.value="delete";
			aform.numbers.value="active";
			aform.submit();
		}
		function submitMove(aform){
			aform.todo.value="move";
			aform.numbers.value="active";
    		aform.submit();
		}
		function submitReply(aform){
			aform.todo.value="compose";
			aform.reply.value="true";
			aform.submit();
		}
		function submitForward(aform){
			if(aform.to.value!=null && aform.to.value!="") {
				aform.todo.value="compose";
				aform.forward.value="true";
				aform.submit();
			}
		}
		function openWindow(url){
			window.open(url,'result','height=150,width=300');
		}
	// -->
	</script>

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
<%      
        String mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");  
        if (mailclientprotocol.equals("imap"))
        {
        %>
        <%!
          JwmaTrashInfo trash;
          JwmaStoreInfo storeinfo;
        %>
        <%
          trash=(JwmaTrashInfo) session.getValue("jwma.trashinfo");
          storeinfo=(JwmaStoreInfo) session.getValue("jwma.storeinfo");
        %>
        <%
        }
        
%>

<%-- Prepare references for use in the page --%>
<%
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");

	JwmaPreferences prefs=(JwmaPreferences) session.getValue("jwma.preferences");
	JwmaMessage message=(JwmaMessage) session.getValue("jwma.message");
	JwmaMailbox mailbox=(JwmaMailbox) session.getValue("jwma.mailbox");
        
	String inserthandler="onChange=\"this.form.to.value=this.value;\"";
        JwmaInboxInfo inbox = (JwmaInboxInfo)session.getAttribute("jwma.inboxinfo");        
%>
</font> 
<table width="82%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
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
    <td height="362" align="left" valign="top" width="30%"> 
      <table width="93%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="130" align="left" valign="top" nowrap height="355"> 
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
                  href="http://rd.yahoo.com/mail_us/nav/?http://help.yahoo.com/help/us/mail/">Help 
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
                <TD bgColor=#cccc99 width=130><IMG alt="Spacer Image" border=0 
                  height=1 
                  width=1></TD>
              </TR>
              <TR> 
                <TD width=130></TD>
              </TR>
              </TBODY> 
            </TABLE>
          </td>
          <td width="510" height="355"> 
            <table border="0" cellspacing="0" cellpadding="0" align="left" height="284">
              <tr> 
                <td height="8" width="13"></td>
                <td width="486"><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="3">Message </font></b></font></td>
              </tr>
              <tr> 
                <!--insert line it slide -->
                <td align=right 
    background="images/line_lt_side.gif" rowspan=4 
    valign=top width=13 height="299"><img alt="Art Corner Image" border=0 height=13 
      src="images/corner_top_lt.gif" 
      width=13><br>
                  <img alt="Art Line Image" border=0 height=300
      src="images/line_lt_side.gif" width=13></td>
                <!--end insert -->
                <td width="486" height="299" valign="top"> 
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td align=left valign=top width=500><img alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=500></td>
                      
                      
                      
                      
                      
                      
                      
                    </tr>
                    <tr> 
                      <td align=left colspan=8 height=19 valign=top width="494"><font 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Send Message</b></font></td>
                    </tr>
                    <tr> 
                      <td bgcolor=#cccc99 height="2" width="450"></td>
                      
                      
                      
                      
                      
                      
                      
                    </tr>
                    <tr> 
                      
                      
                      
                      
                      
                      
                      
                      
                    <tr> 
                      <td width="450" valign="top"> 
                        <div align="center"></div>
                      </td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#0099FF"><b><font size="3">Your 
                    Message was sended successful</font></b></font></p>
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
      Pjung & Pommy All rights reserved.</font> </td>
  </tr>
</table>
</body>
</html>
