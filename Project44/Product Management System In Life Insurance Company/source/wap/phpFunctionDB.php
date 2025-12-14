<?php
//Declaration  Function WAP
//Field table manager 
// Manager_Name  Manager_Surname  Manager_Username  Manager_Password  
//-------------------------------------------------------------------------------------------------------------
//Field Secretary 
// Secretary_Id  Secretary_Name  Secretary_Surname  Secretary_Username  Secretary_Password  
//-------------------------------------------------------------------------------------------------------------
//Field table customer
// Customer_Id  Customer_PreN  Customer_Name  Customer_Surname  Customer_AddressNo  Customer_Range  Customer_Soi  Customer_Sub_soi  Customer_Road  Customer_District  Customer_Sub_Division  Customer_Province  Customer_Postcode  Customer_Tel1  Customer_Tel2  Agent_Username  Customer_SubH 
//--------------------------------------------------------------------------------------------------------------
//Field table agent
//  Agent_Id  Agent_Name  Agent_Surname  Agent_Username  Agent_Password  Agent_Range  Agent_Registerdate  Agent_AddressNo  Agent_Soi  Agent_Sub_soi  Agent_Road  Agent_District  Agent_Sub_Division  Agent_Province  Agent_Postcode  Agent_Telephone  Agent_SubH  
//--------------------------------------------------------------------------------------------------------------
//Field table news																																																			
// News_id  News_Header  News_Detail  News_AnnounceDate  News_ExpireDate 
//--------------------------------------------------------------------------------------------------------------
//Field table inbox	
// Inbox_Id  Username  Date_R  From_Who  Topic  Message  
//--------------------------------------------------------------------------------------------------------------
//Field table outbox																						
// Outbox_Id  Username  Date_S  To_Who  Topic  Message  
//--------------------------------------------------------------------------------------------------------------
//Field table insurance_policy																																															  
//Insurance_Id  Customer_Id  Agent_Id  Insurance_Name  Startdate  Enddate  Paid_Date 
//--------------------------------------------------------------------------------------------------------------
//Field table insurance_name
// Insurance_Name  FYP_Percentage  RangeMonth_Pay_Premium 
//--------------------------------------------------------------------------------------------------------------
//Field table Sub_contact  
// Insurance_ID  Sub_Contact_Name  Value_Sub_Contact  Value_Insurance_Premium  Amount_Of_year_Protect  Amount_Of_year_Pay_Premium  Status  
//--------------------------------------------------------------------------------------------------------------
//Field table Sub_contact _name
// Sub_Contact_Name  FYP_Percentage  
//--------------------------------------------------------------------------------------------------------------
//Field table Competition
// Competition_Id  Post_Date  Complition_Name  Detail_Condition  Detail_Reward  Detail_Other  Start_Date  End_Date  FYP_OverAll  NewCode  FYP_NewCode  Persistency  Claim_Ratio  Amount_Of_Insurance 
//--------------------------------------------------------------------------------------------------------------
//Field table agent_statistics 
// index_Id  Agent_ID  Month  Year  FYP  Persistency  Claim_Ratio  Amount_Of_Insurance 
//--------------------------------------------------------------------------------------------------------------
//Field table overall_statistics 
//Index_Id  Year  Month  FYP  NewCode  Persistency  Claim_Ratio  Amount_Of_Insurance 
//--------------------------------------------------------------------------------------------------------------

include("phpConfig.php");
function Conn2DB()
//value from phpConfig.php
{	global $conn;
	global $ServerName;
	global $UserName;
	global $UserPassword;
	global $DataBaseName;
	$conn=mysql_connect($ServerName,$UserName,$UserPassword );
	if(!$conn)
		die("Not available connect to MYSQL");
	mysql_select_db($DataBaseName,$conn)
		or die("Not available connect to Database of $DataBaseName ");
}
function CloseDB()
{
	global $conn;
	mysql_close($conn);
}
function ChkLogin($login,$pwd,&$sql)
{	
	global $conn;
	$sql="select  Agent_Id,Agent_Name,Agent_Username,Agent_Password  from agent where Agent_Username='$login' and Agent_Password='$pwd' "; 
	$result= mysql_query($sql,$conn);
	if (!$result) 
		die("select ÁÕ¢éÍ¼Ô´¾ÅÒ´".mysql_error());
	if (mysql_num_rows($result)) return true;
	return false;
}
function Login(&$login,$pwd,&$Id)
{	
	global $conn;
	Conn2DB();
	if (ChkLogin($login,$pwd,$sql))
				{
							$result=mysql_query($sql,$conn);
							if(!$result)die("Select error".mysql_error() );
							$rs = mysql_fetch_array($result) ;
							$login= $rs[Agent_Username];
							$pwd=$rs[Agent_Password];
							$Id =$rs[Agent_Id];
							CloseDB();
							return true;
				}
	else {return false;}
}
function Logout()
{

}
function SearchCustomer($vdb,$Cid,$Cname,$Csurname,$Cprovince,$Cdistrict,$Csubd,$Croad,$Csoi,$Csubsoi,$Csubh,$Caddr,$Ctel,$Aid,	$Agent_name,&$sql)
{	
	global $sql;
	$temp = "Customer_Id,Customer_PreN,Customer_Name,Customer_Surname,Agent_Username,Customer_AddressNo,  Customer_Range,Customer_Soi,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,  Customer_Province,Customer_Postcode,Customer_Tel1,Customer_Tel2,Customer_SubH";
		switch($vdb)
		{ 
			case "byname": 
			{
			if (($Cid !="")&&($Cname=="")&&($Csurname=="")){$sql ="select $temp from customer_eng where Customer_Id ='$Cid' order by Customer_Id";break;}
			elseif (($Cname !="")&&($Csurname !="")&&($Cid=="")){$sql ="select $temp from customer_eng where Customer_Name='$Cname' and Customer_Surname='$Csurname'  order by Customer_Id";break;}
			elseif(($Cname !="")&&($Csurname =="")&&($Cid=="")){$sql ="select $temp from customer_eng where Customer_Name='$Cname' order by Customer_Id ";break;}
			else {$sql= "select $temp from customer_eng where Customer_Id='$Cid' or Customer_Name='$Cname' or Customer_Surname='$Csurname'  order by Customer_Id";};
			break;		
			}
		
			case "byaddr": 
			{
			if($Cprovince !=""){$sql= "select $temp from customer_eng where Customer_province='$Cprovince' order by Customer_Id";break;}
			if($Cdistrict !=""){$sql= "select $temp from customer_eng where Customer_district='$Cdistrict' order by Customer_Id";break;}
			if($Csubd !=""){$sql="select $temp from customer_eng where Customer_Sub_division='$Csubd' order by Customer_Id";break;}
			if($Croad !=""){$sql ="select $temp from customer_eng where Customer_road='$Croad' order by Customer_Id";break;}
			if($Csoi !=""){$sql ="select $temp from customer_eng where Customer_soi='$Csoi' order by Customer_Id";break;}
			if($Csubsoi != ""){$sql = "select $temp from customer_eng where Customer_Sub_soi='$Csubsoi' order by Customer_Id";break;}
			if($Csubh !=""){$sql ="select $temp from customer_eng where Customer_subh='$Csubh' order by Customer_Id";break;}
			if($Caddr !=""){$sql ="select $temp from customer_eng where Customer_AddressNo='$Caddr' order by Customer_Id";break;}
			if($Ctel !=""){$sql ="select $temp from customer_eng where Customer_tel1 = '$Ctel' or Customer_tel2 ='$Ctel' order by Customer_Id"; break;}
			break;
			}

			case "byagent": 
			{
			if($Aid!=""){$sql= "select Customer_Id,Customer_PreN,Customer_Name,Customer_Surname,agent.Agent_Username,Customer_AddressNo,  Customer_Range,Customer_Soi,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,  Customer_Province,Customer_Postcode,Customer_Tel1,Customer_Tel2,Customer_SubH from customer_eng,agent where agent.Agent_Id='$Aid'  and customer_eng.Agent_username=agent.Agent_username" ;break;}
			if($Agent_name!=""){$sql= "select	Customer_Id,Customer_PreN,Customer_Name,Customer_Surname,Agent_Username,Customer_AddressNo,  Customer_Range,Customer_Soi,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,  Customer_Province,Customer_Postcode,Customer_Tel1,Customer_Tel2,Customer_SubH from customer_eng  where Agent_username='$Agent_name'  " ;break;}
			
			}
			default : $sql="select $temp from customer_eng";
		};
}//function search customer
function DisplayCustomer($sql)
{
	global $conn;
	Conn2DB();
			$result =mysql_query($sql,$conn);
			$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else 
			{
				echo"<b><i>Result Customer</i></b><br/>";
				while ($row=mysql_fetch_array($result))
					{if ($row[Agent_Username]==""){$row[Agent_Username]="none";}
					echo	" Id   :$row[Customer_Id]<br/>",
								" Name	:$row[Customer_PreN] $row[Customer_Name]<br/>",
								" Surname   :",$row[Customer_Surname],"<br/>",
								"<b><i>Agent by  : $row[Agent_Username]</i> </b><br/>",
								" AddressNo   :",$row[Customer_AddressNo],"<br/>",
								" Range   :",$row[Customer_Range],"<br/>",
								" Soi   :",$row[Customer_Soi],"<br/>",
								" Sub Soi   :",$row[Customer_Sub_soi],"<br/>",
								" Road   :",$row[Customer_Road],"<br/>",
								" District   :",$row[Customer_District],"<br/>",
								" Sub Division   :",$row[Customer_Sub_Division],"<br/>",
								" Province   :",$row[Customer_Province],"<br/>",
								" Postcode   :",$row[Customer_Postcode],"<br/>",
								" Tel1   :",$row[Customer_Tel1],"<br/>",
								" Tel2   :",$row[Customer_Tel2],"<br/>",
								" Village   :",$row[Customer_SubH],"<br/>",
								"------------------------------------------------------------<br/>";
					}
			}
		CloseDB();
}//function DisplayCustomer

function Reserve_customer($Cid,$Anick)
{
	global $conn;
	 Conn2DB();
	$sql="select agent.Agent_Username ,Agent_Range ,Customer_ID , Customer_Range from customer,agent where Customer_ID='$Cid' and agent.Agent_Username = '$Anick' ";
	$query=mysql_query($sql,$conn);
	if(mysql_num_rows($query))
{
	$temp =mysql_fetch_array($query);
	$c_range=$temp[Customer_Range];
	$a_range=$temp[Agent_Range];
	if (($c_range=='B' || $c_range == 'b')&&($a_range=='senior'))
	{
		$sql="update customer set Agent_Username = '$Anick' where Customer_ID ='$Cid' and Agent_Username is NULL ";
		mysql_query($sql,$conn);
		echo"update  Agent $Anick ::$a_range and customer range $c_range <br/>";
		CloseDB();
		return true;
	}
	else if (( $c_range=='C'|| $c_range =='c')&&($a_range =='junior' || $a_range=='senior') )
		{
			$sql="Update customer set Agent_Username = '$Anick' where Customer_ID ='$Cid' and Agent_Username is NULL ";	
			mysql_query($sql,$conn);
			echo"update  Agent $Anick ::$a_range and customer range $c_range <br/>";
			CloseDB();
			return true;
		}
		else{return false;}
 }
 else {echo"no rows";return false;}
}//function Reserve_customer
## 
## MYSQL2UNIX 
## - format a given mysql timestamp ( YYYYMMDDHHMM ) to 
## a unix timestamp ( seconds since 1/1/1970 ) 
## - returned value is now in a form that can be used with 
## php's date() function. 

function mysql2unix( $mysql_timestamp ) { 
$year = substr( $mysql_timestamp, 0, 4 ); 
$month = substr( $mysql_timestamp, 4, 2 ); 
$day = substr( $mysql_timestamp, 6, 2 ); 
$hour = substr( $mysql_timestamp, 8, 2 ); 
$min = substr( $mysql_timestamp, 10, 2 ); 
$sec = substr( $mysql_timestamp, 12, 2 ); 
$unix_timestamp = mktime( $hour, $min, $sec, $month, $day, $year ); 
return $unix_timestamp; 
}
function view_news(&$Header,&$Announce,&$count,&$News_id)
{
	global $conn;
	Conn2DB();
	$sql="select News_Header,News_AnnounceDate,News_id from news order by News_AnnounceDate";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else 
			{
				echo"<b><i>$temp</i></b><br/>";
				$n = 0;
				while ($row=mysql_fetch_array($result))
					{
					$Header[$n]  = $row[News_Header];
					$tempAnnounce[$n]	=$row[News_AnnounceDate];
					$News_id[$n] = $row[News_id];				
					$tem =mysql2unix($tempAnnounce[$n]);
					$Announce[$n] = date ("d/m/Y H:i:s",$tem); 
					$n++;
					};
					$count = $n;
				CloseDB();
			}
}
function displaynews($News_id,&$News_Header,&$News_Detail,&$News_AnnounceDate,&$News_ExpireDate)
{
		global $conn;
		Conn2DB();
		$sql="select News_Header,News_Detail,News_AnnounceDate,News_ExpireDate from news where News_id = '$News_id' ";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else
		{			
				while ($row=mysql_fetch_array($result))
					{			$News_Header							=$row[0]; 
								$News_Detail								=$row[1]; 
								$tem =mysql2unix($row[News_AnnounceDate]);
								$News_AnnounceDate = date ("d/m/Y H:i:s",$tem); 
								$News_ExpireDate					=$row[3];
					}
					CloseDB();
		  }
}

function compose($sender,$to,$topic,$message)
{	
	global $conn;
	Conn2DB();
	$limited = 20;
if ($to !=""  && $topic != "" && $message != "")
{
	$sql = "select Agent_Username from agent  where Agent_Username ='$to' ";
	$result =mysql_query($sql	,$conn);
	if (mysql_num_rows($result))	{$num=mysql_num_rows($result);}
	else 
	{			$sql = "select Manager_Username from manager  where manager_Username ='$to' ";
				$result=mysql_query($sql,$conn);
				if (mysql_num_rows($result))	{$num=mysql_num_rows($result);}
				else {
								$sql = "select Secretary_Username from secretary  where secretary_Username ='$to' ";
								$result =mysql_query($sql,$conn);
								if (mysql_num_rows($result))	{$num=mysql_num_rows($result);}else{break;};
						   }
	}
if ($num==0){echo "No inbox this Username on database","<br/>";}
	else 
			{
				$row=mysql_fetch_array($result);
				$to_login  =$row[0];
				$ok="select count(Username) from inbox where Username='$to_login' ";
				$result_ok= mysql_query($ok,$conn);
				$row_ok=mysql_fetch_array($result_ok);
				if ($row_ok[0] <= $limited)
					{ 
						$sql="insert into inbox(Username,From_who,Topic,message) values('$to_login','$sender','$topic',\"$message\")";
						mysql_query($sql,$conn);
						echo"Compose already!!!";
					}
				else {echo"<b> Inbox $to full!!!</b>";}
				$ok2="select count(Username) from outbox where Username='$sender' ";
				$result_ok2= mysql_query($ok2,$conn);
				$row_ok2=mysql_fetch_array($result_ok2);
				if ($row_ok2[0] <= $limited)
					{
						$sql2="insert into outbox(Username,To_who,Topic,message) values('$sender','$to_login','$topic',\"$message\")";
						mysql_query($sql2,$conn);
						CloseDB();
					}
				else {echo"<b> Outbox  full</b>";}
			}
	}else{ echo" No Message for compose";}
}//function Compose
//Field Outbox_ID  Username  Date_S  To_Who  Topic  Message  
function outbox($login,&$Date,&$To,&$Topic,&$Oid,&$count)
{	global $conn;
	Conn2DB();
		$sql="select date_s,To_who,Topic,outbox_id from outbox where  Username='$login' order by date_s ";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
			{ $n=0;
				echo"<b><i>outbox of $login</i></b><br/>";
				while ($row=mysql_fetch_array($result))
					{			
								$time =mysql2unix($row[date_s]);
								$Date[$n] = date ("d/m/Y H:i:s",$time); 
								$To[$n]				=$row[1];
								$Topic[$n]			=$row[2];
								$Oid[$n]			=$row[3];
								$n++;
					}
			$count = $n ;
			CloseDB();
			}
}
function viewoutbox($outbox_id,&$Date,&$To,&$Topic,&$Message)
{	global $conn;
		Conn2DB();
		$sql="select date_s,to_who,topic,message from outbox where outbox_id='$outbox_id' ";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else
	{			while ($row=mysql_fetch_array($result))
					{			$time =mysql2unix($row[date_s]);
								$Date = date ("d/m/Y H:i:s",$time); 
								$To					=$row[1]; 
								$Topic			=$row[2]; 
								$Message	=$row[3];
					}
			CloseDB();
	}
}
//Field Inbox_ID  Login  Date_R  From_Who  Topic  Message  
function inbox($login,&$Date,&$From,&$Topic,&$Mid,&$count)
{	global $conn;
	Conn2DB();
	$sql="select date_r,from_who,topic,Inbox_Id from inbox where Username='$login' order by date_r";
	$result=mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
			{ $n=0;
				echo"<b><i>inbox of $login </i></b><br/>";
				while ($row=mysql_fetch_array($result))
					{			$time =mysql2unix($row[date_r]);
								$Date[$n] = date ("d/m/Y H:i:s",$time); 
								$From[$n] =$row[from_who];
								$Topic[$n]	=$row[2];
								$Mid[$n]	=$row[3];
								$n++;
					}
			$count =  $n;
			CloseDB();}
}
function viewinbox($inbox_id,&$Date,&$From,&$Topic,&$Message)
{	   global $conn;
		Conn2DB();
		$sql="select date_r,from_who,topic,inbox_id,message from inbox where inbox_id='$inbox_id' ";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		
				while ($row=mysql_fetch_array($result))
					{			
								$time =mysql2unix($row[date_r]);
								$Date = date ("d/m/Y H:i:s",$time);   
								$From= $row[from_who]; 
								$Topic=$row[topic]; 
								$Message= $row[message];
					};
		   CloseDB();
	}
}
function deleteinbox($inbox_id)
{	global $conn;
	Conn2DB();
	$sql="delete from inbox where inbox_id='$inbox_id'";
	if(mysql_query($sql,$conn))
	{echo" Delete complete ";}
	CloseDB();
}
function deleteoutbox($outbox_id)
{		global $conn;
		Conn2DB();
		$sql="delete from outbox where outbox_id='$outbox_id'";
		if(mysql_query($sql,$conn))
		{echo" Delete complete ";}
		CloseDB();
}
//echo("File of phpFunctionDB.php is OK!")
function namebook(&$Name,&$id,&$count)
{		global $conn;
		Conn2DB();
		$sql="select agent_id,agent_Username from agent order by agent_id";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		$n = 0;
			echo"<b><i>Name Book of Agent</i></b><br/>";
				while ($row=mysql_fetch_array($result))
					{			
								$Name[$n] = $row[1];
								$id[$n] =$row[0];
								$n++;
					}
	}
	$count = $n;
	CloseDB();
}
function namebook_secretary(&$Name,&$Sid,&$count)
{
global $conn;
Conn2DB();
$sql="select secretary_id,secretary_username from secretary";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		$n = 0;
			echo"<b><i>Name Book of secretary</i></b><br/>";
				while ($row=mysql_fetch_array($result))
					{			
								$Name[$n] = $row[1];
								$Sid[$n] =$row[0];
								$n++;
					}
	}
	$count = $n;
	CloseDB();
}
function Persistency($Anick)
{
	global $conn;
	Conn2DB();
	$sql ="select Competition_Name,Persistency from Competition  ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{	
		$row = mysql_fetch_array($result); 
		echo"Competition :$row[Competition_Name] <br/>";
		echo"Persistency: $row[Persistency] <br/>";
		
	}
	echo"--------------------------------<br/>";

	$sql3 ="select * from agent where Agent_Username='$Anick'  ";
	$result3 =mysql_query($sql3,$conn);
	$row3 = mysql_fetch_array($result3);

	$sql2 ="select * from Agent_statistics where Agent_ID='$row3[Agent_Id]'  ";
	$result2 =mysql_query($sql2,$conn);
	$numrow = mysql_num_rows($result2);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{	
		$row = mysql_fetch_array($result2); 
		echo"Agent Consistency : $row[Persistency] %<br/>";
	}
	echo"--------------------------------<br/>";
	$sql ="select Persistency,Year,MONTH(Month) from overall_statistics ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{	
		$row = mysql_fetch_array($result); 
		echo"Year : $row[Year] Month : $row[2] ";
		echo"Overall Consistency : $row[Persistency] %<br/>";
		//echo"------------------------------------------------------------------<br/>";
	}
	echo"--------------------------------<br/>";
	CloseDB();
}//function Persistency
function Claim_ratio($Aid)
{
	global $conn;
	Conn2DB();
	$sql ="select  Claim_Ratio  from Agent_statistics where Agent_Id='$Aid'  ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{	
		$row = mysql_fetch_array($result); 
		echo"Claim Ratio: $row[Claim_Ratio] <br/>";
	}
	CloseDB();
}//function Claim_ratio
function Total_customer($Anick)
{
	global $conn;
	Conn2DB();
	$sql ="select  Customer_Id,Customer_Name from customer_eng where Agent_username='$Anick'  ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{	
		while($row = mysql_fetch_array($result)) 
		{
			echo"ID: $row[Customer_Id]  Name:$row[Customer_Name] <br/>";
		}
	}
	$sql2 ="select count(Customer_Id) from customer_eng where Agent_username='$Anick' ";
	$result2 =mysql_query($sql2,$conn);
	$numrow =mysql_num_rows($result2);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{	
		$row2 = mysql_fetch_array($result2);
		echo" Sum customer :$row2[0] <br/>";
	}
	CloseDB();
}
function  TotalFYP($Aid)
{
	global $conn;
	$n = 0;$x=0;
 	Conn2DB();
	$sql ="select Insurance_Id from insurance_policy where Agent_Id='$Aid'  ";
	$result =mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		$n = 0;
		while($row = mysql_fetch_array($result)) 
		{$insurance_id[$n] =$row[0];
		$sql2 ="select sub_contact.sub_contact_name,sub_contact_name.FYP_Percentage,sub_contact.Value_Insurance_Premium   from sub_contact left join sub_contact_name on sub_contact.sub_contact_name=sub_contact_name.sub_contact_name where sub_contact.insurance_id ='$insurance_id[$n]' ";
		$result2 =mysql_query($sql2,$conn);
			while($row2 = mysql_fetch_array($result2)) 
				{	$v1 = $row2[1];
					$v2 = $row2[2];
					//$FYP[$x] = ($row2[1]*$row2[2])/100;
					$FYP[$x] = ($v1 * $v2) /100;
					$x++;			
				}
		$n++;}
	}
while ($x>=0)
	{
		$TotalFYP =$TotalFYP+$FYP[$x];
		$x--;
	}
	CloseDB();
	return $TotalFYP;
}//function  TotalFYP

?>