

<?
$id=$HTTP_GET_VARS[id];
$dbServer = "localhost"; 
	$dbDatabase = "project"; 
	$dbUser = "root"; 
	$dbPass = ""; 

//----------------------------------------------Database-----------------------------------------------------
	$sConn = mysql_connect($dbServer, $dbUser, $dbPass) 
	or die("Couldn't connect to database server"); 
	$dConn = mysql_select_db($dbDatabase, $sConn) 
	or die("Couldn't connect to database $dbDatabase"); 
	$dbQuery = "SELECT * "; 
	$dbQuery .= "FROM multimedia "; 
	$dbQuery .= "WHERE Id=$id";
	$result = mysql_query($dbQuery) or die("Couldn't get file list"); 
	$des=mysql_result($result,0,"Description");
	$title=mysql_result($result,0,"Title");
	$name=mysql_result($result,0,"Filename");
	$size=mysql_result($result,0,"Size");

//-------------------------------------------------------------------------------------------------------------
?>
<body>
<table border=1  width="100%" height="100%" face="Verdana" size="1" color="#FFFFF">
		<tr height="10%">
			<td colspan=3>
				<!--up---->
			</td>
		</tr>			
		<tr>
		<td></td>
			<td bordercolor="#000000">
			<!--pic-->
		<center><img src="downloadfile.php?ImageId= <?echo $id;?>" width=100 height=100 /></center>
			</td>
		<td></td>
		</tr>
		<tr>
			<td></td>
			<td >
			<center>
			<!--descript-->
			<?
				
								echo "Title:  $title</br>";
								echo "Description:  $des</br>";
								echo "Name:$name</br>";
								echo "Size:$size</br>";
			?>
	

