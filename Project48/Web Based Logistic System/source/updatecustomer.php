<html>
<head>
<?
session_start();

?>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<br>
<br>
<br>
<table width="51%" border="0" align="center" cellspacing="0">
  <tr> 
    <td height="16" bgcolor="#FFCC00"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        .:: แก้ไข Password ::. </font></strong></div></td>
  </tr>
  <tr> 
    <td bgcolor="#FFCC00"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <form action="?file=datatool.php&file2=updatecustable.php" method="post">
          <tr bgcolor="#FFFFFF"> 
            <td width="43%"><strong>รหัสสมาชิก :</strong></td>
            <td width="57%"><? print"$sess_username";?></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td><strong>NewPassword :</strong></td>
            <td><input name="pass" type="password" id="pass" size="10" maxlength="10"></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td><strong>Re-Password :</strong></td>
            <td><input name="rpass" type="password" id="repass" size="10" maxlength="10"></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="ตกลง"></td>
          </tr>
        </form>
      </table></td>
  </tr>
  <tr> 
    <td><div align="center">&nbsp;&nbsp;</div></td>
  </tr>
  <tr>
    <td><div align="center"><a href="?file=datatool.php&file2=customer.php"><font color="#FF0000">&lt;&lt; 
        ย้อนกลับ</font></a></div></td>
  </tr>
</table>
</body>
</html>
