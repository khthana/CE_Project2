<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD 
WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>                              
<wml>               
<template>
		<do type ="accept" label="Back to menu" name="p">
			<go href="menu.php"/>
		</do>

</template>
<card id ="vc_not_book" title="View Customer Not Reserve" newcontext="true" >
	<do type="accept" label ="Send to Reserve">
			<go href="reserve_c.php">
			<postfield name="Anick" value="$Anick"/> 
			<postfield name="Apwd" value="$Apwd"/>
			<postfield name="Cid" value="$Cid"/>
			</go>
	</do>
<p align="left" mode ="nowrap">
	<?	
		include("phpFunctionDB.php");
		$sql="select * from customer where Agent_Username is NULL ";
		 DisplayCustomer($sql);
	?>
		<small>Please input Customer Id that you interest for reserve</small><br/>
		<i>Warning ! customer must no agent </i><br/>
			ID	:<input type="text" title ="Customer ID" name ="Cid" /><br/>
			Agent Username :<input type ="text"  title="Agent Username" name="Anick"/><br/>
			Agent Password :<input type ="password"  title="Agent Password" name="Apwd"/><br/>
</p>
</card>
</wml>