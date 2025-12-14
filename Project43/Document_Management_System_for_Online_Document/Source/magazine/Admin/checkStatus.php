<?
	$hostname = "localhost";
	$username = "magazine";
	$password = "magazine";
	$dbName = "magazine";
	mysql_connect($hostname,$username,$password) or die("can not connect!");

	$sql = "update article set art_status=\"$status\" where art_id=$art_id";
	$SQLresult = mysql_db_query($dbName,$sql);

	$sql = "select mem_id from article where art_id=$art_id";
	$SQLresult = mysql_db_query($dbName,$sql);
	$row = mysql_fetch_array($SQLresult);
	$sql = "select mem_email from member where mem_id=$row[mem_id]";
	$SQLresult = mysql_db_query($dbName,$sql);
	$row2 = mysql_fetch_array($SQLresult);

	$emailto = $row2[mem_email];
	$subject=" Re:please check new article";
	$header="From : writer";
	if ($status=="A") {
		$message =" now there is an approved article ";
		$action = "approved";
	}
	else {
		$message =" now there is an not approved article ";
		$action = "not approved";
	}
	mail($emailto,$subject,$message,$header);
	header("Location: ./articleAdmin.php?action=$action");
?>