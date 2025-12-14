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
	<!-- Must send data of customer for verify before add-->
	<card id="card4" title ="Mail Box">
		<!--do type ="accept" label="go">
			<go href=""/>
		</do-->
		<p align ="left">
			<small>
			<? echo"$Anick<br/>"?>
			$Anick<br/>
			<a href="inbox.php?Anick=<?echo "$Anick"?>">1. Inbox</a><br/>
			<a href="outbox.php?Anick=<?echo "$Anick"?>">2. Outbox</a><br/>
			<a href="#compose">3. Compose</a><br/>
			<a href="namebook.php">4. Namebook</a><br/>
			<a href="menu.php">Back to main menu</a><br/>
			</small>
		</p>
	</card>

	<card id="compose" title ="Compose">
	<do type ="accept" label ="Next">
		<go href ="compose.php">
			<postfield name="to" value="$to"/>
			<postfield name="topic" value="$topic"/>
			<postfield name="message" value="$message"/>
			<postfield name="sender" value="<?echo"$Anick"?>"/>
		</go>
	</do>
	<p align ="left">
		TO		:<input type="text" name="to"/><br/>
		Topic	:<input type="text" name="topic"/><br/> 
		Message:<input type="text" name="message"/><br/> 
	</p>
	</card>
</wml> 
