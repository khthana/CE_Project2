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

<title>เพิ่ม Category ของคำถาม</title></head>



<FRAMESET cols="200,*"> 

  <FRAME src="left.php" name="treeframe" > 

  <FRAME SRC="init.php" name="basefrm" > 

</FRAMESET><noframes></noframes> 





</HTML>

