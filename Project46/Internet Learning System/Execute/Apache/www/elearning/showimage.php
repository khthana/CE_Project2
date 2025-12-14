<?
	include("config.inc.php");

	// ติดต่อ database เพื่ออ่านข้อมูล
	mysql_connect($host,$iduser,$passwd);
	$sql = "select image from webboard_$table where No='$No'";
	$result = mysql_db_query($dbname,$sql);
	$row = mysql_fetch_row($result);

	// แสดงภาพ
	echo $row[0];

?>
