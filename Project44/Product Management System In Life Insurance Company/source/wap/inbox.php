<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD 
WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml>
<template>
		<do type ="prev" label="Prev" name="p">
			<prev/>
		</do>
</template>
<card id="Inbox" title="Check Inbox">
<p align ="left">
<?
	include("phpFunctionDB.php");
	$login = $Anick;
	 inbox($login,&$Date,&$From,&$Topic,&$Mid,&$count);
	 $n =0;$x=1;
	 while ($count > $n)
	 {	
		echo"<a href=\"viewinbox.php?inbox_id=$Mid[$n]\">$x ) Date : $Date[$n] From : $From[$n] Topic :$Topic[$n]</a><br/>";
			$n++;$x++;
	 }
?>
</p>
</card>
</wml>
