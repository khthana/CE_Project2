<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
include('dbconnect.inc');
$flag = 0;
if($Submit)
{
	$oldpass = trim($oldpass);
	$newpass = trim($newpass);
	$confpass = trim($confpass);
	if($newpass != $confpass)
	{
		$flag = 1;
	}else
	{
		$sql = "select Password from MEMBER where LoginName = '$admin' and MemberStatus = 'A'";
		$result = mysql_db_query($dbname,$sql);
		$realpass = mysql_fetch_array($result);
		$sql = "select password('$oldpass')  from MEMBER ";
		$result2 = mysql_db_query($dbname,$sql);
		$realoldpass = mysql_fetch_array($result2);
		$realoldpass[0] = substr($realoldpass[0],0,10);
		if ($realpass[0] != $realoldpass[0])
		{
			$flag = 2;
		}else
		{
			  	$sql1 = "update MEMBER set Password = password('$newpass')  where LoginName= '$admin' and MemberStatus = 'A'";
				$result = mysql_db_query($dbname,$sql1);
				echo mysql_error();
				header ("Location: db_detail.php");  
		}
	}
}
?>

<html>

<head>

<title>Change Admin's Password</title>

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



<body bgcolor="#9999CC">

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">

  <tr>

    <td>&nbsp;</td>

  </tr>

</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="90%">

  <tr>

    <td width="50">&nbsp;</td>

    <td bgcolor="#FFFFCC" valign="top" align="center">
		<?
			if ($flag == 1)
			{
		?>
      <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#3333FF">New Password ไม่ตรงกับ Confirm Password</font></p>
		<?
			}elseif ($flag ==2)
			{
		?>
      <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#3333FF">Old Password ผิด</font></p>
		<?
			}else
			{
		?>
      <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#3333FF">เปลี่ยน 
        Password</font></p>
		<?
			}
		?>
      <form method="post" action="change_pass.php">
        <table width="50%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="53%"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF">Old 
                Password</font></div>
            </td>
            <td width="47%"> 
              <div align="center"> 
                <input type="password" name="oldpass" maxlength="10" size="15">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="53%"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF3333">New 
                Password</font></div>
            </td>
            <td width="47%"> 
              <div align="center"> 
                <input type="password" name="newpass" maxlength="10" size="15">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="53%"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF3333">Confirm 
                Password</font></div>
            </td>
            <td width="47%"> 
              <div align="center"> 
                <input type="password" name="confpass" maxlength="10" size="15">
              </div>
            </td>
          </tr>
          <tr> 
            <td width="53%"> 
              <div align="center"> 
                <input type="reset" name="Reset" value="Reset">
              </div>
            </td>
            <td width="47%"> 
              <div align="center"> 
                <input type="submit" name="Submit" value="Submit">
              </div>
            </td>
          </tr>
        </table>
      </form>
      <p>&nbsp;</p>

		</td>

    <td width="50">&nbsp;</td>

  </tr>

</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">

  <tr>

    <td>&nbsp;</td>

  </tr>

</table>

</body>

</html>



