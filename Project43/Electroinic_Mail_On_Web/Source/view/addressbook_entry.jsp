<%@ page session="true" import="java.text.SimpleDateFormat,java.util.Date,dtw.webmail.model.*" %>

<html>
<head>
	<title>Java WebMail Project</title>
 	<meta http-equiv="Content-Type" content="text/html; charset=windows-874"> 
	<meta http-equiv="Pragma" content="no-cache">
	<script type="text/javascript">
	<!--
	function submitSave(form){
		form.acton.value="addressbook";
		form.todo.value="update";
		form.submit();
	}//submitSave
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
	JwmaInboxInfo inbox=(JwmaInboxInfo) session.getValue("jwma.inboxinfo");
	JwmaAddress add=prefs.getAddressBook().getAddress(request.getParameter("nick").trim());
        String mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");
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
    <td height="434" align="left" valign="top" width="30%"> 
      <table width="99%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="130" align="left" valign="top" nowrap height="423"> 
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
                  href="https://161.246.11.205/webmail/help/index.htmlhelp/index.html">Help 
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
          <td width="508" height="423"> 
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
    valign=top width=13 height="378"><img alt="Art Corner Image" border=0 height=13 
      src="images/corner_top_lt.gif" 
      width=13><br>
                  <img alt="Art Line Image" border=0 height=380
      src="images/line_lt_side.gif" width=13></td>
                <!--end insert -->
                <td width="486" height="378" valign="top"> 
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td align=left valign=top width=476><img alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=500></td>
                    </tr>
                    <tr> 
                      <td align=left colspan=8 height=19 valign=top width="476"><font 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Detail Address book</b></font></td>
                    </tr>
                    <tr> 
                      <td bgcolor=#cccc99 height="2" width="476"></td>
                    </tr>
                    <tr> 
                    <tr> 
                      <td width="476" valign="top" height="323"> 
                        <%-- Display message --%>
                      		<form method="post" action="<%= htmlhelper.getControllerUrl() %>">
			<input type="hidden" name="acton" value="">
			<input type="hidden" name="todo" value="">
			<table>
				<tr>
                  <td><img src="images/addressbook.jpg" width="24" height="32"></td>
                  <td><font face="Arial,Helvetica"><b>Address</b></font></td>
				</tr>
			</table>
			  <table width="95%" cellpadding="1" cellspacing="1" border="0">
                <tr> 
                  <td bgcolor="#6699cc" nowrap colspan="2">
					<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="+1">
					<i><b><%= add.getNickname() %><input type="hidden" name="nickname" value="<%= add.getNickname() %>"></b></i>&nbsp;
					</font> 
                  </td>
                </tr> 
                                <tr>	
				              <td  nowrap> <font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b>Fullname</b></font> :</td> 	 
				  <td >
				  	<input type="text" name="fullname" value="<%= add.getFullname() %>" size="50">
				  </td>	
				</tr>
                                <tr>
                                  
                              <td  nowrap> <font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b>FCC :</b></font></td> 	 
				  <td >
				  	<input type="text" name="fcc" value="<%= add.getFcc() %>" size="50">
				  </td>	
                                </tr>
				<tr>	
				              <td  nowrap> <font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b>Email :</b></font></td> 	 
				  <td >
				  	<input type="text" name="email" value="<%= add.getEmail() %>" size="50">
				  </td>	
				</tr>
				<tr>	
				              <td  nowrap> <b><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b>Comment :</b></font></b></td> 	 
				  <td >
				  	<textarea name="comment" rows="4" cols="40"><%= add.getComment() %></textarea>
				  </td>
				</tr>


                <tr align="right" height="20"> 
                  <td  height="20" colspan="2">
					<input type="reset" name="reset" value="Undo changes">
				 	<input type="button" name="update" value="Save" onClick="submitSave(this.form);">
				  </td>
                </tr>
                   
              </table>
			</form> 
      
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
