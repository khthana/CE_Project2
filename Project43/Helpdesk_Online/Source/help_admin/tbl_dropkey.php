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

			$result = mysql_db_query($dbname,$sql_query );

			if ($result){ $flag = 0;}

			else

			 { 

				$flag = 1;

				session_register("errmsg");

				$errmsg = mysql_error();

			}

			$location = "Location: tbl_properties.php?table=$table&flag=$flag";

			header ($location);

			exit;			

		}elseif ($No)

		{

			$flag = 2;

			$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

			header ($location);

			exit;

		}		

?>

<html>

<head>

<title>Run Your SQL Query</title>

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

      <p><a href="db_detail.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>Helpdesk 

        Database  </b></font></a>

		<?

			if (isset ($table))

			{

		?>

			<font color="#FF33FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>-&gt; Table <?echo $table?></b></font></p>

		<?

			}

		?>

		<?

			if ($typeflag == "PRIMARY")

			{

			   $sql_query = "ALTER TABLE $table DROP PRIMARY KEY";

			}elseif ($typeflag =="UNIQUE")

			{

				$sql_query = "ALTER TABLE $table DROP INDEX $keyname";

			}elseif ($typeflag == "INDEX")

			{

				$sql_query = "ALTER TABLE $table DROP INDEX $keyname";

			}

		?>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

        	<tr> 

          	<td width="8%" height="110">&nbsp;</td>

          	<td width="92%" height="110"> 

            	<form method="post" action="tbl_dropkey.php">

              <p><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF"><b>คุณต้องการทำคำสั่ง 

                <font color="#FF33FF"><?echo $sql_query;?></font></b></font></p>

              <p> 

       		  <input type="hidden" name="sql_query" value="<?echo $sql_query;?>">

       		  <input type="hidden" name="table" value="<?echo $table;?>">

				  <input type="submit" name="Yes" value="Yes">

                <input type="submit" name="No" value="No">

              </p>

            	</form>

          	</td>

        	</tr>

      	</table>

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



