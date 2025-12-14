<%@ page session="true" import="dtw.webmail.model.*" %>

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
        JwmaInboxInfo inbox = (JwmaInboxInfo)session.getAttribute("jwma.inboxinfo");
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
	JwmaMessage message=(JwmaMessage) session.getValue("jwma.message");
	JwmaPreferences prefs=(JwmaPreferences) session.getValue("jwma.preferences");
	String inserthandler="onChange=\"this.form.to.value=this.value;\"";
	String mailclientprotocol = (String)session.getValue("jwma.mailclientprotocol");
%>
</font> 
<table width="707" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19" width="707"><object
classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="130" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="130" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top" width="707"> 
      <table border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td bgcolor="#ffffff" width="130" align="left" valign="top" nowrap> 
            <TABLE border=0 cellPadding=0 cellSpacing=0>
              <TBODY> 
              <TR> 
                <TD height="18"><FONT color=#cc6600 
                  face="Verdana, Arial, Helvetica, sans-serif" size=-1> 
                  <!-- LOCAL NAV TITLE -->
                  <B>Web Mail Project</B></FONT></TD>
              </TR>
              <TR> 
                <TD bgColor=#cccc99 height="2"></TD>
              </TR>
              <TR> 
                <TD height="281"> 
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
                <TD bgColor=#cccc99 height="1"><IMG alt="Spacer Image" border=0 
                  height=1 
                  src="E:\tomcat\webapps\webmail\template\Seagate Technology Affiliate Program - Overview_files\clear(1).gif" 
                  width=1></TD>
              </TR>
              <TR> 
                <TD width=130 height="219"></TD>
              </TR>
              </TBODY> 
            </TABLE>
          </td>
          <td width="505" valign="top"> 
            <form method="post" enctype="multipart/form-data" action="servlet/jwmasm">
				<!--begin insert file -->
              <table border="0" cellspacing="0" cellpadding="0" align="left">
                <tr> 
                  <td height="8" width="13"></td>
                  <td width="556"><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="3">Compose Message</font></b></font></td>
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
                  <td width="556" height="602" valign="top"> 
                    <table width="86%" border="0" cellpadding="0" cellspacing="0">
                      <TR> 
                        <TD align=left vAlign=top width=635><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="3"><img alt="Art Line Image" border=0 
      height=13 src="images/line_top.gif" 
      width=500></font></b></font></TD>
                        
                        
                        
                        
                        
                        
                        
                      </TR>
                      <TR> 
                        <TD align=left colSpan=8 height=18 vAlign=top><FONT 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Write to your friend</b></FONT></TD>
                      </TR>
                      <TR> 
                        <TD bgColor=#cccc99 height="2"></TD>
                        
                        
                        
                        
                        
                        
                        
                      </TR>
                      <TR> 
                        
                        
                        
                        
                        
                        
                        
                        
                      <tr> 
                        <td height="602" valign="top"> 
						<!-- begin old code -->
                          <table border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td height="16" valign="top" colspan=3> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF"> 
                                Compose a Mail </font></b> </font></td>
                              
                              
                              
                              
                              
                            </tr>
                            <tr> 
                              <td width="113" height="30" valign="top" ><font 
                  color=#999933 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=-1><b><font size="2">To</font></b></font></td>
                              <td valign="top" width="6" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td width="511" valign="top"> 
                                <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                  <input type="text" name="to" size="50" value="<%= message.getTo() %>">
                                  </font></p>
                              </td>
                              
                              
                              
                              
                              
                            </tr>
                            <TR> 
                              <TD bgColor=#cccc99 height="1" width="113"></TD>
                              <td width="6"></td>
                              <td width="511"></td>
                              
                              
                              
                              
                              
                            </TR>
                            <TR> 
                              <TD bgColor=#ffffff colSpan=8 height=1><IMG height=1 
                  src="images/clear(1).gif" 
                  width=1></TD>
                            </TR>
                            <tr> 
                              <td valign="top" height="30" width="113" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#999933">Cc</font></b></font></td>
                              <td valign="top" width="6" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td valign="top" width="511"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="text" name="ccto" size="50" value="<%= message.getCCTo() %>">
                                </font></td>
                              
                              
                              
                              
                              
                            </tr>
                            <TR> 
                              <TD bgColor=#cccc99 height="1" width="113"></TD>
                              <td width="6"></td>
                              <td width="511"></td>
                              
                              
                              
                              
                              
                            </TR>
                            <tr> 
                              <td height="30" valign="top" width="113" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#999933">Bcc</font></b></font></td>
                              <td valign="top" width="6" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td valign="top" width="511"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="text" name="bccto" size="50" value="<%= message.getBCCTo() %>">
                                </font></td>
                              
                              
                              
                              
                              
                            </tr>
                            <TR> 
                              <TD bgColor=#cccc99 height="1" width="113"></TD>
                              <td width="6"></td>
                              <td width="511"></td>
                              
                              
                              
                              
                              
                            </TR>
                            <tr> 
                              <td height="33" valign="top" width="113" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#999933">Attachment</font></b></font></td>
                              <td valign="top" width="6" height="33" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td valign="top" width="511" height="33"> 
                                <table width="100%" border="0" height="100" vspace="0" hspace="0" bordercolor="#989830">
                                  <tr>
                                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                      <input type="file" name="attachment" size="36">
                                      </font></td>
                                  </tr>
                                  <tr>
                                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                      <input type="file" name="attachment2" size="36">
                                      </font></td>
                                  </tr>
                                  <tr>
                                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                      <input type="file" name="attachment3" size="36">
                                      </font></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <TR> 
                              <TD bgColor=#cccc99 height="1" width="113"></TD>
                              <td width="6"></td>
                              <td width="511"></td>
                              
                              
                              
                              
                              
                            </TR>
                            <tr> 
                              <td height="30" valign="top" width="113" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#999933">Subject</font></b></font></td>
                              <td valign="top" width="6" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td valign="top" width="511" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <input type="text" name="subject" size="50" value="<%= message.getSubject() %>">
                                </font></td>
                              
                              
                              
                              
                              
                            </tr>
                            <TR> 
                              <TD bgColor=#cccc99 height="1" width="113"></TD>
                              <td width="6"></td>
                              <td width="511"></td>
                              
                              
                              
                              
                              
                            </TR>
                            <tr> 
                              <td height="19" valign="top" width="113" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#999933">Body</font></b></font></td>
                              <td valign="top" width="6" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td valign="top" width="511" >&nbsp; </td>
                              
                              
                              
                              
                              
                            </tr>
                            <TR> 
                              <TD bgColor=#cccc99 height="1" width="113"></TD>
                              <td width="6"></td>
                              <td width="511"></td>
                              
                              
                              
                              
                              
                            </TR>
                            <tr> 
                              <td height="334" colspan=3 valign="top" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <textarea name="body" wrap="physical" cols="45" rows="20"><%= message.getBody() %></textarea>
                                </font></td>
                            </tr>
                            <tr> 
                              <td height="20" valign="top" width="113" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Signature</b></font></td>
                              <td valign="top" width="6" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>:</b></font></td>
                              <td valign="top" width="511" > <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                <Select name="signature">
                                  <option value="std" selected>sign</option>
                                  <option value="alt">sign alternative</option>
                                  <option value="none">don&acute;t sign</option>
                                </select>
                                </font></td>
                            </tr>
                            <tr> 
                              <td height="1" width="113"></td>
                              <td width="6"></td>
                              <td width="511"> 
                                <table align=left>
                                  <tr> 
                                    <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                      <input type="reset" value="Undo changes" name="reset">
                                      </font></td>
                                    <td width=10>&nbsp;</td>
                                    <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                      <input type="submit" value="Send Mail" name="submit">
                                      </font></td>
                                  </tr>
                                </table>
                              </td>
                              
                              
                              
                              
                              
                            </tr>
                          </table>
						  <!-- end old code -->
                        </td>
                        
                        
                        
                        
                        
                        
                        
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  
                </tr>
              </table>
			  <!--end new code -->
              <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br clear>
                </font> 
            </form>
          </td>
        </tr>
      </table>
    </td>
	<!--end column  rigth -->
  </tr>
  <tr> 
    <td width="707"><font color="#000033" size="1">&copy;2001 Pjung & Pommy All 
      rights reserved. </font> </td>
  </tr>
</table>
SS 
</body>
</html>
