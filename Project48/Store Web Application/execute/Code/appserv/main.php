<?php

/************************************************************************/
/* AppServ Open Project                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2001 by Phanupong Panyadee (http://www.appservnetwork.com)         */
/* http://academic.cmri.ac.th/appserv                                                  */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (empty($appservlang)) {
$appservlang = getenv("HTTP_ACCEPT_LANGUAGE");
}
switch ($appservlang)
	{
	case "th" :
	include("$appserv_root/lang-thai.php");
	break;
	case "en" :
	include("$appserv_root/lang-english.php");
	break;
	default :
	include("$appserv_root/lang-english.php");
	break;
}
define("_LPHPNUKE","PHP-Nuke");
define("_LPHPMYADMIN","phpMyAdmin");
define("_LPERL","/cgi-bin/");
// define("_LPHPBB","phpBB2");
define("_APPVERSION","2.5.4a");
define("_VMYSQL","4.1.12a");
define("_VPHP","5.0.4");
//define("_VZENDOPT","2.5.5");
define("_VAPACHE","2.0.54");
//define("_VPHPNUKE","6.5");
define("_VPHPMYADMIN","2.6.2-pl1");
//define("_VPERL","5.8.4");
// define("_VPHPBB","2.0-RC2");
define("_APPSERV","AppServ");
?>