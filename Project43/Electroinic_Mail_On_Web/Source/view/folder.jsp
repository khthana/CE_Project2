<%@ page session="true" import="dtw.webmail.model.*" %>

<html>

<head>
        <title>Java WebMail Project</title>
         <link rel=stylesheet href="style.css" type="text/css">

<script language="JavaScript">
<!-- hide this script tag's contents from old browsers

	function submitDelete(aform) {
		//enhance: check for selected folders or mailboxes	
		aform.acton.value="folder";
		aform.todo.value="delete";
		aform.submit();
	}

	function submitMove(aform){
		aform.acton.value="folder";
		aform.todo.value="move";
    	aform.submit();
	}

	function submitCreate(aform) {
		//enhance:check for empty name value
		aform.acton.value=aform.type.value;	
                //aform.acton.value="mailbox";
		aform.todo.value="create";
		aform.submit();
	}
// end hide -->
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
<%-- Prepare references for use in the page --%>
<%!
        String mailclientprotocol;
        JwmaTrashInfo trash;
        JwmaStoreInfo storeinfo;
        JwmaFolder folder;
%>
<%      
        mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");
        if (mailclientprotocol.equals("imap")) 
        {
          trash=(JwmaTrashInfo) session.getValue("jwma.trashinfo");
          storeinfo=(JwmaStoreInfo) session.getValue("jwma.storeinfo");
          folder=(JwmaFolder) session.getValue("jwma.folder");
        }
        
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
	JwmaInboxInfo inbox=(JwmaInboxInfo) session.getValue("jwma.inboxinfo");
        
%>
<br>
</font> 
<table width="94%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <!--table 1 row 1-->
  <tr align="left" valign="top"> 
    <td height="19" width="100%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="130" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="130" height="36">
        </embed> 
      </object></td>
  </tr>
  <!--table 1 row 2-->
  <tr> 
    <td height="364" align="left" valign="top"> 
      <table border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="130" align="left" valign="top" nowrap> 
            <TABLE border=0 cellPadding=0 cellSpacing=0>
              <TBODY> 
              <TR> 
                <TD width="135"><font color="#cc6600" face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                  <!-- LOCAL NAV TITLE -->
                  <B>Web Mail Project</B></font></TD>
              </TR>
              <TR> 
                <TD bgColor=#cccc99 width=135><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><IMG alt="Spacer Image" border=0 
                  height=1 
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></font></TD>
              </TR>
              <TR> 
                <TD 
                  width=135> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><BR>
                    <!-- LIST OF LOCAL NAV LINKS GOES HERE -->
                    <FONT 
                  color=#999933><A 
                  href="<%= htmlhelper.getControllerUrl() %>?acton=session&todo=redirect&view=main">Mail 
                    Home</A></FONT></font><font color="#999933" face="Verdana, Arial, Helvetica, sans-serif" size="2"><BR>
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
                  href="<%= htmlhelper.getControllerUrl() %>?acton=folder&todo=updatedata">Folders</a><br>
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
                <TD bgColor=#cccc99 width=135><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><IMG alt="Spacer Image" border=0 
                  height=1 
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></font></TD>
              </TR>
              <TR> 
                <TD width=135></TD>
              </TR>
              </TBODY> 
            </TABLE>
          </td>
          <td width="563" valign="top"> 
            <table border="0" cellspacing="0" cellpadding="0" align="left">
              <tr> 
                <td height="8" width="13"></td>
                <td width="559"><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="3">Show Directory</font></b></font></td>
              </tr>
              <tr> 
                <!--insert line it slide -->
                <TD align=right 
    background="images/line_lt_side.gif" rowSpan=4 
    vAlign=top width=13 height="1"><IMG alt="Art Corner Image" border=0 height=13 
      src="images/corner_top_lt.gif" 
      width=13><BR>
                  <IMG alt="Art Line Image" border=0 height=380
      src="images/line_lt_side.gif" width=13></TD>
                <!--end insert -->
                <td height="602" valign="top" width="559"> 
                  <table border="0" cellpadding="0" cellspacing="0">
                    <TR> 
                      <TD align=left vAlign=top width=556><IMG alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=550></TD>
                    </TR>
                    <TR> 
                      <TD align=left colSpan=8 vAlign=top width="556"><FONT 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Welcome to our webmail</b></FONT></TD>
                    </TR>
                    <TR> 
                      <TD bgColor=#cccc99 width="556"></TD>
                    </TR>
                    <TR> 
                    <tr> 
                      <td width="556" valign="top"> 
                        <table border="0" cellpadding="0" cellspacing="3">
                          <tr> 
                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><img src="images/inbox.jpg" alt="Inbox"></font></td>
                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                              <b><a href="<%= htmlhelper.getMailboxDisplayAction(inbox.getName()) %>"> 
                              Inbox</a></b></font> </td>
                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                              <b> <%= inbox.getNewMessageCount() %></b> new messages out of <b> <%= inbox.getMessageCount() %></b>.</font> </td>
                          </tr>
                        </table>
                        <form method="post" action="<%= htmlhelper.getControllerUrl() %>">
                          <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <input type="hidden" name="acton" value="">
                          <input type="hidden" name="todo" value="">
                          </font> 
                          <table width="85%" cellpadding=1 cellspacing=1 border=0>
                            <tr bgcolor="#006699"> 
                              <td colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><img align="left" src="images/folder_small.jpg" alt="Folder"> 
                                <font color="#ffffff"> <b><%= htmlhelper.getPathHierarchyNavigator(folder.getPath()) %></b></font></font> </td>
                            </tr>
                            <tr> 
                              <td width="50%" height="100%"  align="left" valign="top"> 
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" align="left" valign="top">
                                  <tr> 
                                    <td colspan=2 height="25" width="100%" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Folders</b></font> 
                                    </td>
                                  </tr>
                                  <% 
						String[] subfolderpaths=folder.getFolderPaths();
						String[] subfoldernames=folder.getFolderNames();
						String[] mailboxpaths=folder.getMailboxPaths();
						String[] mailboxnames=folder.getMailboxNames();
						int[] mailboxsizes=folder.getMessageCounts();
						int rowdiff=subfolderpaths.length-mailboxpaths.length;
					%>
                                  <%-- loop over folders --%>
                                  <%	for (int index=0;index<subfolderpaths.length;index++) { %>
                                  <tr> 
                                    <td width="75%" height="25" align="left" valign="top" > 
                                      <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                      <input type="checkbox" name="paths" value="<%= subfolderpaths[index] %>">
                                      <b> <a href="<%= htmlhelper.getFolderDisplayAction(subfolderpaths[index]) %>"><%= subfoldernames[index] %></a> </b></font> </td>
                                    <td nowrap width="25%" align=left valign=top > 
                                      <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;&nbsp;</font> 
                                    </td>
                                  </tr>
                                  <% } %>
                                  <%-- end loop over folders --%>
                                  <%-- Correct row difference between folderlist and mailboxlist --%>
                                  <%
						while(rowdiff<0) {
							rowdiff++;
					%>
                                  <tr> 
                                    <td height="25" colspan="2" >&nbsp;</td>
                                  </tr>
                                  <% } %>
                                  <%-- End correction --%>
                                </table>
                              </td>
                              <td width="50%" height="100%"  align="left" valign="top"> 
                                <table cellpadding="0" cellspacing="0" border="0" height="100%" width="100%" align="left" valign="top">
                                  <tr> 
                                    <td width="100%" height="25" colspan="2" > 
                                      <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Mailboxes</b></font> 
                                    </td>
                                  </tr>
                                  <%-- loop over mailboxes --%>
                                  <%	for (int index=0;index<mailboxpaths.length;index++) { %>
                                  <tr> 
                                    <td width="75%" height="25" align="left" valign="top" > 
                                      <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                      <input type="checkbox" name="paths" value="<%= mailboxpaths[index] %>">
                                      <b> <a href="<%= htmlhelper.getMailboxDisplayAction(mailboxpaths[index]) %>"><%= mailboxnames[index] %></a> </b></font> </td>
                                    <td nowrap width="25%" align=left valign=top > 
                                      <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;&nbsp;(<b><%= mailboxsizes[index] %></b>)</font> </td>
                                  </tr>
                                  <% } %>
                                  <%-- end loop over mailboxes --%>
                                  <%-- Correct row difference between folderlist and mailboxlist --%>
                                  <%
						while(rowdiff>0) {
							rowdiff--;
					%>
                                  <tr> 
                                    <td height="25" colspan="2" >&nbsp;</td>
                                  </tr>
                                  <% } %>
                                  <%-- End correction --%>
                                </table>
                              </td>
                            </tr>
                            <tr bgcolor="#006699"> 
                              <td colspan="2" width="100%" height="25" align="left" nowrap> 
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="button" name="delete" value="Delete" onclick="submitDelete(this.form);">
                                &nbsp;&nbsp; 
                                <%
                                          //====================================================
                                          // Modify 9/3/2001 00:28AM
                                          //====================================================
                                          //if (storeinfo.listFolders(folder).length != 0)
                                          if (subfoldernames.length != 0 && mailboxnames.length != 0)
                                          {
                                        %>
                                <input type="button" name="move" value="Move to:" onclick="submitMove(this.form);">
                                <%= htmlhelper.getDestinationsSelect(storeinfo.listFolders(folder)) %> &nbsp;&nbsp; 
                                <%
                                          } // end if
                                        %>
                                <input type="button" name="create" value="Create new" onclick="submitCreate(this.form);">
                                <select name="type">
                                  <option value="folder" selected>Folder</option>
                                  <option value="mailbox">Mailbox</option>
                                </select>
                                <input type="text" name="aname" value="" size="20">
                                </font></td>
                            </tr>
                          </table>
                        </form>
                        <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%-- Insert trash status here from jwma.trashinfo --%>
                          <%	if (trash.isEmpty()){ %>
                          <img border="0" src="images/emptybin.jpg" alt="Empty trashbin." align="left"> 
                          <% } else { %>
                          <a href="<%= htmlhelper.getMailboxDisplayAction(trash.getPath()) %>"> 
                          <img border="0" src="images/fullbin.jpg" alt="Full trashbin." align="left"> 
                          </a> 
                          <% } %>
                          </font></p>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
        <tr columnspan="2"> 
          <td height="68" colspan="2" valign="top"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&copy;2001 
            Pjung & Pommy All rights reserved. </font></td>
          
        </tr>
      </table>
    
</table>
</body>
</html>
