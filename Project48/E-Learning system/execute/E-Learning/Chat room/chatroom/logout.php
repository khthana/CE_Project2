<?php
ob_start();
session_start();
require '../libs/config.inc.php';
//require '../libs/ajax.php'; 
require '../libs/mysql.php';
//require '../libs/function.php';
require '../funcs/func_chat.php';

logout();

header("Location:../index.php");
ob_end_flush();
?>