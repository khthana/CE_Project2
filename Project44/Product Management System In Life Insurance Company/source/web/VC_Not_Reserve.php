<?	
//table customer
//Customer_ID  Customer_Name  Customer_Surname  Customer_AddressNo  Customer_Range  Customer_Soi  Customer_Road  Customer_District  Customer_Sub_Division  Customer_Province  Customer_Postcode  Customer_Telephone  Agent_Id  Customer_SubH 
		include("phpConfig.php");
		include("phpFunctionDB.php");
		Conn2DB();
		
		$sql="select * from customer where Agent_Id is NULL ";
		$result =mysql_query($sql);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
		{
		echo"<b><i>View All Customer Not Reserve </i></b><br/>";
		while ($row=mysql_fetch_array($result))
			{
				echo	"ID         :",$row[0],"<br/>",
						"Name		:",$row[1],"<br/>",
						"Surname	:",$row[2],"<br/>",
						"AddressNo	:",$row[3],"<br/>",
						"Range		:",$row[4],"<br/>",
						"Soi		:",$row[5],"<br/>",
						"Sub Soi :",$row[6],"<br/>",
						"Road		:",$row[7],"<br/>",
						"District	:",$row[8],"<br/>",
						"SubDivision:",$row[9],"<br/>",
						"Province	:",$row[10],"<br/>",
						"Postcode	:",$row[11],"<br/>",
						"Telephone	:",$row[12],"<br/>",
						"<i>","<b>","Agent_Id	:",$row[13],"</b>","</i>","<br/>",
						"SubHome	:",$row[14],"<br/>",
			"--------------------------------------","<br/>";
			}
		}
		if ($row[13]==""){echo " You can reserve this customer</br>";
										echo"<a href =\"Reserve_Customer.html\">Go to Reserve Customer -- >></a></br>";
		};
	
	//	$sql="Update customer set Agent_Id = '$agentid' where Customer_ID ='$cid' and Agent_Id is NULL ";

	//	mysql_db_query($databasename,$sql);
		
		CloseDB();
		?>
		<a href ="agent_menu.html"><<--Go to Agent menu</a>