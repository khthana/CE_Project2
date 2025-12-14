<?
include ("interface.inc.php");
include ("accesscontrol.php");


session_unregister("uid");
session_destroy();
logout("http://isag.ce.kmitl.ac.th/home/index.php");






?>