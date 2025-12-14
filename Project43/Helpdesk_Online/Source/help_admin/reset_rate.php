<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
include('dbconnect.inc');

if($Yes)
{
	$sql = "update EXPERTIN set Rate = 0 , NumVote = 0";
	$result = mysql_db_query($dbname,$sql);
	echo mysql_error();
	header ("Location: db_detail.php");  
}elseif ($No)
{
	header ("Location: db_detail.php");  
}
?>

<html>

<head>

<title>Reset Rate</title>

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
      <p>&nbsp; </p>
		
      <form method="post" action="reset_rate.php">
        <p><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF"><b>คุณต้องการ 
          Reset Rate และ จำนวนครั้งในการให้คะแนน ให้เป็น 0</b></font></p>
        <p> 
          <input type="submit" name="Yes" value="Yes">
          <input type="submit" name="No" value="No">
        </p>
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



