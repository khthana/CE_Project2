<?

	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
	include('dbconnect.inc');
		$sql_query = "delete  from $table where ";

		for ($k=0;$k < $numpri;$k++)

		{

			$sql_query .= $primary_field[$k]."='".$primary[$k]."'";

			$tmp = $k+1;

			if ($tmp != $numpri)

			{$sql_query .= " and ";}

		}

		$result = mysql_db_query($dbname,$sql_query );

		if ($result){ $flag = 0;}

		else

		 { 

			$flag = 1;

			session_register("errmsg");

			$errmsg = mysql_error();

		}

		session_unregister("errmsg");

		$location = "Location: sql.php?table=$table&sql_query=selectall&flag=$flag";

		header ($location);

		exit;

?>

