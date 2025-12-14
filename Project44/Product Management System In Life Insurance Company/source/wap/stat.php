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
 <card id ="card2" title="Check Statistics" >
		<p align ="left">
			<a href ="TotalFYP.php?Aid=<?echo"$Aid"?>">1.Total FYP</a><br/>
			<a href ="persistency.php?Anick=<?echo"$Anick"?>">2.Persistency</a><br/>
			<a href ="Claim_Ratio.php?Aid=<?echo"$Aid"?>">3.Claim_ratio</a><br/>
			<a href ="TotalCustomer.php?Anick=<?echo"$Anick"?>">4.Total customer for FYP</a><br/>
			<a href="http://127.0.0.1/project/menu.wml">Back to main menu</a><br/>
		</p>
	</card>
</wml>
