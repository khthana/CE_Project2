<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
	include('dbconnect.inc');



	function have_sub ($dbname,$parentid)

	{	

		$sql = "select count(*) as num from CATEGORY where ParentID=$parentid";

		$result = mysql_db_query($dbname,$sql );

		$num = mysql_result($result,0,"num");

		return $num;

	}

	function recurprint ($dbname,$mname,$mid,$main,$sub)

	{

		$numchild=have_sub($dbname,$mid);

		if ($numchild!=0)

		{

			echo $sub.' = insFld('.$main.', gFld("'.$mname.'", "maindel.php?DID='.$mid.'")); ';

			$sql = "select CatID,CatName from CATEGORY where ParentID=$mid";

			$result = mysql_db_query($dbname,$sql);

			if (!$result){exit;}

			$main = $sub;

			$sub = $sub."1";

			while ($child = mysql_fetch_array($result))

			{

				recurprint ($dbname,$child["CatName"],$child["CatID"],$main,$sub);			

			}

		}else

		{

			echo 'insDoc('.$main.', gLnk(0, "'.$mname.'", "maindel.php?DID='.$mid.'")); ';

		}

	}

?>

<html>

<head>

<title>Un title page</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

<style type="text/css">

<!--

body {  margin: 0px  0px; padding: 0px  0px; font-family: "MS Sans Serif"; font-size: 12pt}

a:link { color: #005CA2; text-decoration: none; font-family: "MS Sans Serif"; font-size: 12pt}

a:visited { color: #005CA2; text-decoration: none; font-family: "MS Sans Serif"; font-size: 12pt}

a:active { color: #0099FF; text-decoration: underline; font-family: "MS Sans Serif"; font-size: 12pt}

a:hover { color: #0099FF; text-decoration: underline; font-family: "MS Sans Serif"; font-size: 12pt}

-->

</style>

<script src="function.js"></script>

</head>



<body bgcolor="#CCFFCC">

<?

echo '<script>';

$main = "foldersTree";

echo $main.' = gFld("<i>Main</i>", "maindel.php?DID=0"); ';

			$sql = "select CatID,CatName from CATEGORY where ParentID=0";

			$result = mysql_db_query($dbname,$sql);

			if (!$result){exit;}

			while ($child = mysql_fetch_array($result))

			{

				$sub = "aux1";

				recurprint ($dbname,$child["CatName"],$child["CatID"],$main,$sub);

			}

echo 'initializeDocument(); ';

echo  '</script>';

?>

</body>

</html>

