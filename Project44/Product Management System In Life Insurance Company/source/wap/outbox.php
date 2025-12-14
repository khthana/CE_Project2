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
<card id="Outbox" title="Check Outbox">
<p align ="left">
<?
	include("phpFunctionDB.php");
	$login = $Anick;
    outbox($login,&$Date,&$To,&$Topic,&$Oid,&$count);
	 $n =0;$x=1;
	 while ($count > $n)
	 {	
		echo"<a href=\"viewoutbox.php?outbox_id=$Oid[$n]\"> $x ) Date : $Date[$n] To : $To[$n] Topic :$Topic[$n]</a><br/>";
			$n++;$x++;
	 }
?>
</p>
</card>
</wml>
