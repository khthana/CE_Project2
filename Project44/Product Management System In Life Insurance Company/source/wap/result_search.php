<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD  WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml>               
<template>
		<do type ="accept" label="Back to menu" name="p">
			<go href="http://127.0.0.1/project/menu.php"/>
		</do>
</template>
<card id ="Result" title="Result customer" newcontext="true" >
	<do type="accept" label ="Book">
		<go href="#Book"/>
	</do>
<p align="left" mode ="nowrap">
<?
		include("phpFunctionDB.php");
		SearchCustomer($vdb,$Cid,$Cname,$Csurname,$Cprovince,$Cdistrict,$Csubd,$Croad,$Csoi,$Csubsoi,$Csubh,$Caddr,$Ctel,	$Aid,	$Agent_name,$sql);	
		 DisplayCustomer($sql);
?>
</p>
</card>
<card id="Book" title ="Reservd Customer">
	<do type ="accept" label ="Check this customer with DB">
			<go href="reserve_c.php">
			<postfield name="Anick" value="$Anick"/> 
			<postfield name="Apwd" value="$Apwd"/>
			<postfield name="Cid" value="$Cid"/>
			</go>
	</do>
		<p align ="left">
			<small> Please input data customer </small><br/>
			ID	:<input type="text" title ="Customer ID" name ="Cid" /><br/>
			Agent Username :<input type ="text"  title="Agent Username" name="Anick"/><br/>
			Agent Password :<input type ="password"  title="Agent Password" name="Apwd"/><br/>
		</p>
	</card>	
</wml>