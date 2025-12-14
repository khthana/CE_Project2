<%@ page session="true" import="java.text.SimpleDateFormat,java.util.Date,dtw.webmail.model.*" %>

<html>
  <head>
    <title>Java WebMail Project</title>
     <link rel=stylesheet href="style.css" type="text/css">
<script language="JavaScript">
<!-- hide this script tag's contents from old browsers

	function submitSave(form){
		form.acton.value="addressbook";
		form.todo.value="update";
		form.submit();
	}//submitSave

// end hide -->
</script>
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
	JwmaAddress add=prefs.getAddressBook().getAddress(request.getParameter("nick").trim());
        String mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19"><object
classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="190" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="190" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top" width="30%"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td  width="19%" align="left" valign="top" nowrap> 
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="<%= htmlhelper.getControllerUrl() %>?acton=message&todo=compose">Compose</a></b></font></li>
            <li><font face="Arial, Helvetica, sans-serif"><b>Addressbook</b></font></li>
            <li><b><font face="Arial, Helvetica, sans-serif"><a href="preferences.jsp">Settings</a></font></b></li>
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="help/index.html">Help</a><br>
              <br>
              </b></font></li>
            <li><font face="Arial, Helvetica, sans-serif"><b> <a href="addressbook.jsp">To 
              Addressbook</a></b></font></li>
            <%
              if (mailclientprotocol.equals("imap"))
              {
            %>
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="<%= htmlhelper.getControllerUrl() %>?acton=session&amp;todo=redirect&amp;view=main">To 
              Main</a><br>
              <br>
              </b></font></li>
            <%
              }
              else
              {
            %>
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="mailbox.jsp">
              Mailbox</a><br>
              <br>
              </b></font></li>
            <%
              }
            %>
            <li><b><font face="Arial, Helvetica, sans-serif"><a href="<%= htmlhelper.getControllerUrl() %>?acton=session&todo=logout">Logout</a></font></b></li>
          </td>
          <td width="81%" valign="top"> 
            <p>
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
                  <td bgcolor="#000000" nowrap colspan="2">
					<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="+1">
					<i><b><%= add.getNickname() %><input type="hidden" name="nickname" value="<%= add.getNickname() %>"></b></i>&nbsp;
					</font> 
                  </td>
                </tr> 
                                <tr>	
				  <td  nowrap>
					<b>Fullname</b>
				  </td> 	 
				  <td >
				  	<input type="text" name="fullname" value="<%= add.getFullname() %>" size="50">
				  </td>	
				</tr>
                                <tr>
                                  <td  nowrap>
					<b>FCC</b>
				  </td> 	 
				  <td >
				  	<input type="text" name="fcc" value="<%= add.getFcc() %>" size="50">
				  </td>	
                                </tr>
				<tr>	
				  <td  nowrap>
					<b>Email</b>
				  </td> 	 
				  <td >
				  	<input type="text" name="email" value="<%= add.getEmail() %>" size="50">
				  </td>	
				</tr>
				<tr>	
				  <td  nowrap>
					<b>Comment</b>
				  </td> 	 
				  <td >
				  	<textarea name="comment" rows="4" cols="70"><%= add.getComment() %></textarea>
				  </td>
				</tr>


                <tr align="right" height="20"> 
                  <td bgcolor="#000000" height="20" colspan="2">
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
  <tr> 
    <td>
		<font size=-2 face=ARIAL,HELVETICA>&copy;2001 Pjung & Pommy All rights reserved. 
      	</font>
	</td>
  </tr>
</table>
</body>
</html>
