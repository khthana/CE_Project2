<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
	include('dbconnect.inc');

		if ($Submit)

		{

			$sql3 = "select CatName from CATEGORY where CatName='$newcat'and ParentID='$parentid'";

			$result = mysql_db_query($dbname,$sql3);

			$nrow = mysql_numrows($result);

			if ($nrow!=0)

			{

			header ("Location: init.php?flag=1");  

			exit;					

			}

			$sql2 = "insert into  CATEGORY (CatName,ParentID) values("."'".$newcat."'".","."'".$parentid."'".")";

			$result = mysql_db_query($dbname,$sql2);			

			header ("Location: init.php?flag=0");  

			exit;					

		}else

		{

			if ($PID != 0)

			{

				$sql1 = "select CatID,CatName from CATEGORY where CatID=$PID";

				$result = mysql_db_query($dbname,$sql1);

				$parent = mysql_fetch_array($result);

				$parentname = $parent["CatName"];

				$parentid = $parent["CatID"];

			}else

			{

				$parentname = "main category";

				$parentid = 0;

			}

?>

<html>

<head>

<title>Un title page</title>

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



<body bgcolor="#FFFFCC">

<div align="center">

  <p>&nbsp;</p>

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">เพิ่ม 

    Category</font></p>

  <form method="post" action="main.php" name="ins_cat">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr> 

        <td width="50%"> 

          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF">Parent 

            Category : </font></div>

        </td>

        <td width="50%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<? echo $parentname; ?> 

          <input type="hidden" name="parentid" value="<?echo $parentid;?>">

        </td>

      </tr>

      <tr> 

        <td width="50%"> 

          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF">New 

            Category : </font></div>

        </td>

        <td width="50%"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF"> 

          &nbsp;&nbsp;&nbsp<input type="text" name="newcat">

          </font></td>

      </tr>

      <tr>

        <td width="50%">&nbsp;</td>

        <td width="50%">&nbsp;</td>

      </tr>

      <tr> 

        <td width="50%"> 

          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF"> 

            <input type="reset" name="Reset" value="Reset">

            </font></div>

        </td>

        <td width="50%"> 

          <div align="left">

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="Submit">

          </div>

        </td>

      </tr>

    </table>

  </form>

  <p>&nbsp;</p>

</div>

</body>

</html>

<?	

		} // end else $submit

?>

