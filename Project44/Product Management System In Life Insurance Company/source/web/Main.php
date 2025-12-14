<html>
<head>
<title>INSURANCE SYSTEM </title>
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
</head>

<body bgcolor="#FFFFFF">
  <form name="login" method="POST" action="login.php">
  <table width="74%" border="0" bgcolor="#FFFFFF">
    <tr> 
      <td colspan="3"><img src="Pic/LOGO.gif" width="750" height="74"></td>
  </tr>
  <tr> 
    <td height="28" colspan="3"><left> 
      <table width="100%" border="0">
        <tr> 
          <td>
            <div align="center">
                <input type="radio" name="check" value="manager" >
                <img src="Pic/Manager.gif" width="250" height="28"> 
            </div>
          </td>
            <td valign="top"> 
              <div align="center"> 
                <input type="radio" name="check" value="secretary">
                <img src="Pic/Secretary.gif" width="250" height="28"></div>
          </td>
            <td valign="top"> 
              <div align="center">
                <input type="radio" name="check" value="agent">
                <img src="Pic/Agent.gif" width="250" height="28"></div>
          </td>
        </tr>
      </table>
      <img src="Pic/space.gif" width="1" height="1"></left> </td>
  </tr>

  <tr> 
      <td height="201" width="20%">&nbsp;</td>
    <td height="184" width="43%"> 
        <table width="290" border="0" bgcolor="#FFFFFF" background="Pic/Login.gif" height="77" align="center">
          <tr> 
            <td width="47%"> 
              <div align="right"> :</div>
            </td>
            <td width="53%"> 
              <input type="text" name="login">
            </td>
          </tr>
          <tr> 
            <td width="47%"> 
              <div align="right"></div>
            </td>
            <td width="53%"> 
              <input type="password" name="pwd">
            </td>
          </tr>
        </table>
        <div align="center">
          <p><input type="submit" name="Submit" value="Login !">
        </p></div>
       <div align="center"> </div>
    </td>
      <td height="201" width="20%" align="right" valign="bottom">&nbsp;</td>
  </tr>
</table>   
</form>
</body>
</html>
