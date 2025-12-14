<? header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD  WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml>  
<card id="menu" title="Agent Profile" newcontext="true">
		<p align ="left">
		<a href="searchcustomer.php">1.Search Customer </a><br/>
		<a href="stat.php">2.Check Statistics </a><br/>
		<a href="reserve.wml">3.Check Reserved Customer</a><br/>
		<a href="#mail">4.Mail Box</a><br/>
		<a href="news.php">5.Check news</a><br/>
		<a href="logout.php">6.logout</a><br/>
		</p>
	</card>
	<card id="mail" title ="Mail Box">
	<do type ="accept" label ="Next">
		<go href ="checkmail.php">
			<postfield name="Anick" value="$Anick"/> 
			<postfield name="Apwd" value="$Apwd"/>
		</go>
	</do>
	<p align ="left">
			Agent Username :<input type ="text"  title="Agent Username" name="Anick"/><br/>
			Agent Password :<input type ="password"  title="Agent Password" name="Apwd"/><br/>
	</p>
	</card>
</wml>
