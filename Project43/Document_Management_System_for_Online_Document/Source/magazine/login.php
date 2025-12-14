<?
// * Connect to MySQL database.
   $hostname = "localhost";
   $username = "magazine";
   $password = "magazine";
   $dbName = "magazine";
   mysql_connect($hostname,$username,$password) or die("can not connect!");
// SQL language.
   $sql="	select mem_id,mem_username,mem_password,mem_show_status 
   			from member 
				where mem_username=\"$loginUser\" ";
   $SQLresult = mysql_db_query($dbName,$sql);
   $num = mysql_num_rows($SQLresult);
   if ($num) {
	   $row = mysql_fetch_array($SQLresult);
		if ($row[mem_password] == $passwordUser) {
			session_start();
			session_destroy();
			$user_id = $row[mem_id];
			$user_name = $row[mem_username];
			$crp_password=crypt($row[mem_password],"mg");
			session_register("user_id");
			session_register("user_name");
			session_register("crp_password");
			$user_type = "R";
			$user_calendar = $user_type;
			$user_types = $user_type;
			$sql = "select mem_id from writer where mem_id=\"$row[mem_id]\"";
			$SQLresult2 = mysql_db_query($dbName,$sql);
			$num2 = mysql_num_rows($SQLresult2);
			if ($num2) {
				$user_type = "W";
				$user_calendar = $user_type;
				$user_types = "$user_types W";
			}
			$sql="select  * from admin where mem_id=\"$row[mem_id]\"";
			$SQLresult3 = mysql_db_query($dbName,$sql);
			$num3 = mysql_num_rows($SQLresult3);
			if($num3) {
				$row3 = mysql_fetch_array($SQLresult3);
				$user_type = "A";
				$user_calendar = $user_type;
				$user_types = "$user_types A";
				if ($row3[adm_function]=="column")
					$function = "column_admin";
				else if ($row3[adm_function]=="member")
					$function = "member_admin";
				session_register("function");
			}
			session_register("user_type");
			session_register("user_calendar");
			session_register("user_types");
			if ($user_type=="A")
				header("Location: ./index.php");
			else
				header("Location: ./calendar/welcome.php");
		}
		else
			header("Location: ./index.php?login=\"password_fail\"");
   }
	else
	   header("Location: ./index.php?login=\"not_member\"");
   mysql_close();
?>