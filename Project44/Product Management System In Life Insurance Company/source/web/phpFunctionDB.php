<?php
//Declaration Function Web
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
//Field table news																																																			
// News_id  News_Header  News_Detail  News_AnnounceDate  News_ExpireDate 
//--------------------------------------------------------------------------------------------------------------
//Field table inbox	
// Inbox_Id  Username  Date_R  From_Who  Topic  Message  
//--------------------------------------------------------------------------------------------------------------
//Field table outbox																						
// Outbox_Id  Username  Date_S  To_Who  Topic  Message  
//--------------------------------------------------------------------------------------------------------------
//Field table Competition
//  Competition_Id  Post_Date  Competition_Name  Detail_Condition  Detail_Reward  Detail_Other  Start_Date  End_Date  FYP_OverAll  NewCode  FYP_NewCode  Persistency  Claim_Ratio  Amount_Of_Insurance  
//--------------------------------------------------------------------------------------------------------------
//Field table agent_statistics 
// index_Id , Agent_ID  ,Month , Year  ,FYP , Persistency,  Claim_Ratio  ,Amount_Of_Insurance 
//--------------------------------------------------------------------------------------------------------------
//Field table overall_statistics 
// Index_Id , Year,  Month , FYP , NewCode , Persistency , Claim_Ratio , Amount_Of_Insurance 
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
function ChkLogin($login,$pwd,$check,&$sql)
{	
	global $conn;
	switch ($check)	{
		case agent:
	$sql="select  Agent_Id,Agent_Name,Agent_Username,Agent_Password  from agent where Agent_Username='$login' and Agent_Password='$pwd' "; 
	break;
		case manager:
	$sql ="select  Manager_Name,Manager_Username,Manager_Password from Manager where Manager_Username='$login' and Manager_Password='$pwd' ";
	break;
		case secretary:
	$sql ="select  Secretary_Id,Secretary_Name,Secretary_Username,Secretary_Password from secretary where Secretary_Username='$login' and Secretary_Password='$pwd' ";
	break;
	};
	$result= mysql_query($sql,$conn);
	if (!$result) 
		die("select มีข้อผิดพลาด".mysql_error());
	if (mysql_num_rows($result)) return true;
	return false;
}
function Login($login,$pwd,&$check)
{	
	global $conn;
	Conn2DB();
if (ChkLogin($login,$pwd,$check,$sql))
			{
						$result=mysql_query($sql,$conn);
						if(!$result)die("Select error".mysql_error() );
						$rs = mysql_fetch_array($result) ;
					CloseDB();
					switch ($check)	{
							case agent :
							{
								setcookie("CK[Flag]",true,time()+3600);
								setcookie("CK[Id]",$rs[Agent_Id],time()+3600);
								setcookie("CK[Name]",$rs[Agent_Name],time()+3600);
								setcookie("CK[Surname]",$rs[Agent_Surname],time()+3600);
								setcookie("CK[Login]",$rs[Agent_Username],time()+3600);
								setcookie("CK[Password]",$rs[Agent_Password],time()+3600);
								setcookie("CK[Type]",$check,time()+3600);						
								return true;
								break;
							};
							case manager :
							{
								setcookie("CK[Flag]",true,time()+3600);
								setcookie("CK[Name]",$rs[Manager_Name],time()+3600);
								setcookie("CK[Surname]",$rs[Manager_Surname],time()+3600);
								setcookie("CK[Login]",$rs[Manager_Username],time()+3600);
								setcookie("CK[Password]",$rs[Manager_Password],time()+3600);
								setcookie("CK[Type]",$check,time()+3600);
								return true;
								break;
							};
							case secretary :
							{
								setcookie("CK[Flag]",true,time()+3600);
								setcookie("CK[Id]",$rs[Secretary_Id],time()+3600);
								setcookie("CK[Name]",$rs[Secretary_Name],time()+3600);
								setcookie("CK[Surname]",$rs[Secretary_Surname],time()+3600);
								setcookie("CK[Login]",$rs[Secretary_Username],time()+3600);
								setcookie("CK[Password]",$rs[Secretary_Password],time()+3600);
								setcookie("CK[Type]",$check,time()+3600);
								return true;
								break;
							};//case
						};//switch
					}
		else //{echo "ERROR";}
		return false;
}
function Logout()
{
	setcookie("CK[Flag]");
	setcookie("CK[Name]");
	setcookie("CK[Surname]");
	setcookie("CK[Id]");
	setcookie("CK[Login]");
	setcookie("CK[Password]");
	setcookie("CK[Type]");
}
## 
## MYSQL2UNIX 
## - format a given mysql timestamp ( YYYYMMDDHHMM ) to 
## a unix timestamp ( seconds since 1/1/1970 ) 
## - returned value is now in a form that can be used with 
## php's date() function. 

function mysql2unix( $mysql_timestamp )
{ 
$year = substr( $mysql_timestamp, 0, 4 ); 
$month = substr( $mysql_timestamp, 4, 2 ); 
$day = substr( $mysql_timestamp, 6, 2 ); 
$hour = substr( $mysql_timestamp, 8, 2 ); 
$min = substr( $mysql_timestamp, 10, 2 ); 
$sec = substr( $mysql_timestamp, 12, 2 ); 
$unix_timestamp = mktime( $hour, $min, $sec, $month, $day, $year ); 
return $unix_timestamp; 
}
function month($x)
{switch($x)
	{	case "1": return "มกราคม";
        case "2": return "กุมภาพันธ์";
        case "3": return "มีนาคม";
        case "4": return "เมษายน";
        case "5": return "พฤษภาคม";
        case "6": return "มิถุนายน";
        case "7": return "กรกฎาคม";
        case "8": return "สิงหาคม";
        case "9": return "กันยายน";
        case "10": return "ตุลาคม";
        case "11": return "พฤศจิกายน";
        case "12": return "ธันวาคม";
	}
}
function ThaiDate()
{
		$ThDay = array("อาทิตย์","จันทร์","อังคาร","พุธ","พฤหัส","ศุกร์","เสาร์");
		$ThMonth =array("มกราคม","กุมภาพันธ","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม",	"พฤศจิกายน ","ธันวาคม");
		$a = date("w");
		$b = date("n")-1;
		$c = date("j");
		$d = date("Y")+543;
		return "วัน$ThDay[$a]ที่ $c  เดือน $ThMonth[$b] พ.ศ. $d";
}
function SearchCustomer($vdb,$Cid,$Cname,$Csurname,$Cprovince,$Cdistrict,$Csubd,$Croad,$Csoi,$Csubsoi,$Csubh,$Caddr,$Ctel,$Aid,	$Agent_name,$Cpostcode,&$sql)
{	
	global $sql;
	$temp = "Customer_Id,Customer_PreN,Customer_Name,Customer_Surname,Agent_Username,Customer_AddressNo,  Customer_Range,Customer_Soi,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,  Customer_Province,Customer_Postcode,Customer_Tel1,Customer_Tel2,Customer_SubH";
		switch($vdb)
		{ 
			case "byname": 
			{
			if (($Cid !="")&&($Cname=="")&&($Csurname=="")){$sql ="select $temp from customer where Customer_Id ='$Cid' order by Customer_Id";break;}
			elseif (($Cname !="")&&($Csurname !="")&&($Cid=="")){$sql ="select $temp from customer where Customer_Name='$Cname' and Customer_Surname='$Csurname'  order by Customer_Id";break;}
			elseif(($Cname !="")&&($Csurname =="")&&($Cid=="")){$sql ="select $temp from customer where Customer_Name='$Cname' order by Customer_Id ";break;}
			else {$sql= "select $temp from customer where Customer_Id='$Cid' or Customer_Name='$Cname' or Customer_Surname='$Csurname'  order by Customer_Id";};
			break;		
			}
			case "byaddr": 
			{
			if($Cprovince !=""){$sql= "select $temp from customer where Customer_province='$Cprovince' order by Customer_Id";break;}
			if($Cdistrict !=""){$sql= "select $temp from customer where Customer_district='$Cdistrict' order by Customer_Id";break;}
			if($Csubd !=""){$sql="select $temp from customer where Customer_Sub_division='$Csubd' order by Customer_Id";break;}
			if($Croad !=""){$sql ="select $temp from customer where Customer_road='$Croad' order by Customer_Id";break;}
			if($Csoi !=""){$sql ="select $temp from customer where Customer_soi='$Csoi' order by Customer_Id";break;}
			if($Csubsoi != ""){$sql = "select $temp from customer where Customer_Sub_soi='$Csubsoi' order by Customer_Id";break;}
			if($Csubh !=""){$sql ="select $temp from customer where Customer_subh='$Csubh' order by Customer_Id";break;}
			if($Caddr !=""){$sql ="select $temp from customer where Customer_AddressNo='$Caddr' order by Customer_Id";break;}
			if($Ctel !=""){$sql ="select $temp from customer where Customer_tel1 = '$Ctel' or Customer_tel2 ='$Ctel' order by Customer_Id"; break;}
			if($Cpostcode !=""){$sql ="select $temp from customer where Customer_Postcode = '$Cpostcode' order by Customer_Id"; break;}
			break;
			}
			case "byagent": 
			{
			if($Aid!=""){$sql= "select Customer_Id,Customer_PreN,Customer_Name,Customer_Surname,agent.Agent_Username,Customer_AddressNo,  Customer_Range,Customer_Soi,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,  Customer_Province,Customer_Postcode,Customer_Tel1,Customer_Tel2,Customer_SubH from customer,agent where agent.Agent_Id='$Aid'  and customer.Agent_username=agent.Agent_username" ;break;}
			if($Agent_name!=""){$sql= "select	Customer_Id,Customer_PreN,Customer_Name,Customer_Surname,Agent_Username,Customer_AddressNo,  Customer_Range,Customer_Soi,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,  Customer_Province,Customer_Postcode,Customer_Tel1,Customer_Tel2,Customer_SubH from customer  where Agent_username='$Agent_name'  " ;break;}
			
			}
			default : $sql="select $temp from customer ";
		};
}//function search customer
function Search_Insurance_Policy($Noinsurance,$agent,$customer,&$sql)
{
	global $conn;
	Conn2DB();
if($agent !="")
	{
	$sql = "select agent_id from agent where agent_name = '$agent' or agent_username='$agent' ";
	$result = mysql_query($sql,$conn);
	$row = mysql_fetch_array($result);
	$Noagent = $row[agent_id];
	if($Noagent !="")
		{ 
		$sql="select insurance_id,insurance_name,startdate,enddate,paid_date,agent.agent_name,agent.agent_surname,customer.customer_name,customer.customer_surname from agent,customer left join insurance_policy on  customer.customer_id=insurance_policy.customer_id and agent.agent_id = insurance_policy.agent_id where insurance_policy.agent_id = $Noagent ";
		}
	}
if($customer !="")
	{
	$sql2 = "select customer_id from customer where customer_name ='$customer' ";
	$result2 = mysql_query($sql2,$conn);
	$row2 = mysql_fetch_array($result2);
	$Nocustomer =$row2[0];
	if($Nocustomer !="")
	{
		$sql="select insurance_id,insurance_name,startdate,enddate,paid_date,agent.agent_name,agent.agent_surname,customer.customer_name,customer.customer_surname from agent,customer left join insurance_policy on  customer.customer_id=insurance_policy.customer_id and agent.agent_id = insurance_policy.agent_id where insurance_policy.customer_id = $Nocustomer ";
	}
	}
if ($Noinsurance !="")
	{
		$sql = "select insurance_id,insurance_name,startdate,enddate,paid_date,agent.agent_name,agent.agent_surname,customer.customer_name,customer.customer_surname from agent,customer left join insurance_policy on  customer.customer_id=insurance_policy.customer_id and agent.agent_id = insurance_policy.agent_id where insurance_policy.insurance_id = $Noinsurance ";
	}
 	CloseDB();
 }
function SearchAgent($vdb,$Aid,$Aname,$Asurname,$Ausername,$Aprovince,$Adistrict,$Asubd,$Aroad,$Asoi,$Asubsoi,$Asubh,	$Aaddr,	$Atel,$Apost)
{	
	global $sql;
	$temp = " Agent_Id,Agent_Name,Agent_Surname,Agent_Username,Agent_Password,Agent_Range,Agent_Registerdate,	 Agent_AddressNo,Agent_Soi,Agent_Sub_soi,Agent_Road,Agent_District,Agent_Sub_Division,Agent_Province,Agent_Postcode,Agent_Telephone,Agent_SubH";
	switch($vdb)
	{ 
		case "byname": 
			{
				if ($Aid !=""){$sql ="select  $temp  from Agent  where Agent_Id = '$Aid' ";return true;}
				elseif ($Asurname != ""){$sql="select $temp from Agent where Agent_Surname='$Asurname' ";return true;}
				elseif($Aname !="") {$sql= "select $temp  from Agent where Agent_name='$Aname' or Agent_Username='$Aname' ";return true;}
				else{return false;}
				break;	
			}
		case "byaddr": 
			{
				if ($Aprovince != ""){	$sql= "select $temp  from Agent  where Agent_Province='$Aprovince' ";return true;}
				elseif($Adistrict !=""){$sql="select $temp from Agent where Agent_District='$Adistrict' ";return true;}
				elseif($Asubd != ""){$sql= "select $temp  from Agent  where Agent_Sub_Division='$Asubd' ";return true;}
				elseif($Aroad != ""){$sql="select $temp from Agent where Agent_Road='$Aroad' ";return true;}
				elseif($Asoi != ""){$sql="select $temp from Agent where Agent_Soi='$Asoi' ";return true;}
				elseif($Asubsoi != ""){$sql="select $temp from Agent where Agent_Sub_soi='$Asubsoi' ";return true;} 
				elseif($Aaddr != ""){$sql="select $temp from Agent where Agent_AddressNo='$Aaddr' ";return true;}
				elseif($Asubh != ""){$sql="select $temp from Agent where Agent_SubH='$Asubh' ";return true;} 
				elseif($Atel != ""){$sql="select $temp from Agent where Agent_Telephone='$Atel' ";return true;}
				elseif($Apost != ""){$sql="select $temp from Agent where Agent_Postcode='$Apost' ";return true;}
			}
		default : $sql="select $temp  from Agent ";  
	};
}//function SearchAgent
function DisplayCustomer($customer_id,&$row)
{
	global $conn;
	Conn2DB();
	$sql ="select * from customer where customer_id = '$customer_id' ";
			$result =mysql_query($sql,$conn);
			$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else 
			{
				$row=mysql_fetch_array($result);
			}
	CloseDB();
}//function DisplayCustomer
function DisplayAgent($agent_id,&$row)
{
	global $conn;
	Conn2DB();
	$sql ="select * from agent where agent_id = '$agent_id' ";
			$result =mysql_query($sql,$conn);
			$numrow = mysql_num_rows($result);
	if($numrow==0){echo "No matchs to view.","<br/>";}
	else 
			{
				$row=mysql_fetch_array($result);
			}
	CloseDB();
}//function DisplayCustomer
function Reserve_customer($Cid,$Anick)
{	global $conn;
	Conn2DB();
	$sql="select agent.Agent_Username,Agent_Range ,Customer_ID , Customer_Range from customer,agent where Customer_ID='$Cid' and agent.Agent_Username = '$Anick' ";
	$query=mysql_query($sql,$conn);
	if(mysql_num_rows($query))
		{
			$temp =mysql_fetch_array($query);
			$c_range=$temp[Customer_Range];
			$a_range=$temp[Agent_Range];
			if(($c_range=='B' || $c_range == 'b')&&($a_range=='senior'))
			{
				$sql = "update customer set Agent_Username = '$Anick' where Customer_ID ='$Cid' and Agent_Username is NULL ";
				mysql_query($sql,$conn);
			    echo"update  Agent $Anick ::$a_range and customer range $c_range <br/>";
				CloseDB();
				return true;
			}
	else if ( ( $c_range=='C'|| $c_range =='c')&&($a_range =='junior' || $a_range=='senior') )
			{	
				$sql="Update customer set Agent_Username = '$Anick' where Customer_ID ='$Cid' and Agent_Username is NULL ";	
				mysql_query($sql,$conn);
				echo"update  Agent $Anick ::$a_range and customer range $c_range <br/>";
				CloseDB();
				return true;
			}else	{return false;}
	} else {echo"no rows";return false;}
}//function Reserve_customer
function Addnews($News_Header,$News_Detail,$News_ExpireDate)
{
global $conn;
Conn2DB();
$sql="insert into news(News_Header,News_Detail,News_ExpireDate) values(\"$News_Header\",'$News_Detail','$News_ExpireDate')";
mysql_query($sql,$conn);
CloseDB();
}
function Deletenews($News_id)
{
	global $conn;
	Conn2DB();
	$sql="delete from news where News_id='$News_id'";
	mysql_query($sql,$conn);	
	CloseDB();
}
function Updatenews($News_id,$News_Header,$News_Detail,$News_ExpireDate)
{
	global $conn;
	Conn2DB();
	if ($News_Header != "")
		{	$sql = "update news set News_Header='$News_Header',News_AnnounceDate=NULL where News_Id = '$News_id' ";
			mysql_query($sql,$conn);}
	if ($News_Detail != "")
		{	$sql = "update news set  News_Detail= '$News_Detail' ,News_AnnounceDate=NULL where News_Id = '$News_id' ";
			mysql_query($sql,$conn);}
	if ($News_ExpireDate!= "")
		{	$sql = "update news set  News_ExpireDate = '$News_ExpireDate' ,News_AnnounceDate=NULL where News_Id='$News_id' ";	mysql_query($sql,$conn);}
CloseDB();
}
function view_news(&$Header,&$Announce,&$count,&$News_id)
{
	global $conn;
	Conn2DB();
	$sql="select News_Header,News_AnnounceDate,News_id from news order by News_AnnounceDate desc";
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
function opennews($News_id,&$News_Header,&$News_Detail,&$News_AnnounceDate,&$News_ExpireDate)
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
function outbox($login,&$Date,&$To,&$Topic,&$Oid,&$count)
{	global $conn;
	Conn2DB();
		$sql="select date_s,To_who,Topic,outbox_id from outbox where  Username='$login' order by date_s ";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
			{ $n=0;
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
function inbox($login,&$Date,&$From,&$Topic,&$Mid,&$count)
{	global $conn;
	Conn2DB();
	$sql="select date_r,from_who,topic,Inbox_Id from inbox where Username='$login' order by date_r";
	$result=mysql_query($sql,$conn);
	$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
		else 
			{ $n=0;
				while ($row=mysql_fetch_array($result))
					{			$time =mysql2unix($row[date_r]);
								$Date[$n] = date ("d/m/Y H:i:s",$time); 
								$From[$n] =$row[from_who];
								$Topic[$n]	=$row[2];
								$Mid[$n]	=$row[3];
								$n++;
					}
			$count =  $n;
			CloseDB();
			}
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
function namebook_agent(&$AName,&$Aid,&$Acount,&$Anme,&$Asme)
{		global $conn;
		Conn2DB();
		$sql="select agent_id,agent_Username,agent_name,agent_surname from agent order by agent_id";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		$n = 0;
				while ($row=mysql_fetch_array($result))
					{			
								$AName[$n] = $row[1];
								$Aid[$n] =$row[0];
								$Anme[$n] = $row[agent_name];
								$Asme[$n]=$row[agent_surname];
								$n++;
					}
	}
	$Acount = $n;
	CloseDB();
}
function namebook_secretary(&$SName,&$Sid,&$Scount,&$Snme,&$Ssme)
{
global $conn;
Conn2DB();
$sql="select Secretary_id,Secretary_username,Secretary_Name,Secretary_Surname from secretary";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		$n = 0;
				while ($row=mysql_fetch_array($result))
					{			
								$SName[$n] = $row[1];
								$Sid[$n] =$row[0];
								$Snme[$n]=$row[2];
								$Ssme[$n]=$row[3];
								$n++;
					}
	}
	$Scount = $n;
	CloseDB();
}
function namebook_manager(&$MName,&$Mnme,&$Msme)
{
global $conn;
Conn2DB();
		$sql="select  manager_username,Manager_Name,Manager_Surname from manager";
		$result=mysql_query($sql,$conn);
		$numrow = mysql_num_rows($result);
		if($numrow==0){echo "No matchs to view.","<br/>";}
	else
	{		
				while ($row=mysql_fetch_array($result))
					{			
								$MName = $row[manager_username];
								$Mnme=$row[Manager_Name];
								$Msme=$row[Manager_Surname];
					}
	}
	CloseDB();
}
function addagent($Aname,$Asurname,$Anick,$Apasswd,$Arange,$Aaddress,$Asoi,$Asubsoi,$Aroad,	$Adistrict,$Asubd,$Aprovince,$Apostcode,$Atel,$Asubh)
{
global $conn;
Conn2DB();
$sql="insert into agent (Agent_Name,Agent_Surname,Agent_Username,Agent_Password,Agent_Range,Agent_AddressNo,Agent_Soi,Agent_Sub_soi,Agent_Road,Agent_District,Agent_Sub_Division,Agent_Province,Agent_Postcode,Agent_Telephone,Agent_SubH) values('$Aname','$Asurname','$Anick','$Apasswd','$Arange','$Aaddress','$Asoi','$Asubsoi','$Aroad',	'$Adistrict','$Asubd','$Aprovince','$Apostcode','$Atel','$Asubh')";
mysql_query($sql,$conn);
CloseDB();
}
function addcustomer($Cpren,$Cname,$Csurname,$Caddress,$Crange,$Csoi,$Csubsoi,$Croad,$Cdistrict,$Csubd,	$Cprovince,	$Cpostcode,$Ctel1,$Ctel2,$Csubh,$Ausername)
{
	global $conn;
	Conn2DB();
	$sql="insert into customer(Customer_PreN,Customer_Name,Customer_Surname,Customer_AddressNo,Customer_Range,Customer_Soi  ,Customer_Sub_soi,Customer_Road,Customer_District,Customer_Sub_Division,Customer_Province,Customer_Postcode  ,Customer_Tel1,Customer_Tel2,Customer_SubH,Agent_Username) values('$Cpren','$Cname','$Csurname','$Caddress','$Crange','$Csoi','$Csubsoi','$Croad','$Cdistrict','$Csubd',	'$Cprovince','$Cpostcode','$Ctel1','$Ctel2','$Csubh','$Ausername')";
mysql_query($sql,$conn);
CloseDB();
}
function updateagent($Aid,$Aname,$Asurname,$Anick,$Apasswd,$Arange,$AregDate,$Aaddress,$Asoi,$Asubsoi,$Aroad,	$Adistrict,$Asubd,$Aprovince,$Apostcode,$Atel,$Asubh)
{global $conn;
Conn2DB();
	if ($Aname != "")
		{	$sql = "update Agent set Agent_Name = '$Aname' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Asurname != "")
		{	$sql = "update Agent set Agent_Surname = '$Asurname' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Anick != "")
		{	$sql = "update Agent set Agent_Username = '$Anick' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Apasswd != "")
		{	$sql = "update Agent set Agent_Password = '$Apasswd' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Arange != "")
		{	$sql = "update Agent set Agent_Range = '$Arange' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($AregDate != "")
		{	$sql = "update Agent set Agent_Registerdate = '$AregDate' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Aaddress != "")
		{	$sql = "update Agent set Agent_AddressNo = '$Aaddress' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Asoi != "")
		{	$sql = "update Agent set Agent_Soi = '$Asoi' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Asubsoi != "")
		{	$sql = "update Agent set Agent_Sub_soi = '$Asubsoi' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Aroad != "")
		{	$sql = "update Agent set Agent_Road = '$Aroad' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Adistrict != "")
		{	$sql = "update Agent set Agent_District = '$Adistrict' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Asubd != "")
		{	$sql = "update Agent set Agent_Sub_Division = '$Asubd' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Aprovince != "")
		{	$sql = "update Agent set Agent_Province = '$Aprovince' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Apostcode != "")
		{	$sql = "update Agent set Agent_Postcode = '$Apostcode' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Atel != "")
		{	$sql = "update Agent set Agent_Telephone = '$Atel' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
	if ($Asubh != "")
		{	$sql = "update Agent set Agent_SubH = '$Asubh' where Agent_Id = '$Aid' ";
			mysql_query($sql,$conn);}
				CloseDB();
}
function updatecustomer($Cid,$CPreN,$Cname,$Csurname,$Crange,$Cprovince,$Cdistrict,$Csubd,$Croad,$Csoi,$Csubsoi,	$Csubh,$Caddr,$Ctel1,$Ctel2,$Ausername,$Cpostcode)
{
	global $conn;
	Conn2DB();
	if ($CPreN != "")
		{	$sql = "update Customer set Customer_PreN = '$CPreN' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Crange != "")
		{	$sql = "update Customer set Customer_Range = '$Crange' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Cname != "")
		{	$sql = "update Customer set Customer_Name = '$Cname' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Csurname != "")
		{	$sql = "update Customer set Customer_Surname = '$Csurname' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Caddress != "")
		{	$sql = "update Customer set Customer_AddressNo = '$Caddr' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Csoi != "")
		{	$sql = "update Customer set Customer_Soi = '$Csoi' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Csubsoi != "")
		{	$sql = "update Customer set Customer_Sub_soi = '$Csubsoi' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Croad != "")
		{	$sql = "update Customer set Customer_Road = '$Croad' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Cdistrict != "")
		{	$sql = "update Customer set Customer_District = '$Cdistrict' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Csubd != "")
		{	$sql = "update Customer set Customer_Sub_Division = '$Csubd' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Cprovince != "")
		{	$sql = "update Customer set Customer_Province = '$Cprovince' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Cpostcode != "")
		{	$sql = "update Customer set Customer_Postcode = '$Cpostcode' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Ctel1 != "")
		{	$sql = "update Customer set Customer_Tel1 = '$Ctel1' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Ctel2 != "")
		{	$sql = "update Customer set Customer_Tel2 = '$Ctel2' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Csubh != "")
		{	$sql = "update Customer set Customer_SubH = '$Csubh' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	if ($Ausername != "")
		{	$sql = "update Customer set Agent_Username = '$Ausername' where Customer_Id = '$Cid' ";
			mysql_query($sql,$conn);}
	CloseDB();
}
function Remove_customer($Cid)
{
	global $conn;
	Conn2DB();
	$sql="delete from customer where Customer_id='$Cid'";
	mysql_query($sql,$conn);
	CloseDB();
}
function del_competition($Competition_Id)
{
	global $conn;
	Conn2DB();
	$sql="delete from Competition where Competition_Id='$Competition_Id'";
	mysql_query($sql,$conn);
	CloseDB();
}
function Remove_Agent($Aid)
{
	global $conn;
	Conn2DB();
	$sql="delete from Agent where Agent_id='$Aid'";
	mysql_query($sql,$conn);
	CloseDB();
}
function AddInsurancePolicy($Cid,$Aid,$Insurance_Name,$Enddate,$Paid_Date,$FYP_Percentage,$RangeMonth_Pay_Premium,	&$returnID)
{
	global $conn;
	Conn2DB();
	$sql="insert into insurance_policy(Customer_Id,Agent_Id,Insurance_Name,Enddate,Paid_Date) values('$Cid','$Aid','$Insurance_Name','$Enddate','$Paid_Date')";
	mysql_query($sql,$conn);
	$ask="select Insurance_Id from insurance_Policy where Customer_Id='$Cid' and Agent_Id='$Aid' ";
	$result =mysql_query($ask,$conn);
	$row = mysql_fetch_array($result);
	$returnID=$row[Insurance_Id];
	$sql2="insert into insurance_name(Insurance_Name,FYP_Percentage,RangeMonth_Pay_Premium) values('$Insurance_Name','$FYP_Percentage','$RangeMonth_Pay_Premium')";
	mysql_query($sql2,$conn);
	echo" Add Insurance complete ";
	CloseDB();
}
function AddSubcontact($Insurance_id,$sub_contact_name,$value_sub_contact,$value_ip,$amountofyearP,$amountofyPP,$status,	$FYP_Per)
{	
	global $conn;
	Conn2DB();
	$sql="insert into sub_contact (Insurance_ID,Sub_Contact_Name,Value_Sub_Contact,Value_Insurance_Premium,Amount_Of_year_Protect,	Amount_Of_year_Pay_Premium,Status) values('$Insurance_id','$sub_contact_name','$value_sub_contact','$value_ip','$amountofyearP','$amountofyPP','$status')";
	mysql_query($sql,$conn);
	$sql2="insert into sub_contact_name(Sub_Contact_Name,FYP_Percentage)values('$sub_contact_name','$FYP_Per')";
	mysql_query($sql2,$conn);
	echo" Add Insurance complete ";
	CloseDB();
}
function RemoveInsurancePolicy_Insurancename($Insurance_Id)
{
	global $conn;
	Conn2DB();
	$sql="delete from insurance_Policy where Insurance_ID ='$Insurance_Id' ";
	if(mysql_query($sql,$conn)){echo" Delete Insurance Policy complete ";}
	$sql2="select Insurance_Name from insurance_Policy where Insurance_Id='$Insurance_Id' ";
	$result = mysql_query($sql2,$conn);
	$row = mysql_fetch_array($result);
	$Iname=$row[Insurance_Name];
	
	$sql3="delete from insurance_name where Insurance_Name='$Iname' ";
	if(mysql_query($sql3,$conn)){echo" Delete Insurance Insurance_Name complete ";}
	
	$sql4="delete from sub_contact where Insurance_ID='$Insurance_Id' ";
	mysql_query($sql4,$conn);
	CloseDB();
}
function UpdateInsurancePolicy($insurance_id,$Cid,$Aid,$Insurance_Name,$Enddate,$Paid_Date,$FYP_Percentage,	$RangeMonth_Pay_Premium)
{
		global $conn;
		Conn2DB();
	if ($Cid != "")
		{	
		$sql = "update insurance_policy set Customer_Id= '$Cid'  where Insurance_ID = '$insurance_id' ";
		mysql_query($sql,$conn);
		};
	if ($Aid != "")
		{
		$sql = "update insurance_policy set  Agent_ID='$Aid' where Insurance_ID = '$insurance_id' ";
		mysql_query($sql,$conn);
		};
	if($Insurance_Name != "")
		{
		$sql = "update insurance_policy set  Insurance_Name='$Insurance_Name' where Insurance_ID = '$insurance_id' ";
		mysql_query($sql,$conn);
		};
	if($Enddate != "")
		{
		$sql = "update insurance_policy set  Enddate='$Enddate' where Insurance_ID = '$insurance_id' ";
		mysql_query($sql,$conn);
		};
	if($Paid_Date != "")
		{
		$sql = "update insurance_policy set  Paid_Date ='$Paid_Date' where Insurance_ID = '$Insurance_Id' ";
		mysql_query($sql,$conn);
		};
	$ask="select Insurance_name from insurance_Policy where  Insurance_ID = '$Insurance_Id' ";
	$result =mysql_query($ask,$conn);
	$row = mysql_fetch_array($result);
	$name=$row[Insurance_name];
	if($FYP_Percentage != "")
		{
		$sql = "update insurance_name set  FYP_Percentage ='$FYP_Percentage' where Insurance_ID = '$Insurance_Id' ";
		mysql_query($sql,$conn);
		};
	if($RangeMonth_Pay_Premium != "")
		{
		$sql = "update insurance_name set  RangeMonth_Pay_Premium ='$RangeMonth_Pay_Premium' where Insurance_ID = '$Insurance_Id' ";
		mysql_query($sql,$conn);
		};
	echo"Updatenews finished";
	CloseDB();
}
function Updatesub_contact($Insurance_Id,$sub_contact_name,$value_sub_contact,$value_ip,$amount_of_yearP,	$amount_of_yearPP,$status,$n)
{
	global $conn;
	Conn2DB();
	while ($n >=0 )
	{
	/*if($sub_contact_name != "")
		{	
			$sql = "update sub_contact set Sub_Contact_Name ='$sub_contact_name[$n]' where Insurance_ID = '$Insurance_Id' and Sub_Contact_Name='$sub_contact_name[$n]' ";
			mysql_query($sql,$conn);
		};*/
	if($value_sub_contact != "")
		{
			$sql = "update sub_contact set Value_Sub_Contact ='$value_sub_contact[$n]' where Insurance_ID = '$Insurance_Id' and Sub_Contact_Name='$sub_contact_name[$n]' ";
			mysql_query($sql,$conn);
		};
	if($value_ip != "")
		{
			$sql = "update sub_contact set Value_Insurance_Premium ='$value_ip[$n]' where Insurance_ID = '$Insurance_Id' 			and Sub_Contact_Name='$sub_contact_name[$n]' ";
			mysql_query($sql,$conn);
		};
	if($amount_of_yearP != "")
		{
			$sql = "update sub_contact set  Amount_Of_year_Protect ='$amount_of_yearP[$n]' where Insurance_ID = '$Insurance_Id' and  Sub_Contact_Name='$sub_contact_name[$n]' ";
			mysql_query($sql,$conn);
		};
	if($amount_of_yearPP != "")
		{
			$sql = "update sub_contact set Amount_Of_year_Pay_Premium ='$amount_of_yearPP[$n]' where Insurance_ID = '$Insurance_Id' and Sub_Contact_Name='$sub_contact_name[$n]' ";
			mysql_query($sql,$conn);
		};
	if($status != "")
		{
			$sql = "update sub_contact set status ='$status[$n]' where Insurance_ID = '$Insurance_Id' and Sub_Contact_Name='$sub_contact_name[$n]' ";
			mysql_query($sql,$conn);
		};
	$n--;
	};
		CloseDB();
}
function Updatesub_contact_name($Insurance_name,$subcontact_name,$FYP_per)
{
	if($subcontact_name != "")
		{
			$sql = "update sub_contact_name set Sub_Contact_Name ='$subcontact_name' where Insurance_name = '$Insurance_name' ";
			mysql_query($sql,$conn);
		};
	if($subcontact_name != "")
		{
			$sql = "update sub_contact_name set FYP_Percentage ='$FYP_per' where Insurance_name = '$Insurance_name' ";
			mysql_query($sql,$conn);
		};
    
}
 function Search_Insurance_name($Insurance_Name,&$sql)
 {
 if($Insurance_Name!="")
	 {
		$sql ="select  * from  insurance_name where Insurance_Name ='$Insurance_Name' ";
	 }
 }
function Search_sub_contact($Insurance_ID,$Sub_contact_Name,&$sql)
{
$sql ="select * from Sub_contact where Insurance_ID = '$Insurance_ID' and SubContact ='$Sub_contact' ";
}
function Add_Competition($Com_Name,$Detail_Con,$Detail_Rew,$Detail_O,$Start_date,$End_Date,$FYP_OverAll,	 $NewCode,$FYP_Newcode,$Persistency,$Claim_Ratio,$Amount_Of_In)
{
	global $conn;
	Conn2DB();
	$sql="insert into Competition(Competition_Name,Detail_Condition,Detail_Reward,Detail_Other,Start_Date,End_Date,  FYP_OverAll,NewCode,FYP_NewCode,Persistency,Claim_Ratio,Amount_Of_Insurance) values('$Com_Name','$Detail_Con','$Detail_Rew','$Detail_O','$Start_date','$End_Date','$FYP_OverAll',	'$NewCode','$FYP_Newcode','$Persistency','$Claim_Ratio','$Amount_Of_In')";
	mysql_query($sql,$conn);
	CloseDB();
}
function Update_Competition($Competition_Id,$Com_Name,$Detail_Con,$Detail_Rew,$Detail_O,$Start_date,$End_Date,	$FYP_OverAll,$NewCode,$FYP_Newcode,$Persistency,$Claim_Ratio,$Amount_Of_In)
{
	global $conn;
	Conn2DB();
	if($Com_Name != "")
		{
			$sql = "update Competition set  Competition_Name='$Com_Name'  where  Competition_Id= '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Detail_Con != "")
		{
			$sql = "update Competition set  Detail_Condition ='$Detail_Con'  where  Competition_Id= '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Detail_Rew != "")
		{
			$sql = "update Competition set  Detail_Reward ='$Detail_Rew'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Detail_O != "")
		{
			$sql = "update Competition set  Detail_Other='$Detail_O'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Start_date != "")
		{
			$sql = "update Competition set  Start_Date='$Start_date'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($End_Date != "")
		{
			$sql = "update Competition set  End_Date ='$End_Date'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($FYP_OverAll != "")
		{
			$sql = "update Competition set  FYP_OverAll ='$FYP_OverAll'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($NewCode != "")
		{
			$sql = "update Competition set  NewCode ='$NewCode'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($FYP_Newcode != "")
		{
			$sql = "update Competition set  FYP_NewCode ='$FYP_Newcode'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Persistency != "")
		{
			$sql = "update Competition set  Persistency='$Persistency'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Claim_Ratio != "")
		{
			$sql = "update Competition set  Claim_Ratio='$Claim_Ratio'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
	if($Amount_Of_In != "")
		{
			$sql = "update Competition set  Amount_Of_Insurance='$Amount_Of_In'  where  Competition_Id = '$Competition_Id' ";
			mysql_query($sql,$conn);
		};
			CloseDB();
}

function Update_Overall_Statistics($index_id,$Persistency,$Claim_Ratio ,$Newcode)
{
	global $conn;
	Conn2DB();
	if($Persistency != "")
		{
			$sql = "update Overall_statistics set  Persistency='$Persistency'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	if($Claim_Ratio != "")
		{
			$sql = "update Overall_statistics set  Claim_Ratio='$Claim_Ratio'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	if($Newcode != "")
		{
			$sql = "update Overall_statistics set  NewCode ='$Newcode'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	CloseDB();
}
function Update_Agent_Statistics($index_id,$Persistency,$Claim_Ratio,$FYP,$Amount_Of_Insurance)
{
	global $conn;
	Conn2DB();
	if($Persistency != "")
		{
			$sql = "update Agent_statistics set  Persistency='$Persistency'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	if($Claim_Ratio != "")
		{
			$sql = "update Agent_statistics set  Claim_Ratio='$Claim_Ratio'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	if($FYP != "")
		{
			$sql = "update Agent_statistics set  FYP ='$FYP'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	if($Amount_Of_Insurance != "")
		{
			$sql = "update Agent_statistics set Amount_Of_Insurance ='$Amount_Of_Insurance'  where  Index_Id = '$index_id' ";
			mysql_query($sql,$conn);
		};
	CloseDB();
}
function DisplayCompetition($Competition_Id,&$row)
{		
	global $conn;
	Conn2DB();
	if ($Competition !="")
	{
		$sql ="select  Post_Date,Complition_Name,Start_Date,End_Date ,Detail_Condition,Detail_Reward,Detail_Other  from  Competition where Competition_Id ='$Competition_Id' ";
		$result= mysql_query($sql,$conn);
		$row =mysql_fetch_array($result);
	}
	else 
	{
		echo " no search competition";
	}
	CloseDB();
}
function Cal_FYP($Insurance_Id)
{           
			global $conn;
			$sql = "SELECT Value_Sub_Contact FROM `sub_contact` WHERE insurance_id = '$Insurance_Id' "; 
			$row = mysql_query($sql);
			$result = mysql_fetch_array($row);
			//$sql ="select 
}
function DisplayTotal_Statistics()
{
			
}

function fyp($Aid)
{	global $conn;
	$sql="select Agent_FYP from agent where Agent_id ='$Aid'";
	$result =mysql_query($sql,$conn);
	$numrow =mysql_num_rows($result);
	if($numrow==0){echo"No matchs to view.","<br/>";}
	else 
	{	
		while ($row=mysql_fetch_array($result))
					{
					echo	"Agent_FYP    := ",$row[0],"<br/>";
					}
	}
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
				{	
					$v1 = $row2[1];
					$v2 = $row2[2];
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