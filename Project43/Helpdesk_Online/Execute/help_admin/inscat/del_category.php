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

<title>ลบ Category ของคำถาม</title></head>



<FRAMESET cols="200,*"> 

  <FRAME src="leftdel.php" name="treeframe" > 

  <FRAME SRC="initdel.php" name="basefrm" > 

</FRAMESET><noframes></noframes> 





</HTML>

