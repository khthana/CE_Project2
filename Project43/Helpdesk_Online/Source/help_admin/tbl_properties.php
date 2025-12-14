<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}

	include('dbconnect.inc');

		$sql = "SHOW FIELDS FROM $table";

		if (!isset($flag))

		{ 

			$flag = 9;

		}

		$fieldresult = mysql_db_query($dbname,$sql);

		$numfield = mysql_num_rows($fieldresult);

	?>

<html>

<head>

<title>Table Properties</title>

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

    <td bgcolor="#FFFFCC" valign="top" align="center" width="50">&nbsp;</td>

    <td bgcolor="#FFFFCC" valign="top" align="left" width="600"> 

      <p align="center"><a href="db_detail.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>Helpdesk 

        Database </b></font></a><font color="#FF33FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>-&gt; 

        Table <?echo $table?></b></font></p>

      <?

			if ($flag == 0)

			{      

		?> 

      <p align="center"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2">complete 

        change</font></p>

		<?

			}elseif ($flag == 2)

			{

		?>

      <p align="center"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2">cancle change</font></p>

      <?

			}elseif ($flag == 1)

			{

		?> 

      <p align="center"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2">error 

        when try to change because <?echo $errmsg;?></font></p>

      <?

			} //end flag

		?> 

      <table width="100%" border="0" cellspacing="2" cellpadding="2">

        <tr bgcolor="#CCFFCC"> 

          <td width="7%" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Field</font></b></font></div>

          </td>

          <td width="7%" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Type</font></b></font></div>

          </td>

          <td width="12%" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Attributes</font></b></font></div>

          </td>

          <td width="10%" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Default</font></b></font></div>

          </td>

          <td width="6%" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Null</font></b></font></div>

          </td>

          <td width="6%" height="22"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Primary</font></b></font></td>

          <td width="7%" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Extra</font></b></font></div>

          </td>

          <td colspan="5" height="22"> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Action</font></b></font></div>

          </td>

        </tr>

        <?

				$i=$i+1;

				$count = 1;

				while ($fieldarray = mysql_fetch_array($fieldresult)) 

				{

					if ($count%2 == 1)

					{ 

						$color = "#CCFFFF";

					}else

					{

						$color = "#FFCCFF";

					}

					$count = $count + 1;

					$attribute = strchr($fieldarray['Type']," ");

					$space = strpos($fieldarray['Type']," ");

					if ($space)

					{

						$type = substr($fieldarray['Type'],0,$space);

					}else

					{

						$type = $fieldarray['Type'];

					}

					if ($fieldarray['Key'] != "")

					{	

						$primaryfield[$i] = $fieldarray['Field'];

						$i=$i+1;

					}

			?> 

        <tr bgcolor="<?echo $color;?>"> 

          <td width="7%" height="30"> 

            <div align="left"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $fieldarray['Field'];?></font></div>

          </td>

          <td width="7%" height="30"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $type;?> 

              </font></div>

          </td>

          <td width="12%" height="30"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $attribute;?></font></div>

          </td>

          <td width="10%" height="30"> 

            <div align="right"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $fieldarray['Default'];?> 

              </font></div>

          </td>

          <td width="6%" height="30"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $fieldarray['Null'];?></font></div>

          </td>

          <td width="6%" height="30"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $fieldarray['Key'];?></font></div>

          </td>

          <td width="7%" height="30"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<? echo $fieldarray['Extra'];?></font></div>

          </td>

          <td width="6%" height="30"> 

            <div align="center"><font color="#3333FF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><a href="tbl_change.php?table=<?echo $table;?>&changefield=<?echo $fieldarray['Field'];?>">Change</a></font></div>

          </td>

          <td width="6%" height="30"> 

            <div align="center"><font color="#3333FF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><a href="sql.php?table=<?echo $table;?>&dropfield=<?echo $fieldarray['Field'];?>&sql_query=dropfield">Drop</a></font></div>

          </td>

          <td width="6%" height="30"> 

            <div align="center"><font color="#3333FF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><a href="tbl_primary.php?table=<?echo $table;?>&primaryfield=<?echo $fieldarray['Field'];?>">Primary</a></font></div>

          </td>

          <td width="10%" height="30"> 

            <div align="center"><font color="#3333FF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><a href="sql.php?table=<?echo $table;?>&indexfield=<?echo $fieldarray['Field'];?>&sql_query=index">Index</a></font></div>

          </td>

          <td width="9%" height="30"> 

            <div align="center"><font color="#3333FF" size="1" face="MS Sans Serif, Microsoft Sans Serif"><a href="sql.php?table=<?echo $table;?>&uniquefield=<?echo $fieldarray['Field'];?>&sql_query=unique">Unique</a> 

              </font></div>

          </td>

        </tr>

        <?

				}//end while fetch array

			?> 

      </table>

      <p><?

		$result = mysql_db_query($dbname, "SHOW KEYS FROM ".$table);

		if (!$result)

   	{

   		echo "MySQL error";

   	}else

   	{

   		if (mysql_num_rows($result)>0)

      	{

      ?> </p>

      <div align="left"></div>

      <table width="50%" border="0" cellspacing="2" cellpadding="2">

        <tr bgcolor="#CCFFCC"> 

          <td> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Key_Name</font></b></font></div>

          </td>

          <td> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Unique</font></b></font></div>

          </td>

          <td> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Field</font></b></font></div>

          </td>

          <td> 

            <div align="center"><font size="1"><b><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif">Action</font></b></font></div>

          </td>

        </tr>

        <?

      		for ($i=0 ; $i<mysql_num_rows($result); $i++)

          	{

          		$row = mysql_fetch_array($result);

					if ($i%2 == 0)

					{ 

						$color = "#CCFFFF";

					}else

					{

						$color = "#FFCCFF";

					}

		?> 

        <tr bgcolor= "<?echo $color;?>"> 

          <td height="29"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif"><? echo $row['Key_name'];?></font></div>

          </td>

          <td height="29"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif"> 

              <?

					  if($row['Key_name']=="PRIMARY")

					  {

						$typeflag = "PRIMARY";

					  }elseif ($row['Non_unique']=="0")

                    {

                       echo 'Yes';

						$typeflag = "UNIQUE";

                    }else

                    {

                       echo 'No';

						$typeflag = "INDEX";

                    }?> </font></div>

          </td>

          <td height="29"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif"><?php echo $row['Column_name'];?></font></div>

          </td>

          <td height="29"> 

            <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif"><a href="tbl_dropkey.php?table=<?echo $table;?>&amp;typeflag=<?echo $typeflag;?>&amp;keyname=<?echo $row['Key_name'];?>">Drop</a></font></div>

          </td>

        </tr>

        <?

          	}//end for

?> 

      </table>

      <?

     }//end if numrow

   }//end else result

?>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr> 

          <td width="92%"><img src="image/circle.gif" width="15" height="15"> 

            <a href="sql.php?sql_query=selectall&table=<?echo $table;?>"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#3333FF">Select 

            All</font></a></td>

        </tr>

        <tr> 

          <td width="92%"><img src="image/circle.gif" width="15" height="15"> 

            <a href="tbl_insert.php?table=<?echo $table;?>"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#3333FF">Insert 

            New Row</font></a></td>

        </tr>

        <tr align="left" valign="middle"> 

          <td> 

            <form method="post" action="tbl_addfield.php" name="addfield">

              <img src="image/circle.gif" width="15" height="15"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#3333FF"> 

              Add New field : </font> 

              <input type="text" name="num_fields" maxlength="2" size="3" value="1">

              <input type="submit" name="Add" value="Add">

              <input type="hidden" name="table" value="<?echo $table;?>">

            </form>

          </td>

        </tr>

        <tr align="left" valign="middle"> 

          <td> 

            <form method="post" action="tbl_rename.php" name="renametbl">

              <img src="image/circle.gif" width="15" height="15"> <font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#3333FF">Rename 

              Table to : 

              <input type="text" name="newname">

              <input type="submit" name="Rename" value="Rename">

              <input type="hidden" name="table" value="<?echo $table;?>">

              </font> 

            </form>

          </td>

        </tr>

      </table>

      <p>&nbsp;</p>

    </td>

    <td width="50" bgcolor="#FFFFCC">&nbsp;</td>

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