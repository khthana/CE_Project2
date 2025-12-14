<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
	include('dbconnect.inc');
		if (!isset($flag))

		{ 

			$flag = 9;

		}

	function count_records ($db,$table)

	{	

		$result = mysql_db_query($db, "select count(*) as num from $table");

		$num = mysql_result($result,0,"num");

		echo $num;

	}



?>

<html>

<head>

<title>จัดการฐานข้อมูล</title>

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

      <p><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="4"><b>Helpdesk 

        Database</b></font></p>

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

      <p align="center"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2">cancle 

        change</font></p>

		<?

			}elseif ($flag == 1)

			{

		?>

      <p align="center"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2">error 

        when try to change because <?echo $errmsg;?></font></p>

      <?

			} //end flag

		$tables = mysql_list_tables($dbname); 

		$num_tables = @mysql_numrows($tables); 

		if ($num_tables == 0) 

		{ 

			echo "NoTablesFound";

		 } else 

		{ 

			$i = 0; 

			$count = 1;

 		?> 

      <table width="80%" border="0" cellspacing="2" cellpadding="2">

        <tr bgcolor="#CCFFCC"> 

          <td width="27%"> 

            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">Table</font></b></div>

          </td>

          <td colspan="5"> 

            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">Action</font></b></div>

          </td>

          <td width="18%"> 

            <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">Records</font></b></div>

          </td>

        </tr>

		<?

			while ($i < $num_tables) 

			{ 

				$table = mysql_tablename($tables, $i); 

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

          <td width="27%"> 

            <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><b><? echo $table;?></b></font></div>

          </td>

          <td width="12%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><a href="sql.php?sql_query=selectall&table=<? echo $table;?>">Select 

              All</a></font></div>

          </td>

          <td width="10%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><a href="tbl_insert.php?table=<?php echo $table;?>">Insert</a></font></div>

          </td>

          <td width="13%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><a href="tbl_properties.php?table=<?php echo $table;?>">Properties</a></font></div>

          </td>

          <td width="10%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><a href="sql.php?sql_query=drop&table=<? echo $table;?>">Drop</a></font></div>

          </td>

          <td width="10%"> 

            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><a href="sql.php?sql_query=delete&table=<? echo $table;?>">Empty</a></font></div>

          </td>

          <td width="18%"> 

            <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><? count_records($dbname,$table) ?></font></div>

            </td>

        </tr>

 		<?

         		$i++;

         	}

		?>

      </table>

		

      <?

		}

		?> 

      <p>&nbsp;</p>

      <table width="80%" border="0" cellspacing="2" cellpadding="2" height="150">
        <tr> 
          <td width="55%" bgcolor="#CCFFCC"><a href="inscat/add_category.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>เพิ่ม 
            Category ของคำถาม</b></font></a></td>
          <td width="45%" bgcolor="#CCFFCC"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>สร้างตารางใหม่</b></font></td>
        </tr>
        <tr> 
          <td width="55%" bgcolor="#CCFFCC"><a href="inscat/edit_category.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>แก้ไข 
            Category ของคำถาม</b></font></a></td>
          <td rowspan="6" height="84" bgcolor="#FFCCFF"> 
            <form method="post" action="tbl_create.php" name="create_table">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="11%">&nbsp;</td>
                  <td width="89%"> 
                    <p align="left"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="1">ชื่อตาราง 
                      :</font> 
                      <input type="text" name="table">
                    </p>
                    <p align="left"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="1">จำนวน 
                      Field :</font> 
                      <input type="text" name="num_fields" size=3>
                      <input type="submit" name="SQL2" value="GO">
                    </p>
                  </td>
                </tr>
              </table>
            </form>
            <font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"></font></td>
        </tr>
        <tr> 
          <td width="45%" bgcolor="#CCFFCC"><a href="inscat/del_category.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>ลบ 
            Category ของคำถาม</b></font></a></td>
        </tr>
        <tr> 
          <td width="55%" bgcolor="#CCFFCC"><a href="reset_rate.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>Reset 
            Rate</b></font></a></td>
        </tr>
        <tr> 
          <td width="55%" bgcolor="#CCFFCC"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><a href="reset_resrate.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>Reset 
            Response Rate</b></font></a></font></td>
        </tr>
        <tr> 
          <td width="55%" bgcolor="#CCFFCC"><a href="change_pass.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>เปลี่ยน 
            Password</b></font></a></td>
        </tr>
        <tr>
          <td width="55%" bgcolor="#CCFFCC"><a href="logout.php"><font color="#3333FF" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b>LogOut</b></font></a></td>
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

