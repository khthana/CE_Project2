<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}

		if (isset($errmsg)){session_unregister("errmsg");}

	include('dbconnect.inc');

		$sql_query = trim($sql_query);

		$sql_query = stripslashes($sql_query);

		if ($Yes)

		{

			$result = mysql_db_query($dbname,$alter);

			if ($result)

			{ 

				$flag =0;

				$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

				session_register("errmsg");

				$errmsg = mysql_error();

				header ($location);

				exit;

			}

			else 

			{

	 			$flag = 1;

				$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

				session_register("errmsg");

				$errmsg = mysql_error();

				header ($location);

				exit;

			}

		}elseif ($No)

		{

			$flag = 2;

			$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

			header ($location);

			exit;

		}else

		{

?>

<html>

<head>

<title>Set Primary</title>

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

<?

			$sql_key = "SHOW KEYS FROM $table";

			$key_result = mysql_db_query($dbname,$sql_key);

			$j=0;

   		while ($key_resultarry=mysql_fetch_Array($key_result))

			{

				 if($key_resultarry['Key_name']=="PRIMARY")

				  {

						if ($key_resultarry['Column_name']!=$primaryfield)

						{

							$oldprimary[$j]=$key_resultarry['Column_name'];

							$j=$j+1;

						}

					}

			}

			$alter = "ALTER TABLE ". $table." DROP PRIMARY KEY, ADD PRIMARY KEY (";

			$i=0;

			while ($i<$j)

			{

				$alter .= " ".$oldprimary[$i] ;

				$i = $i+1;

				$alter .= " ,";

			}

			$alter .= " ".$primaryfield ;

			$alter .= ")";

?>

  <tr>

    <td width="50">&nbsp;</td>

    <td bgcolor="#FFFFCC" valign="top" align="center">

      <p><a href="db_detail.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>Helpdesk 

        Database  </b></font></a>

			<font color="#FF33FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>-&gt; Table <?echo $table?></b></font></p>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

        	<tr> 

          	<td width="8%" height="110">&nbsp;</td>

          	<td width="92%" height="110"> 

            	

            <form method="post" action="tbl_primary.php">

              <p><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF"><b>คุณต้องการทำคำสั่ง 

                <font color="#FF33FF"><?echo $alter;?></font></b></font></p>

              <p> 

                <input type="hidden" name="alter" value="<?echo $alter;?>">

                <input type="hidden" name="table" value="<?echo $table?>">

                <input type="submit" name="Yes" value="Yes">

                <input type="submit" name="No" value="No">

              </p>

            	</form>

          	</td>

        	</tr>

      	</table>

  </tr>

</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">

  <tr>

    <td>&nbsp;</td>

  </tr>

</table>

</body>

</html>

<?

		}//endelse

?>