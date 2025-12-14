<?php
$dbServer = "localhost"; 
$dbDatabase = "project"; 
$dbUser = "root"; 
$dbPass = ""; 


$sConn = mysql_connect($dbServer, $dbUser, $dbPass) 
or die("Couldn't connect to database server"); 


$dConn = mysql_select_db($dbDatabase, $sConn) 
or die("Couldn't connect to database $dbDatabase"); 

$ImageId=$_GET['ImageId']; 
$fileupdate=$_POST['fileupdate'];
//$f1=$_POST['f1']; 

//while($row = mysql_fetch_array($result)) 

$dbQuery = "UPDATE multimedia SET Title='$fileupdate' WHERE Id=1"; 
//$dbQuery .= " SET Title=\'$update'\";
//$dbQuery .= "WHERE Id = $ImageId";



$result = mysql_query($dbQuery) or die("Couldn't get file list"); 




?>

