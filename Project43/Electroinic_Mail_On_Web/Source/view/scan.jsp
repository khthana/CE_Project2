<%@ page session="true" import="dtw.webmail.model.*" %>

<html>

<head>
        <title>Java WebMail Project</title>
         <link rel=stylesheet href="style.css" type="text/css">
	<script language="javascript">
	<!--
		function closeWindow(){
			window.close();
		}
	-->
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
    Integer result= (Integer)session.getAttribute("jwma.scanresult");
    JwmaHtmlHelper htmlhelper= (JwmaHtmlHelper)session.getValue("jwma.htmlhelper");
%>
<%-- Prepare references for use in the page --%>
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
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="help/index.html">Help</a><br>
              <br>
              </b></font></li>
            
            <li><b><font face="Arial, Helvetica, sans-serif"><a href="<%= htmlhelper.getControllerUrl() %>?acton=session&amp;todo=logout">Logout</a></font></b></li>
          </td>
          <td width="81%" valign="top"> 
		<font color=#cc6600>
            <p><center> scan file is complete
                <% if(result.intValue()==0){
                      out.println("not a virus");
                    }else{out.println("visus sure");}
      		%>
                <br>
                <a href=javascript:closeWindow();>close</a>
		</center>	
            </p></font>
			
		</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td><font size=-2 face=ARIAL,HELVETICA>&copy; 2001 Pjung & Pommy All rights reserved.</font></td>
  </tr>
</table>
</font>
</body>
</html>
