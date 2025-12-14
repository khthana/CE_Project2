<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}

	include('dbconnect.inc');

		$sql = "ALTER TABLE ".$table." RENAME ".$newname;

		$result = mysql_db_query($dbname, $sql);

		if ($result)

		{ 

			$flag = 0;

			$table = $newname;

		}

		else

		 { 

			$flag = 1;

			session_register("errmsg");

			$errmsg = mysql_error();

		}

		$location = "Location: tbl_properties.php?table=".$table."&flag=".$flag;

		header ($location);

		exit;			

?>

