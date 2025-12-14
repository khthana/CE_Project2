<?
$id_link = mysql_connect('localhost','magazine','magazine');
if(!$id_link){
	affy_message(" The connection to the local database has failed.
Please enter a username and password so a connection can be made." );
}
?>
