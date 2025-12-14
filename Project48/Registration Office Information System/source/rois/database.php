<?php
	$host = "localhost";		// host for MySQL
	$user = "root";		// user for MySQL
	$password = "";		// pass for MySQL
	
	function database_connect() {
		if(mysql_connect($host,$user,$password)) {
			mysql_query("SET NAMES tis620");
			mysql_query("USE database_rois;");
		}
		else {
			print "Error on connect database. " . mysql_error();
			exit;
		}
	}
	
	function database_query($str_query) {
		$ret = mysql_query($str_query);
		if($ret) {
			return $ret;
		}
		else {
			print "Error on query database."  . mysql_error();
			exit;
		}
	}
	
	function database_close($db_link) {
		mysql_close($db_link);
	}
?>