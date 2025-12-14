<%@ page import =" javax.servlet.http.*,javax.mail.*,java.io.*,javax.mail.internet.*" contentType="text/html; charset=windows-874"%>
<%
	String message="";
	String guser="";
	if(session.getAttribute("login")!=null){
		if(((String)session.getAttribute("login")).equals("no")){
			message="ÃËÑÊ¼èÒ¹äÁè¶Ù¡µéÍ§";
			if(session.getAttribute("user")!=null)
				guser=(String)session.getAttribute("user");			
		}
		session.removeAttribute("login");
		session.removeAttribute("user");
	}
%>
<html>
<head>
<title>ÃÐººÊÒÃÊ¹à·È½èÒÂÇÔ¨ÑÂáÅÐ»ÃÐàÁÔ³¼Å</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="stylesheet/mystylesheet.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
<center>
<table width="780" height="100%" border="0" cellpadding="0" cellspacing="0" background="image/background.gif">
  <tr>
      <td valign="top"> 
        <!-- Cover -->
		<br>
        <img src="image/band.gif" width="780" height="113" border="0"> 
        <br>
		<center>
		<font class="logintopic">·Ó¡ÒÃ Login à¢éÒÃÐºº</font><br>
		<center><font style="font:14px; color:#FF0000;"><%=message%></font></center>

		<form action="servlet/login" method="POST">
		    <table width="386" height="227" border="0" cellpadding="0" cellspacing="0" background="image/border.gif">
              <tr> 
                <td valign="bottom" align="right" height="90" width="135"> <font class="loginfont">User&nbsp;name&nbsp;:&nbsp;</font></td>
                <td valign="bottom" align="left"><input name="username"  type="text" size="20" style="BORDER:#2B2C6F thin solid; COLOR: #000000; BACKGROUND-COLOR:#FFFFFFF;font:12px" value="<%=guser%>"></td>
              </tr>
              <tr> 
                <td valign="top" align="right" height="30"> <font class="loginfont">Password&nbsp;:&nbsp;</font></td>
                <td valign="top" align="left"><input name="password" type="password" size="20" style="BORDER:#2B2C6F thin solid;COLOR:#000000; BACKGROUND-COLOR:#FFFFFFF;font:12px"></td>
              </tr>
              <tr> 
                <td></td>
                <td height="50" align="left" valign="top"><input name="login" type="submit" value="&nbsp;&nbsp;Login&nbsp;&nbsp;"  style="BORDER:#2B2C6F thin solid;COLOR:#2B2C6F;BACKGROUND-COLOR:#FDA96B;font:12px"></td>
              </tr>
              <tr> 
                <td height="57" colspan="2"></td>
              </tr>
            </table>
          </form>	
		</center>
		</td>
		<!-- Cover -->
  </tr>
</table></center>
</body>
</html>
