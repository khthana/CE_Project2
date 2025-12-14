<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<body bgcolor="#FFFFFF" onLoad="" background="pic/background.jpg" >
<%
	String pass_authen=new String();
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if(pass_authen.equals("no")){%>
		<p><div align="center">wrong password</div>	
	<%}%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="23%" height="214">&nbsp;</td>
    <td width="56%" height="214" valign="top"> 
<form action="checkauthen.jsp" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="35%" height="119">&nbsp;</td>
            <td width="65%" height="119">&nbsp;</td>
        </tr>
        <tr> 
          <td height="40" width="35%">
            <div align="right"><img src="pic/login.gif" width="65" height="28"></div>
          </td>
          <td width="65%">&nbsp;
            <input type="text" name="login" size="12" maxlength="12">
          </td>
        </tr>
        <tr> 
          <td width="35%" height="40">
            <div align="right"><img src="pic/Password.gif" width="96" height="28"></div>
          </td>
          <td width="65%">&nbsp;
            <input type="password" name="password" size="8" maxlength="8">
          </td>
        </tr>
        <tr> 
          <td width="35%">&nbsp;</td>
          <td width="65%">
            <div align="center">
              <input type="submit" name="Submit" value="Submit">
              <input type="reset" name="Submit2" value="Reset">
            </div>
          </td>
        </tr>
      </table>
</form>
    </td>
    <td width="21%" height="214">&nbsp;</td>
  </tr>
</table>


</body>
</html>
