<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}

if (isset($errmsg)){session_unregister("errmsg");}

if ($create)

{
	include('dbconnect.inc');

		$sql = "CREATE TABLE ".$table.'( ';

		$i = 0;

		$j = 0;

		$k = 0;

		while ($i<$num_fields)

		{

			$sql .= $field_name[$i]." ".$type[$i];

			if ($length[$i] !="")

			{	$sql .= '('.$length[$i].') ';}



			if ($attribute[$i] !="")

			{	$sql .= " ".$attribute[$i];}



			if ($default[$i] !="")

			{ $sql  .= " DEFAULT '".$default[$i]."'";}



			if ($null[$i] !="null")

			{	$sql .= $null[$i];}



			if ((isset($primary))and($primary[$j]==$i))

			{

				$primary_key[$j] = $field_name[$i];

				$j = $j+1;

			}

			if ($extra[$i] == "AUTO_INCREMENT")

			{

				$auto[$k] = $i;

				$k =$k+1;

			}

			$i = $i+1;

			if ($i < $num_fields)

			{	$sql .= " , "; }



		}

			$sql .= ")";

		$result = mysql_db_query($dbname,$sql);

		if ($result){ $flag = 0;}

		else 

		{ 

			$flag = 1;

			$location = "Location: db_detail.php?flag=".$flag;

			session_register("errmsg");

			$errmsg = mysql_error();

			header ($location);

			exit;

		}

			

		if ($j != 0)

		{

			$alter = "ALTER TABLE ". $table." DROP PRIMARY KEY, ADD PRIMARY KEY (";

			$i=0;

			while ($i<$j)

			{

				$alter .= " ".$primary_key[$i] ;

				$i = $i+1;

				if ($i < $j)

				{  $alter .= " ,"; 	}

			}

			$alter .= ")";

			$result = mysql_db_query($dbname,$alter);

			if ($result){ $flag =0;}

			else 

			{

	 			$flag = 1;

				$location = "Location: db_detail.php?flag=".$flag;

				session_register("errmsg");

				$errmsg = mysql_error();

				header ($location);

				exit;

			}

		}

		if ($k != 0)

		{

			$i=0;

			while ($i<$k)

			{

				$change_auto = "ALTER TABLE ".$table." CHANGE ".$field_name[$auto[$i]];

				$change_auto .= " ".$field_name[$auto[$i]]." ".$type[$auto[$i]];

				if ($length[$auto[$i]] !="")

				{	$change_auto .= '('.$length[$auto[$i]].') ';}

				if ($attribute[$auto[$i]] !="")

				{	$change_auto .= " ".$attribute[$auto[$i]];}

				if ($default[$auto[$i]] !="")

				{ $change_auto  .= " DEFAULT '".$default[$auto[$i]]."'";}

				if ($null[$i] !="null")

				{	$change_auto .= $null[$auto[$i]];}

				$change_auto .= " ".$extra[$auto[$i]];

				$i = $i+1;

				$result = mysql_db_query($dbname,$change_auto);

				if ($result){ $flag =0;}

				else 

				{

					$flag = 1;

					$location = "Location: db_detail.php?flag=".$flag;

					session_register("errmsg");

					$errmsg = mysql_error();

					header ($location);

					exit;

				}

			}			

		}



		$location = "Location: db_detail.php?flag=".$flag;

		header ($location);

		exit;

}else

{

?>

<html>

<head>

<title>สร้างตารางใหม่</title>

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

        Create Table <?echo $table?></b></font></p>

		

      <form method="post" action="tbl_create.php" name="create_tbl">

        <table width="85%" border="0" cellspacing="2" cellpadding="2">

          <tr bgcolor="#CCFFCC"> 

            <td width="15%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Field</font></b></font></div>

            </td>

            <td width="17%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Type</font></b></font></div>

            </td>

            <td width="14%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Length/Set</font></b></font></div>

            </td>

            <td width="15%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Attributes</font></b></font></div>

            </td>

            <td width="7%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Default</font></b></font></div>

            </td>

            <td width="11%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Null</font></b></font></div>

            </td>

            <td width="4%"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Primary</font></b></font></td>

            <td width="17%"> 

              <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Extra</font></b></font></div>

            </td>

          </tr>

          <?

				$i =0;

				$count = 1;

				while ($i < $num_fields)

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

          <tr bgcolor="<?echo $color;?>"> 

            <td width="15%" height="30"> 

              <input type="text" name="field_name[]" size="13">

            </td>

            <td width="17%" height="30"> 

              <select name="type[]">

                <option value="TINYINT" selected>TINYINT</option>

                <option value="SMALLINT">SMALLINT</option>

                <option value="MEDIUMINT">MEDIUMINT</option>

                <option value="INT">INT</option>

                <option value="BIGINT">BIGINT</option>

                <option value="FLOAT">FLOAT</option>

                <option value="DOUBLE">DOUBLE</option>

                <option value="DECIMAL">DECIMAL</option>

                <option value="DATE">DATE</option>

                <option value="DATETIME">DATETIME</option>

                <option value="TIMESTAMP">TIMESTAMP</option>

                <option value="TIME">TIME</option>

                <option value="YEAR">YEAR</option>

                <option value="CHAR">CHAR</option>

                <option value="VARCHAR">VARCHAR</option>

                <option value="TINYBLOB">TINYBLOB</option>

                <option value="TINYTEXT">TINYTEXT</option>

                <option value="BLOB">BLOB</option>

                <option value="TEXT">TEXT</option>

                <option value="MEDIUMBLOB">MEDIUMBLOB</option>

                <option value="MEDIUMTEXT">MEDIUMTEXT</option>

                <option value="LONGBLOB">LONGBLOB</option>

              </select>

            </td>

            <td width="14%" height="30"> 

              <input type="text" name="length[]" size="12">

            </td>

            <td width="15%" height="30"> 

              <select name="attribute[]">

                <option selected> </option>

                <option value="BINARY">BINARY</option>

                <option value="UNSIGNED">UNSIGNED</option>

                <option value="UNSIGNED ZEROFILL">ZEROFILL</option>

              </select>

            </td>

            <td width="7%" height="30"> 

              <input type="text" name="default[]" size="8">

            </td>

            <td width="11%" height="30"> 

              <select name="null[]">

                <option value=" not null" selected>not null</option>

                <option value="null">null</option>

              </select>

            </td>

            <td width="4%" height="30"> 

              <div align="center"> 

                <input type="checkbox" name="primary[]" value="<?echo $i;?>">

              </div>

            </td>

            <td width="17%" height="30"> 

              <select name="extra[]">

                <option selected> </option>

                <option value="AUTO_INCREMENT">auto increment</option>

              </select>

            </td>

          </tr>

          <?

					$i=$i+1;

				}//end while $i < $num_fields

			?> 

        </table>

        <p align="center">

          <input type="hidden" name="num_fields" value="<?echo $num_fields?>">

          <input type="hidden" name="table" value="<?echo $table?>">

          <input type="submit" name="create" value="Create">

        </p>

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

<? } //end else $create?>

