<?php
include("config.inc.php");
@$db = mysql_connect($host,$iduser,$passwd);
if(!$db)
{
	exit();
}