 <?
  	include("phpConfig.php");
	include("phpFunctionDB.php");
	Conn2DB();
 SearchAgent($vdb,$Aid,$Aname,$Asurname,$Aprovince,$Adistrict,$Asubd,$Aroad,$Asoi,$Asubsoi,$Asubh,$Aaddr,$Atel);
 /*Agent_Id,Agent_Name,Agent_Surname,Agent_Nickname,Agent_Range,Agent_Registerday,Agent_FYP,Agent_Total_Premium,	Agent_Province,Agent_District,Agent_SubDivision,Agent_Road,Agent_Soi,Agent_Sub_soi,Agent_SubH,Agent_AddressNo, Agent_Postcode,Agent_Telephone*/
		$result =mysql_query($sql);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
			{
				echo"<b><i>Result Agent Search</i></b><br/>";
				while ($row=mysql_fetch_array($result))
					{
					echo	"Agent_ID         :",$row[0],"<br/>",
							"Agent_Name		:",$row[1],"<br/>",
							"Agent_Surname	:",$row[2],"<br/>",
							"Agent_Nickname	:",$row[3],"<br/>",
							"Agent_Range		:",$row[4],"<br/>",
							"Agent_Registerday		:",$row[5],"<br/>",
							"Agent_FYP :",$row[6],"<br/>",
							"Agent_Total_Premium		:",$row[7],"<br/>",
							"Agent_Province	:",$row[8],"<br/>",
							"Agent_District:",$row[9],"<br/>",
							"Agent_SubDivision	:",$row[10],"<br/>",
							"Agent_Road	:",$row[11],"<br/>",
							"Agent_Soi	:",$row[12],"<br/>",
						" Agent_Sub_soi	:",$row[13],"<br/>",	
						"Agent_SubH	:",$row[14],"<br/>",
						"Agent_AddressNo  :",$row[15],"<br/>",
						"Agent_Postcode  :",$row[16],"<br/>",
						"Agent_Telephone  :",$row[17],"<br/>",
						"--------------------------------------","<br/>";
					}
		};
CloseDB();
  ?>
  <a href ="agent_Search.html">Go to Agent_Search</a>