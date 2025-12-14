<?php
	$host = "localhost";
	$user = "root";
	$password = "sonypl2";
	
	function database_connect() {
		if(mysql_connect($host,$user,$password)) {
			mysql_query("USE hospital;");
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