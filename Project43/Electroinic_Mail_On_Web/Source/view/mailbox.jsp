<%@ page session="true" import="java.text.SimpleDateFormat,java.util.Date,dtw.webmail.model.*" %>

<html>
<head>
<title>Java WebMail Project</title>
<script language="JavaScript">

	function submitDelete(form){
		//enhance->check for selected messages	
		form.acton.value="message";
		form.todo.value="delete";
		form.submit();
	}//submitDelete

	function submitMove(form){
		form.acton.value="message";
		form.todo.value="move";
    	form.submit();
	}//submitMove
        
	function SetChecked(val) {
			dml=document.messageList;
			len = dml.elements.length;
			var i=0;
			for( i=0 ; i<len ; i++) {
			if (dml.elements[i].name=='numbers') {
			dml.elements[i].checked=val;
			}
			}
	}//SetChecked

</script>
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>
<BODY aLink=#ff9933 bgColor=#FFFFFF bottomMargin=0 leftMargin=0 link=#336699 
rightMargin=0 topMargin=0 vLink=#6699cc MARGINWIDTH="0" MARGINHEIGHT="0">
<%-- Ensure authenticated & valid session --%>
<%
    if(session.isNew() || session.getValue("jwma.htmlhelper")==null) {	
    	response.sendRedirect(response.encodeRedirectUrl("login.jsp"));
    }
%>
<%-- Prepare references for use in the page --%>
<%
        JwmaInboxInfo inbox = (JwmaInboxInfo)session.getAttribute("jwma.inboxinfo");
	String mailclientprotocol = (String)session.getAttribute("jwma.mailclientprotocol");
        if (mailclientprotocol.equals("imap"))
        {
        %>
<%!
          JwmaStoreInfo storeinfo;
          JwmaTrashInfo trash;
        %>
<%
          storeinfo=(JwmaStoreInfo) session.getValue("jwma.storeinfo");
	  trash=(JwmaTrashInfo) session.getValue("jwma.trashinfo");
        %>
<%
        }
%>
<%	
	JwmaMailbox mailbox=(JwmaMailbox) session.getValue("jwma.mailbox");
        JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
        String[] pages;
        int apage;
        pages=request.getParameterValues("page");
        if(pages!=null){
          apage=Integer.parseInt(pages[0]);
        }else{apage=1;}
%>
<table width="93%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19" width="100%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="130" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="130" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top"> 
      <table width="98%" border="0" cellspacing="1" cellpadding="10" height="363">
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
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></TD>
              </TR>
              <TR> 
                <TD width=130></TD>
              </TR>
              </TBODY> 
            </TABLE>
          </td>
          <td width="100%" valign="top"> 

            <form method="post" name="messageList" action="<%= htmlhelper.getControllerUrl() %>">
              <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
              <input type="hidden" name="acton" value="">
              <input type="hidden" name="todo" value="">
              </font><font color=#cc6600 
                  face="Verdana, Arial, Helvetica, sans-serif" size=-1><b>Message 
              Action </b></font> 
              <table border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <TD align=right 
    background="images/line_lt_side.gif" rowSpan=3 
    vAlign=top width=13 height="1"><IMG alt="Art Corner Image" border=0 height=13 
      src="images/corner_top_lt.gif" 
      width=13><BR>
                    <IMG alt="Art Line Image" border=0 height=380
      src="images/line_lt_side.gif" width=13></TD>
                  <td width="559"></td>
                </tr>
                <tr> 
                  <TD align=left vAlign=top width="559"><IMG alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=550></TD>
                </tr>
                <tr> 
                  <td height="19" width="559"><FONT 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><B>Message Action</B></FONT> 
                    <table width="100%" border="0" valign=top height="380" >
                      <tr valign="top"> 
                        <td width="100%"> 
                          <table valign="top">
                            <tr> 
                              <td width="33"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><img src="images/mailbox.jpg" alt="Mailbox"> 
                                </font></td>
                              <td width="78"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
                                Mailbox <%= htmlhelper.getPathHierarchyNavigator(mailbox.getPath())%> </b></font> </td>
                              <% int diff=mailbox.getMessageCount()-(apage*25);
                                           if(diff>0){%>
                              <td width="46"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailbox.jsp?page=<%=apage+1%>">next</a></font></td>
                              <% }
                                              if(apage>1){%>
                              <td width="56"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailbox.jsp?page=<%=apage-1%>">previous</a></font></td>
                              <% } %>
                            </tr>
                          </table>
                          <table width="100%" cellpadding="1" cellspacing="1" border="0">
                            <tr> 
                              <td bgcolor="#006699" nowrap> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>#</b></font> 
                              </td>
                              <td bgcolor="#006699" nowrap> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Flags</b></font> 
                              </td>
                              <td bgcolor="#006699" nowrap> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Att.</b></font> 
                              </td>
                              <td bgcolor="#006699" width="50"> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Who</b></font> 
                              </td>
                              <td bgcolor="#006699" nowrap> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Subject</b></font> 
                              </td>
                              <td bgcolor="#006699" nowrap> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Date</b></font> 
                              </td>
                            </tr>
                            <%-- loop over messages --%>
                            <%
					if(mailbox.hasMessages()) {
						SimpleDateFormat dateformat=new SimpleDateFormat("EE d/M/yy");
						JwmaMessageInfo[] infos=mailbox.getMessageInfoList();	
                                                int index=(apage-1)*25;
                                                int max=index+25;
                                                while((index<max)&&(index<infos.length)){
    						//for (int index=0;index<infos.length;index++) {
							JwmaMessageInfo msg=infos[infos.length-index-1];
                                                        index++;
                                                        
				%>
                            <tr> 
                              <td > <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                                <input type="checkbox" name="numbers" value="<%= msg.getMessageNumber() %>">
                                </font></td>
                              <td  nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <%
                                                        if (msg.isNew()) 
                                                        {
                                                        %>
                                N 
                                <%
                                                        }
                                                        else if (msg.isRead()) 
                                                        {
                                                        %>
                                R 
                                <%
                                                        }
                                                        else if (msg.isAnswered()) 
                                                        {
                                                        %>
                                A 
                                <%
                                                        }
                                                        else if (msg.isDeleted()) 
                                                        {
                                                        %>
                                D 
                                <%
                                                        }
                                                        else
                                                        {
                                                        %>
                                &nbsp 
                                <%
                                                        }
                                                %>
                                </font> </td>
                              <td  nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <%= ((msg.isMultipart())? "y":" ") %> </font> </td>
                              <td  nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <%= ((msg.isReceived())? msg.getFrom():("<i>"+msg.getTo()+"</i>")) %> </font> </td>
                              <td nowrap > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <a href="<%= htmlhelper.getControllerUrl() %>?acton=message&amp;todo=display&number=<%= msg.getMessageNumber() %>"> 
                                <%  
							String msgsubject=msg.getSubject().trim();
							if(msgsubject==null || msgsubject.equals("")) {
								msgsubject="<em>No subject</em>";
							} else if (msgsubject.length()>25) {
								msgsubject=msgsubject.substring(0,24)+"...";
							}
						%>
                                <%= msgsubject %> </a> </font> </td>
                              <td  nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <%= dateformat.format(((msg.getDate()!=null)? msg.getDate():new Date())) %> </font> </td>
                            </tr>
                            <%	
						}//for end
                                %>
                            <%
					}//if end
				 %>
                            <%-- end loop --%>
                            <tr> 
                              <td colspan="5" bgcolor="#FFFFFF"> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
                                <a href="javascript:SetChecked(1)">Check&nbsp;All</a> 
                                - <a href="javascript:SetChecked(0)">Clear&nbsp;All</a> 
                                </b></font> 
                              <td></td>
                            </tr>
                            <tr bgcolor="#006699"> 
                              <td colspan="6"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                                <input type="button" name="delete" value="Delete" onClick="submitDelete(this.form);">
                                &nbsp;&nbsp; 
                                <% 
                                                  if (mailclientprotocol.equals("imap"))
                                                  {
                                                %>
                                <input type="button" name="move" value="Move to:" onClick="submitMove(this.form);">
                                <%= htmlhelper.getDestinationsSelect(storeinfo.listMailboxes(mailbox)) %> 
                                <%
                                                  }//end if mailclientprotocol
                                                %>
                                </font></td>
                            </tr>
                          </table>
                          <p> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                            <%-- Insert trash status here from jwma.trashinfo if not trashbox --%>
                            <% if (mailclientprotocol.equals("imap"))
                  {
                  %>
                            <% 
                    if (!mailbox.getPath().equals(trash.getPath())) 
                    { 
                    %>
                            <%
                      if (trash.isEmpty())
                      { 
                      %>
                            <img border="0" src="images/emptybin.jpg" alt="Empty trashbin." align="left"> 
                            <%    } else { %>
                            <a href="<%= htmlhelper.getMailboxDisplayAction(trash.getPath()) %>"> 
                            <img border="0" src="images/fullbin.jpg" alt="Full trashbin." align="left"> 
                            </a> 
                            <%
                      }
                    %>
                            <%
                    }
                  %>
                            <%
                  }
                %>
                            </font> 
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td height="1" width="13"></td>
                  <td width="559"></td>
                </tr>
              </table>
              <!--begin insert 1 section -->
              <!--end insert 1 section -->
            </form>
            <!--end code native -->
            <!-- ใส่ตารางครอบ-->
        <tr> 
          <td height="21"></td>
          <td></td>
        </tr>
      </table>
      <!-- ตรงนี้เสร็จตรงด้านขวา -->
    </td>
  </tr>
</table>
</body>
</html>
