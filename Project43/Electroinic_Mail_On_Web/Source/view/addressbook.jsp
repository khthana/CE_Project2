<%@ page session="true" import="java.text.SimpleDateFormat,java.util.Date,dtw.webmail.model.*" %>

<html>
<head>
        <title>Java WebMail Project</title>
 <link rel=stylesheet href="style.css" type="text/css">
<script language="JavaScript">
<!-- hide this script tag's contents from old browsers

	function submitRemove(form){
		form.acton.value="addressbook";
		form.todo.value="remove";
		form.submit();
	}//submitRemove

	function submitFastAdd(form){
		form.acton.value="addressbook";
		form.todo.value="add";
    	form.submit();
	}//submitFastAdd

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
<%-- Prepare references for use in the page --%>
<%
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
	JwmaPreferences prefs=(JwmaPreferences) session.getValue("jwma.preferences");
	JwmaAddressBook addbook=prefs.getAddressBook();
	JwmaInboxInfo inbox=(JwmaInboxInfo) session.getValue("jwma.inboxinfo");
        String mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");
%>
</font> 
<table width="95%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#FFFFFF">
  <tr align="left" valign="top"> 
    <td height="19"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="130" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="130" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="453" align="left" valign="top" width="30%"> 
      <table width="93%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="19%" align="left" valign="top" nowrap height="444"> 
            <TABLE border=0 cellPadding=0 cellSpacing=0 >
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
                  href="<%= htmlhelper.getControllerUrl() %>?acton=folder&to=updatedata"">Folders</a><br>
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
                  vspace=7 width=130></FONT>
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
          <td width="81%" valign="top" height="444"> 
            <form method="post" action="<%= htmlhelper.getControllerUrl() %>">
			<table border="0" cellspacing="0" cellpadding="0" align="left">
                <tr> 
                  <td height="8" width="13"></td>
                  <td width="554"><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="3">AddressBook</font></b></font></td>
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
                  <td width="554" height="324" valign="top"> 
                    <table width="88%" border="0" cellpadding="0" cellspacing="0" height="368">
                      <TR> 
                        <TD align=left vAlign=top width=661 height="13"><IMG alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=550></TD>
                        <td width="1"></td>
                      </TR>
                      <TR> 
                        <TD align=left colSpan=2 height=18 vAlign=top><FONT 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Keep your friend</b></FONT></TD>
                      </TR>
                      <TR> 
                        <TD height="2" width="661"></TD>
                        <td width="1"></td>
                      </TR>
                      <TR>
                        <TD height="321" valign="top" width="661"> 
                          <!-- begin old code -->
                          <!-- end old code -->
                          <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <input type="hidden" name="acton" value="">
                          <input type="hidden" name="todo" value="">
                          </font> 
                          <table>
                            <tr> 
                              <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><img src="images/addressbook.jpg" width="24" height="32"></font></td>
                              <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Addresses</b></font></td>
                            </tr>
                          </table>
                          <table width="95%" cellpadding="1" cellspacing="1" border="0">
                            <tr> 
                              <td bgcolor="#6699cc" nowrap width="7%"> <font color="#FFFFFF" face="Arial,Helvetica"><b> 
                                <center>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">#</font> 
                                </center>
                                </b></font> </td>
                              <td bgcolor="#6699cc" nowrap width="12%"> <font color="#FFFFFF" face="Arial,Helvetica"><b> 
                                <center>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nickname</font> 
                                </center>
                                </b></font> </td>
                              <td bgcolor="#6699cc" nowrap width="30%"> <font color="#FFFFFF" face="Arial,Helvetica"><b> 
                                <center>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Fullname 
                                  </font> 
                                </center>
                                </b></font> </td>
                              <td bgcolor="#6699cc" nowrap width="39%"> <font color="#FFFFFF" face="Arial,Helvetica"><b> 
                                <center>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Address</font> 
                                </center>
                                </b></font> </td>
                            </tr>
                            <%-- loop over addressbook entries --%>
                            <%
					String[] nicknames=addbook.listNicknames();
					for (int index=0;index<nicknames.length;index++) {
							JwmaAddress add=addbook.getAddress(nicknames[index]);
				%>
                            <tr> 
                              <td  width="7%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="checkbox" name="nicknames" value="<%= add.getNickname() %>">
                                </font></td>
                              <td  nowrap width="12%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <a href="addressbook_entry.jsp?nick=<%= add.getNickname() %>">	
                                <em><%= add.getNickname() %></em> </a> </font> </td>
                              <td  nowrap width="30%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <%= (add.getFullname().equals(""))?" ": add.getFullname() %> </font> </td>
                              <td  nowrap width="39%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <%
                    if (!add.getEmail().equals(""))
                    {
                    %>
                                <a href="<%= htmlhelper.getControllerUrl() %>?acton=message&amp;todo=compose&to=<%= add.getEmail() %>"> 
                                <%= add.getEmail() %> </a> 
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
                            </tr>
                            <%	
					}//for end
				 %>
                            <%-- end loop --%>
                            <tr align="right" height="3"> 
                              <td bgcolor="#6699cc" height="3" width="7%">&nbsp;</td>
                              <td bgcolor="#6699cc" height="3" width="12%">&nbsp;</td>
                              <td bgcolor="#6699cc" height="3" width="30%">&nbsp;</td>
                              <td bgcolor="#6699cc" height="3" width="39%">&nbsp;</td>
                            </tr>
                            <!-- add fast add of address row -->
                            <tr> 
                              <td  width="7%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><i>Quick 
                                Add:</i> </font></td>
                              <td  nowrap width="12%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="text" name="nickname" size="10">
                                </font></td>
                              <td  nowrap width="30%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="text" name="fullname" size="30">
                                </font></td>
                              <td  nowrap width="39%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="text" name="email" size="35">
                                </font></td>
                            </tr>
                            <tr align="right"> 
                              <td colspan="5" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="button" name="remove" value="Remove Selected" onClick="submitRemove(this.form);">
                                <input type="button" name="add" value="Add" onClick="submitFastAdd(this.form);">
                                </font></td>
                            </tr>
                          </table>
                        </TD>
                        <td width="1" height="321"></td>
                      </TR>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td width="554" height="2"></td>
                </tr>
              </table>
			  
              <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> </font>
</form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="21"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">&copy;2001 
      Pjung & Pommy All rights reserved. </font> </td>
  </tr>
</table>
</body>
</html>
