<?php
	$dbhost = 'localhost';
	$dbuser = 'webmaster';
	$dbpass = 'okoqdH]n,';
	$dbname='isag';

	mysql_connect($dbhost,$dbuser,$dbpass)
						or die ("Unable to connect Database");

	mysql_select_db("$dbname") or die ("Unable to select database name");
?>