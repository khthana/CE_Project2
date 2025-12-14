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
<card id="Claim_Ratio" title="Claim_Ratio" > 
<p align="left" > 
<?
echo"Agent $Anick  <br/>";
echo"ID: $Aid  <br/>";

include("phpFunctionDB.php");	
Claim_ratio($Aid);
?>
</p>
</card>
</wml>