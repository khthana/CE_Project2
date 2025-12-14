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
	viewoutbox($outbox_id,&$Date,&$To,&$Topic,&$Message);
	echo"Date : $Date <br/>";
	echo"To : $To <br/>";
	echo"Topic :$Topic <br/>";
	echo"Message :$Message<br/>";
?>
<a href="deleteoutbox.php?outbox_id=<?echo "$outbox_id"?>">Delelte This message !!!</a><br/>
</p>
</card>
</wml>
