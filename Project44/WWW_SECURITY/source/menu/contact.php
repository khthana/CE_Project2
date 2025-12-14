<?php 
include "interface.inc.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
$sql = "select info from contact where id=1";
	$result = mysql_query($sql);
	if(mysql_num_rows($result)==1)
	{
			$row=mysql_fetch_array($result);
			$info=$row["info"]; 

			print "<table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td id=w2><B><font size=3> <CENTER>Contact Information</CENTER> </font></B></td></tr></table>";

			print "<br>".nl2br($info);
	}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close("</center>");
empty_4();
?>