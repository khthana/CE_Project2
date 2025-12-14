<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	addagent($Aname,$Asurname,$Anick,$Apasswd,$Arange,$Aaddress,$Asoi,$Asubsoi,$Aroad,	$Adistrict,$Asubdivision,$AProvince,$APostcode,$Atel,$ASubH);
	CloseDB();
?>

	