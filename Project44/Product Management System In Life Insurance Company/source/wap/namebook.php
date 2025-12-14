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
<card id="namebook" title="Name Book">
<p align ="left">
<?
	include("phpFunctionDB.php");
	namebook(&$Name,&$id,&$count);
  $n =0;$x=1;
	 while ($count > $n)
	 {	
		echo"$x ) Name : $Name[$n]  ID:$id[$n] <br/>";
			$n++;$x++;
	 }
	 namebook_secretary(&$Name,&$Sid,&$count);
	   $n =0;$x=1;
	 while ($count > $n)
	 {	
		echo"$x ) Name : $Name[$n]  ID:$Sid[$n] <br/>";
			$n++;$x++;
	 }

?>
</p>
</card>
</wml>
