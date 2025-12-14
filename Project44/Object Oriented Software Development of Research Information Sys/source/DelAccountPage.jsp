<html>
<head>
<title>Del Account</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
<%@  page session="true"  %>
<%@  include file ="checksessionA.inc" %>
</head>

<body bgcolor="#FFFFCC">
<div id="Layer1" style="position:absolute; left:50px; top:50px; width:680px; z-index:1">
  <div align="center"> 
    <p><font color="#0000FF"><b><font face="Cordia New, CordiaUPC" size="6">ź 
      ACCOUNT </font></b></font></p>
    <p><img src="line.jpg" width="503" height="2"></p>
    <p>&nbsp;</p>
	<form name="DelAccount" action="DelAccount.jsp" >
      <table width="60%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="38%"> 
            <p align="right"><font face="Cordia New, CordiaUPC" size="5"><b><font color="#0000FF">Login</font></b></font></p>
          </td>
          <td width="4%"> 
            <p><font color="#0000FF"><b><font face="Cordia New, CordiaUPC" size="6"><a href="allform.jsp"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font face="Cordia New, CordiaUPC"><font face="Cordia New, CordiaUPC"><font size="4"><font size="6"><font size="5"></font></font></font></font></font></font></font></font></a></font></b></font></p>
          </td>
          <td width="58%"> <font face="Cordia New, CordiaUPC" size="4" color="#000000"> 
            <input type="text" name="loginname" size="15" maxlength="15">
            </font></td>
        </tr>
        <tr> 
          <td width="38%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="3"> 
            <div align="center"> 
              <input type="submit" name="ok" value="confirm">
            </div>
          </td>
        </tr>
      </table>
	</form>
    <p>&nbsp;</p>
    <p><img src="line.jpg" width="503" height="2"></p>
  </div>
</div>
</body>
</html>
