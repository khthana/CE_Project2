<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	$login = $CK[Login];
    opennews($News_id,&$News_Header,&$News_Detail,&$News_AnnounceDate,&$News_ExpireDate);
	echo"News Header  :$News_Header <br> News Detail :$News_Detail <br>",
	"News Announce :$News_AnnounceDate <br> News ExpireDate :$News_ExpireDate";

?>