<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	addcustomer($Cname,$Csurname,$CAddress,$Crange,$Csoi,$Csubsoi,$Croad,$Cdistrict,$Csubdivision,$Cprovince,	$Cpostcode,$Ctel,$CsubH);
	CloseDB();
?>

	