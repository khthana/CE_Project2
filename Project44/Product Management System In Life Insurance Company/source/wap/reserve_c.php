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
<card id ="reserve_customer" title="Reserve customer" newcontext="true" >
	<do type ="accept" label="Back to menu" name="p">
			<go href="menu.php"/>
		</do>
<p align="left" mode ="nowrap">
	<?	
		include("phpFunctionDB.php");
		$login = $Anick ; $pwd = $Apwd;
		if(Login(&$login,$pwd,&$Id))
			{	
				if(Reserve_customer($Cid,$Anick))
					{
					$sql="select * from customer where customer_id='$Cid'";
					DisplayCustomer($sql);
					}
					else {echo"Can't Reserve";}
			 }
			else {echo"Login and password of Agent is error";}
		?>
</p>
</card>
</wml>