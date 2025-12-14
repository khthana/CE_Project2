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
	displaynews($News_id,&$News_Header,&$News_Detail,&$News_AnnounceDate,&$News_ExpireDate);
	echo"Date : $News_AnnounceDate <br/>";
	echo"Expire :$News_ExpireDate <br/>";
	echo"Header :$News_Header <br/>";
	echo"Detail :$News_Detail<br/>";
?>
</p>
</card>
</wml>
