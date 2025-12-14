<?
	require('connect.php');
	$sql="delete from temp where id_temp=$id_temp";
	$result=mysql_db_query($dbname,$sql);
	mysql_close();
	print"<meta http-equiv=\"refresh\" content=\"0;URL=viewcart.php\">";
?>