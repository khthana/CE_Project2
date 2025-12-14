<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}

if (isset($errmsg)){session_unregister("errmsg");}

	include('dbconnect.inc');
if ($Save)

{

		$sql = "ALTER TABLE ".$table." CHANGE ".$changefield;

		$sql .= " ".$field_name." ".$type;

		if ($length != "")

		{	$sql .= '('.$length.') ';}

		if ($attribute !="")

		{	$sql .= " ".$attribute;}

		if ($default !="")

		{ $sql  .= " DEFAULT '".$default."'";}

		if ($null !="null")

		{	$sql .= $null;}

		$result = mysql_db_query($dbname,$sql);

		if ($result){ $flag = 0;}

		else 

		{ 

			$flag = 1;

			$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

			session_register("errmsg");

			$errmsg = mysql_error();

			header ($location);

			exit;

		}

		if ($primary==1)

		{

			$sql_key = "SHOW KEYS FROM $table";

			$key_result = mysql_db_query($dbname,$sql_key);

			$j=0;

   		while ($key_resultarry=mysql_fetch_Array($key_result))

			{

				 if($key_resultarry['Key_name']=="PRIMARY")

				  {

						if ($key_resultarry['Column_name']!=$field_name)

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

			$alter .= " ".$field_name ;

			$alter .= ")";

			$result = mysql_db_query($dbname,$alter);

			if ($result){ $flag =0;}

			else 

			{

	 			$flag = 1;

				$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

				session_register("errmsg");

				$errmsg = mysql_error();

				header ($location);

				exit;

			}

		}elseif(!isset($primary))

		{

			$sql_key = "SHOW KEYS FROM $table";

			$key_result = mysql_db_query($dbname,$sql_key);

			$j=0;

			$k=0;

			$dropflag=false;

   		while ($key_resultarry=mysql_fetch_Array($key_result))

			{

				 if($key_resultarry['Key_name']=="PRIMARY")

				  {

						if ($key_resultarry['Column_name']==$field_name)

						{

							$dropflag=true;

							$k=$k+1;

						}else

						{

							$oldprimary[$j]=$key_resultarry['Column_name'];

							$j=$j+1;

						}

					}

			}

			$alter = "ALTER TABLE ". $table." DROP PRIMARY KEY";

			if ($j>0)

			{

				$alter .= ", ADD PRIMARY KEY (";

				$i=0;

				while ($i<$j)

				{

					$alter .= " ".$oldprimary[$i] ;

					$i = $i+1;

					if ($i<$j)

					{$alter .= " ,";}

				}

				$alter .= ")";

			}

			$result = mysql_db_query($dbname,$alter);

			if ($result){ $flag =0;}

			else 

			{

	 			$flag = 1;

				$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

				session_register("errmsg");

				$errmsg = mysql_error();

				header ($location);

				exit;

			}			

		}

		if ($extra == "AUTO_INCREMENT")

		{

				$change_auto = "ALTER TABLE ".$table." CHANGE ".$field_name;

				$change_auto .= " ".$field_name." ".$type;

				if ($length !="")

				{	$change_auto .= '('.$length.') ';}

				if ($attribute !="")

				{	$change_auto .= " ".$attribute;}

				if ($default !="")

				{ $change_auto  .= " DEFAULT '".$default."'";}

				if ($null !="null")

				{	$change_auto .= $null;}

				$change_auto .= " ".$extra;

				$result = mysql_db_query($dbname,$change_auto);

				if ($result){ $flag =0;}

				else 

				{

					$flag = 1;

					$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

					session_register("errmsg");

					$errmsg = mysql_error();

					header ($location);

					exit;

				}

		}



		$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

		header ($location);

		exit;

}else//not save

{

?>

<html>

<head>

<title>แก้ไข field ในตาราง</title>

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

        Edit Table <?echo $table?></b></font></p>

<?

	   $current = mysql_db_query($dbname, "SHOW FIELDS FROM $table LIKE '$changefield'");

	   $currentarry = mysql_fetch_array($current);

?>		

      <form method="post" action="tbl_change.php" name="create_tbl">

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

			<tr bgcolor= "#CCFFFF"> 

            <td width="15%" height="30"> 

              <input type="text" name="field_name" size="13" value="<? echo $changefield;?>">

            </td>

            <td width="17%" height="30"> 

				<?

					$left = strpos($currentarry['Type'],"(");

					if ($left ===false)

					{

						$field_length = "";

						$field_type = $currentarry['Type'];

					}else

					{

						$right = strpos($currentarry['Type'],")");

						$len = $right-$left-1;

						$field_length = substr($currentarry['Type'],$left+1,$len);

						$field_type = substr($currentarry['Type'],0,$left);

					}

					$space = strpos($currentarry['Type']," ");

					if ($left ===false)

					{

						$field_att = "";

					}else

					{

						$field_att = substr($currentarry['Type'],$space+1);

					}

				?>

              <select name="type">

                <option value="TINYINT" 

						<?

							if ($field_type=="tinyint"){echo "selected";}

						?>

					>TINYINT</option>

                <option value="SMALLINT"

						<?

							if ($field_type=="smallint"){echo "selected";}

						?>

					>SMALLINT</option>

                <option value="MEDIUMINT"

						<?

							if ($field_type=="mediumint"){echo "selected";}

						?>

					>MEDIUMINT</option>

                <option value="INT"

						<?

							if ($field_type=="int"){echo "selected";}

						?>

					>INT</option>

                <option value="BIGINT"

						<?

							if ($field_type=="bigint"){echo "selected";}

						?>

					>BIGINT</option>

                <option value="FLOAT"

						<?

							if ($field_type=="float"){echo "selected";}

						?>

					>FLOAT</option>

                <option value="DOUBLE"

						<?

							if ($field_type=="double"){echo "selected";}

						?>

					>DOUBLE</option>

                <option value="DECIMAL"

						<?

							if ($field_type=="decimal"){echo "selected";}

						?>

					>DECIMAL</option>

                <option value="DATE"

						<?

							if ($field_type=="date"){echo "selected";}

						?>

					>DATE</option>

                <option value="DATETIME"

						<?

							if ($field_type=="datetime"){echo "selected";}

						?>

					>DATETIME</option>

                <option value="TIMESTAMP"

						<?

							if ($field_type=="timestamp"){echo "selected";}

						?>

					>TIMESTAMP</option>

                <option value="TIME"

						<?

							if ($field_type=="time"){echo "selected";}

						?>

					>TIME</option>

                <option value="YEAR"

						<?

							if ($field_type=="year"){echo "selected";}

						?>

					>YEAR</option>

                <option value="CHAR"

						<?

							if ($field_type=="char"){echo "selected";}

						?>

					>CHAR</option>

                <option value="VARCHAR"

						<?

							if ($field_type=="varchar"){echo "selected";}

						?>

					>VARCHAR</option>

                <option value="TINYBLOB"

						<?

							if ($field_type=="tinyblob"){echo "selected";}

						?>

					>TINYBLOB</option>

                <option value="TINYTEXT"

						<?

							if ($field_type=="tinytext"){echo "selected";}

						?>

					>TINYTEXT</option>

                <option value="BLOB"

						<?

							if ($field_type=="blob"){echo "selected";}

						?>

					>BLOB</option>

                <option value="TEXT"

						<?

							if ($field_type=="text"){echo "selected";}

						?>

					>TEXT</option>

                <option value="MEDIUMBLOB"

						<?

							if ($field_type=="mediumblob"){echo "selected";}

						?>

					>MEDIUMBLOB</option>

                <option value="MEDIUMTEXT"

						<?

							if ($field_type=="mediumtext"){echo "selected";}

						?>

					>MEDIUMTEXT</option>

                <option value="LONGBLOB"

						<?

							if ($field_type=="longblob"){echo "selected";}

						?>

					>LONGBLOB</option>

              </select>

            </td>

            <td width="14%" height="30"> 

              <input type="text" name="length" size="12" value="<? echo $field_length;?>">

            </td>

            <td width="15%" height="30">

				<select name="attribute">

                <option 

						<?

							if ($field_att==""){echo "selected";}

						?>

					> </option>

                <option value="BINARY"

						<?

							if ($field_att=="binary"){echo "selected";}

						?>

					>BINARY</option>

                <option value="UNSIGNED"

						<?

							if ($field_att=="unsigned"){echo "selected";}

						?>

					>UNSIGNED</option>

                <option value="UNSIGNED ZEROFILL"

						<?

							if ($field_att=="unsigned zerofill"){echo "selected";}

						?>

					>ZEROFILL</option>

              </select>

            </td>

            <td width="7%" height="30"> 

              <input type="text" name="default" size="8" value="<?echo $currentarry['Default'];?>">

            </td>

            <td width="11%" height="30"> 

              <select name="null">

                <option value=" not null" 

						<?

							if ($currentarry['Null']==""){echo "selected";}

						?>

					>not null</option>

                <option value="null"

						<?

							if ($currentarry['Null']=="YES"){echo "selected";}

						?>

				>null</option>

              </select>

            </td>

            <td width="4%" height="30"> 

              <div align="center"> 

                <input type="checkbox" name="primary" value="1" 

						<?

							if ($currentarry['Key']=="PRI"){echo "checked";}

						?>

				 >

              </div>

            </td>

            <td width="17%" height="30"> 

              <select name="extra">

                <option 

						<?

							if ($currentarry['Extra']==""){echo "selected";}

						?>

				 > </option>

                <option value="AUTO_INCREMENT"

						<?

							if ($currentarry['Extra']=="auto_increment"){echo "selected";}

						?>

				 > auto increment</option>

              </select>

            </td>

          </tr>

		  </table>

        <p align="center"> 

          <input type="hidden" name="table" value="<?echo $table?>">

          <input type="hidden" name="changefield" value="<?echo $changefield;?>">

          <input type="submit" name="Save" value="Save">

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

