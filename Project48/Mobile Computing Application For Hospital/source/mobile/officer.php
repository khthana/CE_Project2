<?php
	include('function.php');
	include('database.php');
	require_once("headerofficer.php");	
	database_connect();
	check_office();
	header_officer("พนักงาน");
?>
<table align="center">
	<tr>
		<td align="center"><br><IMG SRC="image/page1.jpg" WIDTH="640" HEIGHT="350" BORDER=0 ALT=""><br></td>
	</tr>
</table>
<?
	require_once("footer.php");
?>