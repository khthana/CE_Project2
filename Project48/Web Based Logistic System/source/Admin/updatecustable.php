<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="91%" border="0" align="center">
  <tr>
    <td height="25">
	<?
	include "connect.inc.php";
	//print"$province";
	$sql="update customers set  cusid='$id', busname='$busname', name='$name', lname='$sername', att='$att', moo='$moo', email='$email', district='$district', amphur='$amphur', province='$province' , zipcode='$zipcode', telephone='$telephone', mobile='$mobile' where cusid='$id'";
	$result=mysql_db_query($dbname,$sql);
mysql_close();
print"<meta http-equiv=\"refresh\" content=\"0;URL=admin.php?file=customerdata.php\">";	
	?>
	</td>
  </tr>
  <tr>
    <td height="83">&nbsp;</td>
  </tr>
</table>
</body>
</html>
