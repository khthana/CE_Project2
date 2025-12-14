<? 

	session_start( );

	if (!session_is_registered("loginname"))

	{

		header ("Location: login.php");  

		exit;

	}

	include('dbconnect.inc');

	$firstname = trim($firstname);
	$lastname = trim($lastname);
	$link = trim($link);
	$detail = trim($detail);
	$email = trim($email);
	$password = trim($password);
	if (strlen($password) < 6)
	{ 
		header ("Location: editprofile.php?flag=P");
		exit;
	} 	

	$sql = "select LoginName from MEMBER where Email = '$email' and LoginName <> '$loginname'";
	$result = mysql_db_query($dbname,$sql);
	$nrow = mysql_num_rows($result);
	if ($nrow != 0 )
	{ 
		header ("Location: editprofile.php?flag=E");
		exit;
	} else
	{
			$bansql = "select * from BANWORD";
			$banresult = mysql_db_query($dbname,$bansql);
			$bannum = mysql_num_rows($banresult);
			if ($bannum != 0)
			{
				$detail = " $detail";
				while ($banarry = mysql_fetch_array($banresult))
				{
					$found1 = strpos($detail,$banarry['Word'],0);
					if($found1)
					{
						header ("Location: editprofile.php?flag=ban");
						exit;
					}
				} // end while ban
				$detail = trim($detail);
			} //end if ban num !=0

		if ($Picture!="")
		{
			if ($Picture != none )
			{
				if ($Picture_type !="image/gif")
				{
					header ("Location: editprofile.php?flag=I");
					exit;
				}
				$filename = "tmp/" . $Picture_name ;
				copy($Picture,$filename);
				$data = addslashes(fread(fopen($filename,"r"),$Picture_size));
		  		$sql2 = "update MEMBER set Picture='$data'  where LoginName= '$loginname'";
				$result = mysql_db_query($dbname,$sql2);
				unlink($filename);
			}
		}
	$sql = "select Password from MEMBER where LoginName = '$loginname'";
	$result = mysql_db_query($dbname,$sql);
	$oldpass = mysql_fetch_array($result);
	if ($oldpass[0] != $password)
	{
  	$sql1 = "update MEMBER set Password = password($password) , FirstName = '$firstname', LastName = '$lastname' , Email = '$email' , Link = '$link' where LoginName= '$loginname'";
	}else
	{
	  	$sql1 = "update MEMBER set FirstName = '$firstname', LastName = '$lastname' , Email = '$email' , Link = '$link' ,Detail = '$detail' where LoginName= '$loginname'";
	}
		$result = mysql_db_query($dbname,$sql1);		

		header ("Location: new.php");  

	}

?>