

<html>
  <head>
        <title>Java WebMail Project</title>
         <link rel=stylesheet href="style.css" type="text/css">
  </head>

<BODY aLink=#ff9933 bgColor=#FFFFFF bottomMargin=0 leftMargin=0 link=#336699 
rightMargin=0 topMargin=0 vLink=#6699cc MARGINWIDTH="0" MARGINHEIGHT="0">

<%-- Ensure authenticated & valid session --%>
<%
    /*if(session.isNew() || session.getValue("jwma.htmlhelper")==null) {
        response.sendRedirect(response.encodeRedirectUrl("login.jsp"));
    }*/
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="418" bgcolor="#ffffff">
  <tr align="left" valign="top"> 
    <td height="19"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="190" height="36">
        <param name=movie value="Movie7.swf">
        <param name=quality value=high>
        <embed src="Movie7.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="190" height="36">
        </embed> 
      </object></td>
  </tr>
  <tr> 
    <td height="364" align="left" valign="top" width="30%"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="10" height="363">
        <tr> 
          <td  width="19%" align="left" valign="top" nowrap> 
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="help/index.html">Help</a><br>
            <br>
            </b></font>
            <li><b><font face="Arial, Helvetica, sans-serif" ><a href="login.jsp">Login</a></font></b></li>
          </td>
          <td width="81%" valign="top">
		<font color="#999933">
		<center><br><br><br>
              <font color="#999933">ขอขอบคุณที่ให้บริการ</font><br>
	          <p>You have sucessfully logged out of this service. </p>
	      <p>Your configuration is perform update</p>
            <p><em>Thank you for using Java WebMail Project!</em> </p>
		</center></font>
			<% session.invalidate(); %>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td><font size="-2" face="Arial, Helvetica, sans-serif">&copy;2001 Pjung & Pommy All rights reserved.</font></td>
  </tr>
</table>
</body>
</html>
