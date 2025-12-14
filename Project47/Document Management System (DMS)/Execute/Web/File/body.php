<?php
session_start();
session_unregister("user");
session_unregister("pass");
if($Log="1") {session_destroy();}
?>
<html>
<head>
<title>DMS Project : Login Window</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body bgcolor="#FFFFCC" leftMargin=0 topMargin=0>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td width="308" height="176" background="client/pictures/login.gif"><form action="client/client.php" method="post" name="form1" target="_top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="135" height="31" scope="col">&nbsp;</td>
            <th height="31" scope="col">&nbsp;</th>
          </tr>
          <tr>
            <td width="135" scope="row">&nbsp;</td>
            <td><input name="user" type="text" id="user"></td>
          </tr>
          <tr>
            <td width="135" scope="row">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="135" scope="row">&nbsp;</td>
            <td><input name="pass" type="password" id="pass"></td>
          </tr>
          <tr>
            <td width="135" scope="row">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td scope="row">&nbsp;</td>
            <td><input type="submit" name="Submit" value="OK">
            
              <input type="reset" name="Submit2" value="Clear"></td>
          </tr>
        </table>
        </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="300"><a href="client/admin.php" target="_top"><img src="client/pictures/adminclickhere.gif" width="182" height="26" border="0"></a></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
