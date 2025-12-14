<?

	session_start( );
include('dbconnect.inc');
	$sql = "select Rate,NumVote  from EXPERTIN where LoginName = '$expert' and CatID = '$CatID'";

	$result = mysql_db_query($dbname,$sql);
	$num = mysql_num_rows($result);
	if ($num != 0)
	{
	$ratearry = mysql_fetch_array($result);
	$rate = $ratearry['Rate'] + $score;
	$numvote = $ratearry['NumVote']+ 1;
	$sql = "update  EXPERTIN set Rate='$rate',NumVote='$numvote'  where LoginName = '$expert' and CatID = '$CatID'";
	$result = mysql_db_query($dbname,$sql);
	}
	header ("Location: $target");  

	exit;

?>

