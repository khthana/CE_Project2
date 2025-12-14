<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>signup</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>

<body bgcolor="#FFFF99" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="showdata1.jsp">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="54" align="center" bgcolor="#FFFF99">&nbsp;</td>
    </tr>
    <tr> 
      <td height="34" align="center" bgcolor="#FFFF99">Select How to Show Data 
        in Database</td>
    </tr>
    <tr> 
      <td height="40" align="center" bgcolor="#FFFF99"> <select name="select" size="1">
          <option value="grade1" selected>&agrave;&iexcl;&Atilde;&acute;</option>
          <option value="name">&ordf;&times;&egrave;&Iacute;</option>
          <option value="institute1">&Ecirc;&para;&Ograve;&ordm;&Ntilde;&sup1;</option>
        </select> </td>
    </tr>
    <tr> 
      <td height="40" align="center" bgcolor="#FFFF99"><input type="submit" name="Submit" value="Submit"></td>
    </tr>
  </table>
</form>
</body>
</html>