<%@ page session="true" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
  <link rel=stylesheet href="style.css" type="text/css">
</head>
<BODY aLink=#ff9933 bgColor=#FFFFFF bottomMargin=0 leftMargin=0 link=#336699 
rightMargin=0 topMargin=0 vLink=#6699cc MARGINWIDTH="0" MARGINHEIGHT="0">

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
            <li><font face="Arial, Helvetica, sans-serif"><b><a href="help/index.html">Help</a></b></font></li>
          </td>
          <td width="81%" align="center" valign="middle">
<form action="servlet/jwma" method="post" enctype="application/x-www-form-urlencoded">
              <input type="hidden" name="acton" value="session">
			  <input type="hidden" name="todo" value="login"> 
              <center>
                <p> 
                <table border="0" width="50%">
                  <tr> 
                    <td><font face="Arial, Helvetica" color="#cc6600"><b>Username:</b></font></td>
                    <td> 
                      <input type="text" name="username" size="25">
                    </td>
                  </tr>
                  <tr> 
                    <td><font face="Arial, Helvetica" color="#cc6600"><b>Password:</b></font></td>
                    <td> 
                      <input type="password" name="password" size="25">
                    </td>
                  </tr>
                  <tr>
                    <td><font 
                  color=#cc6600 face="Verdana, Arial, Helvetica, sans-serif" 
                  size=2><b>Host:</b></td></font>
                    <td>
                      <select name="hostname">
                        <option value="chaokhun.kmitl.ac.th">@chaokhun</option>
                        <option value="diamond.ce.kmitl.ac.th">@diamond</option>
                      </select>
                    </td>
                  </tr>
                  <tr> 
                    <td colspan="2" align="center"> 
                      <input type="submit" value="Login" name="submit">
                      &nbsp;&nbsp;&nbsp; 
                      <input type="reset" name="reset" value="Reset">
                    </td>
                  </tr>
                </table>
              </center>
            </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td><font size="-2" face="arial, helvetica">&copy;2001 Pjung & Pommy All rights reserved. </font> </td>
  </tr>
</table>
</body>
</html>
 
