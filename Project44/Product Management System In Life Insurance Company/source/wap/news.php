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
<card id="Inbox" title="Check News">
<p align ="left">
<?
	include("phpFunctionDB.php");
	view_news(&$Header,&$Announce,&$count,&$News_id);
	 $n =0;$x=1;
	 while ($count > $n)
	 {	
		echo"<a href=\"viewnews.php?News_id=$News_id[$n]\">$x ) $Announce[$n]  Header : $Header[$n]</a><br/>";
			$n++;$x++;
	 }
?>
</p>
</card>
</wml>