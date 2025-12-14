<?	
		include("phpConfig.php");
		include("phpFunctionDB.php");
		Conn2DB();
		$Anick=$CK[Login];
		Reserve_customer($Cid,$Anick);
		//view customer already update
		$sql2="select * from customer where customer_id='$Cid'";
		$result =mysql_query($sql2);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else  
		{
		echo"<b><i>Result Reserve Customer</i></b><br/>";
//Field table customer
// Customer_Id  Customer_PreN  Customer_Name  Customer_Surname  Customer_AddressNo  Customer_Range  Customer_Soi  Customer_Sub_soi  Customer_Road  Customer_District  Customer_Sub_Division  Customer_Province  Customer_Postcode  Customer_Tel1  Customer_Tel2  Agent_Usename  Customer_SubH 
//--------------------------------------------------------------------------------------------------------------
		while ($row=mysql_fetch_array($result))
			{
				echo	"ID         :$row[Customer_Id]<br/>",
						"Name		:$row[Customer_Name]<br/>",
						"Surname	:$row[Customer_Surname]<br/>",
						"AddressNo	:$row[Customer_AddressNo]<br/>",
						"Range		:$row[Customer_Range]<br/>",
						"Soi		:$row[Customer_Soi]<br/>",
						"Sub Soi  : $row[Customer_Sub_soi]<br/>",
						"Road		: $row[Customer_Road]<br/>",
						"District	 : $row[Customer_District]<br/>",
						"SubDivision : $row[Customer_Sub_Division]<br/>",
						"Province	 : $row[Customer_Province]<br/>",
						"Postcode	: $row[Customer_Postcode]<br/>",
						"Telephone	: $row[Customer_Tel1] and $row[Customer_Tel2]<br/>",
						"<i><b>Agent username	$row[Agent_Username]</b></i><br/>",
						"SubHome	:$row[Customer_SubH]<br/>",
			"--------------------------------------","<br/>";
			}
		}
		CloseDB();
		?>
		<a href ="main_agent_access.php">Go to Agent menu</a>