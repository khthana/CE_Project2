<?php
function  connect_db(){
@$db=mysql_connect("localhost","learnig","");
	if(!$db)
    {
	echo"<center>";
	echo"Can not connect to MySQL<br>".mysql_error();
	echo"</center>";
	exit;
	}
	mysql_select_db("e_learning");
}
?>
