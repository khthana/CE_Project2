<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
?>
<html>

<head>

<title>แก้ไข Category ของคำถาม</title></head>



<FRAMESET cols="200,*"> 

  <FRAME src="leftE.php" name="treeframe" > 

  <FRAME SRC="initE.php" name="basefrm" > 

</FRAMESET><noframes></noframes> 





</HTML>

