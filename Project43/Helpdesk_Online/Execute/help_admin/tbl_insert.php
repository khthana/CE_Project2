<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}

		if (isset($errmsg)){session_unregister("errmsg");}

	include('dbconnect.inc');

		$sql = "show fields from $table";

		$result = mysql_db_query($dbname,$sql);

		$numrow = mysql_num_rows($result);

		if ($save)

		{

			$i =0;

			$j =0;

			$insert_sql = "INSERT INTO " .$table ."(";

			while($result_ary = mysql_fetch_array($result))

			{

				if ($i == 0)

				{

					if ($value[$result_ary['Field']] != "")

					{

						$insert_sql .= $result_ary['Field'];

						$fieldarry[$i] = $result_ary['Field'];

						$typearry[$i] = $result_ary['Type'];

						$i = $i+1;						

					}

				}else

				{

					if ($value[$result_ary['Field']] != "")

					{

						$insert_sql .= ",".$result_ary['Field'];

						$fieldarry[$i] = $result_ary['Field'];

						$typearry[$i] = $result_ary['Type'];

						$i = $i+1;						

					}

				}				

			}

			$insert_sql .= ") VALUES(";

			$j=0;

			while ( $j<$i)

			{

				$ch_flag = strpos($typearry[$i],"CHAR");

				$tex_flag= strpos($typearry[$i],"TEXT");

				if ((!$ch_flag) or (!$tex_flag))

				{

					$insert_sql .= "'";

					$insert_sql .= $value[$fieldarry[$j]];

					$insert_sql .= "'";

					$j = $j+1;

					if ($j<$i)

					{	$insert_sql .= ",";}

				}else

				{

					$insert_sql .= $value[$fieldarry[$j]];

					$j = $j+1;

					if ($j<$i)

					{	$insert_sql .= ",";}

				}

			}

			$insert_sql .= ")";

			$result = mysql_db_query($dbname,$insert_sql);

			if ($result){ $flag = 0; }

			else 

			{ 

				$flag = 1;

				session_register("errmsg");

				$errmsg = mysql_error();

			}			

			$location = "Location: db_detail.php?flag=".$flag;

			header ($location);

			exit;

		}else{

?>

<html>

<head>

<title>Insert your data</title>

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

        Database </b></font></a><font color="#FF33FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>-&gt; 

        Insert into Table <?echo $table?></b></font></p>

		

      <form action=tbl_insert.php method=post>

        <input name=table type=hidden value=<?echo $table?>>

        <table border=0 cellspacing="2" cellpadding="2">

          <tr bgcolor="#CCFFCC"> 

            <th> 

              <div align="center"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2">Field</font></div>

            </th>

            <th> 

              <div align="center"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2">Type</font></div>

            </th>

            <th> 

              <div align="center"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2">Value</font></div>

            </th>

          </tr>

          <?

			$count = 1;

			while ($result_ary = mysql_fetch_array($result)) 

			{ 

				if ($count%2 == 1)

				{ 

					$color = "#CCFFFF";

				}else

				{

					$color = "#FFCCFF";

				}

				$count = $count + 1;

		?> 

          <tr bgcolor="<?echo $color?>"> 

            <td><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><?echo $result_ary['Field'];?></font></td>

            <td><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><?echo $result_ary['Type'];?></font></td>

            <td> 

              <input maxlength=50 name=value[<?echo $result_ary['Field'];?>] style="WIDTH: 300px">

            </td>

          </tr>

          <?

			} //end while $result_ary

		?> 

        </table>

        <p>

          <input type=submit value=Save name="save">

      </form>

      <p>&nbsp;</p>

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

<? } //end else $save?>

