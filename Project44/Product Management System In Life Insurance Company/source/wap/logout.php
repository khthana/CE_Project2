<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD  WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml> 
<template> 
		<do type ="prev" label="Prev" name="p">
			<prev/>
		</do>
</template>
  <card id="card6" title ="Log out" newcontext = "true">
	<do type ="accept" label="logout">
		<go href ="http://127.0.0.1/project/login.wml"/>
	</do>
		<p align ="center" >
			Do you want to logout ?<br/>
		
		</p>
	</card>
</wml> 
