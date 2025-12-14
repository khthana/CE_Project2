<?php
 //$blobId; 
//if(!is_numeric($blobId)) 
//die("Invalid blobId specified");
// Database connection variables 
$dbServer = "localhost"; 
$dbDatabase = "project"; 
$dbUser = "root"; 
$dbPass = ""; 



$sConn = mysql_connect($dbServer, $dbUser, $dbPass) 
or die("Couldn't connect to database server"); 



$dConn = mysql_select_db($dbDatabase, $sConn) 
or die("Couldn't connect to database $dbDatabase"); 

$ImageId=$_GET['ImageId']; 
//while($row = mysql_fetch_array($result)) 

$dbQuery = "SELECT Type,Tdata "; 
$dbQuery .= "FROM multimedia "; 
$dbQuery .= "WHERE Id =  $ImageId";

//$dbQuery.="LIMIT 4,5";



$result = mysql_query($dbQuery) or die("Couldn't get file list"); 



if(mysql_num_rows($result) == 1) 

{ 

$fileType = @mysql_result($result, 0, "Type"); 
$fileContent = @mysql_result($result, 0, "Tdata"); 


header("Content-type: $fileType"); 
echo $fileContent; 


} 

else 

{ 

echo "Record doesn't exist."; 

}
echo $fileType; 
?>

