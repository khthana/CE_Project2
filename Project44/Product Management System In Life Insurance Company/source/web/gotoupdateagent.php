
<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	echo"$Aid";
	echo "$Aroad";
	 updateagent($Aid,$Aname,$Asurname,$Anick,$Apasswd,$Arange,$Aaddress,$Asoi,$Asubsoi,$Aroad,	$Adistrict,$Asubdivision,$AProvince,$APostcode,$Atel,$ASubH);
	CloseDB();
?>
