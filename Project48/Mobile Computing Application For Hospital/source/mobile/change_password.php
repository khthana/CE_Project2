<?
function change_password($Username,$old_password,$new_password,$databasename,$tablename)
{
if(login($Username,$old_password,$databasename,$tablename))	
	{
		if(!($conn=connect_db($databasename)))
			return false;
			$sql="update $tablename set Password = '$new_password' where Username = '$Username'" ;
			$result = mysql_query($sql);
			if(!$result)
				return false;
			else
				return true;
	}
	else 
		return false;
}
?>