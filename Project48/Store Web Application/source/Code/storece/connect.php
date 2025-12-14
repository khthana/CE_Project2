<?php
$host="localhost";
$user="administrator";
$pw="";
$dbname="store";
$c = mysql_pconnect  ($host,$user,$pw);
if (!$c) {
	echo "<h3> ERROR : </h3>";
	exit();
}
?></font>