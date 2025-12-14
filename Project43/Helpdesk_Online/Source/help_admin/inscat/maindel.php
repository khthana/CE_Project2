<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
	include('dbconnect.inc');

		function delsub($dbname,$mainid)

		{

			$sql5 = "select CatID from CATEGORY where ParentID=$mainid";

			$result5 = mysql_db_query($dbname,$sql5);

			$nrow = mysql_num_rows($result5);

			if ($nrow !=0)

			{

				while($sub = mysql_fetch_array($result5))

				{

					delsub($dbname,$sub["CatID"]);

					$sql2 = "delete from  CATEGORY where CatID = $mainid";
					$result = mysql_db_query($dbname,$sql2);

					$sql2 = "update QUESTIONS set CatID= -1 where CatID=$mainid";
					$result = mysql_db_query($dbname,$sql2);

					$sql2 = "delete from  EXPERTIN where CatID = $mainid";
					$result = mysql_db_query($dbname,$sql2);

				}

			}else

			{

				$sql2 = "delete from  CATEGORY where CatID = $mainid";
				$result = mysql_db_query($dbname,$sql2);

				$sql2 = "update QUESTIONS set CatID= -1 where CatID=$mainid";
				$result = mysql_db_query($dbname,$sql2);

				$sql2 = "delete from  EXPERTIN where CatID = $mainid";
				$result = mysql_db_query($dbname,$sql2);

			}

		}



		if ($Yes)

		{

			$sql3 = "select CatID from CATEGORY where ParentID=$delcatid";

			$result = mysql_db_query($dbname,$sql3);

			delsub($dbname,$delcatid);

			header ("Location: initdel.php?flag=0");  

			exit;					

		}elseif($No)

		{

			header ("Location: initdel.php");  

			exit;								

		}else

		{

			if ($DID != 0)

			{

				$sql1 = "select CatID,CatName from CATEGORY where CatID=$DID";

				$result = mysql_db_query($dbname,$sql1);

				$nrow = mysql_numrows($result);

				if ($nrow!=0)

				{

					$delcat = mysql_fetch_array($result);

					$delcatname = $delcat["CatName"];

					$delcatid = $delcat["CatID"];

				}else 

				{

					header ("Location: initdel.php?flag=1");  

					exit;								

				}

			}else

			{

				$delcatname = "main category";

				$delcatid = 0;

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

  <p align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">คุณต้องการลบ 

    Category <? echo $delcatname; ?> และ Subcategory ของ <? echo $delcatname; ?></font></p>

  <p align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">และจะทำการแก้ 

    CatID ของคำถามที่อยู่ใน <? echo $delcatname; ?> เป็น -1</font></p>

  <form method="post" action="maindel.php" name="del_cat">

    <input type="submit" name="No" value="No">

    <input type="submit" name="Yes" value="Yes">

    <input type="hidden" name="delcatid" value="<?echo $delcatid;?>">

  </form>

  <p>&nbsp;</p>

</div>

</body>

</html>

<?	

		} // end else $submit

?>

