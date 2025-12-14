<?
function connect_db($database)
{
	$result = mysql_pconnect("localhost","root","sonypl2");		
	if(!$result)
			return false;
	if(!mysql_select_db($database))
			return false;
	return $result;
}
?>