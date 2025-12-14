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
<card id="FYP" title="FYP">
<p align="left">
<?
	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
	Read_logfile($Aid,$Anick,$Apwd);
	fyp($Aid);
	CloseDB();
?>
</p>
</card>
</wml>