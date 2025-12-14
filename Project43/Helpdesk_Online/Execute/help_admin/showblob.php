<? 

	include('dbconnect.inc');
	$sql = "select Picture from  MEMBER where LoginName= '$loginname'";

	$result = mysql_db_query($dbname,$sql);

  $row = mysql_fetch_row($result);

	header ("Content-type: image/gif");  

	echo $row[0];

?>

