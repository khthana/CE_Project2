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

	include("../webboard/config.inc.php");
	$sql1 = "CREATE TABLE webboard_data (No int(5) NOT NULL auto_increment, Category varchar(50) NOT NULL, Question varchar(100) NOT NULL, Note text NOT NULL, Name varchar(50) NOT NULL, Member tinyint(1) DEFAULT '0' NOT NULL, IP varchar(15) NOT NULL, Email varchar(50) NOT NULL, Date varchar(20) NOT NULL, Reply int(5) DEFAULT '0' NOT NULL, ReplyDate varchar(20) NOT NULL, Image blob, PRIMARY KEY (No))";

	$sql2 = "CREATE TABLE webboard_ans (No int(5) NOT NULL auto_increment, QuestionNo int(5) DEFAULT '0' NOT NULL, Name varchar(50) NOT NULL, Member tinyint(1) DEFAULT '0' NOT NULL, IP varchar(15) NOT NULL, Email varchar(50) NOT NULL, Msg text NOT NULL, Date varchar(20) NOT NULL, Image blob, PRIMARY KEY (No))";

	$sql3 = "CREATE TABLE webboard_member (User char(10) NOT NULL, Password char(10) NOT NULL, Email char(30), ICQ char(15), WebName char(80), URL char(80), Date char(20) NOT NULL, PRIMARY KEY (User))";

	$result1 = mysql_db_query($dbname,$sql1);
	$result2 = mysql_db_query($dbname,$sql2);
	$result3 = mysql_db_query($dbname,$sql3);
	if($result1!=0 && $result2!=0 && $result3!=0) {echo"สร้างฐานข้อมูล เว็บบอร์ดสำเร็จ<br>";}
?>

