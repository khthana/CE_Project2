<? 
	 header("Content-Type: text/vnd.wap.wml");
     echo"<?xml version=\"1.0\"?>\n";
     echo"<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.3//EN\" \"http://www.wapforum.org/DTD/wml13.dtd\">\n";
?>
<wml> 
<template>
		<do type ="prev" label="Prev" name="p">
			<prev/>
		</do>
</template>
 <!-- Search Customer data is sent to database at server -->
<card id="card1" title="Search Customer">
<p align ="left">
		<i>Please select Customer data for search </i><br/>
			<a href="#byname">1. Search by Name</a><br/>
			<a href="#byaddr">2. Search by Address</a><br/>
			<a href="#byagent">3. Search by Agent reserve</a><br/>
			<a href="http://127.0.0.1/project/menu.php">4. Back to main menu</a><br/>
</p>
</card>

<card id="byname" title ="Search by Name">
<do type ="accept" label="Search by name in DB">
	<go href="http://127.0.0.1/project/result_search.php">
			<postfield name="vdb" value="byname"/>
			<postfield name="Cid" value="$CID"/>
			<postfield name="Cname" value="$Cname"/>
			<postfield name="Csurname" value="$CSurname"/>
	</go>
</do>
<p>		
		Customer_ID :<input name="CID" title ="Customer_ID" type="text" emptyok="true"/><br/>
		Name :<input  name="Cname" title ="Customer Name" type="text" emptyok="true"/><br/>
		Surname :<input  name="CSurname" title ="Customer Surname" type="text" emptyok="true"/><br/>
</p>
</card>
<card id="byaddr" title ="Search by Address">
<do type ="accept" label ="Search by address in DB">
	<go href ="http://127.0.0.1/project/result_search.php">
			<postfield name="vdb" value="byaddr"/>			
			<postfield name="Cprovince" value="$prov"/>
			<postfield name="Cdistrict" value="$district"/>
			<postfield name="Csubd" value="$subd"/>
			<postfield name="Croad" value="$road"/>
			<postfield name="Csoi" value="$soi"/>
			<postfield name="Csubsoi" value="$subsoi"/>
			<postfield name="Csubh" value="$subh"/>
			<postfield name="Caddr" value="$addr"/>
			<postfield name="Ctel" value="$Ctel"/>
	</go>
</do>
<p>
		Province :<input  name="prov" title ="Province" type="text" emptyok="true"/><br/>
		District :<input  name="district" title ="District" type="text" emptyok="true"/><br/>
		Subdivision :<input name="subd" title ="Subdivision" type="text" emptyok="true"/><br/>
		Road :<input name="road" title ="Road" type="text" emptyok="true"/><br/>
		Soi :<input name="soi" title ="Soi" type="text" emptyok="true"/><br/>
		Sub Soi :<input name="subsoi" title ="Subsoi" type="text" emptyok="true"/><br/>
		Sub_home :<input name="subh" title="Sub_home" type ="text" emptyok="true"/><br/>
		Address No:<input name="addr" title="Address No" type="text" emptyok="true"/><br/>
		Tel :<input name="Ctel" title ="Customer Tel" type="text" format="NN\-NNN\-NNNN" emptyok="true"/><br/>
</p>
</card>
<card id ="byagent" title ="Search by Agent">
<do type ="accept" label ="Search by agent in DB">
	<go href ="http://127.0.0.1/project/result_search.php">
			<postfield name="vdb" value="byagent"/>
			<postfield name="Aid" value="$Agent_ID"/>
			<postfield name = "Agent_name" value="$Agent_Name"/>
	</go>
</do>
<p>
		Agent ID :<input name="Agent_ID"  title="Agent ID"  type ="text" emptyok="true"/><br/>
		Agent Name:<input name="Agent_Name"  title ="Agent Name"  type = "text"  emptyok = "true"/><br/>
</p>
</card>
</wml>

		
