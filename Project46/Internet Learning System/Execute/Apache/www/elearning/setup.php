<?
/* 
 * **********************************************
 * **     PHP - WebBoard : Install Database    **
 * **********************************************
 * *                                            *
 * * Developed By : Sansak Chairattanatrai      *
 * * E-mail :  sansak@engineer.com              *
 * * UIN : 5590582                              *
 * * License : SamChai Public Soft Group(tm).   *
 * *                                            *
 * **********************************************
 */  

	include("config.inc.php");

	mysql_connect($host,$iduser,$passwd) or die("Unable to Connect");
	mysql_query("use ".$dbname.";");

	$sql1 = "CREATE TABLE webboard_data (No int(5) DEFAULT '0' NOT NULL auto_increment, Category varchar(50) NOT NULL, Question varchar(100) NOT NULL, Note text NOT NULL, Name varchar(50) NOT NULL, Member tinyint(1) DEFAULT '0' NOT NULL, IP varchar(15) NOT NULL, Email varchar(50) NOT NULL, Date varchar(20) NOT NULL, Reply int(5) DEFAULT '0' NOT NULL, ReplyDate varchar(20) NOT NULL, Image blob, PRIMARY KEY (No))";

	$sql2 = "CREATE TABLE webboard_ans (No int(5) DEFAULT '0' NOT NULL auto_increment, QuestionNo int(5) DEFAULT '0' NOT NULL, Name varchar(50) NOT NULL, Member tinyint(1) DEFAULT '0' NOT NULL, IP varchar(15) NOT NULL, Email varchar(50) NOT NULL, Msg text NOT NULL, Date varchar(20) NOT NULL, Image blob, PRIMARY KEY (No))";

	$sql3 = "CREATE TABLE webboard_member (User char(10) NOT NULL, Password char(10) NOT NULL, Email char(30), ICQ char(15), WebName char(80), URL char(80), Date char(20) NOT NULL, PRIMARY KEY (User))";

	$result1 = mysql_db_query($dbname,$sql1);
	$result2 = mysql_db_query($dbname,$sql2);
	$result3 = mysql_db_query($dbname,$sql3);

	mysql_query("use ".$edbname.";");
	
	$sql4 = "CREATE TABLE `ebooksubject` ( `subid` int(2) NOT NULL default '0',  `ebookid` int(2) NOT NULL auto_increment,  `ebookname` varchar(50) NOT NULL default '',  `ebookpart` varchar(50) NOT NULL default '',  PRIMARY KEY  (`subid`,`ebookid`)) TYPE=MyISAM AUTO_INCREMENT=1 ;";

	$sql5 = "CREATE TABLE `history` (  `uid` int(2) NOT NULL default '0',  `fristname` varchar(30) NOT NULL default '',  `lastname` varchar(30) NOT NULL default '',  `nickname` varchar(30) NOT NULL default '',  `email` varchar(30) NOT NULL default '',  PRIMARY KEY  (`uid`)) TYPE=MyISAM;";

	$sql6 = "CREATE TABLE `subject` (  `subid` int(2) NOT NULL auto_increment,  `subcode` varchar(8) NOT NULL default '',  `enname` text NOT NULL,  `thname` text NOT NULL,  `endescript` text NOT NULL,  `thdescript` text NOT NULL,  `subbook` varchar(100) NOT NULL default '',  `uid` int(2) NOT NULL default '0',  `priority` varchar(8) NOT NULL default '',  `prioritylv` int(2) NOT NULL default '0',  `sublv` int(1) NOT NULL default '0',  PRIMARY KEY  (`subid`)) TYPE=MyISAM AUTO_INCREMENT=74 ;";

	$sql7 = "CREATE TABLE `teacherid` (  `uid` int(2) NOT NULL default '0',  `tname` varchar(50) NOT NULL default '',  `troom` varchar(40) default NULL,  `ttel` varchar(25) default NULL,  `temail` varchar(30) default NULL,  PRIMARY KEY  (`uid`)) TYPE=MyISAM;";

	$sql8 = "CREATE TABLE `testsubject` (  `subid` int(2) NOT NULL default '0',  `numid` int(2) NOT NULL auto_increment,  `question` varchar(150) NOT NULL default '',  `choice1` varchar(50) NOT NULL default '',  `choice2` varchar(50) NOT NULL default '',  `choice3` varchar(50) NOT NULL default '',  `choice4` varchar(50) NOT NULL default '',  `choice5` varchar(50) NOT NULL default '',  `answer` char(1) NOT NULL default '',  `level` int(1) NOT NULL default '0',  `picpart` text NOT NULL,  PRIMARY KEY  (`subid`,`numid`)) TYPE=MyISAM AUTO_INCREMENT=1 ;";

	$sql9 = "CREATE TABLE `userid` (  `uid` int(3) NOT NULL auto_increment,  `user` varchar(20) NOT NULL default '',  `pass` varchar(40) NOT NULL default '',  `status` int(1) NOT NULL default '0',  PRIMARY KEY  (`uid`)) TYPE=MyISAM AUTO_INCREMENT=46 ;";

	$sql10 = "CREATE TABLE `userskill` (  `uid` int(2) NOT NULL default '0',  `subid` int(2) NOT NULL default '0',  `lvget` int(2) NOT NULL default '0',  `tested` int(1) NOT NULL default '0',  PRIMARY KEY  (`uid`,`subid`)) TYPE=MyISAM;";

	$admin_pwd = md5($admin_pwd);

	$sql11 = "INSERT INTO `userid` (`uid`, `user`, `pass`, `status`) VALUES (1, '$admin', '$admin_pwd', 0);";

	$sql12 = "INSERT INTO `teacherid` (`uid`, `tname`, `troom`, `ttel`, `temail`) VALUES (1, '$adname', '$adroom', '$adtel', '$ademail');";

	$result4 = mysql_db_query($edbname,$sql4);
	$result5 = mysql_db_query($edbname,$sql5);
	$result6 = mysql_db_query($edbname,$sql6);
	$result7 = mysql_db_query($edbname,$sql7);
	$result8 = mysql_db_query($edbname,$sql8);
	$result9 = mysql_db_query($edbname,$sql9);
	$result10 = mysql_db_query($edbname,$sql10);
	$result11 = mysql_db_query($edbname,$sql11);
	$result12 = mysql_db_query($edbname,$sql12);


	if($result1!=0 && $result2!=0 && $result3!=0 && $result4!=0 && $result5!=0 && $result6!=0 && $result7!=0 && $result8!=0 && $result9!=0 && $result10!=0 && $result11!=0 && $result12!=0) {
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>ได้สร้างฐานข้อมูลแล้ว</b></font><br><br>";
//		echo "<font color=blue>webboard_ans , webboard_data , webboard_member</font>";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "</center>";
		exit();
	}
	else {
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>ได้สร้างฐานข้อมูลไปแล้ว</b></font><br><br>";
		echo "หรือมีข้อผิดพลาดที่ระบบ<br><br>";
		echo "กรุณาแจ้ง <font color=blue>admin</font> ให้ตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "</center>";
		exit();
	}
?>