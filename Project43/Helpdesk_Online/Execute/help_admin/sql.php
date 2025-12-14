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

			$select = strpos($sql_query,"s");

			if ($select===false)

			{

				$result = mysql_db_query($dbname,$sql_query );

				if ($result){ $flag = 0;}

				else

				 { 

					$flag = 1;

					session_register("errmsg");

					$errmsg = mysql_error();

				}

				$location = "Location: ".$target.$flag;

				header ($location);

				exit;			

			}elseif ($select == 0)

			{

				$select_flag = 1;

				$result = mysql_db_query($dbname,$sql_query );

				if ($result)

				{

					$table = mysql_field_table($result,1);

				}else

				{ 

					$flag = 1;

					session_register("errmsg");

					$errmsg = mysql_error();

  				$location = "Location: ".$target.$flag;

					header ($location);

					exit;

				}

			}else 

			{

				$result = mysql_db_query($dbname,$sql_query );

				if ($result){ $flag = 0;}

				else

				 { 

					$flag = 1;

					session_register("errmsg");

					$errmsg = mysql_error();

				}

				$location = "Location: ".$target.$flag;

				header ($location);

				exit;

			} 

		}elseif ($No)

		{

			$flag = 2;

			$location = "Location: ".$target.$flag;

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

			if ((isset ($table)) and ($table != ""))

			{

		?>

			<font color="#FF33FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>-&gt; Table <?echo $table?></b></font></p>

		<?

			}

		?>

		<?

			if ($sql_query == "drop")

			{

			   $sql_query = "drop table $table";

				$select_flag = 0;

				$target = 'db_detail.php?flag=';

			}elseif ($sql_query == "delete")

			{

				$sql_query = "delete  from $table";

				$select_flag = 0;

				$target = 'db_detail.php?flag=';

			}elseif ($sql_query == "dropfield")

			{

				$sql_query = "ALTER TABLE $table DROP $dropfield";

				$select_flag = 0;

				$target = "tbl_properties.php?table=$table&flag=";

			}elseif ($sql_query == "index")

			{

				$sql_query = "ALTER TABLE $table ADD INDEX($indexfield)";

				$select_flag = 0;

				$target = "tbl_properties.php?table=$table&flag=";

			}elseif ($sql_query == "unique")

			{

				$sql_query = "ALTER TABLE $table ADD UNIQUE($uniquefield)";

				$select_flag = 0;

				$target = "tbl_properties.php?table=$table&flag=";

			}elseif ($sql_query == "selectall")

			{

				$sql_query = "select *  from $table";

				$select_flag = 1;

			}elseif(!isset($Yes))

			{

				$select_flag = 0;

				$target = "db_detail.php?flag=";

			}

			if ($select_flag == 0)	

      	{

		?>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

        	<tr> 

          	<td width="8%" height="110">&nbsp;</td>

          	<td width="92%" height="110"> 

            	<form method="post" action="sql.php">

              <p><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF"><b>คุณต้องการทำคำสั่ง 

                <font color="#FF33FF"><?echo $sql_query;?></font></b></font></p>

              <p> 

       		  <input type="hidden" name="sql_query" value="<?echo $sql_query;?>">

       		  <input type="hidden" name="target" value="<?echo $target;?>">

                <input type="submit" name="Yes" value="Yes">

                <input type="submit" name="No" value="No">

              </p>

            	</form>

          	</td>

        	</tr>

      	</table>

		<?

			}else

			{ 

				$result = mysql_db_query($dbname,$sql_query );

				$num_row = mysql_numrows($result); 

				$num_field = mysql_num_fields($result); 

				if ($num_field == 0) 

				{ 

					echo '<b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">ตารางนี้ไม่มี  field  ใดๆ</font></b>';

		 		} else 

				{ 

				$p =0 ;

 		?>

		<table border="0" cellspacing="2" cellpadding="2">     

		<tr bgcolor="#CCFFCC"> 

		<?

				while ($field = mysql_fetch_field($result))

				{

		?>

          <td > 

            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF"><?echo $field->name ;?></font></b></div>

          </td>

 		<?

					if ($field->primary_key==1)

					{

						session_register("primary_field");

						$primary_field[$p] = $field->name;

						$p=$p+1;

					}

				} //end while field

		?>

		</tr>

		<?

				$count = 1;

				$i = 0;

				if ($num_row == 0) 

				{ 

					echo '</table>';

					echo '<p align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">ตารางนี้ยังไม่มีข้อมูล</font></b></p>';

		 		} else 

				{ 

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

        <tr bgcolor="<?echo $color;?>"> 

      <?

						for ($i=0;$i < $num_field;$i++)

						{

							$fieldname = mysql_field_name($result,$i);

							if ($fieldname == "Picture")

							{

								if (!empty($result_ary['Picture']))

								{

 									echo '<td><div align="center"><img src="showblob.php?loginname='.$result_ary['LoginName'].'"  width="150" height="150"></div></td>';

								}else

								{

                                 	echo '<td>&nbsp;</td>';

								}

							} else{

		?>

			<td > 

            <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><? echo htmlspecialchars($result_ary[$i]);?></font></div>

          </td>

		<?

						} //end picture

			$tmp = $i+1;

			if (($tmp == $num_field)and($p != 0))

			{

		?>

			<td > 

            <div align="left"><a href="row_delete.php?

			<?

				for ($k=0;$k < $p;$k++)

				{

					echo 'primary['.$k.']='.$result_ary[$primary_field[$k]].'&';

				}

			?>

			numpri=<? echo $p; ?>&table=<?echo $table;?>"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Delete</font></a></div>

          </td>

		<?

			}//end echo delete

						} // end for

		?>

 		<?

         			} // end while result

		?>

        </tr>

 		<?

         		} // end else result

		?>

		</table>

 		<?

			} //end else num_field == 0

		?>

		<?

			} //end select_flag

		?>

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



