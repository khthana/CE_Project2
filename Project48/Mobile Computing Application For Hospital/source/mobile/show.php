<?
		include("header.php");		
		include('function.php');
		include('database.php');
		
		header_html("โรงพยาบาลเกกีงาม 2");  
		database_connect();	
		
		check_session();
		
?>
	<tr>
		<td align="center"><br><IMG SRC="image/page1.jpg" WIDTH="640" HEIGHT="350" BORDER=0 ALT=""><br></td>
	</tr>
<?
	require_once("footer.php");
?>
