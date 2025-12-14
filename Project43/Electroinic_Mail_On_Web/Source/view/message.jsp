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
    <td height="364" align="left" valign="top" width="30%"> 
      <table width="93%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="130" align="left" valign="top" nowrap> 
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
          <td width="510" height="494"> 
            <table border="0" cellspacing="0" cellpadding="0" align="left">
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
    valign=top width=13 height="1"><img alt="Art Corner Image" border=0 height=13 
      src="images/corner_top_lt.gif" 
      width=13><br>
                  <img alt="Art Line Image" border=0 height=380
      src="images/line_lt_side.gif" width=13></td>
                <!--end insert -->
                <td width="486" height="602" valign="top"> 
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td align=left valign=top width=500><img alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=500></td>
                      
                      
                      
                      
                      
                      
                      
                    </tr>
                    <tr> 
                      <td align=left colspan=8 height=19 valign=top width="494"><font 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Read Message</b></font></td>
                    </tr>
                    <tr> 
                      <td bgcolor=#cccc99 height="2" width="450"></td>
                      
                      
                      
                      
                      
                      
                      
                    </tr>
                    <tr> 
                      
                      
                      
                      
                      
                      
                      
                      
                    <tr> 
                      <td width="450" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <%-- Display message --%>
                        </font> 
                        <table>
                          <tr> 
                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><img src="images/message.jpg" alt="Message"></font></td>
                            <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
                              Message #<%= message.getMessageNumber() %> from <%= htmlhelper.getPathHierarchyNavigator(mailbox.getPath())%> </b></font> </td>
                          </tr>
                        </table>
                        <form method="post" action="<%= htmlhelper.getControllerUrl() %>">
                          <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <input type="hidden" name="acton" value="message">
                          <input type="hidden" name="todo" value="">
                          <input type="hidden" name="numbers" value="">
                          <input type="hidden" name="reply" value="">
                          <input type="hidden" name="forward" value="">
                          </font> 
                          <table border="0" width="75%" cellspacing="1" cellpadding="1">
                            <tr> 
                              <td colspan="2" align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
                                <% int no = message.getMessageNumber(); %>
                                <% if (no!=mailbox.getMessageCount()) { %>
                                <a href="<%= htmlhelper.getControllerUrl() %>?acton=message&amp;todo=display&amp;number=<%=no+1%>"><img src="images/next.gif" width="17" height="17" align="right" alt="Next Message" border="0"></a> 
                                <% } %>
                                <a href="printmessage.jsp"><img src="images/printer.jpg" width="16" height="16" align="right" hspace="5" alt="Printer friendly" border="0"></a> 
                                <%
					if(no>1)
					{
				%>
                                <a href="<%= htmlhelper.getControllerUrl() %>?acton=message&amp;todo=display&amp;number=<%= no-1 %>"><img src="images/previous.gif" width="17" height="17" align="right" border="0" alt="Previous message"></a><%= ((message.getDate()!=null)? message.getDate():new Date()) %></b> 
                                <%	}	%>
                                <i> &nbsp;&quot;<%= ((message.getSubject().length()>25)? (message.getSubject().substring(0,24)+"..."):message.getSubject()) %>&quot;</i> </font></td>
                            </tr>
                            <tr> 
                              <td  align=left valign=top width="20%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#336699">From:</font></b></font></td>
                              <td  align=left valign=top width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%= message.getFrom() %> </font></td>
                            </tr>
                            <tr> 
                              <td  align=left valign=top width="20%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#336699">To:</font></b></font></td>
                              <td  align=left valign=top width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%= message.getTo() %> </font></td>
                            </tr>
                            <tr> 
                              <td  align=left valign=top width="20%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#336699">Subject:</font></b></font></td>
                              <td  align=left valign=top width="80%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><em><%= message.getSubject() %></em> </font></td>
                            </tr>
			<tr>
        			<td bgcolor=#474747 height="2"></td>
<td bgcolor=#474747 height="2"></td>
<td bgcolor=#474747 height="2"></td>
<td bgcolor=#474747 height="2"></td>
<td bgcolor=#474747 height="2"></td>
<td bgcolor=#474747 height="2"></td>      
</tr>
                            <tr> 
                              <td  align="left" valign="top" colspan="2" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <% if (message.isSinglepart()) { %>
                                </font> 
                                <pre><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%= message.getBody() %></font></pre>
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <% } else {
							JwmaMessagePart[] parts=message.getMessageParts();
							for (int i=0;i<parts.length;i++) {
					%>
                                <%= htmlhelper.getPartDescription(parts[i],i) %> 
                                <%
					   		}
					   } 
					%>
                                </font></td>
                            </tr>
                            <!------------------------------------------------------------------------------------>
                            <tr> 
                              <td colspan="2" align="left" height="24"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <% if (no!=mailbox.getMessageCount()) { %>
                                <a href="<%= htmlhelper.getControllerUrl() %>?acton=message&amp;todo=display&amp;number=<%=no+1%>"><img src="images/next.gif" width="17" height="17" align="right" alt="Next message" border="0"></a> 
                                <% }	%>
                                <a href="printmessage.jsp"><img src="images/printer.jpg" width="16" height="16" align="right" hspace="5" alt="Printer friendly" border="0"></a> 
                                <% if(no>1) {%>
                                <a href="<%= htmlhelper.getControllerUrl() %>?acton=message&amp;todo=display&amp;number=<%=no-1%>"><img src="images/previous.gif" width="17" height="17" align="right" alt="Previous message" border="0"></a> 
                                <% } %>
                                <input type="button" name="delete" value="Delete" onClick="submitDelete(this.form,<%=message.getMessageNumber()%>);">
                                <%
                                  if (mailclientprotocol.equals("imap"))
                                  {
                                %>
                                  <input type="button" name="move" value="Move to:" onClick="submitMove(this.form);">
                                  <%= htmlhelper.getDestinationsSelect(storeinfo.listMailboxes(mailbox)) %> 
                                <%
                                  }
                                %>
                                </font></td>
                            </tr>
                            <tr> 
                              <td colspan="2" align="left" height="31"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="button" name="replybutton" value="Reply" onClick="submitReply(this.form);">
                                <input type="checkbox" name="toall" value="true">
                                <font color="#336699">To all</font></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                </font> 
                              </td>
                            </tr>
                            <tr> 
                              <td colspan="2" align="left" height="24" nowrap> 
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="button" name="forwardbutton" value="Forward to:" onClick="submitForward(this.form);">
                                <input type="text" name="to" size="30">
                                </font></td>
                            </tr>
                            <!------------------------------------------------------------------------------------>
                          </table>
                        </form>
                        <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%-- Insert trash status here from jwma.trashinfo --%>
			<%
				if (mailclientprotocol.equals("imap"))
				{
			%>
                          <%	if (trash.isEmpty()){ %>
                          <img border="0" src="images/emptybin.jpg" alt="Empty trashbin." align="left"> 
                          <% } else{ %>
                          <a href="<%= htmlhelper.getMailboxDisplayAction(trash.getPath()) %>"> 
                          <img border="0" src="images/fullbin.jpg" alt="Full trashbin." align="left"> 
                          </a> 
                          <% } %>
			<%
			}
			%>
                          </font></p>
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
  <tr> 
    <td> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">&copy;2001 
      Pjung & Pommy All rights reserved.</font> </td>
  </tr>
</table>
</body>
</html>
